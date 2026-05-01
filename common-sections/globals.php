<?php
if (!defined('COMMON_SECTIONS_GLOBALS_LOADED')) {
    define('COMMON_SECTIONS_GLOBALS_LOADED', true);

    $global_db_host = getenv('DB_HOST') ?: "sql300.byethost18.com";
    $global_db_user = getenv('DB_USER') ?: "b18_41230477";
    $global_db_pass = getenv('DB_PASS') ?: "Wateva06@";
    $global_db_name = getenv('DB_NAME') ?: "b18_41230477_db2";
    $global_db_socket = getenv('DB_SOCKET') ?: "";

    $globalConn = null;

    if (isset($conn) && $conn instanceof mysqli && empty($conn->connect_error)) {
        $globalConn = $conn;
    } elseif (isset($dbconn) && $dbconn instanceof mysqli && empty($dbconn->connect_error)) {
        $globalConn = $dbconn;
    } else {
        mysqli_report(MYSQLI_REPORT_OFF);

        if ($global_db_socket !== '') {
            $globalConn = @new mysqli(null, $global_db_user, $global_db_pass, $global_db_name, null, $global_db_socket);
        } else {
            $hostsToTry = [$global_db_host, 'localhost', '127.0.0.1'];
            $hostsToTry = array_values(array_unique(array_filter($hostsToTry)));
            foreach ($hostsToTry as $hostToTry) {
                $globalConn = @new mysqli($hostToTry, $global_db_user, $global_db_pass, $global_db_name);
                if (empty($globalConn->connect_error)) {
                    break;
                }
            }
        }

        if (!empty($globalConn->connect_error)) {
            die("Connection failed: " . $globalConn->connect_error . ". Verify DB_HOST/DB_USER/DB_PASS/DB_NAME. Default in this repo is sql300.byethost18.com; override with DB_HOST if your panel shows a different sql host.");
        }
    }

    $conn = $globalConn;
    $dbconn = $globalConn;

    if (!function_exists('asset_url')) {
        function asset_url(string $path): string {
            $filePath = $_SERVER['DOCUMENT_ROOT'] . $path;
            if (file_exists($filePath)) {
                $separator = (strpos($path, '?') === false) ? '?' : '&';
                return $path . $separator . 'v=' . filemtime($filePath);
            }
            return $path;
        }
    }

    // Global performance hints for Material Symbols CDN used across pages.
    if (!headers_sent()) {
        $materialSymbolsHref = "https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200";
        header("Link: <https://fonts.googleapis.com>; rel=preconnect", false);
        header("Link: <https://fonts.gstatic.com>; rel=preconnect; crossorigin", false);
        header("Link: <{$materialSymbolsHref}>; rel=preload; as=style", false);
    }
}
?>
