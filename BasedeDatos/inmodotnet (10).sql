-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 23-04-2024 a las 05:55:31
-- Versión del servidor: 10.4.25-MariaDB
-- Versión de PHP: 8.1.10

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `auditorias`
--

INSERT INTO `auditorias` (`IdAuditoria`, `IdUsuario`, `Fecha`, `Observaciones`) VALUES
(247, 39, '2024-04-22 23:58:58', 'Usuario:Torres, Miguel-(39)-Acción: ACCESO CORRECTO Modulo: LOGIN'),
(248, 39, '2024-04-23 00:03:38', 'Usuario:Torres, Miguel-(39)-Acción: Alta Modulo: Inquilinos'),
(249, 39, '2024-04-23 00:04:42', 'Usuario:Torres, Miguel-(39)-Acción: Alta Modulo: Inquilinos'),
(250, 39, '2024-04-23 00:04:58', 'Usuario:Torres, Miguel-(39)-Acción: Editar Modulo: Inquilinos'),
(251, 39, '2024-04-23 00:05:06', 'Usuario:Torres, Miguel-(39)-Acción: Editar Modulo: Inquilinos'),
(252, 39, '2024-04-23 00:06:10', 'Usuario:Torres, Miguel-(39)-Acción: Alta Modulo: Inquilinos'),
(253, 39, '2024-04-23 00:07:03', 'Usuario:Torres, Miguel-(39)-Acción: Alta Modulo: Inquilinos'),
(254, 39, '2024-04-23 00:07:53', 'Usuario:Torres, Miguel-(39)-Acción: Alta Modulo: Inquilinos'),
(255, 39, '2024-04-23 00:08:42', 'Usuario:Torres, Miguel-(39)-Acción: Alta Modulo: Inquilinos'),
(256, 39, '2024-04-23 00:09:22', 'Usuario:Torres, Miguel-(39)-Acción: Alta Modulo: Inquilinos'),
(257, 39, '2024-04-23 00:09:54', 'Usuario:Torres, Miguel-(39)-Acción: Alta Modulo: Inquilinos'),
(258, 39, '2024-04-23 00:10:29', 'Usuario:Torres, Miguel-(39)-Acción: Alta Modulo: Inquilinos'),
(259, 39, '2024-04-23 00:11:15', 'Usuario:Torres, Miguel-(39)-Acción: Alta Modulo: Inquilinos'),
(260, 39, '2024-04-23 00:11:59', 'Usuario:Torres, Miguel-(39)-Acción: Alta Modulo: Propietarios'),
(261, 39, '2024-04-23 00:12:35', 'Usuario:Torres, Miguel-(39)-Acción: Alta Modulo: Propietarios'),
(262, 39, '2024-04-23 00:14:30', 'Usuario:Torres, Miguel-(39)-Acción: Alta Modulo: Propietarios'),
(263, 39, '2024-04-23 00:15:04', 'Usuario:Torres, Miguel-(39)-Acción: Alta Modulo: Propietarios'),
(264, 39, '2024-04-23 00:15:13', 'Usuario:Torres, Miguel-(39)-Acción: Editar Modulo: Propietarios'),
(265, 39, '2024-04-23 00:15:25', 'Usuario:Torres, Miguel-(39)-Acción: Modificar Modulo: Propietarios'),
(266, 39, '2024-04-23 00:16:03', 'Usuario:Torres, Miguel-(39)-Acción: Alta Modulo: Propietarios'),
(267, 39, '2024-04-23 00:17:02', 'Usuario:Torres, Miguel-(39)-Acción: Alta Modulo: Propietarios'),
(268, 39, '2024-04-23 00:17:50', 'Usuario:Torres, Miguel-(39)-Acción: Alta Modulo: Propietarios'),
(269, 39, '2024-04-23 00:18:19', 'Usuario:Torres, Miguel-(39)-Acción: Alta Modulo: Propietarios'),
(270, 39, '2024-04-23 00:18:58', 'Usuario:Torres, Miguel-(39)-Acción: Alta Modulo: Propietarios'),
(271, 39, '2024-04-23 00:19:46', 'Usuario:Torres, Miguel-(39)-Acción: Alta Modulo: Propietarios'),
(272, 39, '2024-04-23 00:24:59', 'Usuario:Torres, Miguel-(39)-Acción: Modificar Modulo: Inmuebles'),
(273, 39, '2024-04-23 00:25:59', 'Usuario:Torres, Miguel-(39)-Acción: Modificar Modulo: Inmuebles'),
(274, 39, '2024-04-23 00:27:04', 'Usuario:Torres, Miguel-(39)-Acción: Modificar Modulo: Inmuebles'),
(275, 39, '2024-04-23 00:27:22', 'Usuario:Torres, Miguel-(39)-Acción: Editar Modulo: Inmuebles'),
(276, 39, '2024-04-23 00:28:24', 'Usuario:Torres, Miguel-(39)-Acción: Modificar Modulo: Inmuebles'),
(277, 39, '2024-04-23 00:29:57', 'Usuario:Torres, Miguel-(39)-Acción: Modificar Modulo: Inmuebles'),
(278, 39, '2024-04-23 00:31:07', 'Usuario:Torres, Miguel-(39)-Acción: Modificar Modulo: Inmuebles'),
(279, 39, '2024-04-23 00:32:05', 'Usuario:Torres, Miguel-(39)-Acción: Modificar Modulo: Inmuebles'),
(280, 39, '2024-04-23 00:33:30', 'Usuario:Torres, Miguel-(39)-Acción: Modificar Modulo: Inmuebles'),
(281, 39, '2024-04-23 00:34:26', 'Usuario:Torres, Miguel-(39)-Acción: Modificar Modulo: Inmuebles'),
(282, 39, '2024-04-23 00:35:13', 'Usuario:Torres, Miguel-(39)-Acción: Modificar Modulo: Inmuebles'),
(283, 39, '2024-04-23 00:35:55', 'Usuario:Torres, Miguel-(39)-Acción: Modificar Modulo: Inmuebles'),
(284, 39, '2024-04-23 00:36:39', 'Usuario:Torres, Miguel-(39)-Acción: Modificar Modulo: Inmuebles'),
(285, 39, '2024-04-23 00:37:24', 'Usuario:Torres, Miguel-(39)-Acción: Alta Modulo: Contrato'),
(286, 39, '2024-04-23 00:38:18', 'Usuario:Torres, Miguel-(39)-Acción: Alta Modulo: Contrato'),
(287, 39, '2024-04-23 00:38:58', 'Usuario:Torres, Miguel-(39)-Acción: Alta Modulo: Contrato'),
(288, 39, '2024-04-23 00:39:03', 'Usuario:Torres, Miguel-(39)-Acción: Baja Modulo: Contrato'),
(289, 39, '2024-04-23 00:39:36', 'Usuario:Torres, Miguel-(39)-Acción: Alta Modulo: Contrato'),
(290, 39, '2024-04-23 00:40:06', 'Usuario:Torres, Miguel-(39)-Acción: Alta Modulo: Contrato'),
(291, 39, '2024-04-23 00:40:35', 'Usuario:Torres, Miguel-(39)-Acción: Alta Modulo: Contrato'),
(292, 39, '2024-04-23 00:41:14', 'Usuario:Torres, Miguel-(39)-Acción: Alta Modulo: Contrato'),
(293, 39, '2024-04-23 00:41:48', 'Usuario:Torres, Miguel-(39)-Acción: Alta Modulo: Contrato'),
(294, 39, '2024-04-23 00:42:19', 'Usuario:Torres, Miguel-(39)-Acción: Alta Modulo: Contrato'),
(295, 39, '2024-04-23 00:42:45', 'Usuario:Torres, Miguel-(39)-Acción: Alta Modulo: Contrato'),
(296, 39, '2024-04-23 00:43:10', 'Usuario:Torres, Miguel-(39)-Acción: Alta Modulo: Contrato'),
(297, 39, '2024-04-23 00:43:38', 'Usuario:Torres, Miguel-(39)-Acción: Modificar Modulo: Contrato'),
(298, 39, '2024-04-23 00:44:14', 'Usuario:Torres, Miguel-(39)-Acción: Alta Modulo: Pagos'),
(299, 39, '2024-04-23 00:44:33', 'Usuario:Torres, Miguel-(39)-Acción: Alta Modulo: Pagos'),
(300, 39, '2024-04-23 00:44:52', 'Usuario:Torres, Miguel-(39)-Acción: Alta Modulo: Pagos'),
(301, 39, '2024-04-23 00:46:08', 'Usuario:Torres, Miguel-(39)-Acción: Alta Modulo: Pagos'),
(302, 39, '2024-04-23 00:47:02', 'Usuario:Torres, Miguel-(39)-Acción: Alta Modulo: Pagos'),
(303, 39, '2024-04-23 00:47:44', 'Usuario:Torres, Miguel-(39)-Acción: Alta Modulo: Pagos'),
(304, 39, '2024-04-23 00:48:23', 'Usuario:Torres, Miguel-(39)-Acción: Alta Modulo: Pagos'),
(305, 39, '2024-04-23 00:48:55', 'Usuario:Torres, Miguel-(39)-Acción: Alta Modulo: Pagos'),
(306, 39, '2024-04-23 00:49:20', 'Usuario:Torres, Miguel-(39)-Acción: Alta Modulo: Pagos'),
(307, 39, '2024-04-23 00:50:40', 'Usuario:Torres, Miguel-(39)-Acción: Alta Modulo: usuarios'),
(308, 39, '2024-04-23 00:51:25', 'Usuario:Torres, Miguel-(39)-Acción: Alta Modulo: usuarios'),
(309, 39, '2024-04-23 00:51:31', 'Usuario:Torres, Miguel-(39)-Acción: Alta Modulo: usuarios'),
(310, 39, '2024-04-23 00:52:04', 'Usuario:Torres, Miguel-(39)-Acción: Alta Modulo: usuarios'),
(311, 39, '2024-04-23 00:52:11', 'Usuario:Torres, Miguel-(39)-Acción: Alta Modulo: usuarios'),
(312, 39, '2024-04-23 00:52:46', 'Usuario:Torres, Miguel-(39)-Acción: Alta Modulo: usuarios'),
(313, 39, '2024-04-23 00:53:01', 'Usuario:Torres, Miguel-(39)-Acción: Alta Modulo: usuarios'),
(314, 39, '2024-04-23 00:53:37', 'Usuario:Torres, Miguel-(39)-Acción: Alta Modulo: usuarios'),
(315, 39, '2024-04-23 00:53:54', 'Usuario:Torres, Miguel-(39)-Acción: cierre Sesión Modulo: usuarios'),
(316, 43, '2024-04-23 00:54:10', 'Usuario:Rios, Javier-(43)-Acción: ACCESO CORRECTO Modulo: LOGIN'),
(317, 43, '2024-04-23 00:54:30', 'Usuario:Rios, Javier-(43)-Acción: cierre Sesión Modulo: usuarios'),
(318, 41, '2024-04-23 00:54:56', 'Usuario:Biolatti, Ana luz-(41)-Acción: ACCESO CORRECTO Modulo: LOGIN'),
(319, 41, '2024-04-23 00:55:16', 'Usuario:Biolatti, Ana luz-(41)-Acción: cierre Sesión Modulo: usuarios');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `contratos`
--

INSERT INTO `contratos` (`idcontrato`, `idinmueble`, `idinquilino`, `fdesde`, `fhasta`, `importe`, `borrado`) VALUES
(19, 16, 18, '2024-05-01', '2024-08-01', '80000.00', 0),
(20, 15, 19, '2024-04-23', '2024-11-23', '120000.00', 0),
(21, 16, 21, '2024-05-01', '2024-05-30', '999999.99', 1),
(22, 17, 20, '2024-05-01', '2025-06-01', '350000.00', 0),
(23, 18, 21, '2024-05-01', '2024-12-01', '130000.00', 0),
(24, 19, 22, '2024-04-29', '2024-08-29', '40000.00', 0),
(25, 20, 24, '2024-05-01', '2024-06-01', '300000.00', 0),
(26, 22, 23, '2024-05-01', '2024-09-01', '90000.00', 0),
(27, 23, 26, '2024-04-23', '2024-06-23', '375000.00', 0),
(28, 25, 25, '2024-05-07', '2024-06-07', '56000.00', 0),
(29, 24, 27, '2024-05-01', '2024-08-01', '120000.00', 0);

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
  `estado` varchar(15) NOT NULL,
  `borrado` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `inmuebles`
--

INSERT INTO `inmuebles` (`idinmueble`, `direccion`, `ambientes`, `superficie`, `latitud`, `longitud`, `idpropietario`, `tipoinmueble`, `nompropietario`, `estado`, `borrado`) VALUES
(15, 'Av. Libertad 123', 3, 150, '-99999.99', '-99999.99', 33, 'Casa', '', 'Alquilado', 0),
(16, 'San Martin 456', 2, 80, '-99999.99', '-99999.99', 34, 'Departamento', '', 'Alquilado', 0),
(17, 'Belgrano 789', 4, 200, '-99999.99', '-99999.99', 35, 'Casa', '', 'Alquilado', 0),
(18, 'Corrientes 1010', 1, 50, '-99999.99', '-99999.99', 38, 'Local', '', 'Alquilado', 0),
(19, 'General Paz 100', 1, 40, '-99999.99', '-99999.99', 36, 'Depósito', '', 'Alquilado', 0),
(20, 'Junin 6060', 1, 300, '-99999.99', '-99999.99', 39, 'Depósito', '', 'Alquilado', 0),
(21, 'Entre rios 7070', 0, 500, '-99999.99', '-99999.99', 37, 'Terreno', '', 'Disponible', 0),
(22, 'La Rioja 300', 2, 75, '-99999.99', '-99999.99', 40, 'Departamento', '', 'Alquilado', 0),
(23, 'Uruguay 1313', 4, 180, '-99999.99', '-99999.99', 31, 'Casa', '', 'Alquilado', 0),
(24, 'Av. Callao 909', 1, 80, '-99999.99', '-99999.99', 32, 'Local', '', 'Alquilado', 0),
(25, 'Heras 131', 1, 45, '-99999.99', '-99999.99', 33, 'Departamento', '', 'Alquilado', 0),
(26, 'Av. Cordoba 909', 2, 85, '-99999.99', '-99999.99', 39, 'Departamento', '', 'Disponible', 0);

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
  `importe` decimal(7,2) NOT NULL,
  `borrado` tinyint(1) NOT NULL,
  `anulado` tinyint(1) NOT NULL,
  `detalle` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `pagos`
--

INSERT INTO `pagos` (`idpago`, `idcontrato`, `fpago`, `importe`, `borrado`, `anulado`, `detalle`) VALUES
(54, 19, '2024-05-01', '80000.00', 0, 0, ''),
(55, 20, '2024-04-30', '99999.99', 0, 0, ''),
(56, 22, '2024-04-23', '99999.99', 0, 0, ''),
(57, 23, '2024-05-01', '99999.99', 0, 0, ''),
(58, 24, '2024-04-24', '40000.00', 0, 0, ''),
(59, 25, '2024-04-24', '99999.99', 0, 0, ''),
(60, 27, '2024-04-24', '99999.99', 0, 0, ''),
(61, 28, '2024-04-26', '56000.00', 0, 0, ''),
(62, 29, '2024-04-25', '12000.00', 0, 0, '');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
(40, 'FRANCISCO', 'ESCOBAR', 25789098, 'franciscoescobar@gmail.com', '123', 0);

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`IdUsuario`, `Nombre`, `Apellido`, `Email`, `Clave`, `Borrado`, `Permiso`, `AvatarUrl`) VALUES
(39, 'Miguel', 'Torres', 'migueltorres@gmail.com', 'k3ydslbaTcDJEL1NRHX+0Nh2UWI52IXsIB+W2d6k9Jc=', 0, 1, '/update\\avatar_39.png'),
(40, 'Pablo ', 'lopez pujato', 'lopezpujatopablo@gmail.com', 'k3ydslbaTcDJEL1NRHX+0Nh2UWI52IXsIB+W2d6k9Jc=', 0, 1, '/update\\avatar_40.jpg'),
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
  MODIFY `IdAuditoria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=320;

--
-- AUTO_INCREMENT de la tabla `contratos`
--
ALTER TABLE `contratos`
  MODIFY `idcontrato` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT de la tabla `inmuebles`
--
ALTER TABLE `inmuebles`
  MODIFY `idinmueble` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT de la tabla `inquilino`
--
ALTER TABLE `inquilino`
  MODIFY `idinquilino` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT de la tabla `pagos`
--
ALTER TABLE `pagos`
  MODIFY `idpago` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;

--
-- AUTO_INCREMENT de la tabla `propietario`
--
ALTER TABLE `propietario`
  MODIFY `idpropietario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

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
