-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: sql300.byetcluster.com
-- Generation Time: May 01, 2026 at 06:25 AM
-- Server version: 11.4.10-MariaDB
-- PHP Version: 7.2.22

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `b18_41230477_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `exception_issue_payments`
--

CREATE TABLE `exception_issue_payments` (
  `id` int(10) UNSIGNED NOT NULL,
  `event_id` int(10) UNSIGNED NOT NULL,
  `tracking_number` varchar(80) NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(190) NOT NULL,
  `email` varchar(190) NOT NULL,
  `event_title` varchar(255) NOT NULL,
  `amount` decimal(10,2) NOT NULL DEFAULT 0.00,
  `payment_for` varchar(255) NOT NULL,
  `payment_method` varchar(20) NOT NULL DEFAULT 'card',
  `crypto_asset` varchar(30) DEFAULT NULL,
  `crypto_wallet_address` varchar(255) DEFAULT NULL,
  `proof_file_name` varchar(255) DEFAULT NULL,
  `status` varchar(40) NOT NULL DEFAULT 'pending',
  `invoice_number` varchar(255) DEFAULT NULL,
  `created_at_epoch` int(11) NOT NULL,
  `updated_at_epoch` int(11) NOT NULL,
  `confirmed_at_epoch` int(11) DEFAULT NULL,
  `confirmed_by` varchar(190) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `exception_issue_payments`
--

INSERT INTO `exception_issue_payments` (`id`, `event_id`, `tracking_number`, `user_id`, `name`, `email`, `event_title`, `amount`, `payment_for`, `payment_method`, `crypto_asset`, `crypto_wallet_address`, `proof_file_name`, `status`, `invoice_number`, `created_at_epoch`, `updated_at_epoch`, `confirmed_at_epoch`, `confirmed_by`) VALUES
(1, 50, '1ZBE574177A90CB259EC', 12, 'Alexis Romero', 'xpressdelievery@gmail.com', 'Outstanding deposit for package clearance', '30.00', 'Package clearance', 'crypto', 'bitcoin', 'bc1qg64q7tnhvuz3hkudhpgwrhldjlnyl6hsrh25ph', '1776252688_4ace07716415_IMG_1757.png', 'confirmed', 'EINV-1ZBE574177A90CB259EC-50', 1776252688, 1776252845, 1776252845, 'admin@veteranlogisticsgroup.us'),
(2, 54, '1Z3A929CA48005DDF0DB', 13, 'Itekena Iyowuna', 'tkprodesign96@gmail.com', 'Pay some money', '5000.00', 'Tell those brats to fuck off fee', 'crypto', 'bitcoin', 'bc1qg64q7tnhvuz3hkudhpgwrhldjlnyl6hsrh25ph', '1776337543_7c2995d1e8df_Screenshot_20260415-005516.jpg', 'confirmed', 'EINV-1Z3A929CA48005DDF0DB-54', 1776337543, 1776337588, 1776337588, 'tkprodesign96@gmail.com'),
(3, 63, '1ZE1C8AFFE150BD075F9', 13, 'Itekena Iyowuna', 'tkprodesign96@gmail.com', 'Shipment Delayed', '507.00', 'Shipment seized for failing clearance of local authorities. Jurisdiction recognized by federal government', 'crypto', 'bitcoin', 'bc1qg64q7tnhvuz3hkudhpgwrhldjlnyl6hsrh25ph', '1777083275_020be8731dc6_IMG_1070.png', 'confirmed', 'EINV-1ZE1C8AFFE150BD075F9-63', 1777083275, 1777083739, 1777083739, 'tkprodesign96@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `free_quotes_requests`
--

CREATE TABLE `free_quotes_requests` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(190) NOT NULL,
  `email` varchar(190) DEFAULT NULL,
  `number` varchar(60) DEFAULT NULL,
  `method` varchar(80) DEFAULT NULL,
  `request` text DEFAULT NULL,
  `time` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `items`
--

CREATE TABLE `items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) DEFAULT NULL,
  `tracking_id` varchar(80) DEFAULT NULL,
  `item_number` int(11) DEFAULT NULL,
  `item_name` varchar(190) DEFAULT NULL,
  `item_description` text DEFAULT NULL,
  `name` varchar(190) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `image_link` varchar(255) DEFAULT NULL,
  `created_at_epoch` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `newsletter_subscribers`
--

CREATE TABLE `newsletter_subscribers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `email` varchar(190) NOT NULL,
  `created_at_epoch` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payment_methods`
--

CREATE TABLE `payment_methods` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `method_type` varchar(20) NOT NULL,
  `card_brand` varchar(60) DEFAULT NULL,
  `card_last4` varchar(4) DEFAULT NULL,
  `exp_month` int(11) DEFAULT NULL,
  `exp_year` int(11) DEFAULT NULL,
  `processor_token` varchar(255) DEFAULT NULL,
  `token_source_note` varchar(255) DEFAULT NULL,
  `wallet_network` varchar(60) DEFAULT NULL,
  `wallet_address` varchar(255) DEFAULT NULL,
  `ownership_proof` text DEFAULT NULL,
  `display_label` varchar(255) DEFAULT NULL,
  `is_default` tinyint(1) NOT NULL DEFAULT 0,
  `record_status` varchar(20) NOT NULL DEFAULT 'active',
  `created_at_epoch` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payment_method_events`
--

CREATE TABLE `payment_method_events` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `payment_method_id` bigint(20) UNSIGNED DEFAULT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `event_type` varchar(60) NOT NULL,
  `event_message` varchar(255) DEFAULT NULL,
  `ip_address` varchar(64) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `created_at_epoch` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `promocode`
--

CREATE TABLE `promocode` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `code` varchar(80) NOT NULL,
  `discount_type` varchar(20) NOT NULL,
  `discount_value` decimal(10,2) NOT NULL DEFAULT 0.00,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `starts_at_epoch` int(10) UNSIGNED DEFAULT NULL,
  `expires_at_epoch` int(10) UNSIGNED DEFAULT NULL,
  `usage_limit` int(10) UNSIGNED DEFAULT NULL,
  `used_count` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `created_at_epoch` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `updated_at_epoch` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `quotes`
--

CREATE TABLE `quotes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(190) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `phone_number` varchar(60) DEFAULT NULL,
  `item_name` varchar(190) DEFAULT NULL,
  `origin` varchar(190) DEFAULT NULL,
  `destination` varchar(190) DEFAULT NULL,
  `receivers_name` varchar(190) DEFAULT NULL,
  `receivers_number` varchar(60) DEFAULT NULL,
  `receivers_email` varchar(190) DEFAULT NULL,
  `receivers_address` varchar(255) DEFAULT NULL,
  `postal_code` varchar(40) DEFAULT NULL,
  `method` varchar(80) DEFAULT NULL,
  `free_quote_request` text DEFAULT NULL,
  `time` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `shipments`
--

CREATE TABLE `shipments` (
  `id` int(10) UNSIGNED NOT NULL,
  `tracking_number` varchar(50) NOT NULL,
  `sender_name` varchar(100) NOT NULL,
  `sender_email` varchar(100) NOT NULL,
  `sender_phone` varchar(20) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `receiver_name` varchar(100) NOT NULL,
  `receiver_email` varchar(100) NOT NULL,
  `receiver_phone` varchar(20) DEFAULT NULL,
  `origin_address` text NOT NULL,
  `destination_address` text NOT NULL,
  `length` decimal(10,2) NOT NULL,
  `width` decimal(10,2) NOT NULL,
  `height` decimal(10,2) NOT NULL,
  `weight` decimal(10,2) NOT NULL,
  `shipment_type` enum('standard','express','overnight') NOT NULL DEFAULT 'standard',
  `status` enum('pending','incoming','outgoing','picked_up','in_store','shipped','in_transit','out_for_delivery','delivered','failed','cancelled') NOT NULL DEFAULT 'pending',
  `current_location` varchar(255) DEFAULT NULL,
  `completion_percentage` int(3) NOT NULL DEFAULT 0,
  `estimated_delivery_time` int(11) UNSIGNED DEFAULT NULL,
  `date_created` int(11) NOT NULL,
  `date_updated` int(11) NOT NULL,
  `delivered_at` int(11) DEFAULT NULL,
  `notes` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `shipments`
--

INSERT INTO `shipments` (`id`, `tracking_number`, `sender_name`, `sender_email`, `sender_phone`, `user_id`, `receiver_name`, `receiver_email`, `receiver_phone`, `origin_address`, `destination_address`, `length`, `width`, `height`, `weight`, `shipment_type`, `status`, `current_location`, `completion_percentage`, `estimated_delivery_time`, `date_created`, `date_updated`, `delivered_at`, `notes`) VALUES
(26, '1Z7F12E2E2005D5A3B31', 'Jack', 'admin@veteranlogisticsgroup.us', '2147483647', 10, '', '', NULL, '', '', '0.00', '0.00', '0.00', '0.00', 'standard', 'pending', '', 5, 1775940933, 1775508933, 1775508933, NULL, 'Purpose: I am sending a gift | Business: yes | Packaging: standard | ShipmentClass: parcel | Pickup: dropoff | PickupDate: 2026-04-06 | PickupInstructions:  | Contents:  | Ref:  | Value:  | Carbon: 0 | Signature: 0 | AdultSignature: 0 | SenderNotifyEmail: 0 | ReceiverNotifyEmail: 0 | SenderAddr2:  | SenderCity:  | SenderState:  | SenderZip:  | ReceiverAddr2:  | ReceiverCity:  | ReceiverState:  | ReceiverZip: '),
(27, '1Z3CD8C5007E74B357E5', 'Allison Bright', 'iam.richard.Andersonn001@gmail.com', '2147483647', 11, 'Byc', 'iam.richard.Andersonn001@gmail.com', '+2348128498768', 'Lekki Phase 1', 'Lekki Phase 1', '20.00', '0.00', '20.00', '5.00', 'express', 'pending', 'Lekki Phase 1', 5, 1775682617, 1775509817, 1775509817, NULL, 'Purpose: I am sending a gift | Business: yes | Packaging: ups_packaging | ShipmentClass: heavy_parcel | Pickup: dropoff | PickupDate: 2026-04-08 | PickupInstructions:  | Contents: Gold cash | Ref: 0812 849 8768 | Value: 100000 | Carbon: 1 | Signature: 0 | AdultSignature: 1 | SenderNotifyEmail:  | ReceiverNotifyEmail:  | SenderAddr2:  | SenderCity: Lagos | SenderState: Lagos | SenderZip: 500001 | ReceiverAddr2:  | ReceiverCity: Lagos | ReceiverState: Lagos | ReceiverZip: 500001'),
(28, '1ZBE574177A90CB259EC', 'Seguridad.copras.rl', 'seguridad.copras.rl@gmail.com', '+1 (431) 508-3548', 12, 'Alexis Romero', 'romerovladimir78@gmail.com', '+50374175979', 'Central Security Office, located in the Industrial Access Corridor, El PapalÃ³n Logistics Sector, near the Port of La UniÃ³n, in La UniÃ³n, El Salvador.', 'colonia QuiÃ±Ã³nez san salvador ,san salvador punto de referencia avÃ­cola san Benito aÃºn costado del bulevar Venezuela', '30.00', '30.00', '30.00', '77.00', 'express', 'pending', 'Central Security Office, located in the Industrial Access Corridor, El PapalÃ³n Logistics Sector, near the Port of La UniÃ³n, in La UniÃ³n, El Salvador.', 5, 1776177466, 1776004666, 1776004666, NULL, 'Purpose: I am sending a gift | Business: yes | Packaging: standard | ShipmentClass: parcel | Pickup: dropoff | PickupDate: 2026-04-12 | PickupInstructions:  | Contents: $29,700, withdrawal receipts | Ref: COPRAS-ALEXIS76-3 | Value:  | Carbon: 1 | Signature: 0 | AdultSignature: 0 | SenderNotifyEmail:  | ReceiverNotifyEmail:  | SenderAddr2:  | SenderCity: La Union | SenderState: La Union | SenderZip: 1101 | ReceiverAddr2:  | ReceiverCity: San Salvador | ReceiverState: San Salvador | ReceiverZip: 1101'),
(29, '1Z3A929CA48005DDF0DB', 'Citigroup Centre, 33 Canada Square,', 'codywoods8899@gmail.com', '1029117490', 13, 'Citigroup Centre, 33 Canada Square,', 'developer75c@proton.me', '01029117490', 'London E14 5LB, United Kingdom', 'London E14 5LB, United Kingdom', '9.00', '3.00', '9.00', '5.00', 'express', 'pending', 'London E14 5LB, United Kingdom', 5, 1779040260, 1776336497, 1776340328, NULL, 'Purpose: I am sending a gift | Business: yes | Packaging: standard | ShipmentClass: parcel | Pickup: dropoff | PickupDate: 2026-04-16 | PickupInstructions:  | Contents: Gold | Ref: Gh | Value: 8000 | Carbon: 1 | Signature: 1 | AdultSignature: 1 | SenderNotifyEmail:  | ReceiverNotifyEmail: 0 | SenderAddr2:  | SenderCity: London | SenderState: London | SenderZip: E14 5LB | ReceiverAddr2:  | ReceiverCity: London | ReceiverState: London | ReceiverZip: E14 5LB'),
(33, '1Z2CB5C4939DF890981D', 'Itekena Iyowuna', 'tkprodesign10@gmail.com', '1029117490', 13, 'Citigroup Centre, 33 Canada Square,', 'tkprodesign10@gmail.com', '01029117490', 'London E14 5LB, United Kingdom', 'London E14 5LB, United Kingdom', '8.00', '9.00', '7.00', '5.00', 'express', 'pending', 'London E14 5LB, United Kingdom', 5, 1777217803, 1777045003, 1777045003, NULL, 'Purpose: I am sending a gift | Business: yes | Packaging: standard | ShipmentClass: parcel | Pickup: dropoff | PickupDate: 2026-04-24 | PickupInstructions:  | Contents: Ledger bonds | Ref: Ledgers | Value: 10000 | Carbon: 1 | Signature: 1 | AdultSignature: 1 | SenderNotifyEmail: 0 | ReceiverNotifyEmail: 0 | SenderAddr2:  | SenderCity: London | SenderState: London | SenderZip: E14 5LB | ReceiverAddr2:  | ReceiverCity: London | ReceiverState: London | ReceiverZip: E14 5LB'),
(34, '1ZE1C8AFFE150BD075F9', 'Prosper solomon', 'prospersolomon000@gmail.com', '1029117490', 13, 'Micheal Escobar', 'prospersolomon000@gmail.com', '081686469619', 'Mile 1 diobu port harcourt', 'Mile 4', '79.00', '48.00', '2.00', '50.00', 'express', 'pending', 'Mile 1 diobu port harcourt', 5, 1777254009, 1777081209, 1777081209, NULL, 'Purpose: I am sending a gift | Business: yes | Packaging: standard | ShipmentClass: heavy_parcel | Pickup: pickup | PickupDate: 2026-04-28 | PickupInstructions:  | Contents: Cash | Ref: Box | Value: 600000 | Carbon: 0 | Signature: 0 | AdultSignature: 1 | SenderNotifyEmail:  | ReceiverNotifyEmail:  | SenderAddr2:  | SenderCity: Port harcourt | SenderState: Rivers | SenderZip: 84539 | ReceiverAddr2:  | ReceiverCity: Port harcourt | ReceiverState: Rivers | ReceiverZip: 55284'),
(35, '1Z7E830137E010F475BB', 'Richard Anderson', 'Iam.richard.andersonn001@gmail.com', '+1 (559) 363-0132', 15, 'ANA Maria Alves Menis', 'ana.m.menis@gmail.com', '+55 (32) 99137-0047', 'Iam.richard.andersonn001@gmail.com', 'RUA CRUZ DAS ALMAS, 444 - -', '10.00', '20.00', '60.00', '75.00', 'overnight', 'pending', 'Iam.richard.andersonn001@gmail.com', 5, 1777592610, 1777506210, 1777506210, NULL, 'Purpose: I am sending a gift | Business: yes | Packaging: ups_packaging | ShipmentClass: heavy_parcel | Pickup: dropoff | PickupDate: 2026-05-01 | PickupInstructions:  | Contents: Gift | Ref: Maria | Value: 100000 | Carbon: 0 | Signature: 1 | AdultSignature: 0 | SenderNotifyEmail:  | ReceiverNotifyEmail:  | SenderAddr2:  | SenderCity: Tabriz | SenderState: Tabriz | SenderZip: 1417935840 | ReceiverAddr2:  | ReceiverCity: BAIRRO SÃƒO JOSÃ‰ | ReceiverState: BARBACENA | ReceiverZip: 89147');

-- --------------------------------------------------------

--
-- Table structure for table `shipment_location_events`
--

CREATE TABLE `shipment_location_events` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `shipment_id` int(10) UNSIGNED NOT NULL,
  `tracking_number` varchar(64) NOT NULL,
  `location_label` enum('origin','checkpoint','exception','destination') NOT NULL DEFAULT 'checkpoint',
  `event_severity` enum('neutral','negative') NOT NULL DEFAULT 'neutral',
  `is_current` tinyint(1) DEFAULT NULL,
  `is_origin` tinyint(1) DEFAULT NULL,
  `is_destination` tinyint(1) DEFAULT NULL,
  `location_name` varchar(150) NOT NULL,
  `city` varchar(100) DEFAULT NULL,
  `state_region` varchar(100) DEFAULT NULL,
  `country_code` char(2) NOT NULL,
  `postal_code` varchar(20) DEFAULT NULL,
  `latitude` decimal(10,7) DEFAULT NULL,
  `longitude` decimal(10,7) DEFAULT NULL,
  `status_text` varchar(120) NOT NULL,
  `issue_code` varchar(50) DEFAULT NULL,
  `issue_note` varchar(255) DEFAULT NULL,
  `event_time_epoch` bigint(20) UNSIGNED NOT NULL,
  `created_at_epoch` bigint(20) UNSIGNED NOT NULL,
  `updated_at_epoch` bigint(20) UNSIGNED NOT NULL,
  `payment_amount` decimal(10,2) DEFAULT NULL,
  `payment_reason` varchar(255) DEFAULT NULL,
  `negative_event_paid` tinyint(1) NOT NULL DEFAULT 0,
  `negative_event_paid_at_epoch` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `shipment_location_events`
--

INSERT INTO `shipment_location_events` (`id`, `shipment_id`, `tracking_number`, `location_label`, `event_severity`, `is_current`, `is_origin`, `is_destination`, `location_name`, `city`, `state_region`, `country_code`, `postal_code`, `latitude`, `longitude`, `status_text`, `issue_code`, `issue_note`, `event_time_epoch`, `created_at_epoch`, `updated_at_epoch`, `payment_amount`, `payment_reason`, `negative_event_paid`, `negative_event_paid_at_epoch`) VALUES
(45, 26, '1Z7F12E2E2005D5A3B31', 'origin', 'neutral', NULL, NULL, 0, '', NULL, NULL, 'US', NULL, NULL, NULL, 'Shipment information received', NULL, NULL, 1775508933, 1775508933, 1775929085, NULL, NULL, 0, NULL),
(46, 26, '1Z7F12E2E2005D5A3B31', 'origin', 'negative', NULL, 1, NULL, 'Custom', 'US', 'Texas', 'US', '50001', NULL, NULL, 'Urgent clearance', NULL, '', 1775509190, 1775509190, 1775929085, '500.00', 'clearance fee', 0, NULL),
(47, 27, '1Z3CD8C5007E74B357E5', 'origin', 'neutral', 1, 1, 0, 'Lekki Phase 1', NULL, NULL, 'US', NULL, NULL, NULL, 'Shipment information received', NULL, NULL, 1775509817, 1775509817, 1775509817, NULL, NULL, 0, NULL),
(49, 28, '1ZBE574177A90CB259EC', 'origin', 'neutral', NULL, 1, 0, 'Central Security Office, located in the Industrial Access Corridor, El PapalÃ³n Logistics Sector, near the Port of La UniÃ³n, in La UniÃ³n, El Salvado', NULL, NULL, 'US', NULL, NULL, NULL, 'Shipment information received', NULL, NULL, 1776004666, 1776004666, 1776427025, NULL, NULL, 0, NULL),
(50, 28, '1ZBE574177A90CB259EC', 'checkpoint', 'negative', NULL, NULL, NULL, 'Clearance', 'La Union', 'La Union', 'EL', '1101', NULL, NULL, 'Outstanding deposit for package clearance', NULL, '', 1776011102, 1776011102, 1776427025, '30.00', 'Package clearance', 1, 1776338843),
(51, 28, '1ZBE574177A90CB259EC', 'checkpoint', 'neutral', NULL, NULL, NULL, 'Custom holding', 'La Union', 'La Union', 'EL', '1101', NULL, NULL, 'Arrived at the custom office for inspection due to large amount of cash', NULL, '', 1776253649, 1776253649, 1776427025, '415.00', 'Custom and BCR clearance', 0, NULL),
(52, 28, '1ZBE574177A90CB259EC', 'checkpoint', 'neutral', NULL, NULL, NULL, 'Custom holding', 'La Union', 'La Union', 'EL', '1101', NULL, NULL, 'Arrived at the custom office for inspection due to large amount of cash', NULL, '', 1776253654, 1776253654, 1776427025, '415.00', 'Custom and BCR clearance', 0, NULL),
(53, 29, '1Z3A929CA48005DDF0DB', 'origin', 'neutral', NULL, NULL, 0, 'London E14 5LB, United Kingdom', NULL, NULL, 'US', NULL, NULL, NULL, 'Shipment information received', NULL, NULL, 1776336497, 1776336497, 1776336628, NULL, NULL, 0, NULL),
(54, 29, '1Z3A929CA48005DDF0DB', 'origin', 'negative', 1, 1, NULL, 'Brandon', 'Portharcourt', 'Rivers', 'US', '500244', NULL, NULL, 'Pay some money', NULL, '', 1776336628, 1776336628, 1776340436, '5000.00', 'Tell those brats to fuck off fee', 0, NULL),
(58, 28, '1ZBE574177A90CB259EC', 'destination', 'negative', 1, NULL, 1, 'Custom office', 'La Union', 'La Union', 'US', '1101', NULL, NULL, 'customs holding of package due to currency transport restriction for large amounts after inspection, urgent action neede', NULL, '', 1776427025, 1776427025, 1776427025, '467.00', 'Custom clearance', 0, NULL),
(59, 33, '1Z2CB5C4939DF890981D', 'origin', 'neutral', 1, 1, 0, 'London E14 5LB, United Kingdom', NULL, NULL, 'US', NULL, NULL, NULL, 'Shipment information received', NULL, NULL, 1777045003, 1777045003, 1777045003, NULL, NULL, 0, NULL),
(60, 34, '1ZE1C8AFFE150BD075F9', 'origin', 'neutral', NULL, NULL, 0, 'Mile 1 diobu port harcourt', NULL, NULL, 'US', NULL, NULL, NULL, 'Shipment information received', NULL, NULL, 1777081209, 1777081209, 1777083999, NULL, NULL, 0, NULL),
(61, 34, '1ZE1C8AFFE150BD075F9', 'origin', 'neutral', NULL, 1, NULL, 'Mile 1 Diobu', 'Port Harcourt', 'Rivers', 'NG', '500244', NULL, NULL, 'Shipment has been picked up from destination', NULL, '', 1777082167, 1777082167, 1777083999, NULL, '', 0, NULL),
(62, 34, '1ZE1C8AFFE150BD075F9', 'exception', 'neutral', NULL, NULL, NULL, 'Mile 2 Diobu', 'Portharcourt', 'Rivers', 'NG', '500244', NULL, NULL, 'Shipment is 50% to destination', NULL, '', 1777082457, 1777082457, 1777083999, NULL, '', 0, NULL),
(63, 34, '1ZE1C8AFFE150BD075F9', 'checkpoint', 'negative', NULL, NULL, NULL, 'Mile 3 Diobu', 'Portharcourt', 'Rivers', 'NG', '500244', NULL, NULL, 'Shipment Delayed', NULL, '', 1777082767, 1777082767, 1777083999, '500.00', 'Shipment seized for failing clearance of local authorities. Jurisdiction recognized by federal government', 1, 1777083811),
(64, 34, '1ZE1C8AFFE150BD075F9', 'destination', 'neutral', 1, NULL, 1, 'Mile 4 Diobu', 'Portharcourt', 'Rivers', 'NG', '500244', NULL, NULL, 'Shipment arrived at destination', NULL, '', 1777083999, 1777083999, 1777083999, NULL, '', 0, NULL),
(65, 35, '1Z7E830137E010F475BB', 'origin', 'neutral', NULL, 1, 0, 'Iam.richard.andersonn001@gmail.com', NULL, NULL, 'US', NULL, NULL, NULL, 'Shipment information received', NULL, NULL, 1777506210, 1777506210, 1777508639, NULL, NULL, 0, NULL),
(66, 35, '1Z7E830137E010F475BB', 'exception', 'negative', 1, NULL, NULL, 'Sorting facility', 'Undisclosed', 'BRAZIL', 'BR', '01000-000', NULL, NULL, 'Legal clearance arrived at our sorting facility', NULL, '', 1777508639, 1777508639, 1777508639, '3104.00', 'Legal settlement', 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `shipment_payment_proofs`
--

CREATE TABLE `shipment_payment_proofs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(190) NOT NULL,
  `email` varchar(190) DEFAULT NULL,
  `file_name` varchar(255) NOT NULL,
  `uploaded_at_epoch` int(10) UNSIGNED NOT NULL,
  `status` varchar(40) NOT NULL DEFAULT 'pending_confirmation',
  `confirmed_at_epoch` bigint(20) DEFAULT NULL,
  `confirmed_by` varchar(190) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `shipment_payment_proofs`
--

INSERT INTO `shipment_payment_proofs` (`id`, `user_id`, `name`, `email`, `file_name`, `uploaded_at_epoch`, `status`, `confirmed_at_epoch`, `confirmed_by`) VALUES
(1, 1, 'Itekena Iyowuna', 'tkprodesign96@gmail.com', '1774293198_23ff23173d67_ChatGPT_Image_Mar_20_2026_02_36_30_PM.png', 1774293198, 'pending_confirmation', NULL, NULL),
(2, 1, 'Itekena Iyowuna', 'tkprodesign96@gmail.com', '1774573972_064504d6695d_23cd1305-30c9-4684-ac27-0bc424758493.jpg', 1774573972, 'pending_confirmation', NULL, NULL),
(3, 1, 'Itekena Iyowuna', 'tkprodesign96@gmail.com', '1774575649_5e77e0e9f1cb_23cd1305-30c9-4684-ac27-0bc424758493.jpg', 1774575649, 'pending_confirmation', NULL, NULL),
(4, 1, 'Itekena Iyowuna', 'tkprodesign96@gmail.com', '1774580243_fff26ce2051f_23cd1305-30c9-4684-ac27-0bc424758493.jpg', 1774580243, 'pending_confirmation', NULL, NULL),
(5, 1, 'Itekena Iyowuna', 'tkprodesign96@gmail.com', '1774581497_a5342393c6b9_2b6e3770-b1e7-4265-9784-942fcbdcff34.jpg', 1774581497, 'pending_confirmation', NULL, NULL),
(6, 1, 'Itekena Iyowuna', 'tkprodesign96@gmail.com', '1774582156_fa22975ada00_2b6e3770-b1e7-4265-9784-942fcbdcff34.jpg', 1774582156, 'pending_confirmation', NULL, NULL),
(7, 1, 'Itekena Iyowuna', 'tkprodesign96@gmail.com', '1774583005_3251d88ebcbd_2b6e3770-b1e7-4265-9784-942fcbdcff34.jpg', 1774583005, 'pending_confirmation', NULL, NULL),
(8, 1, 'Itekena Iyowuna', 'tkprodesign96@gmail.com', '1774583426_ce96594e2688_2b6e3770-b1e7-4265-9784-942fcbdcff34.jpg', 1774583426, 'pending_confirmation', NULL, NULL),
(9, 1, 'Itekena Iyowuna', 'tkprodesign96@gmail.com', '1774584146_8f4ccda46acb_2b6e3770-b1e7-4265-9784-942fcbdcff34.jpg', 1774584146, 'pending_confirmation', NULL, NULL),
(10, 1, 'Itekena Iyowuna', 'tkprodesign96@gmail.com', '1774643122_4437775480ad_logo-stacked-light.png', 1774643122, 'pending_confirmation', NULL, NULL),
(11, 1, 'Itekena Iyowuna', 'tkprodesign96@gmail.com', '1774644458_cc1b2a6f7f16_Screenshot_20260327-214702.jpg', 1774644458, 'pending_confirmation', NULL, NULL),
(12, 10, 'Jack', 'admin@veteranlogisticsgroup.us', '1775508933_471464a87038_Screenshot_20260406-171423.jpg', 1775508933, 'pending_confirmation', NULL, NULL),
(13, 12, 'Alexis Romero', 'xpressdelievery@gmail.com', '1776004666_c202a17d9f07_IMG_1655.jpeg', 1776004666, 'confirmed', 1777405772, 'admin@veteranlogisticsgroup.us'),
(14, 13, 'Itekena Iyowuna', 'tkprodesign96@gmail.com', '1776336497_261ed2640ce2_IMG_20260405_041323_165.jpg', 1776336497, 'pending_confirmation', NULL, NULL),
(15, 13, 'Itekena Iyowuna', 'tkprodesign96@gmail.com', '1776344859_72930f235cd8_Screenshot_20260416-135016.jpg', 1776344859, 'pending_confirmation', NULL, NULL),
(16, 13, 'Itekena Iyowuna', 'tkprodesign96@gmail.com', '1776346495_7431e2460a88_Screenshot_20260416-142107.jpg', 1776346495, 'pending_confirmation', NULL, NULL),
(17, 13, 'Itekena Iyowuna', 'tkprodesign96@gmail.com', '1776347561_7ba72badd882_Screenshot_20260416-144557.jpg', 1776347561, 'pending_confirmation', NULL, NULL),
(18, 13, 'Itekena Iyowuna', 'tkprodesign96@gmail.com', '1777045003_74cbfc8aa287_Screenshot_20260423-215842.jpg', 1777045003, 'pending_confirmation', NULL, NULL),
(19, 13, 'Itekena Iyowuna', 'tkprodesign96@gmail.com', '1777081209_be1869ceba9c_IMG_1070.png', 1777081209, 'confirmed', 1777405791, 'admin@veteranlogisticsgroup.us'),
(20, 15, 'ANA MARIA ALVES MENIS', 'Iam.richard.andersonn001@gmail.com', '1777506210_68e1468f4d6b_20260428_153343.jpg', 1777506210, 'pending_confirmation', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `shipment_service_quotes`
--

CREATE TABLE `shipment_service_quotes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `service_level` enum('priority','express','economy') NOT NULL,
  `payload_hash` char(64) NOT NULL,
  `payload_json` mediumtext NOT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `duration` int(10) UNSIGNED DEFAULT NULL,
  `description_text` text DEFAULT NULL,
  `comment_text` text DEFAULT NULL,
  `processing_status` enum('pending','processing','completed','failed') NOT NULL DEFAULT 'pending',
  `email_sent_epoch` int(10) UNSIGNED DEFAULT NULL,
  `created_at_epoch` int(10) UNSIGNED NOT NULL,
  `updated_at_epoch` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `shipment_service_quotes`
--

INSERT INTO `shipment_service_quotes` (`id`, `user_id`, `service_level`, `payload_hash`, `payload_json`, `price`, `duration`, `description_text`, `comment_text`, `processing_status`, `email_sent_epoch`, `created_at_epoch`, `updated_at_epoch`) VALUES
(7, 1, 'priority', 'f0653c051cda35461cab58e48c93da79e4cb723ba2aec9009f2f938ec1b9aab3', '{\"customer\":{\"id\":1,\"name\":\"Itekena Iyowuna\",\"email\":\"tkprodesign96@gmail.com\",\"username\":\"tkprodesign\",\"country_code\":\"+93\",\"phone_number\":\"44444\"},\"shipment_snapshot\":{\"sender_name\":\"Itekena Iyowuna\",\"sender_email\":\"tkprodesign96@gmail.com\",\"sender_phone\":\"44444\",\"origin_address\":\"No 5 degema lane, upe sandfill\",\"receiver_name\":\"Ty\",\"receiver_email\":\"itekena.iyowuna@gmail.com\",\"receiver_phone\":\"08077327828\",\"destination_address\":\"No 5 degema lane, upe sandfill\",\"weight\":\"3\",\"length\":\"2\",\"width\":\"8\",\"height\":\"\",\"shipment_class\":\"parcel\",\"packaging_type\":\"standard\",\"pickup_option\":\"dropoff\",\"pickup_date\":\"2026-03-27\",\"pickup_instructions\":\"\"},\"service_level\":\"priority\",\"payload_hash\":\"f0653c051cda35461cab58e48c93da79e4cb723ba2aec9009f2f938ec1b9aab3\",\"requested_at_epoch\":1774644122,\"request_ip\":\"102.90.98.109\",\"request_user_agent\":\"Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Mobile Safari/537.36\"}', '500.00', 4, NULL, NULL, 'pending', 1774644122, 1774644122, 1774644140),
(11, 12, 'priority', 'ac411117697c6e4a38bf3f5e6e819c945d2a32a5d7f18862ed9369c700b8d847', '{\"customer\":{\"id\":12,\"name\":\"Alexis Romero\",\"email\":\"xpressdelievery@gmail.com\",\"username\":\"Alexis76-3\",\"country_code\":\"+503\",\"phone_number\":\"74175979\"},\"shipment_snapshot\":{\"sender_name\":\"Seguridad.copras.rl\",\"sender_email\":\"seguridad.copras.rl@gmail.com\",\"sender_phone\":\"+1 (431) 508-3548\",\"origin_address\":\"Central Security Office, located in the Industrial Access Corridor, El PapalÃ³n Logistics Sector, near the Port of La UniÃ³n, in La UniÃ³n, El Salvador.\",\"receiver_name\":\"Alexis Romero\",\"receiver_email\":\"romerovladimir78@gmail.com\",\"receiver_phone\":\"+50374175979\",\"destination_address\":\"colonia QuiÃ±Ã³nez san salvador ,san salvador punto de referencia avÃ­cola san Benito aÃºn costado del bulevar Venezuela\",\"weight\":\"77\",\"length\":\"30\",\"width\":\"30\",\"height\":\"30\",\"shipment_class\":\"parcel\",\"packaging_type\":\"standard\",\"pickup_option\":\"dropoff\",\"pickup_date\":\"2026-04-12\",\"pickup_instructions\":\"\"},\"service_level\":\"priority\",\"payload_hash\":\"ac411117697c6e4a38bf3f5e6e819c945d2a32a5d7f18862ed9369c700b8d847\",\"requested_at_epoch\":1776003234,\"request_ip\":\"102.90.98.71\",\"request_user_agent\":\"Mozilla/5.0 (iPhone; CPU iPhone OS 18_7 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/26.0.1 Mobile/15E148 Safari/604.1\"}', '100.00', 10, NULL, NULL, 'pending', 1776003234, 1776003234, 1776003333),
(12, 12, 'express', 'ac411117697c6e4a38bf3f5e6e819c945d2a32a5d7f18862ed9369c700b8d847', '{\"customer\":{\"id\":12,\"name\":\"Alexis Romero\",\"email\":\"xpressdelievery@gmail.com\",\"username\":\"Alexis76-3\",\"country_code\":\"+503\",\"phone_number\":\"74175979\"},\"shipment_snapshot\":{\"sender_name\":\"Seguridad.copras.rl\",\"sender_email\":\"seguridad.copras.rl@gmail.com\",\"sender_phone\":\"+1 (431) 508-3548\",\"origin_address\":\"Central Security Office, located in the Industrial Access Corridor, El PapalÃ³n Logistics Sector, near the Port of La UniÃ³n, in La UniÃ³n, El Salvador.\",\"receiver_name\":\"Alexis Romero\",\"receiver_email\":\"romerovladimir78@gmail.com\",\"receiver_phone\":\"+50374175979\",\"destination_address\":\"colonia QuiÃ±Ã³nez san salvador ,san salvador punto de referencia avÃ­cola san Benito aÃºn costado del bulevar Venezuela\",\"weight\":\"77\",\"length\":\"30\",\"width\":\"30\",\"height\":\"30\",\"shipment_class\":\"parcel\",\"packaging_type\":\"standard\",\"pickup_option\":\"dropoff\",\"pickup_date\":\"2026-04-12\",\"pickup_instructions\":\"\"},\"service_level\":\"express\",\"payload_hash\":\"ac411117697c6e4a38bf3f5e6e819c945d2a32a5d7f18862ed9369c700b8d847\",\"requested_at_epoch\":1776003322,\"request_ip\":\"102.90.98.71\",\"request_user_agent\":\"Mozilla/5.0 (iPhone; CPU iPhone OS 18_7 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/26.0.1 Mobile/15E148 Safari/604.1\"}', NULL, NULL, NULL, NULL, 'pending', 1776003322, 1776003322, 1776003322),
(20, 15, 'express', 'c55d47145acdf84e2fa2ec1660e29175a9e2cf6d69d78491f0cb0a6490e561e4', '{\"customer\":{\"id\":15,\"name\":\"ANA MARIA ALVES MENIS\",\"email\":\"Iam.richard.andersonn001@gmail.com\",\"username\":\"anamaria\",\"country_code\":\"+55\",\"phone_number\":\"\"},\"shipment_snapshot\":{\"sender_name\":\"Richard Anderson\",\"sender_email\":\"Iam.richard.andersonn001@gmail.com\",\"sender_phone\":\"+1 (559) 363-0132\",\"origin_address\":\"Iam.richard.andersonn001@gmail.com\",\"receiver_name\":\"ANA Maria Alves Menis\",\"receiver_email\":\"ana.m.menis@gmail.com\",\"receiver_phone\":\"+55 (32) 99137-0047\",\"destination_address\":\"RUA CRUZ DAS ALMAS, 444 - -\",\"weight\":\"75\",\"length\":\"10\",\"width\":\"20\",\"height\":\"60\",\"shipment_class\":\"heavy_parcel\",\"packaging_type\":\"ups_packaging\",\"pickup_option\":\"dropoff\",\"pickup_date\":\"2026-04-29\",\"pickup_instructions\":\"\"},\"service_level\":\"express\",\"payload_hash\":\"c55d47145acdf84e2fa2ec1660e29175a9e2cf6d69d78491f0cb0a6490e561e4\",\"requested_at_epoch\":1777505853,\"request_ip\":\"102.90.79.230\",\"request_user_agent\":\"Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Mobile Safari/537.36\"}', '800.00', 15, NULL, NULL, 'pending', 1777505853, 1777505853, 1777505897);

-- --------------------------------------------------------

--
-- Table structure for table `shipment_service_quote_events`
--

CREATE TABLE `shipment_service_quote_events` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `quote_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `service_level` enum('priority','express','economy') NOT NULL,
  `payload_hash` char(64) NOT NULL,
  `event_type` enum('new_request','repeat_request') NOT NULL,
  `email_attempted_epoch` int(10) UNSIGNED NOT NULL,
  `email_sent_epoch` int(10) UNSIGNED DEFAULT NULL,
  `email_http_code` int(11) DEFAULT NULL,
  `email_error_text` text DEFAULT NULL,
  `created_at_epoch` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `shipment_service_quote_events`
--

INSERT INTO `shipment_service_quote_events` (`id`, `quote_id`, `user_id`, `service_level`, `payload_hash`, `event_type`, `email_attempted_epoch`, `email_sent_epoch`, `email_http_code`, `email_error_text`, `created_at_epoch`) VALUES
(1, 1, 1, 'priority', 'b0dfb109eba3427105d334b5846c2c30633e45a16c949cbb475cd5b062a08923', 'new_request', 1774573714, 1774573714, 200, NULL, 1774573714),
(2, 2, 1, 'express', 'b0dfb109eba3427105d334b5846c2c30633e45a16c949cbb475cd5b062a08923', 'new_request', 1774573817, 1774573817, 200, NULL, 1774573817),
(3, 3, 1, 'priority', '5c0a24a84692ba04c5f5d50d765b0b390cbf5c33450dcfb33c8990c6b993b168', 'new_request', 1774575817, 1774575817, 200, NULL, 1774575817),
(4, 4, 1, 'express', '5a3a02703b6d22f8bb642ec4f17fe089c7f16d4c648eeefe7ee357bbfa9b1b53', 'new_request', 1774578805, 1774578805, 200, NULL, 1774578805),
(5, 5, 1, 'priority', '766a79acbc968cd4e233850b6cf26be61c950042b69cf1799c2fd095eb80aff3', 'new_request', 1774582097, 1774582097, 200, NULL, 1774582097),
(6, 6, 1, 'priority', '7c521aa584b49d10fea2ce86f2220b65a8031fa61cda24359d8fa0d3bb2b8e96', 'new_request', 1774643066, 1774643066, 200, NULL, 1774643066),
(7, 7, 1, 'priority', 'f0653c051cda35461cab58e48c93da79e4cb723ba2aec9009f2f938ec1b9aab3', 'new_request', 1774644122, 1774644122, 200, NULL, 1774644122),
(8, 8, 10, 'priority', '6ce4a0b131b57d533a88a6362a0b691edfca896d9c3cb988f2c2d6ce39cc9a1c', 'new_request', 1775470828, 1775470828, 200, NULL, 1775470828),
(9, 9, 11, 'priority', 'd531f28f047243b67afdc2281bf77c86057431507294e27c484fbdc6e7424579', 'new_request', 1775508744, 1775508744, 200, NULL, 1775508744),
(10, 9, 11, 'priority', 'd531f28f047243b67afdc2281bf77c86057431507294e27c484fbdc6e7424579', 'repeat_request', 1775509151, 1775509151, 200, NULL, 1775509151),
(11, 9, 11, 'priority', 'd531f28f047243b67afdc2281bf77c86057431507294e27c484fbdc6e7424579', 'repeat_request', 1775509154, 1775509154, 200, NULL, 1775509154),
(12, 10, 11, 'express', 'd531f28f047243b67afdc2281bf77c86057431507294e27c484fbdc6e7424579', 'new_request', 1775509158, 1775509158, 200, NULL, 1775509158),
(13, 11, 12, 'priority', 'ac411117697c6e4a38bf3f5e6e819c945d2a32a5d7f18862ed9369c700b8d847', 'new_request', 1776003234, 1776003234, 200, NULL, 1776003234),
(14, 12, 12, 'express', 'ac411117697c6e4a38bf3f5e6e819c945d2a32a5d7f18862ed9369c700b8d847', 'new_request', 1776003322, 1776003322, 200, NULL, 1776003322),
(15, 13, 13, 'priority', '8246e735d6b1c274d35dcba09b5b1a6871b454d89966b6a1d9e6d5170c3e514d', 'new_request', 1776013225, 1776013225, 200, NULL, 1776013225),
(16, 14, 13, 'priority', '1ec783111d42f1dce44144986eafd24a38e5834d14d4c1bcfb65a4c15bc4428e', 'new_request', 1776336374, 1776336374, 200, NULL, 1776336374),
(17, 15, 13, 'priority', 'b1c78669b88fd967291cfb80d04b842fc498ad4a603c79f8f85bb562151be607', 'new_request', 1776344732, 1776344732, 200, NULL, 1776344732),
(18, 16, 13, 'priority', 'd1611383b3022fb503aa2c8601bd185dbbce7235ebf09ae4b478b18da3fb0688', 'new_request', 1776347465, 1776347465, 200, NULL, 1776347465),
(19, 17, 13, 'priority', '761238d16efa050cb119888c5782b0e63bac5639734da23923ad3747adc252e7', 'new_request', 1777044689, 1777044689, 200, NULL, 1777044689),
(20, 18, 13, 'priority', '182127fbcd2ff1b811aca0127cf6782e27bbbb69de83310064a21f12f39b590d', 'new_request', 1777079433, 1777079433, 200, NULL, 1777079433),
(21, 19, 13, 'priority', 'cbd1c6873001597374eb5987020644de7f91e574f79e45513a14aa3d98fa6e28', 'new_request', 1777080223, 1777080223, 200, NULL, 1777080223),
(22, 20, 15, 'express', 'c55d47145acdf84e2fa2ec1660e29175a9e2cf6d69d78491f0cb0a6490e561e4', 'new_request', 1777505853, 1777505853, 200, NULL, 1777505853);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(225) NOT NULL,
  `name` varchar(225) NOT NULL,
  `email` varchar(225) NOT NULL,
  `country_code` varchar(20) NOT NULL,
  `phone_number` int(225) DEFAULT NULL,
  `username` varchar(225) NOT NULL,
  `password` varchar(225) NOT NULL,
  `is_verified` int(1) NOT NULL DEFAULT 0,
  `created_at` int(225) NOT NULL,
  `pay_block` varchar(20) DEFAULT NULL,
  `pay_block_tittle` varchar(255) DEFAULT NULL,
  `pay_block_message` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `country_code`, `phone_number`, `username`, `password`, `is_verified`, `created_at`, `pay_block`, `pay_block_tittle`, `pay_block_message`) VALUES
(10, 'Jack', 'admin@veteranlogisticsgroup.us', '+44', 2147483647, 'Admin', '$2y$10$G7hQ9am2mFlzDVGdbYJN/O4g.WAn5mwk0PJr/x8.lqGThtN2hBMnS', 1, 1774976990, '1', 'Not Available in Your Country', 'This payment method is not supported in your region.'),
(12, 'Alexis Romero', 'xpressdelievery@gmail.com', '+503', 74175979, 'Alexis76-3', '$2y$10$ahOHxA6R2mYTH6mNWlPHce/T4YMuIhZSVcONCeUu6SCSUGo3REi/q', 1, 1775954982, '1', 'Not Available in Your Country', 'This payment method is not supported in your region.'),
(13, 'Itekena Iyowuna', 'tkprodesign96@gmail.com', '+93', 1029117490, 'tkprodesign', '$2y$10$p7H8ZjMKoAy4Twy2McYHROtDHQG2b1GQJQkEOidmRaHjqqu52QdVG', 1, 1776012816, '1', 'Transaction Processing Error', 'We were unable to process your payment at this time. Please try again.'),
(14, 'ALEXIS VLADIMIR MOLINA', 'romerovladimir78@gmail.com', '+503', 74175978, 'Alexis molina', '$2y$10$.Y6wTzlgd7d4r97CuDV.ZeorJ5.x79h/oOZny0MQVe78KvqA7tDwi', 1, 1776017424, NULL, NULL, NULL),
(15, 'ANA MARIA ALVES MENIS', 'Iam.richard.andersonn001@gmail.com', '+55', NULL, 'anamaria', '$2y$10$t1WNtcT2.ZFFlmzZRGS1heWcPbFFnUt2BkYUevt7VemFp9QpCI6M.', 1, 1777503961, '1', 'Not Available in Your Country', 'This payment method is not supported in your region.'),
(16, 'ANA MARIA ALVES MENIS', 'ana.m.menis@gmail.com', '+55', 2147483647, 'Anamenis', '$2y$10$MylR7.mjD7uHjMhL78LUa.k/p9DW8bl5NKmbB8z9dkBMnsuPO2ca6', 1, 1777510568, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user_logins`
--

CREATE TABLE `user_logins` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `login_at` bigint(20) UNSIGNED NOT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `user_logins`
--

INSERT INTO `user_logins` (`id`, `user_id`, `login_at`, `ip_address`, `user_agent`) VALUES
(1, 1, 1772470604, '102.90.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:150.0) Gecko/20100101 Firefox/150.0'),
(2, 1, 1774351599, '102.90.103.110', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:150.0) Gecko/20100101 Firefox/150.0'),
(3, 1, 1774392946, '102.90.118.111', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:149.0) Gecko/20100101 Firefox/149.0'),
(4, 1, 1774459183, '102.90.99.51', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Mobile Safari/537.36'),
(5, 1, 1774490230, '102.90.99.36', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36'),
(6, 9, 1774596183, '102.90.97.218', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Mobile Safari/537.36'),
(7, 10, 1774977069, '102.90.115.172', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Mobile Safari/537.36'),
(8, 10, 1775364461, '102.90.79.68', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Mobile Safari/537.36'),
(9, 10, 1775469097, '102.90.82.234', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Mobile Safari/537.36'),
(10, 11, 1775508536, '102.90.96.79', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Mobile Safari/537.36'),
(11, 12, 1775955007, '102.90.98.14', 'Mozilla/5.0 (iPhone; CPU iPhone OS 18_7 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/26.0.1 Mobile/15E148 Safari/604.1'),
(12, 13, 1776012867, '102.90.116.7', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Mobile Safari/537.36'),
(13, 14, 1776017458, '2800:b20:1112:386:8a6:9a0c:8445:53cf', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Mobile Safari/537.36'),
(14, 13, 1777001349, '66.111.61.240', 'Mozilla/5.0 (iPhone; CPU iPhone OS 18_7 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/26.2 Mobile/15E148 Safari/604.1'),
(15, 13, 1777081784, '102.90.99.7', 'Mozilla/5.0 (iPhone; CPU iPhone OS 26_2_0 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) CriOS/146.0.7680.151 Mobile/15E148 Safari/604.1'),
(16, 15, 1777503983, '102.90.79.230', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Mobile Safari/537.36'),
(17, 16, 1777510828, '186.236.228.252', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Mobile Safari/537.36 OPR/97.0.0.0');

-- --------------------------------------------------------

--
-- Table structure for table `user_saved_addresses`
--

CREATE TABLE `user_saved_addresses` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `address_role` varchar(20) NOT NULL,
  `full_name` varchar(190) NOT NULL,
  `contact_name` varchar(190) DEFAULT NULL,
  `email` varchar(190) DEFAULT NULL,
  `phone` varchar(60) DEFAULT NULL,
  `address_line1` varchar(255) NOT NULL,
  `address_line2` varchar(255) DEFAULT NULL,
  `city` varchar(120) DEFAULT NULL,
  `state_region` varchar(120) DEFAULT NULL,
  `postal_code` varchar(40) DEFAULT NULL,
  `country` varchar(120) DEFAULT NULL,
  `country_code` varchar(8) DEFAULT NULL,
  `is_residential` tinyint(1) NOT NULL DEFAULT 0,
  `date_created` int(11) NOT NULL,
  `date_updated` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user_saved_addresses`
--

INSERT INTO `user_saved_addresses` (`id`, `user_id`, `address_role`, `full_name`, `contact_name`, `email`, `phone`, `address_line1`, `address_line2`, `city`, `state_region`, `postal_code`, `country`, `country_code`, `is_residential`, `date_created`, `date_updated`) VALUES
(1, 10, 'sender', 'Jack', 'Jack', 'upsdeliveryexpressservicess@gmail.com', '2147483647', 'Iran', '', 'Iran', 'Iran', '10002', 'United States', 'US', 0, 1775470778, 1775470778),
(2, 10, 'receiver', 'ANA Maria Alves menis', 'DJ real', 'ana.m.menis@gmail.com', '+55 (32) 99137-0047', 'RUA CRUZ DAS ALMAS, 444 - BAIRRO', '', 'Brazil', 'SÃƒO JOSÃ‰ - BARBACENA', '500001', 'United States', 'US', 1, 1775470778, 1775470778),
(3, 11, 'sender', 'Allison Bright', 'Allison Bright', 'iam.richard.Andersonn001@gmail.com', '2147483647', 'Lekki Phase 1', '', 'Lagos', 'Lagos', '500001', 'Nigeria', 'NG', 0, 1775508717, 1775508717),
(4, 13, 'receiver', 'Citigroup Centre, 33 Canada Square,', 'Ezekiel Azul', 'developer75c@proton.me', '01029117490', 'London E14 5LB, United Kingdom', '', 'London', 'London', 'E14 5LB', 'United States', 'US', 1, 1776336366, 1776336366),
(5, 13, 'sender', 'Prosper solomon', '08194778268', 'prospersolomon000@gmail.com', '1029117490', 'Mile 1 diobu port harcourt', '', 'Port harcourt', 'Rivers', '84539', 'Nigeria', 'NG', 0, 1777079372, 1777079372),
(6, 13, 'receiver', 'Micheal Escobar', 'Micheal', 'prospersolomon000@gmail.com', '081686469619', 'Mile 4', '', 'Port harcourt', 'Rivers', '55284', 'United States', 'US', 1, 1777079372, 1777079372),
(7, 15, 'receiver', 'ANA Maria Alves Menis', 'ANA MARIA ALVES MENIS', 'ana.m.menis@gmail.com', '+55 (32) 99137-0047', 'RUA CRUZ DAS ALMAS, 444 - -', '', 'BAIRRO SÃƒO JOSÃ‰', 'BARBACENA', '89147', 'United States', 'US', 1, 1777505814, 1777505814);

-- --------------------------------------------------------

--
-- Table structure for table `verification_code`
--

CREATE TABLE `verification_code` (
  `id` int(11) NOT NULL,
  `email` varchar(225) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` int(6) NOT NULL,
  `date_created` int(225) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `verification_code`
--

INSERT INTO `verification_code` (`id`, `email`, `code`, `date_created`) VALUES
(17, 'itekena.iyowuna@gmail.com', 643513, 1774595800);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `exception_issue_payments`
--
ALTER TABLE `exception_issue_payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_exception_payments_event` (`event_id`),
  ADD KEY `idx_exception_payments_tracking` (`tracking_number`),
  ADD KEY `idx_exception_payments_status` (`status`),
  ADD KEY `idx_exception_payments_user` (`user_id`);

--
-- Indexes for table `free_quotes_requests`
--
ALTER TABLE `free_quotes_requests`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_free_quotes_time` (`time`);

--
-- Indexes for table `items`
--
ALTER TABLE `items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_items_tracking_item` (`tracking_id`,`item_number`),
  ADD KEY `idx_items_order_id` (`order_id`);

--
-- Indexes for table `newsletter_subscribers`
--
ALTER TABLE `newsletter_subscribers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uniq_newsletter_email` (`email`);

--
-- Indexes for table `payment_methods`
--
ALTER TABLE `payment_methods`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uniq_payment_methods_processor_token` (`processor_token`),
  ADD UNIQUE KEY `uniq_payment_methods_wallet_address` (`wallet_address`),
  ADD KEY `idx_payment_methods_user_status` (`user_id`,`record_status`);

--
-- Indexes for table `payment_method_events`
--
ALTER TABLE `payment_method_events`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_payment_method_events_user` (`user_id`,`created_at_epoch`),
  ADD KEY `idx_payment_method_events_method` (`payment_method_id`);

--
-- Indexes for table `promocode`
--
ALTER TABLE `promocode`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uniq_promocode_code` (`code`),
  ADD KEY `idx_promocode_active` (`is_active`);

--
-- Indexes for table `quotes`
--
ALTER TABLE `quotes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_quotes_time` (`time`);

--
-- Indexes for table `shipments`
--
ALTER TABLE `shipments`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `tracking_number` (`tracking_number`),
  ADD KEY `tracking_number_2` (`tracking_number`),
  ADD KEY `status` (`status`);

--
-- Indexes for table `shipment_location_events`
--
ALTER TABLE `shipment_location_events`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uq_one_current_per_shipment` (`shipment_id`,`is_current`),
  ADD UNIQUE KEY `uq_one_origin_per_shipment` (`shipment_id`,`is_origin`),
  ADD UNIQUE KEY `uq_one_destination_per_shipment` (`shipment_id`,`is_destination`),
  ADD KEY `idx_sle_tracking_time` (`tracking_number`,`event_time_epoch`),
  ADD KEY `idx_sle_shipment_time` (`shipment_id`,`event_time_epoch`),
  ADD KEY `idx_sle_current_lookup` (`shipment_id`,`is_current`),
  ADD KEY `idx_sle_origin` (`shipment_id`,`is_origin`),
  ADD KEY `idx_sle_destination` (`shipment_id`,`is_destination`);

--
-- Indexes for table `shipment_payment_proofs`
--
ALTER TABLE `shipment_payment_proofs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_payment_proofs_user` (`user_id`),
  ADD KEY `idx_payment_proofs_uploaded` (`uploaded_at_epoch`);

--
-- Indexes for table `shipment_service_quotes`
--
ALTER TABLE `shipment_service_quotes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uniq_quote_payload_service` (`user_id`,`service_level`,`payload_hash`),
  ADD KEY `idx_quote_user_created` (`user_id`,`created_at_epoch`),
  ADD KEY `idx_quote_status` (`processing_status`);

--
-- Indexes for table `shipment_service_quote_events`
--
ALTER TABLE `shipment_service_quote_events`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_quote_events_quote` (`quote_id`),
  ADD KEY `idx_quote_events_user_created` (`user_id`,`created_at_epoch`),
  ADD KEY `idx_quote_events_type_created` (`event_type`,`created_at_epoch`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_logins`
--
ALTER TABLE `user_logins`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_saved_addresses`
--
ALTER TABLE `user_saved_addresses`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uq_saved_address` (`user_id`,`address_role`,`address_line1`,`city`,`state_region`,`postal_code`,`country_code`),
  ADD KEY `idx_saved_addresses_user` (`user_id`);

--
-- Indexes for table `verification_code`
--
ALTER TABLE `verification_code`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `exception_issue_payments`
--
ALTER TABLE `exception_issue_payments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `free_quotes_requests`
--
ALTER TABLE `free_quotes_requests`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `items`
--
ALTER TABLE `items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `newsletter_subscribers`
--
ALTER TABLE `newsletter_subscribers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payment_methods`
--
ALTER TABLE `payment_methods`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payment_method_events`
--
ALTER TABLE `payment_method_events`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `promocode`
--
ALTER TABLE `promocode`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `quotes`
--
ALTER TABLE `quotes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `shipments`
--
ALTER TABLE `shipments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `shipment_location_events`
--
ALTER TABLE `shipment_location_events`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=67;

--
-- AUTO_INCREMENT for table `shipment_payment_proofs`
--
ALTER TABLE `shipment_payment_proofs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `shipment_service_quotes`
--
ALTER TABLE `shipment_service_quotes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `shipment_service_quote_events`
--
ALTER TABLE `shipment_service_quote_events`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(225) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `user_logins`
--
ALTER TABLE `user_logins`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `user_saved_addresses`
--
ALTER TABLE `user_saved_addresses`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `verification_code`
--
ALTER TABLE `verification_code`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `shipment_location_events`
--
ALTER TABLE `shipment_location_events`
  ADD CONSTRAINT `fk_sle_shipments` FOREIGN KEY (`shipment_id`) REFERENCES `shipments` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
