#!/bin/bash
MYSQL_DATA=/home/runner/mysql-data
MYSQL_RUN=/home/runner/mysql-run
MYSQL_LOGS=/home/runner/mysql-logs

mkdir -p "$MYSQL_DATA" "$MYSQL_RUN" "$MYSQL_LOGS"

# Initialize data directory if empty or missing system tables
if [ ! -f "$MYSQL_DATA/ibdata1" ]; then
    echo "Initializing MySQL data directory..."
    mysqld --initialize-insecure --datadir="$MYSQL_DATA" 2>>"$MYSQL_LOGS/error.log"
fi

# Remove stale socket/lock/pid files
rm -f "$MYSQL_RUN/mysql.sock" "$MYSQL_RUN/mysql.sock.lock" "$MYSQL_RUN/mysql.pid"

# Start MySQL
mysqld --datadir="$MYSQL_DATA" \
       --socket="$MYSQL_RUN/mysql.sock" \
       --pid-file="$MYSQL_RUN/mysql.pid" \
       --log-error="$MYSQL_LOGS/error.log" \
       --mysqlx=OFF \
       --port=3306 \
       --bind-address=127.0.0.1 &

MYSQL_PID=$!
echo "MySQL PID: $MYSQL_PID"

# Wait for socket to appear
for i in $(seq 1 30); do
    if [ -S "$MYSQL_RUN/mysql.sock" ]; then
        echo "MySQL socket ready"
        break
    fi
    sleep 1
done

# Setup database and user
mysql -u root --socket="$MYSQL_RUN/mysql.sock" <<'SQLEOF'
CREATE DATABASE IF NOT EXISTS shipping_db CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
CREATE USER IF NOT EXISTS 'shipping_user'@'localhost' IDENTIFIED BY 'shipping_pass';
CREATE USER IF NOT EXISTS 'shipping_user'@'127.0.0.1' IDENTIFIED BY 'shipping_pass';
GRANT ALL PRIVILEGES ON shipping_db.* TO 'shipping_user'@'localhost';
GRANT ALL PRIVILEGES ON shipping_db.* TO 'shipping_user'@'127.0.0.1';
FLUSH PRIVILEGES;
SQLEOF

echo "Database setup complete"

# Start PHP server
php -S 0.0.0.0:5000 -t /home/runner/workspace
