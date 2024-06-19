-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 19, 2024 at 06:51 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `gimnasio "siempre en forma"`
--

-- --------------------------------------------------------

--
-- Table structure for table `banco_socio`
--

CREATE TABLE `banco_socio` (
  `Id_Banco_Socio` int(11) NOT NULL,
  `Num_Tarjera_Banco_Socio` varchar(255) NOT NULL,
  `Fecha_Vcto_Banco_Socio` date NOT NULL,
  `CVV_Banco_Socio` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `clases`
--

CREATE TABLE `clases` (
  `Id_Clase` int(11) NOT NULL,
  `Id_Monitor` int(11) NOT NULL,
  `Id_Sala` int(11) NOT NULL,
  `Id_Tipo_Clase` int(11) NOT NULL,
  `Dia_Clase` varchar(255) NOT NULL,
  `Hora_Inicio_Clase` time NOT NULL,
  `Hora_Fin_Clase` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `inscripciones`
--

CREATE TABLE `inscripciones` (
  `Id_Inscripcion` int(11) NOT NULL,
  `Id_Socio` int(11) NOT NULL,
  `Plan_Inscipcion` varchar(255) NOT NULL,
  `Fecha_Alta_Inscripcion` date NOT NULL,
  `Fecha_Renovacion` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `maquina`
--

CREATE TABLE `maquina` (
  `Id_Maquina` int(11) NOT NULL,
  `Id_Sala` int(11) NOT NULL,
  `Id_Tipo_Maquina` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `monitor`
--

CREATE TABLE `monitor` (
  `Id_Monitor` int(11) NOT NULL,
  `Id_Tipo_Clase` int(11) NOT NULL,
  `Nombre_Monitor` varchar(255) NOT NULL,
  `Apellido_Monitor` varchar(255) NOT NULL,
  `DNI_Monitor` varchar(255) NOT NULL,
  `Tel_Movil_Monitor` varchar(255) NOT NULL,
  `Titulacion_Monitor` varchar(255) NOT NULL,
  `Experiencia_Profesional_Monitor` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pistas_squash`
--

CREATE TABLE `pistas_squash` (
  `Id_Pista_Squash` int(11) NOT NULL,
  `Id_Sala` int(11) NOT NULL,
  `Num_Pista_Squash` int(11) NOT NULL,
  `Estado_Pista_Squash` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `reservas_pista_squash`
--

CREATE TABLE `reservas_pista_squash` (
  `Id_Reserva` int(11) NOT NULL,
  `Id_Socio` int(11) NOT NULL,
  `Id_Pista_Squash` int(11) NOT NULL,
  `Fecha_Reserva` date NOT NULL,
  `Hora_Inicio_Reserva` time NOT NULL,
  `Hora_Fin_Reserva` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `salas`
--

CREATE TABLE `salas` (
  `Id_Sala` int(11) NOT NULL,
  `Id_Tipo_Sala` int(11) NOT NULL,
  `M2_Sala` decimal(10,0) NOT NULL,
  `Ubicacion_Sala` varchar(255) NOT NULL,
  `Num_Sala` int(11) NOT NULL,
  `Maquinas` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `socios`
--

CREATE TABLE `socios` (
  `Id_Socio` int(11) NOT NULL,
  `Id_Banco_Socio` int(11) NOT NULL,
  `Id_Clase` int(11) NOT NULL,
  `Nombre_Socio` varchar(255) NOT NULL,
  `Apellido_Socio` varchar(255) NOT NULL,
  `Direccion_Socio` varchar(255) NOT NULL,
  `Tel_Movil_Socio` varchar(255) NOT NULL,
  `Profesion_Socio` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tipo_clase`
--

CREATE TABLE `tipo_clase` (
  `Id_Tipo_Clase` int(11) NOT NULL,
  `Nombre_Clase` varchar(255) NOT NULL,
  `Descripcion_Clase` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tipo_maquina`
--

CREATE TABLE `tipo_maquina` (
  `Id_Tipo_Maquina` int(11) NOT NULL,
  `Nombre_Tipo_Maquina` varchar(255) NOT NULL,
  `Descripcion_Tipo_Maquina` text NOT NULL,
  `Condicion_Tipo_Maquina` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tipo_sala`
--

CREATE TABLE `tipo_sala` (
  `Id_Tipo_Sala` int(11) NOT NULL,
  `Nombre_Tipo_Sala` varchar(255) NOT NULL,
  `Descripcion_Tipo_Sala` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `banco_socio`
--
ALTER TABLE `banco_socio`
  ADD PRIMARY KEY (`Id_Banco_Socio`),
  ADD UNIQUE KEY `Id_Banco_Socio` (`Id_Banco_Socio`);

--
-- Indexes for table `clases`
--
ALTER TABLE `clases`
  ADD PRIMARY KEY (`Id_Clase`),
  ADD KEY `Clases_fk1` (`Id_Monitor`),
  ADD KEY `Clases_fk2` (`Id_Sala`),
  ADD KEY `Clases_fk3` (`Id_Tipo_Clase`);

--
-- Indexes for table `inscripciones`
--
ALTER TABLE `inscripciones`
  ADD PRIMARY KEY (`Id_Inscripcion`),
  ADD UNIQUE KEY `Id_Inscripcion` (`Id_Inscripcion`),
  ADD KEY `Inscripciones_fk1` (`Id_Socio`);

--
-- Indexes for table `maquina`
--
ALTER TABLE `maquina`
  ADD PRIMARY KEY (`Id_Maquina`),
  ADD UNIQUE KEY `Id_Maquina` (`Id_Maquina`),
  ADD KEY `Maquina_fk1` (`Id_Sala`),
  ADD KEY `Maquina_fk2` (`Id_Tipo_Maquina`);

--
-- Indexes for table `monitor`
--
ALTER TABLE `monitor`
  ADD PRIMARY KEY (`Id_Monitor`),
  ADD UNIQUE KEY `Id_Monitor` (`Id_Monitor`),
  ADD KEY `Monitor_fk1` (`Id_Tipo_Clase`);

--
-- Indexes for table `pistas_squash`
--
ALTER TABLE `pistas_squash`
  ADD PRIMARY KEY (`Id_Pista_Squash`),
  ADD UNIQUE KEY `Id_Pista_Squash` (`Id_Pista_Squash`),
  ADD KEY `Pistas_Squash_fk1` (`Id_Sala`);

--
-- Indexes for table `reservas_pista_squash`
--
ALTER TABLE `reservas_pista_squash`
  ADD PRIMARY KEY (`Id_Reserva`),
  ADD UNIQUE KEY `Id_Reserva` (`Id_Reserva`),
  ADD KEY `Reservas_Pista_Squash_fk1` (`Id_Socio`),
  ADD KEY `Reservas_Pista_Squash_fk2` (`Id_Pista_Squash`);

--
-- Indexes for table `salas`
--
ALTER TABLE `salas`
  ADD PRIMARY KEY (`Id_Sala`),
  ADD KEY `Salas_fk1` (`Id_Tipo_Sala`);

--
-- Indexes for table `socios`
--
ALTER TABLE `socios`
  ADD PRIMARY KEY (`Id_Socio`),
  ADD UNIQUE KEY `Id_Socio` (`Id_Socio`),
  ADD KEY `Socios_fk1` (`Id_Banco_Socio`),
  ADD KEY `Socios_fk2` (`Id_Clase`);

--
-- Indexes for table `tipo_clase`
--
ALTER TABLE `tipo_clase`
  ADD PRIMARY KEY (`Id_Tipo_Clase`),
  ADD UNIQUE KEY `Id_Tipo_Clase` (`Id_Tipo_Clase`);

--
-- Indexes for table `tipo_maquina`
--
ALTER TABLE `tipo_maquina`
  ADD PRIMARY KEY (`Id_Tipo_Maquina`),
  ADD UNIQUE KEY `Id_Tipo_Maquina` (`Id_Tipo_Maquina`);

--
-- Indexes for table `tipo_sala`
--
ALTER TABLE `tipo_sala`
  ADD PRIMARY KEY (`Id_Tipo_Sala`),
  ADD UNIQUE KEY `Id_Tipo_Sala` (`Id_Tipo_Sala`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `banco_socio`
--
ALTER TABLE `banco_socio`
  MODIFY `Id_Banco_Socio` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `inscripciones`
--
ALTER TABLE `inscripciones`
  MODIFY `Id_Inscripcion` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `maquina`
--
ALTER TABLE `maquina`
  MODIFY `Id_Maquina` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `monitor`
--
ALTER TABLE `monitor`
  MODIFY `Id_Monitor` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pistas_squash`
--
ALTER TABLE `pistas_squash`
  MODIFY `Id_Pista_Squash` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `reservas_pista_squash`
--
ALTER TABLE `reservas_pista_squash`
  MODIFY `Id_Reserva` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `socios`
--
ALTER TABLE `socios`
  MODIFY `Id_Socio` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tipo_clase`
--
ALTER TABLE `tipo_clase`
  MODIFY `Id_Tipo_Clase` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tipo_maquina`
--
ALTER TABLE `tipo_maquina`
  MODIFY `Id_Tipo_Maquina` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tipo_sala`
--
ALTER TABLE `tipo_sala`
  MODIFY `Id_Tipo_Sala` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `clases`
--
ALTER TABLE `clases`
  ADD CONSTRAINT `Clases_fk1` FOREIGN KEY (`Id_Monitor`) REFERENCES `monitor` (`Id_Monitor`),
  ADD CONSTRAINT `Clases_fk2` FOREIGN KEY (`Id_Sala`) REFERENCES `salas` (`Id_Sala`),
  ADD CONSTRAINT `Clases_fk3` FOREIGN KEY (`Id_Tipo_Clase`) REFERENCES `tipo_clase` (`Id_Tipo_Clase`);

--
-- Constraints for table `inscripciones`
--
ALTER TABLE `inscripciones`
  ADD CONSTRAINT `Inscripciones_fk1` FOREIGN KEY (`Id_Socio`) REFERENCES `socios` (`Id_Socio`);

--
-- Constraints for table `maquina`
--
ALTER TABLE `maquina`
  ADD CONSTRAINT `Maquina_fk1` FOREIGN KEY (`Id_Sala`) REFERENCES `salas` (`Id_Sala`),
  ADD CONSTRAINT `Maquina_fk2` FOREIGN KEY (`Id_Tipo_Maquina`) REFERENCES `tipo_maquina` (`Id_Tipo_Maquina`);

--
-- Constraints for table `monitor`
--
ALTER TABLE `monitor`
  ADD CONSTRAINT `Monitor_fk1` FOREIGN KEY (`Id_Tipo_Clase`) REFERENCES `tipo_clase` (`Id_Tipo_Clase`);

--
-- Constraints for table `pistas_squash`
--
ALTER TABLE `pistas_squash`
  ADD CONSTRAINT `Pistas_Squash_fk1` FOREIGN KEY (`Id_Sala`) REFERENCES `salas` (`Id_Sala`);

--
-- Constraints for table `reservas_pista_squash`
--
ALTER TABLE `reservas_pista_squash`
  ADD CONSTRAINT `Reservas_Pista_Squash_fk1` FOREIGN KEY (`Id_Socio`) REFERENCES `socios` (`Id_Socio`),
  ADD CONSTRAINT `Reservas_Pista_Squash_fk2` FOREIGN KEY (`Id_Pista_Squash`) REFERENCES `pistas_squash` (`Id_Pista_Squash`);

--
-- Constraints for table `salas`
--
ALTER TABLE `salas`
  ADD CONSTRAINT `Salas_fk1` FOREIGN KEY (`Id_Tipo_Sala`) REFERENCES `tipo_sala` (`Id_Tipo_Sala`);

--
-- Constraints for table `socios`
--
ALTER TABLE `socios`
  ADD CONSTRAINT `Socios_fk1` FOREIGN KEY (`Id_Banco_Socio`) REFERENCES `banco_socio` (`Id_Banco_Socio`),
  ADD CONSTRAINT `Socios_fk2` FOREIGN KEY (`Id_Clase`) REFERENCES `clases` (`Id_Clase`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
