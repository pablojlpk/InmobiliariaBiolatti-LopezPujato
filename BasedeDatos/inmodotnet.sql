-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 23-04-2024 a las 15:10:48
-- Versión del servidor: 10.4.28-MariaDB
-- Versión de PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `inmodotnet`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auditorias`
--

CREATE TABLE `auditorias` (
  `IdAuditoria` int(11) NOT NULL,
  `IdUsuario` int(11) NOT NULL,
  `Fecha` datetime NOT NULL,
  `Observaciones` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `auditorias`
--

INSERT INTO `auditorias` (`IdAuditoria`, `IdUsuario`, `Fecha`, `Observaciones`) VALUES
(341, 40, '2024-04-23 09:50:16', 'Usuario:lopez pujato, Pablo -(40)-Acción: ACCESO CORRECTO Modulo: LOGIN'),
(342, 40, '2024-04-23 09:55:27', 'Usuario:lopez pujato, Pablo -(40)-Acción: Modificar Modulo: usuarios'),
(343, 40, '2024-04-23 09:55:48', 'Usuario:lopez pujato, Pablo -(40)-Acción: Modificar Modulo: usuarios'),
(344, 40, '2024-04-23 09:58:04', 'Usuario:lopez pujato, Pablo -(40)-Acción: Editar Modulo: Inmuebles'),
(345, 40, '2024-04-23 09:58:12', 'Usuario:lopez pujato, Pablo -(40)-Acción: Modificar Modulo: Contrato'),
(346, 40, '2024-04-23 09:58:35', 'Usuario:lopez pujato, Pablo -(40)-Acción: Modificar Modulo: Contrato'),
(347, 40, '2024-04-23 09:59:12', 'Usuario:lopez pujato, Pablo -(40)-Acción: Alta Modulo: Propietarios'),
(348, 40, '2024-04-23 09:59:24', 'Usuario:lopez pujato, Pablo -(40)-Acción: cierre Sesión Modulo: usuarios'),
(349, 40, '2024-04-23 09:59:32', 'Usuario:lopez pujato, Pablo -(40)-Acción: ACCESO CORRECTO Modulo: LOGIN'),
(350, 40, '2024-04-23 09:59:34', 'Usuario:lopez pujato, Pablo -(40)-Acción: Editar Modulo: Propietarios'),
(351, 40, '2024-04-23 09:59:38', 'Usuario:lopez pujato, Pablo -(40)-Acción: Modificar Modulo: Propietarios'),
(352, 40, '2024-04-23 09:59:47', 'Usuario:lopez pujato, Pablo -(40)-Acción: Editar Modulo: Inquilinos'),
(353, 40, '2024-04-23 10:00:58', 'Usuario:lopez pujato, Pablo -(40)-Acción: MULTA Modulo: Pagos'),
(354, 40, '2024-04-23 10:01:19', 'Usuario:lopez pujato, Pablo -(40)-Acción: Anular Modulo: Pagos'),
(355, 40, '2024-04-23 10:08:19', 'Usuario:lopez pujato, Pablo -(40)-Acción: MULTA Modulo: Pagos'),
(356, 40, '2024-04-23 10:08:38', 'Usuario:lopez pujato, Pablo -(40)-Acción: MULTA Modulo: Pagos'),
(357, 40, '2024-04-23 10:08:41', 'Usuario:lopez pujato, Pablo -(40)-Acción: Anular Modulo: Pagos'),
(358, 40, '2024-04-23 10:09:22', 'Usuario:lopez pujato, Pablo -(40)-Acción: Alta Modulo: Pagos'),
(359, 40, '2024-04-23 10:09:39', 'Usuario:lopez pujato, Pablo -(40)-Acción: cierre Sesión Modulo: usuarios'),
(360, 43, '2024-04-23 10:09:45', 'Usuario:Rios, Javier-(43)-Acción: ACCESO CORRECTO Modulo: LOGIN'),
(361, 43, '2024-04-23 10:09:52', 'Usuario:Rios, Javier-(43)-Acción: Editar Modulo: Propietarios'),
(362, 43, '2024-04-23 10:09:55', 'Usuario:Rios, Javier-(43)-Acción: Modificar Modulo: Propietarios'),
(363, 43, '2024-04-23 10:09:59', 'Usuario:Rios, Javier-(43)-Acción: cierre Sesión Modulo: usuarios'),
(364, 40, '2024-04-23 10:10:09', 'Usuario:lopez pujato, Pablo -(40)-Acción: ACCESO CORRECTO Modulo: LOGIN'),
(365, 40, '2024-04-23 10:10:36', 'Usuario:lopez pujato, Pablo -(40)-Acción: cierre Sesión Modulo: usuarios');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `contratos`
--

CREATE TABLE `contratos` (
  `idcontrato` int(11) NOT NULL,
  `idinmueble` int(11) NOT NULL,
  `idinquilino` int(11) NOT NULL,
  `fdesde` date NOT NULL,
  `fhasta` date NOT NULL,
  `importe` decimal(8,2) NOT NULL,
  `borrado` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `contratos`
--

INSERT INTO `contratos` (`idcontrato`, `idinmueble`, `idinquilino`, `fdesde`, `fhasta`, `importe`, `borrado`) VALUES
(19, 16, 18, '2024-05-01', '2024-04-22', 80000.00, 0),
(20, 15, 19, '2024-04-23', '2024-11-23', 120000.00, 0),
(21, 16, 21, '2024-05-01', '2024-05-30', 999999.99, 1),
(22, 17, 20, '2024-05-01', '2025-06-01', 350000.00, 0),
(23, 18, 21, '2024-05-01', '2024-12-01', 130000.00, 0),
(24, 19, 22, '2024-04-29', '2024-08-29', 40000.00, 0),
(25, 20, 24, '2024-05-01', '2024-04-22', 300000.00, 0),
(26, 22, 23, '2024-05-01', '2024-09-01', 90000.00, 0),
(27, 23, 26, '2024-04-23', '2024-06-23', 375000.00, 0),
(28, 25, 25, '2024-05-07', '2024-06-07', 56000.00, 0),
(29, 24, 27, '2024-05-01', '2024-08-01', 120000.00, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inmuebles`
--

CREATE TABLE `inmuebles` (
  `idinmueble` int(11) NOT NULL,
  `direccion` varchar(100) NOT NULL,
  `ambientes` int(2) NOT NULL,
  `superficie` int(4) NOT NULL,
  `latitud` decimal(7,2) NOT NULL,
  `longitud` decimal(7,2) NOT NULL,
  `idpropietario` int(11) NOT NULL,
  `tipoinmueble` varchar(20) NOT NULL,
  `nompropietario` varchar(100) NOT NULL,
  `importe` decimal(9,2) NOT NULL,
  `estado` varchar(15) NOT NULL,
  `borrado` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `inmuebles`
--

INSERT INTO `inmuebles` (`idinmueble`, `direccion`, `ambientes`, `superficie`, `latitud`, `longitud`, `idpropietario`, `tipoinmueble`, `nompropietario`, `importe`, `estado`, `borrado`) VALUES
(15, 'Av. Libertad 123', 3, 150, -99999.99, -99999.99, 33, 'Casa', '', 25412.22, 'Alquilado', 0),
(16, 'San Martin 456', 3, 80, 2255.22, -99999.99, 34, 'Departamento', '', 100000.00, 'Disponible', 0),
(17, 'Belgrano 789', 4, 200, -99999.99, -99999.99, 35, 'Casa', '', 50000.00, 'Alquilado', 0),
(18, 'Corrientes 1010', 1, 50, -99999.99, -99999.99, 38, 'Local', '', 15000.00, 'Alquilado', 0),
(19, 'General Paz 100', 1, 40, -99999.99, -99999.99, 36, 'Depósito', '', 25001.00, 'Alquilado', 0),
(20, 'Junin 6060', 1, 300, -99999.99, -99999.99, 39, 'Depósito', '', 25000.00, 'Disponible', 0),
(21, 'Entre rios 7070', 0, 500, -99999.99, -99999.99, 37, 'Terreno', '', 10250.22, 'Disponible', 0),
(22, 'La Rioja 300', 2, 75, -99999.99, -99999.99, 40, 'Departamento', '', 25144.00, 'Alquilado', 0),
(23, 'Uruguay 1313', 4, 180, -99999.99, -99999.99, 31, 'Local', '', 25411.22, 'Alquilado', 0),
(24, 'Av. Callao 909', 1, 80, -99999.99, -99999.99, 32, 'Local', '', 15222.00, 'Alquilado', 0),
(25, 'Heras 131', 1, 45, -99999.99, -99999.99, 33, 'Departamento', '', 2551.00, 'Alquilado', 0),
(26, 'Av. Cordoba 909', 2, 85, -99999.99, -99999.99, 39, 'Departamento', '', 0.00, 'Disponible', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inquilino`
--

CREATE TABLE `inquilino` (
  `idinquilino` int(11) NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `apellido` varchar(30) NOT NULL,
  `mail` varchar(30) NOT NULL,
  `clave` varchar(30) NOT NULL,
  `dni` int(8) NOT NULL,
  `borrado` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `inquilino`
--

INSERT INTO `inquilino` (`idinquilino`, `nombre`, `apellido`, `mail`, `clave`, `dni`, `borrado`) VALUES
(18, 'Enrique', 'Acevedo Mejía', 'acevedomejia@gmail.com', '123', 16980777, 0),
(19, 'Tomas Jose', 'Acosta Canto', 'tomasjose@gmail.com', '1234', 17555709, 0),
(20, ' Irma', 'Aguilar', ' irmaaguilar@gmail.com', '123', 20908778, 0),
(21, 'Gerardo', 'Alarcon', 'gerardoalarcon@gmail.com', '123', 18890097, 0),
(22, 'Juana ', 'Cadena', 'cadenajuana@gmail.com', '123', 17699078, 0),
(23, 'Clemente', 'Delgado', 'clementedelgado@gmail.com', '123', 36310098, 0),
(24, 'Celeste', 'Del Toro', 'celestedeltoro@gmail.com', '123', 39798987, 0),
(25, 'Cristina', 'Sanchez', 'cristinasanchez@gmail.com', '123', 36389965, 0),
(26, 'Beatriz', 'Duarte', 'beatrizduarte@gmail.com', '123', 15789087, 0),
(27, 'Micaela', 'Velasco', 'micavelasco', '123', 40879098, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pagos`
--

CREATE TABLE `pagos` (
  `idpago` int(11) NOT NULL,
  `idcontrato` int(11) NOT NULL,
  `fpago` date NOT NULL,
  `importe` decimal(9,2) NOT NULL,
  `borrado` tinyint(1) NOT NULL,
  `anulado` tinyint(1) NOT NULL,
  `detalle` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `pagos`
--

INSERT INTO `pagos` (`idpago`, `idcontrato`, `fpago`, `importe`, `borrado`, `anulado`, `detalle`) VALUES
(54, 19, '2024-05-01', 80000.00, 0, 0, ''),
(55, 20, '2024-04-30', 99999.99, 0, 0, ''),
(56, 22, '2024-04-23', 99999.99, 0, 0, ''),
(57, 23, '2024-05-01', 99999.99, 0, 0, ''),
(58, 24, '2024-04-24', 40000.00, 0, 0, ''),
(59, 25, '2024-04-24', 99999.99, 0, 0, ''),
(60, 27, '2024-04-24', 99999.99, 0, 0, ''),
(61, 28, '2024-04-26', 56000.00, 0, 1, ''),
(62, 29, '2024-04-25', 12000.00, 0, 0, ''),
(63, 19, '2024-04-24', 12555.00, 0, 0, 'Multa'),
(64, 20, '2024-04-23', 50822.66, 0, 0, 'Multa'),
(65, 26, '2024-04-10', 26.64, 0, 1, 'Multa'),
(66, 26, '2024-04-23', 254.00, 0, 0, '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `propietario`
--

CREATE TABLE `propietario` (
  `idpropietario` int(11) NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `apellido` varchar(30) NOT NULL,
  `dni` int(8) NOT NULL,
  `mail` varchar(30) NOT NULL,
  `clave` text NOT NULL,
  `borrado` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `propietario`
--

INSERT INTO `propietario` (`idpropietario`, `nombre`, `apellido`, `dni`, `mail`, `clave`, `borrado`) VALUES
(31, 'OMAR', 'FUENTES', 16345987, 'omarfuentes@gmail.com', '123', 0),
(32, 'RICARDO', 'GARCIA', 16578932, 'ricardogarcia@gmail.com', '123', 0),
(33, 'Raul', 'Alvarez', 17897560, 'alvarezraul@gmail.com', '123', 0),
(34, 'ANGEL', 'AMAYA', 18789543, 'amayaangel@gmail.com', '123', 0),
(35, 'ANGEL', 'ANGULO', 363876567, 'anguloangel@gmail.com', '123', 0),
(36, 'SANDRA', 'CAMACHO', 18564298, 'sandracamacho@gmail.com', '123', 0),
(37, 'CESAR', 'CONTRERAS', 20870987, 'cesarcontreras@gmail.com', '123', 0),
(38, 'SONIA', 'CALVILLO', 27658798, 'soniacalvillo@gmail.com', '123', 0),
(39, 'MARIO', 'CANTU', 28765980, 'mariocantu@gmail.com', '123', 0),
(40, 'FRANCISCO', 'ESCOBAR', 25789098, 'franciscoescobar@gmail.com', '123', 0),
(41, 'MARCELO', 'GOMEZ', 24499857, 'mmgomez@gmail.com', '123', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `IdUsuario` int(11) NOT NULL,
  `Nombre` varchar(25) NOT NULL,
  `Apellido` varchar(25) NOT NULL,
  `Email` varchar(50) NOT NULL,
  `Clave` varchar(100) NOT NULL,
  `Borrado` tinyint(1) NOT NULL,
  `Permiso` int(2) NOT NULL,
  `AvatarUrl` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`IdUsuario`, `Nombre`, `Apellido`, `Email`, `Clave`, `Borrado`, `Permiso`, `AvatarUrl`) VALUES
(39, 'Miguel', 'Torres', 'migueltorres@gmail.com', 'k3ydslbaTcDJEL1NRHX+0Nh2UWI52IXsIB+W2d6k9Jc=', 0, 1, '/update\\avatar_39.png'),
(40, 'Pablo ', 'lopez pujato', 'pp@pp.com', 'k3ydslbaTcDJEL1NRHX+0Nh2UWI52IXsIB+W2d6k9Jc=', 0, 1, '/update\\avatar_40.jpg'),
(41, 'Ana luz', 'Biolatti', 'analuzbiolatti@gmail.com', 'k3ydslbaTcDJEL1NRHX+0Nh2UWI52IXsIB+W2d6k9Jc=', 0, 1, '/update\\avatar_41.png'),
(42, 'Ricardo', 'Cantero', 'ricardocantero@gmail.com', 'k3ydslbaTcDJEL1NRHX+0Nh2UWI52IXsIB+W2d6k9Jc=', 0, 2, '/update\\avatar_42.png'),
(43, 'Javier', 'Rios', 'javirios@gmail.com', 'k3ydslbaTcDJEL1NRHX+0Nh2UWI52IXsIB+W2d6k9Jc=', 0, 2, '/update\\avatar_43.png');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `auditorias`
--
ALTER TABLE `auditorias`
  ADD PRIMARY KEY (`IdAuditoria`),
  ADD KEY `IdUsuario` (`IdUsuario`);

--
-- Indices de la tabla `contratos`
--
ALTER TABLE `contratos`
  ADD PRIMARY KEY (`idcontrato`),
  ADD KEY `idinmueble` (`idinmueble`,`idinquilino`),
  ADD KEY `idinquilino` (`idinquilino`);

--
-- Indices de la tabla `inmuebles`
--
ALTER TABLE `inmuebles`
  ADD PRIMARY KEY (`idinmueble`),
  ADD KEY `idpropietario` (`idpropietario`);

--
-- Indices de la tabla `inquilino`
--
ALTER TABLE `inquilino`
  ADD PRIMARY KEY (`idinquilino`);

--
-- Indices de la tabla `pagos`
--
ALTER TABLE `pagos`
  ADD PRIMARY KEY (`idpago`),
  ADD KEY `idcontrato` (`idcontrato`);

--
-- Indices de la tabla `propietario`
--
ALTER TABLE `propietario`
  ADD PRIMARY KEY (`idpropietario`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`IdUsuario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `auditorias`
--
ALTER TABLE `auditorias`
  MODIFY `IdAuditoria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=366;

--
-- AUTO_INCREMENT de la tabla `contratos`
--
ALTER TABLE `contratos`
  MODIFY `idcontrato` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT de la tabla `inmuebles`
--
ALTER TABLE `inmuebles`
  MODIFY `idinmueble` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT de la tabla `inquilino`
--
ALTER TABLE `inquilino`
  MODIFY `idinquilino` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT de la tabla `pagos`
--
ALTER TABLE `pagos`
  MODIFY `idpago` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=67;

--
-- AUTO_INCREMENT de la tabla `propietario`
--
ALTER TABLE `propietario`
  MODIFY `idpropietario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `IdUsuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `auditorias`
--
ALTER TABLE `auditorias`
  ADD CONSTRAINT `auditorias_ibfk_1` FOREIGN KEY (`IdUsuario`) REFERENCES `usuarios` (`IdUsuario`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `contratos`
--
ALTER TABLE `contratos`
  ADD CONSTRAINT `contratos_ibfk_1` FOREIGN KEY (`idinquilino`) REFERENCES `inquilino` (`idinquilino`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `contratos_ibfk_2` FOREIGN KEY (`idinmueble`) REFERENCES `inmuebles` (`idinmueble`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `inmuebles`
--
ALTER TABLE `inmuebles`
  ADD CONSTRAINT `inmuebles_ibfk_1` FOREIGN KEY (`idpropietario`) REFERENCES `propietario` (`idpropietario`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `pagos`
--
ALTER TABLE `pagos`
  ADD CONSTRAINT `pagos_ibfk_1` FOREIGN KEY (`idcontrato`) REFERENCES `contratos` (`idcontrato`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
