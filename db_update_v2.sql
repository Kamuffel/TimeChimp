-- phpMyAdmin SQL Dump
-- version 4.7.7
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Gegenereerd op: 13 jul 2018 om 20:18
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
-- Database: `cyberworld`
--
CREATE DATABASE IF NOT EXISTS `cyberworld` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `cyberworld`;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `accounts_verwijdert`
--

CREATE TABLE `accounts_verwijdert` (
  `id` int(11) NOT NULL,
  `count` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Gegevens worden geëxporteerd voor tabel `accounts_verwijdert`
--

INSERT INTO `accounts_verwijdert` (`id`, `count`) VALUES
(1, 0);

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `activatie`
--

CREATE TABLE `activatie` (
  `id` int(10) NOT NULL,
  `code` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `categorie`
--

CREATE TABLE `categorie` (
  `id` int(11) NOT NULL,
  `naam` varchar(40) NOT NULL,
  `afbeelding` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Gegevens worden geëxporteerd voor tabel `categorie`
--

INSERT INTO `categorie` (`id`, `naam`, `afbeelding`) VALUES
(1, 'Internet', 'internet.png'),
(2, 'Sociaal', 'socialv3.png'),
(3, 'Wachtwoord', 'password.png'),
(4, 'Phishing', 'phishingv1.png'),
(5, 'Virus', 'virus.png');

-- --------------------------------------------------------

--
-- Stand-in structuur voor view `docentklassen`
-- (Zie onder voor de actuele view)
--
CREATE TABLE `docentklassen` (
`klasid` int(10)
,`naam` varchar(255)
,`gebruikerid` int(10)
);

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `gebruiker`
--

CREATE TABLE `gebruiker` (
  `id` int(10) NOT NULL,
  `gebruikersnaam` varchar(255) NOT NULL,
  `naam` varchar(255) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `geboortedatum` date NOT NULL,
  `aangemaakt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `laatste_inlog` datetime DEFAULT NULL,
  `geactiveerd` tinyint(1) NOT NULL DEFAULT '0',
  `Rechtenid` int(10) NOT NULL,
  `Activatieid` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Gegevens worden geëxporteerd voor tabel `gebruiker`
--

INSERT INTO `gebruiker` (`id`, `gebruikersnaam`, `naam`, `email`, `geboortedatum`, `aangemaakt`, `laatste_inlog`, `geactiveerd`, `Rechtenid`, `Activatieid`) VALUES
(85, 'john_doe', 'John Doe', '', '2000-01-01', '2018-06-30 00:00:00', '2018-07-09 00:00:00', 1, 1, NULL),
(86, 'john_doe_leraar', '', 'johndoe@email.com', '1970-01-01', '2018-06-30 00:00:00', '2018-06-30 00:00:00', 1, 2, NULL),
(87, 'john_doe_beheerder', '', 'johndoe_beheerder@email.com', '1970-01-01', '2018-06-30 00:00:00', '2018-06-30 00:00:00', 1, 3, NULL);

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `gebruiker_klas`
--

CREATE TABLE `gebruiker_klas` (
  `Klasid` int(10) NOT NULL,
  `Gebruikerid` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Gegevens worden geëxporteerd voor tabel `gebruiker_klas`
--

INSERT INTO `gebruiker_klas` (`Klasid`, `Gebruikerid`) VALUES
(6, 85);

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `gebruiker_level`
--

CREATE TABLE `gebruiker_level` (
  `Gebruikerid` int(10) NOT NULL,
  `Levelid` int(10) NOT NULL,
  `goed` int(10) NOT NULL DEFAULT '0',
  `fout` int(10) NOT NULL DEFAULT '0',
  `highscore` int(10) NOT NULL DEFAULT '0',
  `behaald` tinyint(4) NOT NULL DEFAULT '0',
  `tijd` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Gegevens worden geëxporteerd voor tabel `gebruiker_level`
--

INSERT INTO `gebruiker_level` (`Gebruikerid`, `Levelid`, `goed`, `fout`, `highscore`, `behaald`, `tijd`) VALUES
(85, 1, 1, 0, 1000, 1, '00:00:13'),
(85, 2, 1, 0, 200, 1, '00:00:13'),
(85, 3, 1, 0, 100, 1, '00:00:05'),
(85, 4, 1, 0, 100, 1, '00:00:04'),
(85, 5, 1, 0, 100, 1, '00:00:06'),
(85, 6, 1, 0, 100, 1, '00:00:05'),
(85, 7, 1, 0, 200, 1, '00:00:12'),
(85, 8, 1, 0, 200, 1, '00:00:10'),
(85, 9, 1, 1, 100, 1, '00:00:18'),
(85, 10, 1, 0, 3, 1, '00:00:13');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `hashes`
--

CREATE TABLE `hashes` (
  `Gebruikerid` int(10) NOT NULL,
  `Hash` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Gegevens worden geëxporteerd voor tabel `hashes`
--

INSERT INTO `hashes` (`Gebruikerid`, `Hash`) VALUES
(85, '$2y$10$BoUZteY/BiU.jb0QbiAFxuxEZv5HgKQ9VdfwS9p1kmKRLlcIpkJrW'),
(86, '$2y$10$R1SiaZpT7GKLvdQW3ok/COPUiO7.P2vZsoN06DhJWDeg29y2xCp/y'),
(87, '$2y$10$6vkOFm9vL8b8eRs/IK9iteGOmZzD1B9rkvXFmVzRgm5UgudfreZky');

-- --------------------------------------------------------

--
-- Stand-in structuur voor view `highscoreklas`
-- (Zie onder voor de actuele view)
--
CREATE TABLE `highscoreklas` (
`Klasid` int(10)
,`Gebruikerid` int(10)
,`gebruikersnaam` varchar(255)
,`punten` decimal(32,0)
);

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `klas`
--

CREATE TABLE `klas` (
  `id` int(10) NOT NULL,
  `naam` varchar(255) NOT NULL,
  `klascode` varchar(255) NOT NULL,
  `leerjaar` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Gegevens worden geëxporteerd voor tabel `klas`
--

INSERT INTO `klas` (`id`, `naam`, `klascode`, `leerjaar`) VALUES
(6, 'DEF_CLASSROOM', 'DEF_CLASSROOM', 0);

-- --------------------------------------------------------

--
-- Stand-in structuur voor view `klaslevel`
-- (Zie onder voor de actuele view)
--
CREATE TABLE `klaslevel` (
`klasid` int(10)
,`Levelid` int(10)
,`Levelnaam` varchar(255)
);

-- --------------------------------------------------------

--
-- Stand-in structuur voor view `leerlinglevel`
-- (Zie onder voor de actuele view)
--
CREATE TABLE `leerlinglevel` (
`klasid` int(10)
,`Levelid` int(10)
,`Levelnaam` varchar(255)
);

-- --------------------------------------------------------

--
-- Stand-in structuur voor view `leerlingprogressie`
-- (Zie onder voor de actuele view)
--
CREATE TABLE `leerlingprogressie` (
`Gebruikerid` int(10)
,`Klasid` int(10)
,`naam` varchar(255)
,`gebruikersnaam` varchar(255)
,`klasnaam` varchar(255)
,`geboortedatum` date
,`punten` decimal(32,0)
,`tijd` time
,`hoogstbehaald` bigint(20)
);

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `level`
--

CREATE TABLE `level` (
  `id` int(10) NOT NULL,
  `naam` varchar(255) NOT NULL,
  `Categorieid` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Gegevens worden geëxporteerd voor tabel `level`
--

INSERT INTO `level` (`id`, `naam`, `Categorieid`) VALUES
(1, 'WiFi netwerken', 1),
(2, 'Slotje', 1),
(3, 'Youtuber Scotty', 2),
(4, 'Pesten online', 2),
(5, 'Vervalst online profiel', 2),
(6, 'Jouw gegevens', 2),
(7, 'Sterke wachtwoorden', 3),
(8, 'Wachtwoord raden', 3),
(9, 'Phishing e-mail', 4),
(10, 'Computer virus', 5);

-- --------------------------------------------------------

--
-- Stand-in structuur voor view `progressie`
-- (Zie onder voor de actuele view)
--
CREATE TABLE `progressie` (
`id` int(10)
,`highscore` decimal(32,0)
,`tijd` time
,`level` bigint(11)
);

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `rechten`
--

CREATE TABLE `rechten` (
  `id` int(10) NOT NULL,
  `naam` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Gegevens worden geëxporteerd voor tabel `rechten`
--

INSERT INTO `rechten` (`id`, `naam`) VALUES
(1, 'Leerling'),
(2, 'Leraar'),
(3, 'Beheerder');

-- --------------------------------------------------------

--
-- Structuur voor de view `docentklassen`
--
DROP TABLE IF EXISTS `docentklassen`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `docentklassen`  AS  select `klas`.`id` AS `klasid`,`klas`.`naam` AS `naam`,`gebruiker`.`id` AS `gebruikerid` from ((`gebruiker` join `gebruiker_klas` on((`gebruiker`.`id` = `gebruiker_klas`.`Gebruikerid`))) join `klas` on((`gebruiker_klas`.`Klasid` = `klas`.`id`))) where (`gebruiker`.`Rechtenid` = 2) ;

-- --------------------------------------------------------

--
-- Structuur voor de view `highscoreklas`
--
DROP TABLE IF EXISTS `highscoreklas`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `highscoreklas`  AS  select `klas`.`id` AS `Klasid`,`gebruiker`.`id` AS `Gebruikerid`,`gebruiker`.`gebruikersnaam` AS `gebruikersnaam`,(select `progressie`.`highscore` from `progressie` where (`progressie`.`id` = `gebruiker`.`id`)) AS `punten` from ((`gebruiker` join `gebruiker_klas` on((`gebruiker`.`id` = `gebruiker_klas`.`Gebruikerid`))) join `klas` on((`gebruiker_klas`.`Klasid` = `klas`.`id`))) where (`gebruiker`.`Rechtenid` = 1) ;

-- --------------------------------------------------------

--
-- Structuur voor de view `klaslevel`
--
DROP TABLE IF EXISTS `klaslevel`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `klaslevel`  AS  select `klas`.`id` AS `klasid`,`level`.`id` AS `Levelid`,`level`.`naam` AS `Levelnaam` from ((((`gebruiker` join `gebruiker_klas` on((`gebruiker`.`id` = `gebruiker_klas`.`Gebruikerid`))) join `gebruiker_level` on((`gebruiker`.`id` = `gebruiker_level`.`Gebruikerid`))) join `klas` on((`gebruiker_klas`.`Klasid` = `klas`.`id`))) join `level` on((`gebruiker_level`.`Levelid` = `level`.`id`))) where (`gebruiker_level`.`behaald` = 1) group by `level`.`id`,`klas`.`id` order by `klas`.`id` ;

-- --------------------------------------------------------

--
-- Structuur voor de view `leerlinglevel`
--
DROP TABLE IF EXISTS `leerlinglevel`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `leerlinglevel`  AS  select `klas`.`id` AS `klasid`,`level`.`id` AS `Levelid`,`level`.`naam` AS `Levelnaam` from ((((`gebruiker` join `gebruiker_klas` on((`gebruiker`.`id` = `gebruiker_klas`.`Gebruikerid`))) join `gebruiker_level` on((`gebruiker`.`id` = `gebruiker_level`.`Gebruikerid`))) join `klas` on((`gebruiker_klas`.`Klasid` = `klas`.`id`))) join `level` on((`gebruiker_level`.`Levelid` = `level`.`id`))) where (`gebruiker_level`.`behaald` = 1) group by `level`.`id`,`klas`.`id` order by `klas`.`id` ;

-- --------------------------------------------------------

--
-- Structuur voor de view `leerlingprogressie`
--
DROP TABLE IF EXISTS `leerlingprogressie`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `leerlingprogressie`  AS  select `gebruiker`.`id` AS `Gebruikerid`,`klas`.`id` AS `Klasid`,`gebruiker`.`naam` AS `naam`,`gebruiker`.`gebruikersnaam` AS `gebruikersnaam`,`klas`.`naam` AS `klasnaam`,`gebruiker`.`geboortedatum` AS `geboortedatum`,(select `progressie`.`highscore` from `progressie` where (`progressie`.`id` = `gebruiker`.`id`)) AS `punten`,(select `progressie`.`tijd` from `progressie` where (`progressie`.`id` = `gebruiker`.`id`)) AS `tijd`,(select `progressie`.`level` from `progressie` where (`progressie`.`id` = `gebruiker`.`id`)) AS `hoogstbehaald` from (((`gebruiker` join `gebruiker_klas` on((`gebruiker`.`id` = `gebruiker_klas`.`Gebruikerid`))) join `rechten` on((`gebruiker`.`Rechtenid` = `rechten`.`id`))) join `klas` on((`gebruiker_klas`.`Klasid` = `klas`.`id`))) where (`gebruiker`.`Rechtenid` = 1) ;

-- --------------------------------------------------------

--
-- Structuur voor de view `progressie`
--
DROP TABLE IF EXISTS `progressie`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `progressie`  AS  select `gebruiker`.`id` AS `id`,sum(`gebruiker_level`.`highscore`) AS `highscore`,sec_to_time(sum(time_to_sec(`gebruiker_level`.`tijd`))) AS `tijd`,ifnull((select max(`gebruiker_level`.`Levelid`) from `gebruiker_level` where ((`gebruiker_level`.`Gebruikerid` = `gebruiker`.`id`) and (`gebruiker_level`.`behaald` = 1))),0) AS `level` from (`gebruiker` join `gebruiker_level` on((`gebruiker`.`id` = `gebruiker_level`.`Gebruikerid`))) group by `gebruiker`.`id` ;

--
-- Indexen voor geëxporteerde tabellen
--

--
-- Indexen voor tabel `accounts_verwijdert`
--
ALTER TABLE `accounts_verwijdert`
  ADD PRIMARY KEY (`id`);

--
-- Indexen voor tabel `activatie`
--
ALTER TABLE `activatie`
  ADD PRIMARY KEY (`id`);

--
-- Indexen voor tabel `gebruiker`
--
ALTER TABLE `gebruiker`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `gebruikersnaam` (`gebruikersnaam`),
  ADD KEY `FKGebruiker78455` (`Rechtenid`),
  ADD KEY `FKGebruiker524471` (`Activatieid`);

--
-- Indexen voor tabel `gebruiker_klas`
--
ALTER TABLE `gebruiker_klas`
  ADD PRIMARY KEY (`Klasid`,`Gebruikerid`),
  ADD KEY `FKGebruiker_619200` (`Gebruikerid`);

--
-- Indexen voor tabel `gebruiker_level`
--
ALTER TABLE `gebruiker_level`
  ADD PRIMARY KEY (`Gebruikerid`,`Levelid`),
  ADD KEY `FKGebruiker_814720` (`Levelid`);

--
-- Indexen voor tabel `hashes`
--
ALTER TABLE `hashes`
  ADD KEY `FKHashes637034` (`Gebruikerid`);

--
-- Indexen voor tabel `klas`
--
ALTER TABLE `klas`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `klascode` (`klascode`);

--
-- Indexen voor tabel `level`
--
ALTER TABLE `level`
  ADD PRIMARY KEY (`id`);

--
-- Indexen voor tabel `rechten`
--
ALTER TABLE `rechten`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT voor geëxporteerde tabellen
--

--
-- AUTO_INCREMENT voor een tabel `accounts_verwijdert`
--
ALTER TABLE `accounts_verwijdert`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT voor een tabel `activatie`
--
ALTER TABLE `activatie`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT voor een tabel `gebruiker`
--
ALTER TABLE `gebruiker`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=88;

--
-- AUTO_INCREMENT voor een tabel `klas`
--
ALTER TABLE `klas`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT voor een tabel `level`
--
ALTER TABLE `level`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT voor een tabel `rechten`
--
ALTER TABLE `rechten`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Beperkingen voor geëxporteerde tabellen
--

--
-- Beperkingen voor tabel `gebruiker`
--
ALTER TABLE `gebruiker`
  ADD CONSTRAINT `FKGebruiker524471` FOREIGN KEY (`Activatieid`) REFERENCES `activatie` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `FKGebruiker78455` FOREIGN KEY (`Rechtenid`) REFERENCES `rechten` (`id`);

--
-- Beperkingen voor tabel `gebruiker_klas`
--
ALTER TABLE `gebruiker_klas`
  ADD CONSTRAINT `FKGebruiker_619200` FOREIGN KEY (`Gebruikerid`) REFERENCES `gebruiker` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FKGebruiker_699325` FOREIGN KEY (`Klasid`) REFERENCES `klas` (`id`) ON DELETE CASCADE;

--
-- Beperkingen voor tabel `gebruiker_level`
--
ALTER TABLE `gebruiker_level`
  ADD CONSTRAINT `FKGebruiker_374883` FOREIGN KEY (`Gebruikerid`) REFERENCES `gebruiker` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FKGebruiker_814720` FOREIGN KEY (`Levelid`) REFERENCES `level` (`id`) ON DELETE CASCADE;

--
-- Beperkingen voor tabel `hashes`
--
ALTER TABLE `hashes`
  ADD CONSTRAINT `FKHashes637034` FOREIGN KEY (`Gebruikerid`) REFERENCES `gebruiker` (`id`) ON DELETE CASCADE;
--
-- Database: `phpmyadmin`
--
CREATE DATABASE IF NOT EXISTS `phpmyadmin` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin;
USE `phpmyadmin`;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `pma__bookmark`
--

CREATE TABLE `pma__bookmark` (
  `id` int(11) NOT NULL,
  `dbase` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `user` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `label` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `query` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Bookmarks';

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `pma__central_columns`
--

CREATE TABLE `pma__central_columns` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_type` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_length` text COLLATE utf8_bin,
  `col_collation` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_isNull` tinyint(1) NOT NULL,
  `col_extra` varchar(255) COLLATE utf8_bin DEFAULT '',
  `col_default` text COLLATE utf8_bin
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Central list of columns';

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `pma__column_info`
--

CREATE TABLE `pma__column_info` (
  `id` int(5) UNSIGNED NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `column_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `comment` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `mimetype` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `transformation` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `transformation_options` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `input_transformation` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `input_transformation_options` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Column information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `pma__designer_settings`
--

CREATE TABLE `pma__designer_settings` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `settings_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Settings related to Designer';

--
-- Gegevens worden geëxporteerd voor tabel `pma__designer_settings`
--

INSERT INTO `pma__designer_settings` (`username`, `settings_data`) VALUES
('root', '{\"angular_direct\":\"direct\",\"relation_lines\":\"true\",\"snap_to_grid\":\"off\"}');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `pma__export_templates`
--

CREATE TABLE `pma__export_templates` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `export_type` varchar(10) COLLATE utf8_bin NOT NULL,
  `template_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `template_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved export templates';

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `pma__favorite`
--

CREATE TABLE `pma__favorite` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `tables` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Favorite tables';

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `pma__history`
--

CREATE TABLE `pma__history` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `timevalue` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `sqlquery` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='SQL history for phpMyAdmin';

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `pma__navigationhiding`
--

CREATE TABLE `pma__navigationhiding` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `item_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `item_type` varchar(64) COLLATE utf8_bin NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Hidden items of navigation tree';

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `pma__pdf_pages`
--

CREATE TABLE `pma__pdf_pages` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `page_nr` int(10) UNSIGNED NOT NULL,
  `page_descr` varchar(50) CHARACTER SET utf8 NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='PDF relation pages for phpMyAdmin';

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `pma__recent`
--

CREATE TABLE `pma__recent` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `tables` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Recently accessed tables';

--
-- Gegevens worden geëxporteerd voor tabel `pma__recent`
--

INSERT INTO `pma__recent` (`username`, `tables`) VALUES
('root', '[{\"db\":\"thomang3_timechimp\",\"table\":\"activity\"},{\"db\":\"thomang3_timechimp\",\"table\":\"users\"},{\"db\":\"cyberworld\",\"table\":\"gebruiker_level\"},{\"db\":\"cyberworld\",\"table\":\"gebruiker_klas\"},{\"db\":\"cyberworld\",\"table\":\"rechten\"},{\"db\":\"cyberworld\",\"table\":\"level\"},{\"db\":\"cyberworld\",\"table\":\"klas\"},{\"db\":\"cyberworld\",\"table\":\"hashes\"},{\"db\":\"cyberworld\",\"table\":\"gebruiker\"},{\"db\":\"cyberworld\",\"table\":\"categorie\"}]');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `pma__relation`
--

CREATE TABLE `pma__relation` (
  `master_db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `master_table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `master_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Relation table';

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `pma__savedsearches`
--

CREATE TABLE `pma__savedsearches` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `search_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `search_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved searches';

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `pma__table_coords`
--

CREATE TABLE `pma__table_coords` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `pdf_page_number` int(11) NOT NULL DEFAULT '0',
  `x` float UNSIGNED NOT NULL DEFAULT '0',
  `y` float UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table coordinates for phpMyAdmin PDF output';

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `pma__table_info`
--

CREATE TABLE `pma__table_info` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `display_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `pma__table_uiprefs`
--

CREATE TABLE `pma__table_uiprefs` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `prefs` text COLLATE utf8_bin NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Tables'' UI preferences';

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `pma__tracking`
--

CREATE TABLE `pma__tracking` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `version` int(10) UNSIGNED NOT NULL,
  `date_created` datetime NOT NULL,
  `date_updated` datetime NOT NULL,
  `schema_snapshot` text COLLATE utf8_bin NOT NULL,
  `schema_sql` text COLLATE utf8_bin,
  `data_sql` longtext COLLATE utf8_bin,
  `tracking` set('UPDATE','REPLACE','INSERT','DELETE','TRUNCATE','CREATE DATABASE','ALTER DATABASE','DROP DATABASE','CREATE TABLE','ALTER TABLE','RENAME TABLE','DROP TABLE','CREATE INDEX','DROP INDEX','CREATE VIEW','ALTER VIEW','DROP VIEW') COLLATE utf8_bin DEFAULT NULL,
  `tracking_active` int(1) UNSIGNED NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Database changes tracking for phpMyAdmin';

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `pma__userconfig`
--

CREATE TABLE `pma__userconfig` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `timevalue` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `config_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User preferences storage for phpMyAdmin';

--
-- Gegevens worden geëxporteerd voor tabel `pma__userconfig`
--

INSERT INTO `pma__userconfig` (`username`, `timevalue`, `config_data`) VALUES
('root', '2018-04-23 19:02:00', '{\"lang\":\"nl\",\"collation_connection\":\"utf8mb4_unicode_ci\"}');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `pma__usergroups`
--

CREATE TABLE `pma__usergroups` (
  `usergroup` varchar(64) COLLATE utf8_bin NOT NULL,
  `tab` varchar(64) COLLATE utf8_bin NOT NULL,
  `allowed` enum('Y','N') COLLATE utf8_bin NOT NULL DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User groups with configured menu items';

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `pma__users`
--

CREATE TABLE `pma__users` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `usergroup` varchar(64) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Users and their assignments to user groups';

--
-- Indexen voor geëxporteerde tabellen
--

--
-- Indexen voor tabel `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  ADD PRIMARY KEY (`id`);

--
-- Indexen voor tabel `pma__central_columns`
--
ALTER TABLE `pma__central_columns`
  ADD PRIMARY KEY (`db_name`,`col_name`);

--
-- Indexen voor tabel `pma__column_info`
--
ALTER TABLE `pma__column_info`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `db_name` (`db_name`,`table_name`,`column_name`);

--
-- Indexen voor tabel `pma__designer_settings`
--
ALTER TABLE `pma__designer_settings`
  ADD PRIMARY KEY (`username`);

--
-- Indexen voor tabel `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_user_type_template` (`username`,`export_type`,`template_name`);

--
-- Indexen voor tabel `pma__favorite`
--
ALTER TABLE `pma__favorite`
  ADD PRIMARY KEY (`username`);

--
-- Indexen voor tabel `pma__history`
--
ALTER TABLE `pma__history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `username` (`username`,`db`,`table`,`timevalue`);

--
-- Indexen voor tabel `pma__navigationhiding`
--
ALTER TABLE `pma__navigationhiding`
  ADD PRIMARY KEY (`username`,`item_name`,`item_type`,`db_name`,`table_name`);

--
-- Indexen voor tabel `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  ADD PRIMARY KEY (`page_nr`),
  ADD KEY `db_name` (`db_name`);

--
-- Indexen voor tabel `pma__recent`
--
ALTER TABLE `pma__recent`
  ADD PRIMARY KEY (`username`);

--
-- Indexen voor tabel `pma__relation`
--
ALTER TABLE `pma__relation`
  ADD PRIMARY KEY (`master_db`,`master_table`,`master_field`),
  ADD KEY `foreign_field` (`foreign_db`,`foreign_table`);

--
-- Indexen voor tabel `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_savedsearches_username_dbname` (`username`,`db_name`,`search_name`);

--
-- Indexen voor tabel `pma__table_coords`
--
ALTER TABLE `pma__table_coords`
  ADD PRIMARY KEY (`db_name`,`table_name`,`pdf_page_number`);

--
-- Indexen voor tabel `pma__table_info`
--
ALTER TABLE `pma__table_info`
  ADD PRIMARY KEY (`db_name`,`table_name`);

--
-- Indexen voor tabel `pma__table_uiprefs`
--
ALTER TABLE `pma__table_uiprefs`
  ADD PRIMARY KEY (`username`,`db_name`,`table_name`);

--
-- Indexen voor tabel `pma__tracking`
--
ALTER TABLE `pma__tracking`
  ADD PRIMARY KEY (`db_name`,`table_name`,`version`);

--
-- Indexen voor tabel `pma__userconfig`
--
ALTER TABLE `pma__userconfig`
  ADD PRIMARY KEY (`username`);

--
-- Indexen voor tabel `pma__usergroups`
--
ALTER TABLE `pma__usergroups`
  ADD PRIMARY KEY (`usergroup`,`tab`,`allowed`);

--
-- Indexen voor tabel `pma__users`
--
ALTER TABLE `pma__users`
  ADD PRIMARY KEY (`username`,`usergroup`);

--
-- AUTO_INCREMENT voor geëxporteerde tabellen
--

--
-- AUTO_INCREMENT voor een tabel `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT voor een tabel `pma__column_info`
--
ALTER TABLE `pma__column_info`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT voor een tabel `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT voor een tabel `pma__history`
--
ALTER TABLE `pma__history`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT voor een tabel `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  MODIFY `page_nr` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT voor een tabel `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- Database: `test`
--
CREATE DATABASE IF NOT EXISTS `test` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `test`;
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
