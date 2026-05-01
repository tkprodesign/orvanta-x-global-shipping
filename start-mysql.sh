#!/bin/bash
MYSQL_DATA=/home/runner/mysql-data
MYSQL_RUN=/home/runner/mysql-run
MYSQL_LOGS=/home/runner/mysql-logs

mkdir -p "$MYSQL_DATA" "$MYSQL_RUN" "$MYSQL_LOGS"

# Kill any leftover mysqld from a prior run so the data lock is released
pkill -x mysqld 2>/dev/null || true
sleep 2

# Remove stale socket/lock/pid files
rm -f "$MYSQL_RUN/mysql.sock" "$MYSQL_RUN/mysql.sock.lock" "$MYSQL_RUN/mysql.pid"

# Initialize data directory if empty or missing system tables
if [ ! -f "$MYSQL_DATA/ibdata1" ]; then
    echo "Initializing MySQL data directory..."
    mysqld --initialize-insecure --datadir="$MYSQL_DATA" 2>>"$MYSQL_LOGS/error.log"
fi

start_mysql() {
    rm -f "$MYSQL_RUN/mysql.sock" "$MYSQL_RUN/mysql.sock.lock" "$MYSQL_RUN/mysql.pid"
    mysqld --datadir="$MYSQL_DATA" \
           --socket="$MYSQL_RUN/mysql.sock" \
           --pid-file="$MYSQL_RUN/mysql.pid" \
           --log-error="$MYSQL_LOGS/error.log" \
           --mysqlx=OFF \
           --port=3306 \
           --bind-address=127.0.0.1 &
    MYSQL_PID=$!
    echo "MySQL PID: $MYSQL_PID"

    # Wait for socket to appear (up to 30s)
    for i in $(seq 1 30); do
        if [ -S "$MYSQL_RUN/mysql.sock" ]; then
            echo "MySQL socket ready"
            return 0
        fi
        sleep 1
    done

    echo "MySQL socket did not appear in time" >&2
    return 1
}

start_mysql

# Setup database and user (idempotent)
mysql -u root --socket="$MYSQL_RUN/mysql.sock" <<'SQLEOF'
CREATE DATABASE IF NOT EXISTS shipping_db CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
CREATE USER IF NOT EXISTS 'shipping_user'@'localhost' IDENTIFIED BY 'shipping_pass';
CREATE USER IF NOT EXISTS 'shipping_user'@'127.0.0.1' IDENTIFIED BY 'shipping_pass';
GRANT ALL PRIVILEGES ON shipping_db.* TO 'shipping_user'@'localhost';
GRANT ALL PRIVILEGES ON shipping_db.* TO 'shipping_user'@'127.0.0.1';
FLUSH PRIVILEGES;
SQLEOF

echo "Database setup complete"

# Watchdog: restart MySQL if it dies, so the PHP server keeps working
(
    while true; do
        sleep 10
        if ! pgrep -x mysqld > /dev/null; then
            echo "$(date): MySQL died, restarting..." >> "$MYSQL_LOGS/watchdog.log"
            pkill -x mysqld 2>/dev/null || true
            sleep 1
            start_mysql >> "$MYSQL_LOGS/watchdog.log" 2>&1
        fi
    done
) &

# Start PHP server (keeps the workflow alive)
php -S 0.0.0.0:5000 -t /home/runner/workspace
