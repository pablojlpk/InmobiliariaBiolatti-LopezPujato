-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 03-04-2024 a las 14:29:43
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
-- Estructura de tabla para la tabla `contratos`
--

CREATE TABLE `contratos` (
  `idcontrato` int(11) NOT NULL,
  `idinmueble` int(11) NOT NULL,
  `idinquilino` int(11) NOT NULL,
  `fdesde` date NOT NULL,
  `fhasta` date NOT NULL,
  `importe` decimal(8,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
(3, 'balcarce', 833, 30, 5.00, 1.00, 1, '', 0),
(4, 'BALCARCE', 833, 30, 5.00, 1.00, 12, '', 0),
(5, 'MONTEVIDEO', 200, 2, 0.00, 2.00, 11, '', 0),
(6, 'IRIONDO 98', 2, 150, 0.00, 4422.00, 1, '', 0),
(7, 'BUENOS AIRES 833', 2, 2, 0.00, 4422.00, 12, '', 0),
(8, 'BUENOS AIRES 833', 3, 3, 0.00, 21.00, 1, '', 0),
(9, 'MONTEVIDEO', 12, 2, 0.00, 2.00, 26, '', 0),
(10, 'SAN MARTIN 232', 1, 122, 0.00, 2333.00, 1, '', 0);

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
(1, 'pablo javier', 'lopez pujato', 'pp@pp.com', '123', 12321121, 0),
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
(13, 'Juan', 'Gomez', 'gggomez@pp.com', '', 21321123, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pagos`
--

CREATE TABLE `pagos` (
  `idpago` int(11) NOT NULL,
  `idcontrato` int(11) NOT NULL,
  `fpago` date NOT NULL,
  `importe` decimal(7,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
(1, 'Pablo Javier', 'Lopez Pujato', 11121121, 'pablojlpk@pablol.com', '2134', 0),
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
(23, 'LORENA', 'Crizado', 12432980, 'crizadol@gmail.com', '12111qw', 0),
(24, '231', '452', 423, '432', '4234', 1),
(25, 'upper(ww)', 'ww', 12, '122q', '12', 1),
(26, 'LP', 'ines', 12, 'pp@pp.com', '112', 0),
(27, 'Q', 'Q', 1, '1', '', 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `contratos`
--
ALTER TABLE `contratos`
  ADD PRIMARY KEY (`idcontrato`);

--
-- Indices de la tabla `inmuebles`
--
ALTER TABLE `inmuebles`
  ADD PRIMARY KEY (`idinmueble`);

--
-- Indices de la tabla `inquilino`
--
ALTER TABLE `inquilino`
  ADD PRIMARY KEY (`idinquilino`);

--
-- Indices de la tabla `pagos`
--
ALTER TABLE `pagos`
  ADD PRIMARY KEY (`idpago`);

--
-- Indices de la tabla `propietario`
--
ALTER TABLE `propietario`
  ADD PRIMARY KEY (`idpropietario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `contratos`
--
ALTER TABLE `contratos`
  MODIFY `idcontrato` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `inmuebles`
--
ALTER TABLE `inmuebles`
  MODIFY `idinmueble` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `inquilino`
--
ALTER TABLE `inquilino`
  MODIFY `idinquilino` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de la tabla `pagos`
--
ALTER TABLE `pagos`
  MODIFY `idpago` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `propietario`
--
ALTER TABLE `propietario`
  MODIFY `idpropietario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
