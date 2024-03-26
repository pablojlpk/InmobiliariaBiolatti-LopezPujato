-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 26-03-2024 a las 16:20:42
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
(15, 'Juan', 'Gonzalez', 54789123, 'rrgonzalez@gmail.com', '251', 0),
(16, 'Pedro', 'Albornoz', 12328741, 'dsdsdf@sddfad.com', '1233', 1),
(17, 'Marcelo Cesar', 'Lot', 11232131, '123123@1232-com', '1233', 1),
(18, 'Rolando René', 'Guiñazu', 1232131231, '123123@1232-com', '1233', 0),
(19, 'Ana', 'BIOLATTIs', 122163254, 'analuz@gmail.com', '1234', 0),
(20, 'ANA2', 'BIOLATTI', 123963254, 'analuz@gmail.com', '1234', 0),
(21, 'marcelo cesar', 'Lot', 1232131231, '123123@1232-com', '1233', 1),
(22, 'marcelo cesar', 'Lotufo', 1232131231, '123123@1232-com', '1233', 0),
(23, 'Lorena', 'Crizado', 12432980, 'crizadol@gmail.com', '12111qw', 0),
(24, '231', '452', 423, '432', '4234', 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `inquilino`
--
ALTER TABLE `inquilino`
  ADD PRIMARY KEY (`idinquilino`);

--
-- Indices de la tabla `propietario`
--
ALTER TABLE `propietario`
  ADD PRIMARY KEY (`idpropietario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `inquilino`
--
ALTER TABLE `inquilino`
  MODIFY `idinquilino` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `propietario`
--
ALTER TABLE `propietario`
  MODIFY `idpropietario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
