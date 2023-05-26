-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 24, 2023 at 09:56 AM
-- Server version: 8.0.28
-- PHP Version: 8.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bas`
--

-- --------------------------------------------------------

--
-- Table structure for table `artikelen`
--

CREATE TABLE `artikelen` (
  `artId` int NOT NULL,
  `artOmschrijving` varchar(12) NOT NULL COMMENT 'De naam van het artikel',
  `artInkoop` decimal(3,2) DEFAULT NULL COMMENT 'Inkoopprijs',
  `artVerkoop` decimal(3,2) DEFAULT NULL COMMENT 'Verkoopprijs',
  `artVoorraad` int NOT NULL COMMENT 'Aantal artikelen op voorraad',
  `artMinVoorraad` int NOT NULL COMMENT 'Aantal artikelen dat minimaal op voorraad moet zijn',
  `artMaxVoorraad` int NOT NULL COMMENT 'Aantal artikelen dat maximaal op voorraad mag zijn',
  `artLocatie` int DEFAULT NULL COMMENT 'Het nummer van de stelling waarin het artikel te vinden is',
  `levId` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `artikelen`
--

INSERT INTO `artikelen` (`artId`, `artOmschrijving`, `artInkoop`, `artVerkoop`, `artVoorraad`, `artMinVoorraad`, `artMaxVoorraad`, `artLocatie`, `levId`) VALUES
(1, 'Pizza Doos', '3.50', '5.00', 100, 1, 25, 122, 1);

-- --------------------------------------------------------

--
-- Table structure for table `inkooporders`
--

CREATE TABLE `inkooporders` (
  `inkOrdId` int NOT NULL,
  `levId` int NOT NULL,
  `artId` int NOT NULL,
  `inkOrdDatum` date NOT NULL COMMENT 'Datum waarop de inkooporder isgedaan',
  `inkOrdBestAantal` int NOT NULL COMMENT 'Het aantal artikelen dat besteld is.',
  `inkOrdStatus` tinyint(1) NOT NULL COMMENT 'Is het artikel al geleverd?'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `klanten`
--

CREATE TABLE `klanten` (
  `klantId` int NOT NULL,
  `klantNaam` varchar(20) DEFAULT NULL COMMENT 'Voor-en achternaam van de klant',
  `klantEmail` varchar(30) NOT NULL COMMENT 'Emailadres van de klant',
  `klantAdres` varchar(30) NOT NULL COMMENT 'Straat en huisnummer klant',
  `klantPostcode` varchar(6) NOT NULL,
  `klantWoonplaats` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `klanten`
--

INSERT INTO `klanten` (`klantId`, `klantNaam`, `klantEmail`, `klantAdres`, `klantPostcode`, `klantWoonplaats`) VALUES
(1, 'Davy van Pors', 'Davy@gmail.com', 'Hollandertraat 2', '2304ZD', 'Rotterdam')


-- --------------------------------------------------------

--
-- Table structure for table `leveranciers`
--

CREATE TABLE `leveranciers` (
  `levId` int NOT NULL,
  `levNaam` varchar(15) NOT NULL COMMENT 'De bedrijfsnaam',
  `levContact` varchar(20) NOT NULL COMMENT 'Voor-en achternaam contactpersoon',
  `levEmail` varchar(30) NOT NULL COMMENT 'Emailadres van de contactpersoon',
  `levAdres` varchar(30) NOT NULL COMMENT 'Straat en huisnummer leverancier',
  `levPostcode` varchar(6) NOT NULL,
  `levWoonplaats` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `verkooporders`
--

CREATE TABLE `verkooporders` (
  `verkOrdid` int NOT NULL,
  `klantId` int NOT NULL,
  `artId` int NOT NULL,
  `verkOrdDatum` date NOT NULL COMMENT 'Datum waarop het artikel is gekocht.',
  `verkOrdBestAantal` int NOT NULL COMMENT 'Het aantal artikelen dat besteld is.',
  `verkOrdStatus` int NOT NULL DEFAULT '1' COMMENT '1 = genoteerd in deze tabel2 = magazijnmedewerker verzamelt het artikel (picking)3. tas met artikel is bij de bezorger4. tas met artikel is afgeleverd bij de klant'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `verkooporders`
--

INSERT INTO `verkooporders` (`verkOrdid`, `klantId`, `artId`, `verkOrdDatum`, `verkOrdBestAantal`, `verkOrdStatus`) VALUES
(1, 1, 1, '2024-05-14', 35, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `artikelen`
--
ALTER TABLE `artikelen`
  ADD PRIMARY KEY (`artId`);

--
-- Indexes for table `inkooporders`
--
ALTER TABLE `inkooporders`
  ADD PRIMARY KEY (`inkOrdId`) USING BTREE,
  ADD KEY `levId` (`levId`),
  ADD KEY `artId` (`artId`);

--
-- Indexes for table `klanten`
--
ALTER TABLE `klanten`
  ADD PRIMARY KEY (`klantId`);

--
-- Indexes for table `leveranciers`
--
ALTER TABLE `leveranciers`
  ADD PRIMARY KEY (`levId`);

--
-- Indexes for table `verkooporders`
--
ALTER TABLE `verkooporders`
  ADD PRIMARY KEY (`verkOrdid`),
  ADD KEY `artId` (`artId`),
  ADD KEY `klantId` (`klantId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `inkooporders`
--
ALTER TABLE `inkooporders`
  MODIFY `inkOrdId` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `klanten`
--
ALTER TABLE `klanten`
  MODIFY `klantId` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35054;

--
-- AUTO_INCREMENT for table `verkooporders`
--
ALTER TABLE `verkooporders`
  MODIFY `verkOrdid` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `inkooporders`
--
ALTER TABLE `inkooporders`
  ADD CONSTRAINT `inkooporders_ibfk_1` FOREIGN KEY (`levId`) REFERENCES `leveranciers` (`levId`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `inkooporders_ibfk_2` FOREIGN KEY (`artId`) REFERENCES `artikelen` (`artId`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `verkooporders`
--
ALTER TABLE `verkooporders`
  ADD CONSTRAINT `verkooporders_ibfk_1` FOREIGN KEY (`artId`) REFERENCES `artikelen` (`artId`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `verkooporders_ibfk_2` FOREIGN KEY (`klantId`) REFERENCES `klanten` (`klantId`) ON DELETE RESTRICT ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
