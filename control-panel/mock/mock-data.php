<?php

function cp_mock_table_exists(mysqli $dbconn, string $table): bool {
    $tableEsc = $dbconn->real_escape_string($table);
    $sql = "SHOW TABLES LIKE '{$tableEsc}'";
    $res = $dbconn->query($sql);
    return (bool)($res && $res->num_rows > 0);
}

function cp_mock_table_columns(mysqli $dbconn, string $table): array {
    $columns = [];
    $tableEsc = $dbconn->real_escape_string($table);
    $res = $dbconn->query("SHOW COLUMNS FROM `{$tableEsc}`");
    if (!$res) {
        return $columns;
    }
    while ($row = $res->fetch_assoc()) {
        $field = strtolower(trim((string)($row['Field'] ?? '')));
        if ($field !== '') {
            $columns[$field] = true;
        }
    }
    return $columns;
}

function cp_mock_has_column(array $columns, string $column): bool {
    return isset($columns[strtolower($column)]);
}

function cp_mock_fetch_dashboard_data(mysqli $dbconn): array {
    $summary = [
        'users' => 0,
        'shipments' => 0,
        'quotes' => 0,
        'exception_payments' => 0,
        'pending_proofs' => 0,
    ];

    $countQueries = [
        'users' => ['table' => 'users', 'sql' => 'SELECT COUNT(*) AS total FROM users'],
        'shipments' => ['table' => 'shipments', 'sql' => 'SELECT COUNT(*) AS total FROM shipments'],
        'quotes' => ['table' => 'shipment_service_quotes', 'sql' => 'SELECT COUNT(*) AS total FROM shipment_service_quotes'],
        'exception_payments' => ['table' => 'exception_issue_payments', 'sql' => 'SELECT COUNT(*) AS total FROM exception_issue_payments'],
    ];

    foreach ($countQueries as $key => $cfg) {
        if (!cp_mock_table_exists($dbconn, $cfg['table'])) {
            continue;
        }
        try {
            $res = $dbconn->query($cfg['sql']);
            if ($res && ($row = $res->fetch_assoc())) {
                $summary[$key] = (int)($row['total'] ?? 0);
            }
        } catch (Throwable $e) {
            // Ignore schema mismatch issues in mock pages.
        }
    }

    if (cp_mock_table_exists($dbconn, 'shipment_payment_proofs')) {
        $proofColumns = cp_mock_table_columns($dbconn, 'shipment_payment_proofs');
        $proofSql = cp_mock_has_column($proofColumns, 'status')
            ? "SELECT COUNT(*) AS total FROM shipment_payment_proofs WHERE LOWER(COALESCE(status, 'pending_confirmation')) = 'pending_confirmation'"
            : "SELECT COUNT(*) AS total FROM shipment_payment_proofs";
        try {
            $proofRes = $dbconn->query($proofSql);
            if ($proofRes && ($proofRow = $proofRes->fetch_assoc())) {
                $summary['pending_proofs'] = (int)($proofRow['total'] ?? 0);
            }
        } catch (Throwable $e) {
            // Ignore schema mismatch issues in mock pages.
        }
    }

    $recentShipments = [];
    if (cp_mock_table_exists($dbconn, 'shipments')) {
        $shipmentColumns = cp_mock_table_columns($dbconn, 'shipments');
        $idSelect = cp_mock_has_column($shipmentColumns, 'id') ? 'id' : '0 AS id';
        $trackingSelect = cp_mock_has_column($shipmentColumns, 'tracking_number') ? 'tracking_number' : "'' AS tracking_number";
        $typeSelect = cp_mock_has_column($shipmentColumns, 'shipment_type') ? 'shipment_type' : "'standard' AS shipment_type";
        $senderSelect = cp_mock_has_column($shipmentColumns, 'sender_name') ? 'sender_name' : "'-' AS sender_name";
        $receiverSelect = cp_mock_has_column($shipmentColumns, 'receiver_name') ? 'receiver_name' : "'-' AS receiver_name";
        $statusSelect = cp_mock_has_column($shipmentColumns, 'status') ? 'status' : "'created' AS status";

        $createdOrderColumn = '';
        if (cp_mock_has_column($shipmentColumns, 'created_at_epoch')) {
            $createdSelect = 'created_at_epoch AS mock_created_epoch';
            $createdOrderColumn = 'created_at_epoch';
        } elseif (cp_mock_has_column($shipmentColumns, 'created_epoch')) {
            $createdSelect = 'created_epoch AS mock_created_epoch';
            $createdOrderColumn = 'created_epoch';
        } elseif (cp_mock_has_column($shipmentColumns, 'created_at')) {
            $createdSelect = 'UNIX_TIMESTAMP(created_at) AS mock_created_epoch';
            $createdOrderColumn = 'created_at';
        } elseif (cp_mock_has_column($shipmentColumns, 'created_on')) {
            $createdSelect = 'UNIX_TIMESTAMP(created_on) AS mock_created_epoch';
            $createdOrderColumn = 'created_on';
        } else {
            $createdSelect = '0 AS mock_created_epoch';
        }

        $orderBy = cp_mock_has_column($shipmentColumns, 'id')
            ? 'ORDER BY id DESC'
            : (($createdOrderColumn !== '') ? "ORDER BY {$createdOrderColumn} DESC" : '');

        $shipmentSql = "
            SELECT {$idSelect}, {$trackingSelect}, {$typeSelect}, {$senderSelect}, {$receiverSelect}, {$statusSelect}, {$createdSelect}
            FROM shipments
            {$orderBy}
            LIMIT 6
        ";
        try {
            $shipmentRes = $dbconn->query($shipmentSql);
            if ($shipmentRes) {
                while ($row = $shipmentRes->fetch_assoc()) {
                    $createdEpoch = (int)($row['mock_created_epoch'] ?? 0);
                    if ($createdEpoch > 1000000000000) {
                        $createdEpoch = (int)($createdEpoch / 1000);
                    }
                    $recentShipments[] = [
                        'id' => (int)($row['id'] ?? 0),
                        'tracking_number' => (string)($row['tracking_number'] ?? ''),
                        'shipment_type' => (string)($row['shipment_type'] ?? 'standard'),
                        'sender_name' => (string)($row['sender_name'] ?? '-'),
                        'receiver_name' => (string)($row['receiver_name'] ?? '-'),
                        'status' => (string)($row['status'] ?? 'created'),
                        'created_display' => $createdEpoch > 0 ? date('M j, Y H:i', $createdEpoch) : '-',
                    ];
                }
            }
        } catch (Throwable $e) {
            // Ignore schema mismatch issues in mock pages.
        }
    }

    return [
        'summary' => $summary,
        'recent_shipments' => $recentShipments,
    ];
}

function cp_mock_design_options(): array {
    return [
        1 => [
            'title' => 'Design 1 · Sticky total with expandable breakdown',
            'slug' => 'design-1.php',
            'description' => 'Total stays visible while charges expand inline for fast clarity.',
            'tag' => 'Balanced clarity'
        ],
        2 => [
            'title' => 'Design 2 · Always-visible compact summary card',
            'slug' => 'design-2.php',
            'description' => 'Compact rows are always visible with less tapping.',
            'tag' => 'Zero-friction reading'
        ],
        3 => [
            'title' => 'Design 3 · Bottom sheet charges',
            'slug' => 'design-3.php',
            'description' => 'A clean form with full charges inside a mobile-style sheet.',
            'tag' => 'Focused form flow'
        ],
        4 => [
            'title' => 'Design 4 · Common checkout accordion',
            'slug' => 'design-4.php',
            'description' => 'Standard e-commerce pattern with familiar order summary accordion.',
            'tag' => 'Commonly used UX'
        ],
    ];
}
