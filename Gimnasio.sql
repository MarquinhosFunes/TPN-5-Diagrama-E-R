CREATE TABLE IF NOT EXISTS `Salas` (
	`Id_Sala` int NOT NULL,
	`Id_Tipo_Sala` int NOT NULL,
	`M2_Sala` decimal(10,0) NOT NULL,
	`Ubicacion_Sala` varchar(255) NOT NULL,
	`Num_Sala` int NOT NULL,
	`Maquinas` bool NOT NULL,
	PRIMARY KEY (`Id_Sala`)
);

CREATE TABLE IF NOT EXISTS `Clases` (
	`Id_Clase` int NOT NULL,
	`Id_Monitor` int NOT NULL,
	`Id_Sala` int NOT NULL,
	`Id_Tipo_Clase` int NOT NULL,
	`Dia_Clase` varchar(255) NOT NULL,
	`Hora_Inicio_Clase` time NOT NULL,
	`Hora_Fin_Clase` time NOT NULL,
	PRIMARY KEY (`Id_Clase`)
);

CREATE TABLE IF NOT EXISTS `Maquina` (
	`Id_Maquina` int AUTO_INCREMENT NOT NULL UNIQUE,
	`Id_Sala` int NOT NULL,
	`Tipo_Maquina` varchar(255) NOT NULL,
	PRIMARY KEY (`Id_Maquina`)
);

CREATE TABLE IF NOT EXISTS `Tipo_Maquina` (
	`Id_Tipo_Maquina` int AUTO_INCREMENT NOT NULL UNIQUE,
	`Nombre_Tipo_Maquina` varchar(255) NOT NULL,
	`Descripcion_Tipo_Maquina` text NOT NULL,
	`Condicion_Tipo_Maquina` text NOT NULL,
	PRIMARY KEY (`Id_Tipo_Maquina`)
);

CREATE TABLE IF NOT EXISTS `Monitor` (
	`Id_Monitor` int AUTO_INCREMENT NOT NULL UNIQUE,
	`Id_Tipo_Clase` int NOT NULL,
	`Nombre_Monitor` varchar(255) NOT NULL,
	`Apellido_Monitor` varchar(255) NOT NULL,
	`DNI_Monitor` varchar(255) NOT NULL,
	`Tel_Movil_Monitor` varchar(255) NOT NULL,
	`Titulacion_Monitor` varchar(255) NOT NULL,
	`Experiencia_Profesional_Monitor` varchar(255) NOT NULL,
	PRIMARY KEY (`Id_Monitor`)
);

CREATE TABLE IF NOT EXISTS `Tipo_Sala` (
	`Id_Tipo_Sala` int AUTO_INCREMENT NOT NULL UNIQUE,
	`Nombre_Tipo_Sala` varchar(255) NOT NULL,
	`Descripcion_Tipo_Sala` text NOT NULL,
	PRIMARY KEY (`Id_Tipo_Sala`)
);

CREATE TABLE IF NOT EXISTS `Tipo_Clase` (
	`Id_Tipo_Clase` int AUTO_INCREMENT NOT NULL UNIQUE,
	`Nombre_Clase` varchar(255) NOT NULL,
	`Descripcion_Clase` text NOT NULL,
	PRIMARY KEY (`Id_Tipo_Clase`)
);

CREATE TABLE IF NOT EXISTS `Socios` (
	`Id_Socio` int AUTO_INCREMENT NOT NULL UNIQUE,
	`Id_Banco_Socio` int NOT NULL,
	`Id_Clase` int NOT NULL,
	`Nombre_Socio` varchar(255) NOT NULL,
	`Apellido_Socio` varchar(255) NOT NULL,
	`Direccion_Socio` varchar(255) NOT NULL,
	`Tel_Movil_Socio` varchar(255) NOT NULL,
	`Profesion_Socio` varchar(255) NOT NULL,
	PRIMARY KEY (`Id_Socio`)
);

CREATE TABLE IF NOT EXISTS `Banco_Socio` (
	`Id_Banco_Socio` int AUTO_INCREMENT NOT NULL UNIQUE,
	`Num_Tarjera_Banco_Socio` varchar(255) NOT NULL,
	`Fecha_Vcto_Banco_Socio` date NOT NULL,
	`CVV_Banco_Socio` varchar(255) NOT NULL,
	PRIMARY KEY (`Id_Banco_Socio`)
);

CREATE TABLE IF NOT EXISTS `Inscripciones` (
	`Id_Inscripcion` int AUTO_INCREMENT NOT NULL UNIQUE,
	`Id_Socio` int NOT NULL,
	`Plan_Inscipcion` varchar(255) NOT NULL,
	`Fecha_Alta_Inscripcion` date NOT NULL,
	`Fecha_Renovacion` date NOT NULL,
	PRIMARY KEY (`Id_Inscripcion`)
);

CREATE TABLE IF NOT EXISTS `Pistas_Squash` (
	`Id_Pista_Squash` int AUTO_INCREMENT NOT NULL UNIQUE,
	`Id_Sala` int NOT NULL,
	`Num_Pista_Squash` int NOT NULL,
	`Estado_Pista_Squash` varchar(255) NOT NULL,
	PRIMARY KEY (`Id_Pista_Squash`)
);

CREATE TABLE IF NOT EXISTS `Reservas_Pista_Squash` (
	`Id_Reserva` int AUTO_INCREMENT NOT NULL UNIQUE,
	`Id_Socio` int NOT NULL,
	`Id_Pista_Squash` int NOT NULL,
	`Fecha_Reserva` date NOT NULL,
	`Hora_Inicio_Reserva` time NOT NULL,
	`Hora_Fin_Reserva` time NOT NULL,
	PRIMARY KEY (`Id_Reserva`)
);

ALTER TABLE `Salas` ADD CONSTRAINT `Salas_fk1` FOREIGN KEY (`Id_Tipo_Sala`) REFERENCES `Tipo_Sala`(`Id_Tipo_Sala`);
ALTER TABLE `Clases` ADD CONSTRAINT `Clases_fk1` FOREIGN KEY (`Id_Monitor`) REFERENCES `Monitor`(`Id_Monitor`);

ALTER TABLE `Clases` ADD CONSTRAINT `Clases_fk2` FOREIGN KEY (`Id_Sala`) REFERENCES `Salas`(`Id_Sala`);

ALTER TABLE `Clases` ADD CONSTRAINT `Clases_fk3` FOREIGN KEY (`Id_Tipo_Clase`) REFERENCES `Tipo_Clase`(`Id_Tipo_Clase`);
ALTER TABLE `Maquina` ADD CONSTRAINT `Maquina_fk1` FOREIGN KEY (`Id_Sala`) REFERENCES `Salas`(`Id_Sala`);

ALTER TABLE `Maquina` ADD CONSTRAINT `Maquina_fk2` FOREIGN KEY (`Tipo_Maquina`) REFERENCES `Tipo_Maquina`(`Id_Tipo_Maquina`);

ALTER TABLE `Monitor` ADD CONSTRAINT `Monitor_fk1` FOREIGN KEY (`Id_Tipo_Clase`) REFERENCES `Tipo_Clase`(`Id_Tipo_Clase`);


ALTER TABLE `Socios` ADD CONSTRAINT `Socios_fk1` FOREIGN KEY (`Id_Banco_Socio`) REFERENCES `Banco_Socio`(`Id_Banco_Socio`);

ALTER TABLE `Socios` ADD CONSTRAINT `Socios_fk2` FOREIGN KEY (`Id_Clase`) REFERENCES `Clases`(`Id_Clase`);

ALTER TABLE `Inscripciones` ADD CONSTRAINT `Inscripciones_fk1` FOREIGN KEY (`Id_Socio`) REFERENCES `Socios`(`Id_Socio`);
ALTER TABLE `Pistas_Squash` ADD CONSTRAINT `Pistas_Squash_fk1` FOREIGN KEY (`Id_Sala`) REFERENCES `Salas`(`Id_Sala`);
ALTER TABLE `Reservas_Pista_Squash` ADD CONSTRAINT `Reservas_Pista_Squash_fk1` FOREIGN KEY (`Id_Socio`) REFERENCES `Socios`(`Id_Socio`);

ALTER TABLE `Reservas_Pista_Squash` ADD CONSTRAINT `Reservas_Pista_Squash_fk2` FOREIGN KEY (`Id_Pista_Squash`) REFERENCES `Pistas_Squash`(`Id_Pista_Squash`);