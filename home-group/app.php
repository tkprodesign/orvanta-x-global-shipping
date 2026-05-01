<?php
//setting initials
    session_start();
    ini_set('display_errors', 1);
    ini_set('display_startup_errors', 1);
    error_reporting(E_ALL);
    date_default_timezone_set('America/Chicago');



// PHP Mailer
if (file_exists('./PHPMailer/src/PHPMailer.php')) {
    require './PHPMailer/src/PHPMailer.php';
    require './PHPMailer/src/SMTP.php';
    require './PHPMailer/src/Exception.php';
} elseif (file_exists('../PHPMailer/src/PHPMailer.php')) {
    require '../PHPMailer/src/PHPMailer.php';
    require '../PHPMailer/src/SMTP.php';
    require '../PHPMailer/src/Exception.php';
} elseif (file_exists('../../PHPMailer/src/PHPMailer.php')) {
    require '../../PHPMailer/src/PHPMailer.php';
    require '../../PHPMailer/src/SMTP.php';
    require '../../PHPMailer/src/Exception.php'; 
} elseif (file_exists('../../../PHPMailer/src/PHPMailer.php')) {
    require '../../../PHPMailer/src/PHPMailer.php';
    require '../../../PHPMailer/src/SMTP.php';
    require '../../../PHPMailer/src/Exception.php'; 
} elseif (file_exists('../../../../PHPMailer/src/PHPMailer.php')) {
    require '../../../../PHPMailer/src/PHPMailer.php';
    require '../../../../PHPMailer/src/SMTP.php';
    require '../../../../PHPMailer/src/Exception.php'; 
} elseif (file_exists('../../../../../PHPMailer/src/PHPMailer.php')) {
    require '../../../../../PHPMailer/src/PHPMailer.php';
    require '../../../../../PHPMailer/src/SMTP.php';
    require '../../../../../PHPMailer/src/Exception.php'; 
} else {
    require '../../../../../../PHPMailer/src/PHPMailer.php';
    require '../../../../../../PHPMailer/src/SMTP.php';
    require '../../../../../../PHPMailer/src/Exception.php'; 
}





// Connecting To Database
$servername = "localhost";
$dbusername = "tyimttsm_dev2";
$dbpassword = "5Es~,+K@-&d6";
$dbname = "tyimttsm_dcs";
$dbconn = mysqli_connect($servername, $dbusername, $dbpassword, $dbname);
if (!$dbconn) {
  die("Connection failed: " . mysqli_connect_error());
}






    function test_input($data) {
        $data = trim($data);
        $data = stripslashes($data);
        $data = htmlspecialchars($data);
        return $data;
    }



    if ($_SERVER["REQUEST_METHOD"] == "POST"  && isset($_POST['free-quote-button']) && !empty($_POST['free-quote-button'])) {
        // Collect form data
        $name = $_POST['name'];
        $address = $_POST['address'];
        $phone_number = $_POST['phone_number'];
        $item_name = $_POST['item_name'];
        $origin = $_POST['origin'];
        $destination = $_POST['destination'];
        $receivers_name = $_POST['receivers_name'];
        $receivers_number = $_POST['receivers_number'];
        $receivers_email = $_POST['receivers_email'];
        $receivers_address = $_POST['receivers_address'];
        $postal_code = $_POST['postal_code'];
        $method = $_POST['method'];
        $free_quote_request = $_POST['free-quote-request'];
        $time = time();

        
        $sql = "INSERT INTO quotes (name, address, phone_number, item_name, origin, destination, receivers_name, receivers_number, receivers_email, receivers_address, postal_code, method, free_quote_request, time) VALUES ('$name', '$address', '$phone_number', '$item_name', '$origin', '$destination', '$receivers_name', '$receivers_number', '$receivers_email', '$receivers_address', '$postal_code', '$method', '$free_quote_request', $time)";

        if ($dbconn->query($sql) === TRUE) {
            $resendApiKey = 're_2e7JWzHc_9zdoBJs3FkKUzvJQuWccpd3s';
            $htmlContent = '
                <html><body>
                    <h2>New Free Quote Request Details</h2>
                    <p><strong>Sender\'s Name:</strong> ' . htmlspecialchars($name) . '</p>
                    <p><strong>Sender\'s Address:</strong> ' . htmlspecialchars($address) . '</p>
                    <p><strong>Sender\'s Phone Number:</strong> ' . htmlspecialchars($phone_number) . '</p>
                    <p><strong>Item Name:</strong> ' . htmlspecialchars($item_name) . '</p>
                    <p><strong>Package Origin:</strong> ' . htmlspecialchars($origin) . '</p>
                    <p><strong>Destination:</strong> ' . htmlspecialchars($destination) . '</p>
                    <p><strong>Receiver\'s Name:</strong> ' . htmlspecialchars($receivers_name) . '</p>
                    <p><strong>Receiver\'s Phone Number:</strong> ' . htmlspecialchars($receivers_number) . '</p>
                    <p><strong>Receiver\'s Email:</strong> ' . htmlspecialchars($receivers_email) . '</p>
                    <p><strong>Receiver\'s Address:</strong> ' . htmlspecialchars($receivers_address) . '</p>
                    <p><strong>Postal Code:</strong> ' . htmlspecialchars($postal_code) . '</p>
                    <p><strong>Method:</strong> ' . htmlspecialchars($method) . '</p>
                    <p><strong>Special Note:</strong> ' . htmlspecialchars($free_quote_request) . '</p>
                </body></html>';

            $payload = json_encode([
                'from' => 'OrvantaX Global Shipping <noreply@veteranlogisticsgroup.us>',
                'to' => ['admin@veteranlogisticsgroup.us'],
                'subject' => 'New Free Quote Request',
                'html' => $htmlContent,
            ]);

            $ch = curl_init('https://api.resend.com/emails');
            curl_setopt($ch, CURLOPT_POST, true);
            curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
            curl_setopt($ch, CURLOPT_HTTPHEADER, [
                'Authorization: Bearer ' . $resendApiKey,
                'Content-Type: application/json',
            ]);
            curl_setopt($ch, CURLOPT_POSTFIELDS, $payload);
            curl_exec($ch);
            curl_close($ch);
        } else {
            echo "Error: " . $sql . "<br>" . $dbconn->error;
        }


    }
?>