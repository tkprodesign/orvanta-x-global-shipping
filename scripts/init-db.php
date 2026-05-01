<?php
declare(strict_types=1);

/**
 * CLI helper to bootstrap all required database tables.
 *
 * Usage:
 *   DB_HOST=... DB_USER=... DB_PASS=... DB_NAME=... php scripts/init-db.php
 */

if (PHP_SAPI !== 'cli') {
    fwrite(STDERR, "This helper must be run from CLI.\n");
    exit(1);
}

require __DIR__ . '/../install-database.php';
