-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         10.4.24-MariaDB - mariadb.org binary distribution
-- SO del servidor:              Win64
-- HeidiSQL Versión:             12.0.0.6468
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Volcando estructura de base de datos para programacion
CREATE DATABASE IF NOT EXISTS `programacion` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE `programacion`;

-- Volcando estructura para tabla programacion.dias_disponibles_licencia
CREATE TABLE IF NOT EXISTS `dias_disponibles_licencia` (
  `id_dias_disponibles` int(11) NOT NULL AUTO_INCREMENT,
  `id_usuario` int(11) NOT NULL,
  `id_tipo_licencia` int(11) NOT NULL,
  `año` year(4) DEFAULT NULL,
  `dias_disponibles` int(11) DEFAULT NULL,
  `dias_actuales` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_dias_disponibles`) USING BTREE,
  KEY `FK_dias_disponibles_licencia_usuario` (`id_usuario`),
  KEY `FK_dias_disponibles_licencia_tipo_licencia` (`id_tipo_licencia`),
  CONSTRAINT `FK_dias_disponibles_licencia_tipo_licencia` FOREIGN KEY (`id_tipo_licencia`) REFERENCES `tipo_licencia` (`id_tipo_licencia`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_dias_disponibles_licencia_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla programacion.dias_disponibles_licencia: ~18 rows (aproximadamente)
INSERT INTO `dias_disponibles_licencia` (`id_dias_disponibles`, `id_usuario`, `id_tipo_licencia`, `año`, `dias_disponibles`, `dias_actuales`) VALUES
	(19, 4, 4, '2022', 1, 1),
	(21, 4, 4, NULL, NULL, NULL),
	(22, 4, 8, NULL, 1, NULL),
	(23, 4, 8, NULL, -3, NULL),
	(24, 4, 8, NULL, -19, NULL),
	(25, 4, 1, NULL, 1, NULL),
	(26, 4, 1, NULL, 1, NULL),
	(27, 4, 1, NULL, 1, NULL),
	(28, 4, 1, NULL, 1, NULL),
	(29, 4, 2, NULL, 4, NULL),
	(30, 4, 4, NULL, 4, NULL),
	(31, 4, 4, NULL, 7, NULL),
	(32, 5, 1, NULL, 1, NULL),
	(33, 5, 4, NULL, 8, NULL),
	(34, 5, 8, NULL, 8, NULL),
	(35, 9, 1, NULL, 0, NULL),
	(36, 9, 4, NULL, 1, NULL),
	(37, 9, 7, NULL, 1, NULL);

-- Volcando estructura para tabla programacion.estado
CREATE TABLE IF NOT EXISTS `estado` (
  `id_estado` int(11) NOT NULL AUTO_INCREMENT,
  `estado` char(50) DEFAULT NULL,
  `descripcion` char(100) DEFAULT NULL,
  PRIMARY KEY (`id_estado`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla programacion.estado: ~4 rows (aproximadamente)
INSERT INTO `estado` (`id_estado`, `estado`, `descripcion`) VALUES
	(1, 'Enviado', 'Estado cuando se envía la licencia o las vacaciones para su aprobación'),
	(2, 'En Proceso', 'Cuando el usuario Guarda el formulario se pasa este estado.'),
	(3, 'Aprobado', 'Si el aprobador aprueba la licencia/vacaciones'),
	(4, 'Denegado', 'Si el aprobador deniega la licencia/vacaciones');

-- Volcando estructura para tabla programacion.perfil
CREATE TABLE IF NOT EXISTS `perfil` (
  `id_perfil` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` char(50) DEFAULT '0',
  `apellido` char(50) DEFAULT '0',
  `dni` char(50) NOT NULL,
  `direccion` char(50) DEFAULT NULL,
  `contacto` char(50) DEFAULT NULL,
  `cuit` char(50) DEFAULT NULL,
  `fecha_nacimiento` datetime NOT NULL,
  `puesto` char(50) DEFAULT NULL,
  PRIMARY KEY (`id_perfil`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla programacion.perfil: ~6 rows (aproximadamente)
INSERT INTO `perfil` (`id_perfil`, `nombre`, `apellido`, `dni`, `direccion`, `contacto`, `cuit`, `fecha_nacimiento`, `puesto`) VALUES
	(1, 'damian', 'daporta', '123123123', 'banfield', '01133232', '353467334', '2020-01-11 11:11:11', ''),
	(2, 'damian', 'daporta', '123123123', 'banfield', '01133232', '353467334', '2020-01-11 11:11:11', ''),
	(3, 'sebastian', 'lanzt', '12312312', 'lanus', '1111', '23232323', '2020-01-11 11:11:11', ''),
	(4, 'nombre', 'apellido', 'dni', 'direccion', 'contado', 'cuit', '2020-01-11 11:11:11', ''),
	(5, 'damian', 'daporta', '123123123', '', '', '', '2020-01-11 11:11:11', ''),
	(6, 'seba2', 'lanz2', '1231231', '', '', '', '2020-01-11 11:11:11', ''),
	(7, '', '', '', '', '', '', '2020-01-11 11:11:11', '');

-- Volcando estructura para tabla programacion.permisos
CREATE TABLE IF NOT EXISTS `permisos` (
  `id_permiso` int(11) NOT NULL AUTO_INCREMENT,
  `permiso` char(50) NOT NULL,
  `descripcion` char(50) NOT NULL,
  PRIMARY KEY (`id_permiso`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla programacion.permisos: ~5 rows (aproximadamente)
INSERT INTO `permisos` (`id_permiso`, `permiso`, `descripcion`) VALUES
	(1, 'admin', 'Puede realizar todo'),
	(2, 'user', 'user'),
	(3, 'invitado', 'invitado'),
	(4, 'gestor', 'gestor'),
	(5, 'analyst', 'analista'),
	(9, 'manager', '');

-- Volcando estructura para tabla programacion.tipo_licencia
CREATE TABLE IF NOT EXISTS `tipo_licencia` (
  `id_tipo_licencia` int(11) NOT NULL AUTO_INCREMENT,
  `tipo` char(50) NOT NULL,
  `descripción` char(70) NOT NULL,
  `dias_disponibles` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_tipo_licencia`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla programacion.tipo_licencia: ~8 rows (aproximadamente)
INSERT INTO `tipo_licencia` (`id_tipo_licencia`, `tipo`, `descripción`, `dias_disponibles`) VALUES
	(1, 'Donación de sangre', '1 día', 1),
	(2, 'Exámenes', '10 días al año', 10),
	(3, 'Mudanza', '2 días corridos', 2),
	(4, 'Casamiento', '14 días corridos', 14),
	(5, 'Nacimiento Hijo', '14 días corridos', 14),
	(6, 'Sin goce de sueldo', '21 días', 21),
	(7, 'Maternidad/Paternidad', '21 días corridos', 21),
	(8, 'Vacaciones', 'La cantidad de días corridos que tenga disponible el usuario por año', 14);

-- Volcando estructura para tabla programacion.usuario
CREATE TABLE IF NOT EXISTS `usuario` (
  `id_usuario` int(11) NOT NULL AUTO_INCREMENT,
  `username` char(50) NOT NULL,
  `password` char(50) NOT NULL,
  `fecha_creacion` datetime DEFAULT NULL,
  `fechaUltimoIngreso` datetime DEFAULT NULL,
  `activo` bit(1) NOT NULL,
  `bloqueado` bit(1) NOT NULL,
  `mail` varchar(50) NOT NULL,
  `fechaInactivo` datetime DEFAULT NULL,
  `supervisor` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id_usuario`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla programacion.usuario: ~5 rows (aproximadamente)
INSERT INTO `usuario` (`id_usuario`, `username`, `password`, `fecha_creacion`, `fechaUltimoIngreso`, `activo`, `bloqueado`, `mail`, `fechaInactivo`, `supervisor`) VALUES
	(4, 'admin', 'DVOZUIQnznlVbNpxkYAgwejRW1M=', '2022-09-28 19:20:06', '2022-09-28 19:20:06', b'1', b'0', 'sebas__93@hotmail.com', '2022-09-28 19:20:21', b'1'),
	(5, 'dami', 'DVOZUIQnznlVbNpxkYAgwejRW1M=', '2022-09-28 19:21:18', '2022-09-28 19:21:19', b'1', b'0', 'dami@dami.com', '2022-09-28 19:21:27', b'0'),
	(6, 'pepe', 'nPGRS443NSHcoQlkwvEOLSbLqSU=', '2028-09-28 20:22:00', '2022-10-02 18:08:53', b'1', b'0', 'damiandaporta21@gmail.com', '2022-10-02 17:48:36', b'0'),
	(7, 'dami123', '123', '2019-10-19 20:22:00', NULL, b'1', b'0', 'dami@asd.com', NULL, NULL),
	(8, 'dami333', '1Bcp210AtyGV2MCqppj6qRsauOk=', '2019-10-19 20:22:00', NULL, b'1', b'0', 'asdasd@asdasd', NULL, NULL),
	(9, 'admin2', 'DVOZUIQnznlVbNpxkYAgwejRW1M=', '2019-10-19 20:22:00', NULL, b'1', b'0', 'sbjjnz@gmail.com', NULL, NULL),
	(10, 'eze', 'DVOZUIQnznlVbNpxkYAgwejRW1M=', '2022-09-28 19:20:06', '2022-09-28 19:20:06', b'1', b'0', 'sebas__93@hotmail.com', NULL, NULL);

-- Volcando estructura para tabla programacion.usuario_perfil
CREATE TABLE IF NOT EXISTS `usuario_perfil` (
  `id_usuario_perfil` int(11) NOT NULL AUTO_INCREMENT,
  `id_usuario` int(11) NOT NULL,
  `id_perfil` int(11) NOT NULL,
  PRIMARY KEY (`id_usuario_perfil`),
  KEY `id_usuario` (`id_usuario`),
  KEY `id_perfil` (`id_perfil`),
  CONSTRAINT `FK_usuario_perfil_perfil` FOREIGN KEY (`id_perfil`) REFERENCES `perfil` (`id_perfil`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_usuario_perfil_usuarios` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla programacion.usuario_perfil: ~5 rows (aproximadamente)
INSERT INTO `usuario_perfil` (`id_usuario_perfil`, `id_usuario`, `id_perfil`) VALUES
	(4, 4, 3),
	(5, 5, 1),
	(6, 6, 4),
	(7, 7, 5),
	(8, 8, 6),
	(9, 9, 7);

-- Volcando estructura para tabla programacion.usuario_permiso
CREATE TABLE IF NOT EXISTS `usuario_permiso` (
  `id_usuario_permiso` int(11) NOT NULL AUTO_INCREMENT,
  `id_usuario` int(11) NOT NULL,
  `id_permiso` int(11) NOT NULL,
  PRIMARY KEY (`id_usuario_permiso`),
  KEY `id_usuario` (`id_usuario`),
  KEY `id_permiso` (`id_permiso`),
  CONSTRAINT `FK_usuario_permiso_permisos` FOREIGN KEY (`id_permiso`) REFERENCES `permisos` (`id_permiso`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_usuario_permiso_usuarios` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COMMENT='Acá se va a asignar el/los permisos del ejercicio C-2';

-- Volcando datos para la tabla programacion.usuario_permiso: ~7 rows (aproximadamente)
INSERT INTO `usuario_permiso` (`id_usuario_permiso`, `id_usuario`, `id_permiso`) VALUES
	(7, 4, 1),
	(8, 6, 2),
	(9, 6, 3),
	(13, 4, 3),
	(14, 9, 1),
	(16, 5, 2),
	(17, 10, 9),
	(19, 10, 4);

-- Volcando estructura para tabla programacion.usuario_tipolicencia_estado
CREATE TABLE IF NOT EXISTS `usuario_tipolicencia_estado` (
  `id_usuario_tipoLicencia_estado` int(11) NOT NULL AUTO_INCREMENT,
  `id_usuario` int(11) NOT NULL,
  `id_estado` int(11) NOT NULL,
  `id_tipo_licencia` int(11) NOT NULL,
  `fecha_inicio` datetime DEFAULT NULL,
  `fecha_fin` datetime DEFAULT NULL,
  `motivoRechazo` varchar(50) DEFAULT NULL,
  `id_supervisor` int(11) NOT NULL,
  `dias_tomados` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id_usuario_tipoLicencia_estado`),
  KEY `id_usuario` (`id_usuario`),
  KEY `id_estado` (`id_estado`),
  KEY `id_tipo_licencia` (`id_tipo_licencia`),
  CONSTRAINT `FK_usuario_tipolicencia_estado_estado` FOREIGN KEY (`id_estado`) REFERENCES `estado` (`id_estado`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_usuario_tipolicencia_estado_tipo_licencia` FOREIGN KEY (`id_tipo_licencia`) REFERENCES `tipo_licencia` (`id_tipo_licencia`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_usuario_tipolicencia_estado_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COMMENT='Tabla asociativa entre Usuario - tipo de licencia y Estado';

-- Volcando datos para la tabla programacion.usuario_tipolicencia_estado: ~30 rows (aproximadamente)
INSERT INTO `usuario_tipolicencia_estado` (`id_usuario_tipoLicencia_estado`, `id_usuario`, `id_estado`, `id_tipo_licencia`, `fecha_inicio`, `fecha_fin`, `motivoRechazo`, `id_supervisor`, `dias_tomados`) VALUES
	(1, 4, 3, 8, '2022-11-16 18:55:07', '2022-11-16 18:55:08', NULL, 1, 10),
	(2, 4, 2, 8, '2022-11-16 00:00:00', '2022-11-30 00:00:00', NULL, 9, 0),
	(3, 4, 2, 8, '2022-11-16 00:00:00', '2022-11-24 00:00:00', NULL, 9, 0),
	(4, 4, 1, 8, '2022-11-16 00:00:00', '2022-11-17 00:00:00', NULL, 9, 0),
	(5, 4, 2, 8, '2022-11-16 00:00:00', '2022-11-18 00:00:00', NULL, 9, 0),
	(6, 4, 1, 8, '2022-12-11 00:00:00', '2022-12-14 00:00:00', NULL, 9, 0),
	(7, 4, 1, 8, '2022-12-11 00:00:00', '2022-12-30 00:00:00', NULL, 9, 0),
	(8, 4, 1, 1, '2022-12-11 00:00:00', '2022-12-11 00:00:00', NULL, 9, 0),
	(9, 4, 2, 1, '2022-12-11 00:00:00', '2022-12-11 00:00:00', NULL, 9, 0),
	(10, 4, 1, 1, '2022-12-11 00:00:00', '2022-12-14 00:00:00', NULL, 9, 0),
	(11, 4, 1, 1, '2022-12-11 00:00:00', '2022-12-24 00:00:00', NULL, 9, 0),
	(12, 4, 2, 1, '2022-12-13 00:00:00', '2022-12-14 00:00:00', NULL, 9, 0),
	(13, 4, 1, 1, '2022-12-13 00:00:00', '2022-12-14 00:00:00', NULL, 9, 0),
	(14, 4, 1, 2, '2022-12-13 00:00:00', '2022-12-17 00:00:00', NULL, 9, 0),
	(15, 4, 1, 4, '2022-12-13 00:00:00', '2022-12-17 00:00:00', NULL, 9, 0),
	(16, 4, 1, 4, '2022-12-13 00:00:00', '2022-12-20 00:00:00', NULL, 9, 0),
	(17, 4, 2, 4, '2022-12-13 00:00:00', '2022-12-16 00:00:00', NULL, 9, 0),
	(18, 4, 2, 4, '2022-12-13 00:00:00', '2022-12-23 00:00:00', NULL, 9, 0),
	(19, 4, 2, 6, '2022-12-13 00:00:00', '2022-12-16 00:00:00', NULL, 9, 0),
	(20, 4, 2, 7, '2022-12-13 00:00:00', '2022-12-16 00:00:00', NULL, 9, 0),
	(21, 4, 2, 8, '2022-12-13 00:00:00', '2022-12-16 00:00:00', NULL, 9, 0),
	(22, 5, 2, 1, '2022-12-14 00:00:00', '2022-12-15 00:00:00', NULL, 9, 0),
	(23, 5, 3, 1, '2022-12-14 00:00:00', '2022-12-15 00:00:00', NULL, 10, 0),
	(24, 5, 3, 4, '2022-12-14 00:00:00', '2022-12-22 00:00:00', NULL, 10, 0),
	(25, 5, 4, 8, '2022-12-14 00:00:00', '2022-12-22 00:00:00', 'Probando', 10, 0),
	(26, 9, 1, 1, '2022-12-13 00:00:00', '2022-12-13 00:00:00', NULL, 4, 0),
	(27, 9, 2, 4, '2022-12-13 00:00:00', '2022-12-14 00:00:00', NULL, 4, 0),
	(28, 9, 1, 4, '2022-12-13 00:00:00', '2022-12-14 00:00:00', NULL, 4, 0),
	(29, 9, 2, 7, '2022-12-13 00:00:00', '2022-12-14 00:00:00', NULL, 4, 0),
	(30, 9, 1, 7, '2022-12-13 00:00:00', '2022-12-14 00:00:00', NULL, 4, 0);

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
