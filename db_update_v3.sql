-- phpMyAdmin SQL Dump
-- version 4.7.7
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Gegenereerd op: 13 jul 2018 om 20:26
-- Serverversie: 10.1.30-MariaDB
-- PHP-versie: 7.2.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `thomang3_timechimp`
--
CREATE DATABASE IF NOT EXISTS `thomang3_timechimp` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `thomang3_timechimp`;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `activity`
--

CREATE TABLE `activity` (
  `T_ID` int(10) NOT NULL,
  `User_ID` int(10) NOT NULL,
  `Start_Time` time NOT NULL,
  `Stop_Time` time NOT NULL,
  `Work` time NOT NULL,
  `Break` time NOT NULL,
  `Date` date NOT NULL,
  `Activity` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Gegevens worden geëxporteerd voor tabel `activity`
--

INSERT INTO `activity` (`T_ID`, `User_ID`, `Start_Time`, `Stop_Time`, `Work`, `Break`, `Date`, `Activity`) VALUES
(1, 1, '00:03:04', '00:04:00', '00:00:00', '00:01:00', '2018-07-17', 'Work'),
(2, 1, '10:40:28', '08:41:39', '00:00:00', '00:00:00', '2018-07-10', 'Work'),
(3, 1, '10:42:26', '08:42:29', '00:00:00', '00:00:05', '2018-07-10', 'Work'),
(4, 1, '10:42:50', '08:42:56', '00:00:00', '00:00:03', '2018-07-10', 'Work'),
(5, 1, '10:45:04', '08:45:09', '00:00:00', '00:00:03', '2018-07-10', 'Work'),
(6, 1, '10:51:40', '10:54:20', '00:00:00', '00:01:58', '2018-07-10', 'Work'),
(7, 1, '13:09:53', '11:30:29', '00:00:00', '00:04:44', '2018-07-10', 'Work'),
(8, 1, '13:41:51', '11:41:59', '00:00:00', '00:00:03', '2018-07-10', 'Work'),
(9, 1, '02:42:29', '11:42:40', '00:00:00', '00:00:05', '2018-07-10', 'Work'),
(10, 1, '01:00:00', '12:40:52', '00:00:00', '00:00:24', '2018-07-10', 'Work'),
(11, 1, '04:06:37', '01:07:07', '00:00:00', '00:00:09', '2018-07-10', 'Work'),
(12, 1, '13:48:41', '01:00:13', '00:00:00', '00:00:17', '2018-07-10', 'Work'),
(13, 1, '13:49:54', '13:50:07', '00:00:00', '00:00:08', '2018-07-10', 'Work'),
(14, 1, '13:53:26', '13:53:39', '00:00:00', '00:00:03', '2018-07-10', 'Work'),
(15, 1, '13:54:07', '13:54:13', '00:00:00', '00:00:04', '2018-07-10', 'Work'),
(16, 1, '14:08:19', '14:08:30', '00:00:07', '00:00:04', '2018-07-10', 'Work'),
(17, 1, '14:12:19', '14:13:03', '00:00:11', '00:00:33', '2018-07-10', 'Work'),
(18, 1, '14:13:03', '14:13:10', '00:00:03', '00:00:04', '2018-07-10', 'Work'),
(19, 1, '14:15:05', '14:15:28', '00:00:12', '00:00:11', '2018-07-10', 'Work'),
(20, 1, '22:50:09', '22:50:56', '00:00:35', '00:00:12', '2018-07-11', 'Work'),
(21, 1, '23:07:39', '23:07:43', '00:00:02', '00:00:02', '2018-07-11', 'Work'),
(22, 1, '00:14:05', '00:14:05', '00:00:00', '00:00:00', '2018-07-13', 'Work');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `users`
--

CREATE TABLE `users` (
  `User_ID` int(10) NOT NULL,
  `Username` varchar(50) DEFAULT NULL,
  `Password` varchar(255) DEFAULT NULL,
  `Email` varchar(255) DEFAULT NULL,
  `Hourly_wage` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Gegevens worden geëxporteerd voor tabel `users`
--

INSERT INTO `users` (`User_ID`, `Username`, `Password`, `Email`, `Hourly_wage`) VALUES
(1, 'timechimp', '123456', 'timechimp@email.com', 12.14),
(2, 'test', '$2y$10$TyRTeHEuPSWSQCPwKGs4q.cH/0Gh2ugJOD42PfQvoE9rBC20HBJ4W', 'test@test.nl', NULL);

--
-- Indexen voor geëxporteerde tabellen
--

--
-- Indexen voor tabel `activity`
--
ALTER TABLE `activity`
  ADD PRIMARY KEY (`T_ID`);

--
-- Indexen voor tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`User_ID`),
  ADD UNIQUE KEY `Email` (`Email`),
  ADD UNIQUE KEY `Username` (`Username`);

--
-- AUTO_INCREMENT voor geëxporteerde tabellen
--

--
-- AUTO_INCREMENT voor een tabel `activity`
--
ALTER TABLE `activity`
  MODIFY `T_ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT voor een tabel `users`
--
ALTER TABLE `users`
  MODIFY `User_ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
