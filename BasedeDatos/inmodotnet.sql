-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 18-04-2024 a las 17:27:24
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
(110, 26, '2024-04-18 11:10:51', 'Usuario:lopez pujato, pablo-(26)-Acción: ACCESO CORRECTO Modulo: LOGIN'),
(111, 26, '2024-04-18 11:10:55', 'Usuario:lopez pujato, pablo-(26)-Acción: Editar Modulo: Propietarios'),
(112, 26, '2024-04-18 11:10:56', 'Usuario:lopez pujato, pablo-(26)-Acción: Modificar Modulo: Propietarios'),
(113, 26, '2024-04-18 11:11:08', 'Usuario:lopez pujato, pablo-(26)-Acción: Baja Modulo: Propietarios'),
(114, 26, '2024-04-18 11:11:22', 'Usuario:lopez pujato, pablo-(26)-Acción: Editar Modulo: Inquilinos'),
(115, 26, '2024-04-18 11:11:32', 'Usuario:lopez pujato, pablo-(26)-Acción: Baja Modulo: Inmuebles'),
(116, 26, '2024-04-18 11:11:54', 'Usuario:lopez pujato, pablo-(26)-Acción: Alta Modulo: Contrato'),
(117, 26, '2024-04-18 11:12:13', 'Usuario:lopez pujato, pablo-(26)-Acción: Alta Modulo: Pagos'),
(118, 26, '2024-04-18 11:12:29', 'Usuario:lopez pujato, pablo-(26)-Acción: MULTA Modulo: Pagos'),
(119, 26, '2024-04-18 11:13:08', 'Usuario:lopez pujato, pablo-(26)-Acción: Modificar Modulo: Pagos'),
(120, 26, '2024-04-18 11:13:28', 'Usuario:lopez pujato, pablo-(26)-Acción: Editar Modulo: Inquilinos'),
(121, 26, '2024-04-18 11:13:40', 'Usuario:lopez pujato, pablo-(26)-Acción: cierre Sesión Modulo: usuarios'),
(122, 26, '2024-04-18 12:12:27', 'Usuario:lopez pujato, pablo-(26)-Acción: ACCESO CORRECTO Modulo: LOGIN'),
(123, 26, '2024-04-18 12:22:10', 'Usuario:lopez pujato, pablo-(26)-Acción: Editar Modulo: usuarios'),
(124, 26, '2024-04-18 12:22:35', 'Usuario:lopez pujato, pablo-(26)-Acción: cierre Sesión Modulo: usuarios'),
(125, 29, '2024-04-18 12:22:44', 'Usuario:Lopez Pujato, Pablo perfil Emplreado pr-(29)-Acción: ACCESO CORRECTO Modulo: LOGIN'),
(126, 29, '2024-04-18 12:23:05', 'Usuario:Lopez Pujato, Pablo perfil Emplreado pr-(29)-Acción: cierre Sesión Modulo: usuarios');

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
(1, 4, 12, '2021-03-12', '2024-04-12', 250.33, 0),
(2, 10, 5, '2021-03-12', '2021-12-12', 25033.00, 1),
(3, 9, 1, '0000-00-00', '0000-00-00', 2541.00, 1),
(4, 1, 12, '2024-04-04', '2024-04-03', 221.00, 1),
(5, 1, 12, '0000-00-00', '0000-00-00', 2.00, 1),
(6, 3, 12, '0000-00-00', '0000-00-00', 2.00, 1),
(7, 3, 12, '0000-00-00', '0000-00-00', 2.00, 1),
(8, 3, 8, '2024-01-01', '2024-12-31', 235.00, 0),
(9, 2, 1, '2024-01-01', '2024-12-31', 12.00, 0),
(10, 1, 12, '2024-04-01', '2024-05-09', 25.00, 0),
(11, 9, 13, '2024-04-09', '2024-04-30', 2541.00, 0),
(12, 6, 9, '2024-04-15', '2025-05-30', 250000.00, 0),
(13, 7, 12, '2024-04-10', '2024-09-12', 25422.00, 0),
(14, 11, 11, '2024-04-19', '2024-06-20', 55000.00, 0),
(15, 10, 8, '2024-04-25', '2024-05-30', 22.00, 0),
(16, 6, 12, '2024-05-01', '2024-08-18', 211111.00, 0);

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
  `nompropietario` varchar(100) NOT NULL,
  `borrado` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `inmuebles`
--

INSERT INTO `inmuebles` (`idinmueble`, `direccion`, `ambientes`, `superficie`, `latitud`, `longitud`, `idpropietario`, `nompropietario`, `borrado`) VALUES
(1, 'virgen del carmen 10', 2, 200, 1.25, 1.25, 1, '', 0),
(2, 'Rivadavia 538', 2, 200, 2.74, 0.00, 6, '', 0),
(3, 'balcarce', 833, 30, 5.00, 1.00, 1, '', 1),
(4, 'BALCARCE', 833, 30, 5.00, 1.00, 12, '', 0),
(5, 'MONTEVIDEO', 200, 2, 1.50, 2.00, 20, '', 0),
(6, 'IRIONDO 98', 2, 150, 2.22, 4422.00, 1, '', 0),
(7, 'Lafinur 2350', 2, 2, 0.00, 4422.00, 11, '', 0),
(8, 'BUENOS AIRES 833', 3, 3, 3.55, 21.00, 1, '', 0),
(9, 'MONTEVIDEO', 12, 2, 0.00, 2.00, 26, '', 0),
(10, 'SAN MARTIN 232', 1, 122, 0.00, 2333.00, 1, '', 0),
(11, 'montevideo 885', 12, 123, 0.00, 45.32, 1, '', 0),
(12, 'montevideo 1121', 123, 123, 22.33, 25.21, 1, '', 0),
(13, 'rivadavia 538', 2, 1000, 225.22, 35.33, 6, '', 0);

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
(1, 'PABLO JAVIER', 'LOPEZ PUJATO', 'pp@pp.com', '123', 12321121, 0),
(2, 'ana', 'biolcati', 'pp@pp.com', '12', 12, 1),
(3, 'ana', 'biolcati', 'pp@pp.com', '23123', 1231, 1),
(4, 'Bruno', 'Gentiletti', 'bbg@gmail.com.ar', '111', 12456789, 1),
(5, 'ana', 'Biolati', 'pp@pp.com', '', 3123132, 0),
(6, 'lopez', 'pujato', 'pp@pp.com', '213123', 12312123, 1),
(7, 'ana', 'biolcati', 'pp@pp.com', '122qdd', 2312, 1),
(8, 'ROBERTO ', 'GUIÑAZU MOLIN', 'rrmolina@gmail.com', 'QQ', 12312312, 0),
(9, 'PEDRO', 'MOLINA CANDIOTI', 'pp@pp.com', '1', 12332111, 0),
(10, '1', '1', '1', '1', 1, 1),
(11, 'Matias2', 'Torres', 'mtorres@yahoo.com', '12', 12321112, 0),
(12, 'Jacinta', 'Alvarez', 'jjalvarez@gmail.com', '', 12321221, 0),
(13, 'Juan', 'Gomez', 'gggomez@pp.com', '', 21321123, 0),
(14, 'ROBERTO', 'SPOSITO', 'rr@gmail.com', '123', 43212342, 0),
(15, 'gomez', 'juan', '123@pp.com', '11', 234, 1),
(16, 'Juan', 'Gomez', 'pp@pp.com', '123', 99123432, 0);

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `pagos`
--

INSERT INTO `pagos` (`idpago`, `idcontrato`, `fpago`, `importe`, `borrado`, `anulado`, `detalle`) VALUES
(1, 8, '2020-10-10', 25000.33, 0, 0, '0'),
(2, 1, '1916-10-19', 15110.33, 0, 0, '0'),
(3, 2, '2024-12-31', 5000.33, 0, 0, '0'),
(13, 13, '2024-04-09', 1919.00, 0, 0, '0'),
(14, 12, '2024-04-11', 99999.99, 0, 0, 'Multa'),
(15, 1, '2024-04-11', 15000.00, 0, 0, ''),
(16, 1, '2024-04-18', 25.33, 0, 0, ''),
(17, 1, '2024-04-25', 254.22, 0, 0, 'Multa'),
(18, 1, '2024-04-17', 25.33, 0, 0, ''),
(21, 1, '2024-04-18', 11111.00, 0, 0, ''),
(50, 11, '2024-05-02', 254.22, 0, 0, ''),
(51, 1, '2024-04-11', 254.22, 0, 0, 'Multa'),
(52, 1, '2024-04-25', 21111.00, 0, 0, ''),
(53, 1, '2024-04-18', 99999.99, 0, 0, 'Multa');

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
(1, 'PABLO JAVIER', 'LOPEZ PUJATO', 11121121, 'pablojlpk@pablol.com', '2134', 0),
(4, 'juan ', 'gomez', 12325874, 'pp@pp.com', '1233', 0),
(6, 'JUAN ANDRES', 'LUCERO', 1231231, 'lllucero@yahoo.com', '', 0),
(11, 'Ignacio', 'Torres', 12328741, 'dsdsdf@sddfad.com', '1233', 0),
(12, 'ANA', 'BIOLATTI', 123963254, 'analuz@gmail.com', '1234', 0),
(14, 'Juan', 'Gonzalez', 12456789, 'ggonzale@hotmail.com', '23456789', 0),
(15, 'Pedro', 'Gonzalez', 54789123, 'rrgonzalez@gmail.com', '251', 0),
(16, 'Pedro', 'Albornoz', 12328741, 'dsdsdf@sddfad.com', '1233', 1),
(17, 'Marcelo Cesar', 'Lot', 11232131, '123123@1232-com', '1233', 1),
(18, 'Rolando René', 'Guiñazu', 1232131231, '123123@1232-com', '1233', 0),
(19, 'Ana', 'BIOLATTIs', 122163254, 'analuz@gmail.com', '1234', 1),
(20, 'SILVIA', 'TORRES', 123963254, 'sstorres@gmail.com', '1234', 0),
(21, 'marcelo cesar', 'Lot', 1232131231, '123123@1232-com', '1233', 1),
(22, 'marcelo cesar', 'Lotufo', 1232131231, '123123@1232-com', '1233', 0),
(23, 'LORENA', 'Crizado', 12432980, 'crizadol@gmail.com', '12111qw1', 0),
(24, '231', '452', 423, '432', '4234', 1),
(25, 'upper(ww)', 'ww', 12, '122q', '12', 1),
(26, 'lopez', 'ines', 12, 'pp@pp.com', '112', 1),
(27, 'Q', 'Q', 1, '1', '', 1),
(28, 'LORENA', 'CRUZADO', 99999123, 'llcruzado@gmail.com', '123', 0);

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
(21, 'Ana Luz', 'Biolatti', 'analuzbiolatti@gmail.com', 'k3ydslbaTcDJEL1NRHX+0Nh2UWI52IXsIB+W2d6k9Jc=', 0, 1, '/update\\avatar_27.png'),
(22, 'Lopez', 'Pablo', 'usuariopablo@gmail.com', 'k3ydslbaTcDJEL1NRHX+0Nh2UWI52IXsIB+W2d6k9Jc=', 0, 1, '/update\\avatar_27.png'),
(23, 'Juan', 'Perez', 'juanperez@gmail.com', 'k3ydslbaTcDJEL1NRHX+0Nh2UWI52IXsIB+W2d6k9Jc=', 0, 2, '/update\\avatar_34.jpg'),
(24, 'Manuel', 'Torres', 'manu@gmail.com', 'k3ydslbaTcDJEL1NRHX+0Nh2UWI52IXsIB+W2d6k9Jc=\n', 0, 2, '/update\\avatar_33.png'),
(25, 'Lulu', 'Lopez', 'lulu@gmail.com', 'k3ydslbaTcDJEL1NRHX+0Nh2UWI52IXsIB+W2d6k9Jc=', 0, 2, '/update\\avatar_27.png'),
(26, 'Pablo', 'Lopez Pujato', 'pp@pp.com', 'k3ydslbaTcDJEL1NRHX+0Nh2UWI52IXsIB+W2d6k9Jc=', 0, 1, NULL),
(27, 'Lulu', 'Gutierrez', 'lulu@gmail.com', 'k3ydslbaTcDJEL1NRHX+0Nh2UWI52IXsIB+W2d6k9Jc=\n', 0, 2, '/update\\avatar_32.png'),
(28, 'Facundo', 'Lopez Pujato', 'facu@gmail.cm', 'k3ydslbaTcDJEL1NRHX+0Nh2UWI52IXsIB+W2d6k9Jc=', 0, 0, NULL),
(29, 'Pablo perfil Emplreado pr', 'Lopez Pujato', 'ppp@pp.com', 'k3ydslbaTcDJEL1NRHX+0Nh2UWI52IXsIB+W2d6k9Jc=', 0, 2, NULL),
(30, 'GOMEZ', 'JUAN', 'jj@gmail.com', 'k3ydslbaTcDJEL1NRHX+0Nh2UWI52IXsIB+W2d6k9Jc=', 0, 1, '/update\\avatar_30.jpg'),
(31, 'Facundo', 'Lopez Pujato', 'facu@gmail.com', 'k3ydslbaTcDJEL1NRHX+0Nh2UWI52IXsIB+W2d6k9Jc=', 0, 1, '/update\\avatar_32.png'),
(32, 'Esteban', 'Quito', 'pp@correo.com', 'k3ydslbaTcDJEL1NRHX+0Nh2UWI52IXsIB+W2d6k9Jc=', 0, 1, '/update\\avatar_32.png'),
(33, 'Usuario', 'usuarioultimo', 'qq@qq.com', 'k3ydslbaTcDJEL1NRHX+0Nh2UWI52IXsIB+W2d6k9Jc=', 0, 1, '/update\\avatar_33.png'),
(34, 'Edurdo', 'Rosso', 'eduardoroso@lacosta.com', 'pcHk3H69xHDoCvdWoCjwf1h2QhmcXOst+pZwT/TEYLo=', 0, 1, NULL);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `auditorias`
--
ALTER TABLE `auditorias`
  ADD PRIMARY KEY (`IdAuditoria`);

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
  MODIFY `IdAuditoria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=127;

--
-- AUTO_INCREMENT de la tabla `contratos`
--
ALTER TABLE `contratos`
  MODIFY `idcontrato` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT de la tabla `inmuebles`
--
ALTER TABLE `inmuebles`
  MODIFY `idinmueble` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de la tabla `inquilino`
--
ALTER TABLE `inquilino`
  MODIFY `idinquilino` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT de la tabla `pagos`
--
ALTER TABLE `pagos`
  MODIFY `idpago` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;

--
-- AUTO_INCREMENT de la tabla `propietario`
--
ALTER TABLE `propietario`
  MODIFY `idpropietario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `IdUsuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- Restricciones para tablas volcadas
--

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
