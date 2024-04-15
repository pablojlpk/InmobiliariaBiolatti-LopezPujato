-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 15-04-2024 a las 07:33:21
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
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `IdUsuario` int(11) NOT NULL,
  `Nombre` varchar(25) NOT NULL,
  `Apellido` varchar(25) NOT NULL,
  `Email` varchar(50) NOT NULL,
  `Clave` varchar(30) NOT NULL,
  `Borrado` tinyint(1) NOT NULL,
  `Permiso` int(2) NOT NULL,
  `AvatarUrl` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`IdUsuario`, `Nombre`, `Apellido`, `Email`, `Clave`, `Borrado`, `Permiso`, `AvatarUrl`) VALUES
(21, 'ana luz', 'biolatti', 'analuzbiolatti@gmail.com', 'k3ydslbaTcDJEL1NRHX+0Nh2UWI52I', 0, 1, NULL),
(22, 'lopez', 'pablo', 'usuariopablo@gmail.com', 'k3ydslbaTcDJEL1NRHX+0Nh2UWI52I', 0, 1, NULL),
(23, 'juan', 'perez', 'juanperez@gmail.com', 'k3ydslbaTcDJEL1NRHX+0Nh2UWI52I', 0, 2, NULL),
(24, 'manuel', 'torres', 'manu@gmail.com', 'k3ydslbaTcDJEL1NRHX+0Nh2UWI52I', 0, 2, NULL),
(25, 'lulu', 'lopez', 'lulu@gmail.com', 'k3ydslbaTcDJEL1NRHX+0Nh2UWI52I', 0, 2, NULL),
(26, 'pablo', 'lopez pujato', 'pablito@gmail.com', 'k3ydslbaTcDJEL1NRHX+0Nh2UWI52I', 0, 2, NULL),
(27, 'lulu', 'lulu', 'lulu@gmail.com', 'k3ydslbaTcDJEL1NRHX+0Nh2UWI52I', 0, 2, NULL);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`IdUsuario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `IdUsuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
