-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 22-04-2024 a las 15:54:15
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
(126, 29, '2024-04-18 12:23:05', 'Usuario:Lopez Pujato, Pablo perfil Emplreado pr-(29)-Acción: cierre Sesión Modulo: usuarios'),
(127, 26, '2024-04-19 08:39:21', 'Usuario:Lopez Pujato, Pablo-(26)-Acción: ACCESO CORRECTO Modulo: LOGIN'),
(128, 26, '2024-04-19 08:41:38', 'Usuario:Lopez Pujato, Pablo-(26)-Acción: Editar Modulo: usuarios'),
(129, 26, '2024-04-19 08:42:11', 'Usuario:Lopez Pujato, Pablo-(26)-Acción: cierre Sesión Modulo: usuarios'),
(130, 29, '2024-04-19 08:42:51', 'Usuario:Lopez Pujato, Pablo perfil Emplreado pr-(29)-Acción: ACCESO CORRECTO Modulo: LOGIN'),
(131, 29, '2024-04-19 08:42:59', 'Usuario:Lopez Pujato, Pablo perfil Emplreado pr-(29)-Acción: Editar Modulo: Propietarios'),
(132, 29, '2024-04-19 08:43:05', 'Usuario:Lopez Pujato, Pablo perfil Emplreado pr-(29)-Acción: cierre Sesión Modulo: usuarios'),
(133, 26, '2024-04-19 08:43:13', 'Usuario:Lopez Pujato, Pablo-(26)-Acción: ACCESO CORRECTO Modulo: LOGIN'),
(134, 26, '2024-04-19 09:41:42', 'Usuario:Lopez Pujato, Pablo-(26)-Acción: cierre Sesión Modulo: usuarios'),
(135, 26, '2024-04-19 09:41:50', 'Usuario:Lopez Pujato, Pablo-(26)-Acción: ACCESO CORRECTO Modulo: LOGIN'),
(136, 26, '2024-04-19 09:53:13', 'Usuario:Lopez Pujato, Pablo-(26)-Acción: ACCESO CORRECTO Modulo: LOGIN'),
(137, 26, '2024-04-19 10:02:25', 'Usuario:Lopez Pujato, Pablo-(26)-Acción: ACCESO CORRECTO Modulo: LOGIN'),
(138, 26, '2024-04-19 10:04:01', 'Usuario:Lopez Pujato, Pablo-(26)-Acción: ACCESO CORRECTO Modulo: LOGIN'),
(139, 26, '2024-04-19 10:12:00', 'Usuario:Lopez Pujato, Pablo-(26)-Acción: ACCESO CORRECTO Modulo: LOGIN'),
(140, 26, '2024-04-19 10:12:08', 'Usuario:Lopez Pujato, Pablo-(26)-Acción: cierre Sesión Modulo: usuarios'),
(141, 26, '2024-04-19 10:12:17', 'Usuario:Lopez Pujato, Pablo-(26)-Acción: ACCESO CORRECTO Modulo: LOGIN'),
(142, 26, '2024-04-19 10:12:28', 'Usuario:Lopez Pujato, Pablo-(26)-Acción: Editar Modulo: Inmuebles'),
(143, 26, '2024-04-19 10:31:17', 'Usuario:Lopez Pujato, Pablo-(26)-Acción: cierre Sesión Modulo: usuarios'),
(144, 26, '2024-04-19 10:31:37', 'Usuario:Lopez Pujato, Pablo-(26)-Acción: ACCESO CORRECTO Modulo: LOGIN'),
(145, 26, '2024-04-19 10:32:51', 'Usuario:Lopez Pujato, Pablo-(26)-Acción: Alta Modulo: Propietarios'),
(146, 26, '2024-04-19 10:33:01', 'Usuario:Lopez Pujato, Pablo-(26)-Acción: Editar Modulo: Propietarios'),
(147, 26, '2024-04-19 10:34:03', 'Usuario:Lopez Pujato, Pablo-(26)-Acción: Alta Modulo: Contrato'),
(148, 26, '2024-04-19 10:34:21', 'Usuario:Lopez Pujato, Pablo-(26)-Acción: Alta Modulo: Contrato'),
(149, 26, '2024-04-19 10:39:09', 'Usuario:Lopez Pujato, Pablo-(26)-Acción: cierre Sesión Modulo: usuarios'),
(150, 29, '2024-04-19 10:39:16', 'Usuario:Lopez Pujato, Pablo perfil Emplreado pr-(29)-Acción: ACCESO CORRECTO Modulo: LOGIN'),
(151, 29, '2024-04-19 10:39:57', 'Usuario:Lopez Pujato, Pablo perfil Emplreado pr-(29)-Acción: Editar Modulo: Propietarios'),
(152, 29, '2024-04-19 10:45:19', 'Usuario:Lopez Pujato, Pablo perfil Emplreado pr-(29)-Acción: cierre Sesión Modulo: usuarios'),
(153, 26, '2024-04-19 10:45:25', 'Usuario:Lopez Pujato, Pablo-(26)-Acción: ACCESO CORRECTO Modulo: LOGIN'),
(154, 26, '2024-04-19 10:45:32', 'Usuario:Lopez Pujato, Pablo-(26)-Acción: Alta Modulo: usuarios'),
(155, 26, '2024-04-19 10:45:53', 'Usuario:Lopez Pujato, Pablo-(26)-Acción: Alta Modulo: usuarios'),
(156, 26, '2024-04-19 10:45:58', 'Usuario:Lopez Pujato, Pablo-(26)-Acción: Alta Modulo: usuarios'),
(157, 26, '2024-04-19 10:46:16', 'Usuario:Lopez Pujato, Pablo-(26)-Acción: Alta Modulo: usuarios'),
(158, 26, '2024-04-19 10:46:16', 'Usuario:Lopez Pujato, Pablo-(26)-Acción: Alta Modulo: usuarios'),
(159, 26, '2024-04-19 10:46:23', 'Usuario:Lopez Pujato, Pablo-(26)-Acción: Editar Modulo: usuarios'),
(160, 26, '2024-04-19 10:46:30', 'Usuario:Lopez Pujato, Pablo-(26)-Acción: Editar Modulo: usuarios'),
(161, 26, '2024-04-19 10:46:41', 'Usuario:Lopez Pujato, Pablo-(26)-Acción: Editar Modulo: Inmuebles'),
(162, 26, '2024-04-19 10:46:48', 'Usuario:Lopez Pujato, Pablo-(26)-Acción: Editar Modulo: Inmuebles'),
(163, 26, '2024-04-19 10:46:55', 'Usuario:Lopez Pujato, Pablo-(26)-Acción: Editar Modulo: Inmuebles'),
(164, 26, '2024-04-19 10:47:04', 'Usuario:Lopez Pujato, Pablo-(26)-Acción: Editar Modulo: Inmuebles'),
(165, 26, '2024-04-19 10:47:13', 'Usuario:Lopez Pujato, Pablo-(26)-Acción: Editar Modulo: Inmuebles'),
(166, 26, '2024-04-19 10:47:17', 'Usuario:Lopez Pujato, Pablo-(26)-Acción: Editar Modulo: Inmuebles'),
(167, 26, '2024-04-19 10:47:27', 'Usuario:Lopez Pujato, Pablo-(26)-Acción: Editar Modulo: Inmuebles'),
(168, 26, '2024-04-19 10:47:34', 'Usuario:Lopez Pujato, Pablo-(26)-Acción: Editar Modulo: Inmuebles'),
(169, 26, '2024-04-19 10:54:43', 'Usuario:Lopez Pujato, Pablo-(26)-Acción: Editar Modulo: Inmuebles'),
(170, 26, '2024-04-19 10:54:49', 'Usuario:Lopez Pujato, Pablo-(26)-Acción: Editar Modulo: Inmuebles'),
(171, 26, '2024-04-19 10:54:53', 'Usuario:Lopez Pujato, Pablo-(26)-Acción: Editar Modulo: Inmuebles'),
(172, 26, '2024-04-19 11:18:42', 'Usuario:Lopez Pujato, Pablo-(26)-Acción: Modificar Modulo: Inmuebles'),
(173, 26, '2024-04-19 11:19:28', 'Usuario:Lopez Pujato, Pablo-(26)-Acción: Modificar Modulo: Inmuebles'),
(174, 26, '2024-04-19 11:20:59', 'Usuario:Lopez Pujato, Pablo-(26)-Acción: Modificar Modulo: Inmuebles'),
(175, 26, '2024-04-19 11:30:16', 'Usuario:Lopez Pujato, Pablo-(26)-Acción: Modificar Modulo: Inmuebles'),
(176, 26, '2024-04-19 11:30:43', 'Usuario:Lopez Pujato, Pablo-(26)-Acción: Modificar Modulo: Inmuebles'),
(177, 26, '2024-04-19 11:56:19', 'Usuario:Lopez Pujato, Pablo-(26)-Acción: Modificar Modulo: Inmuebles'),
(178, 26, '2024-04-19 12:10:20', 'Usuario:Lopez Pujato, Pablo-(26)-Acción: Alta Modulo: Propietarios'),
(179, 26, '2024-04-19 12:10:54', 'Usuario:Lopez Pujato, Pablo-(26)-Acción: Alta Modulo: Inquilinos'),
(180, 26, '2024-04-19 12:11:27', 'Usuario:Lopez Pujato, Pablo-(26)-Acción: Modificar Modulo: Inmuebles'),
(181, 26, '2024-04-19 12:14:22', 'Usuario:Lopez Pujato, Pablo-(26)-Acción: Modificar Modulo: Inmuebles'),
(182, 26, '2024-04-19 12:14:55', 'Usuario:Lopez Pujato, Pablo-(26)-Acción: Modificar Modulo: Inmuebles'),
(183, 26, '2024-04-19 12:15:08', 'Usuario:Lopez Pujato, Pablo-(26)-Acción: Modificar Modulo: Inmuebles'),
(184, 26, '2024-04-19 12:15:54', 'Usuario:Lopez Pujato, Pablo-(26)-Acción: Editar Modulo: Inmuebles'),
(185, 26, '2024-04-19 12:16:07', 'Usuario:Lopez Pujato, Pablo-(26)-Acción: Editar Modulo: Inmuebles'),
(186, 26, '2024-04-19 12:16:56', 'Usuario:Lopez Pujato, Pablo-(26)-Acción: Alta Modulo: Contrato'),
(187, 26, '2024-04-19 12:20:57', 'Usuario:Lopez Pujato, Pablo-(26)-Acción: ACCESO CORRECTO Modulo: LOGIN'),
(188, 26, '2024-04-19 12:24:24', 'Usuario:Lopez Pujato, Pablo-(26)-Acción: ACCESO CORRECTO Modulo: LOGIN'),
(189, 26, '2024-04-19 12:24:28', 'Usuario:Lopez Pujato, Pablo-(26)-Acción: ACCESO CORRECTO Modulo: LOGIN'),
(190, 26, '2024-04-19 12:55:31', 'Usuario:Lopez Pujato, Pablo-(26)-Acción: Alta Modulo: usuarios'),
(191, 26, '2024-04-19 12:56:13', 'Usuario:Lopez Pujato, Pablo-(26)-Acción: Alta Modulo: usuarios'),
(192, 26, '2024-04-19 12:56:33', 'Usuario:Lopez Pujato, Pablo-(26)-Acción: cierre Sesión Modulo: usuarios'),
(193, 26, '2024-04-20 11:59:31', 'Usuario:lopez pujato22, pablo-(26)-Acción: cierre Sesión Modulo: usuarios'),
(194, 26, '2024-04-20 11:59:48', 'Usuario:Lopez Pujato, Pablo-(26)-Acción: ACCESO CORRECTO Modulo: LOGIN'),
(195, 26, '2024-04-20 12:04:49', 'Usuario:Lopez Pujato, Pablo-(26)-Acción: cierre Sesión Modulo: usuarios'),
(196, 26, '2024-04-20 12:04:57', 'Usuario:Lopez Pujato, Pablo-(26)-Acción: ACCESO CORRECTO Modulo: LOGIN'),
(197, 26, '2024-04-20 12:31:02', 'Usuario:Lopez Pujato, Pablo-(26)-Acción: cierre Sesión Modulo: usuarios'),
(198, 26, '2024-04-20 12:32:41', 'Usuario:Lopez Pujato, Pablo-(26)-Acción: ACCESO CORRECTO Modulo: LOGIN'),
(199, 26, '2024-04-20 12:35:07', 'Usuario:Lopez Pujato, Pablo-(26)-Acción: ACCESO CORRECTO Modulo: LOGIN'),
(200, 26, '2024-04-20 12:37:59', 'Usuario:Lopez Pujato, Pablo-(26)-Acción: ACCESO CORRECTO Modulo: LOGIN'),
(201, 26, '2024-04-20 12:38:28', 'Usuario:Lopez Pujato, Pablo-(26)-Acción: Perfil Modulo: usuarios'),
(202, 26, '2024-04-20 12:40:27', 'Usuario:Lopez Pujato, Pablo-(26)-Acción: cierre Sesión Modulo: usuarios'),
(203, 26, '2024-04-20 12:40:33', 'Usuario:Lopez Pujato, Pablo-(26)-Acción: ACCESO CORRECTO Modulo: LOGIN'),
(204, 26, '2024-04-20 12:40:45', 'Usuario:Lopez Pujato, Pablo-(26)-Acción: Perfil Modulo: usuarios'),
(205, 26, '2024-04-20 12:52:11', 'Usuario:Lopez Pujato, Pablo-(26)-Acción: CambioPassword Modulo: usuarios'),
(206, 26, '2024-04-22 08:41:39', 'Usuario:Lopez Pujato, Pablo-(26)-Acción: ACCESO CORRECTO Modulo: LOGIN'),
(207, 26, '2024-04-22 08:58:42', 'Usuario:Lopez Pujato, Pablo-(26)-Acción: Editar Modulo: Inmuebles'),
(208, 26, '2024-04-22 09:00:18', 'Usuario:Lopez Pujato, Pablo-(26)-Acción: Baja Modulo: Inmuebles'),
(209, 26, '2024-04-22 09:01:07', 'Usuario:Lopez Pujato, Pablo-(26)-Acción: Modificar Modulo: Inmuebles'),
(210, 26, '2024-04-22 09:03:47', 'Usuario:Lopez Pujato, Pablo-(26)-Acción: Editar Modulo: Inmuebles'),
(211, 26, '2024-04-22 09:07:28', 'Usuario:Lopez Pujato, Pablo-(26)-Acción: Modificar Modulo: Inmuebles'),
(212, 26, '2024-04-22 09:08:28', 'Usuario:Lopez Pujato, Pablo-(26)-Acción: Modificar Modulo: Inmuebles'),
(213, 26, '2024-04-22 09:12:34', 'Usuario:Lopez Pujato, Pablo-(26)-Acción: Modificar Modulo: Inmuebles'),
(214, 26, '2024-04-22 09:13:47', 'Usuario:Lopez Pujato, Pablo-(26)-Acción: Modificar Modulo: Inmuebles'),
(215, 26, '2024-04-22 09:15:33', 'Usuario:Lopez Pujato, Pablo-(26)-Acción: Modificar Modulo: Inmuebles'),
(216, 26, '2024-04-22 09:15:36', 'Usuario:Lopez Pujato, Pablo-(26)-Acción: Modificar Modulo: Inmuebles'),
(217, 26, '2024-04-22 09:17:33', 'Usuario:Lopez Pujato, Pablo-(26)-Acción: Modificar Modulo: Inmuebles'),
(218, 26, '2024-04-22 09:33:40', 'Usuario:Lopez Pujato, Pablo-(26)-Acción: Modificar Modulo: Contrato'),
(219, 26, '2024-04-22 09:33:58', 'Usuario:Lopez Pujato, Pablo-(26)-Acción: Modificar Modulo: Contrato'),
(220, 26, '2024-04-22 09:34:16', 'Usuario:Lopez Pujato, Pablo-(26)-Acción: Modificar Modulo: Contrato'),
(221, 26, '2024-04-22 09:35:00', 'Usuario:Lopez Pujato, Pablo-(26)-Acción: Modificar Modulo: Contrato'),
(222, 26, '2024-04-22 09:35:44', 'Usuario:Lopez Pujato, Pablo-(26)-Acción: Modificar Modulo: Contrato'),
(223, 26, '2024-04-22 09:36:03', 'Usuario:Lopez Pujato, Pablo-(26)-Acción: Modificar Modulo: Contrato'),
(224, 26, '2024-04-22 09:38:18', 'Usuario:Lopez Pujato, Pablo-(26)-Acción: Modificar Modulo: Contrato'),
(225, 26, '2024-04-22 09:39:33', 'Usuario:Lopez Pujato, Pablo-(26)-Acción: Modificar Modulo: Contrato'),
(226, 26, '2024-04-22 09:45:53', 'Usuario:Lopez Pujato, Pablo-(26)-Acción: Modificar Modulo: Contrato'),
(227, 26, '2024-04-22 09:58:21', 'Usuario:Lopez Pujato, Pablo-(26)-Acción: Modificar Modulo: Contrato'),
(228, 26, '2024-04-22 10:13:10', 'Usuario:Lopez Pujato, Pablo-(26)-Acción: Editar Modulo: Inmuebles'),
(229, 26, '2024-04-22 10:14:18', 'Usuario:Lopez Pujato, Pablo-(26)-Acción: Editar Modulo: Inmuebles'),
(230, 26, '2024-04-22 10:16:03', 'Usuario:Lopez Pujato, Pablo-(26)-Acción: Modificar Modulo: Contrato'),
(231, 26, '2024-04-22 10:16:38', 'Usuario:Lopez Pujato, Pablo-(26)-Acción: Modificar Modulo: Contrato'),
(232, 26, '2024-04-22 10:17:01', 'Usuario:Lopez Pujato, Pablo-(26)-Acción: Modificar Modulo: Contrato'),
(233, 26, '2024-04-22 10:17:22', 'Usuario:Lopez Pujato, Pablo-(26)-Acción: Modificar Modulo: Contrato'),
(234, 26, '2024-04-22 10:17:22', 'Usuario:Lopez Pujato, Pablo-(26)-Acción: Modificar Modulo: Contrato'),
(235, 26, '2024-04-22 10:17:26', 'Usuario:Lopez Pujato, Pablo-(26)-Acción: Modificar Modulo: Contrato'),
(236, 26, '2024-04-22 10:18:08', 'Usuario:Lopez Pujato, Pablo-(26)-Acción: Modificar Modulo: Contrato'),
(237, 26, '2024-04-22 10:18:08', 'Usuario:Lopez Pujato, Pablo-(26)-Acción: Modificar Modulo: Contrato'),
(238, 26, '2024-04-22 10:20:43', 'Usuario:Lopez Pujato, Pablo-(26)-Acción: Modificar Modulo: Contrato'),
(239, 26, '2024-04-22 10:20:43', 'Usuario:Lopez Pujato, Pablo-(26)-Acción: Modificar Modulo: Contrato'),
(240, 26, '2024-04-22 10:21:43', 'Usuario:Lopez Pujato, Pablo-(26)-Acción: Modificar Modulo: Contrato'),
(241, 26, '2024-04-22 10:34:08', 'Usuario:Lopez Pujato, Pablo-(26)-Acción: Modificar Modulo: Contrato');

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
(1, 1, 12, '2021-03-12', '2024-04-12', 250.33, 0),
(8, 3, 8, '2024-01-01', '2024-12-31', 235.00, 0),
(9, 2, 1, '2024-01-01', '2024-12-31', 12.00, 0),
(11, 9, 13, '2024-04-09', '2024-04-30', 2541.00, 0),
(13, 7, 12, '2024-04-10', '2024-09-12', 25422.00, 0),
(14, 11, 11, '2024-04-19', '2024-06-20', 55000.00, 0),
(16, 6, 12, '2024-05-01', '2024-08-18', 211111.00, 0),
(17, 10, 1, '2024-04-18', '2024-04-25', 454656.00, 0),
(18, 13, 12, '2024-04-12', '2024-06-13', 255541.22, 0);

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `inmuebles`
--

INSERT INTO `inmuebles` (`idinmueble`, `direccion`, `ambientes`, `superficie`, `latitud`, `longitud`, `idpropietario`, `tipoinmueble`, `nompropietario`, `estado`, `borrado`) VALUES
(1, 'virgen del carmen 10', 2, 200, 1.25, 1.25, 1, 'Casa', '', 'Alquilado', 0),
(2, 'Rivadavia 538', 2, 200, 2.74, 0.00, 6, 'Departamento', '', 'Alquilado', 0),
(3, 'balcarce', 833, 30, 5.00, 1.00, 1, '', '', 'Alquilado', 1),
(4, 'BALCARCE', 833, 30, 5.00, 1.00, 12, 'Departamento', '', '', 1),
(5, 'MONTEVIDEO', 200, 2, 1.50, 2.00, 20, 'Local', '', 'Disponible', 0),
(6, 'IRIONDO 98', 2, 150, 2.22, 4422.00, 1, 'Depósito', '', 'Alquilado', 0),
(7, 'Lafinur 2350', 2, 2, 0.00, 4422.00, 11, 'Casa', '', 'Alquilado', 0),
(8, 'BUENOS AIRES 833', 3, 3, 3.55, 21.00, 1, 'Departamento', '', 'Disponible', 0),
(9, 'MONTEVIDEO', 12, 2, 0.00, 2.00, 12, 'Departamento', '', 'Alquilado', 0),
(10, 'SAN MARTIN 232', 1, 122, 0.00, 2333.00, 1, 'Comercio', '', 'Alquilado', 0),
(11, 'montevideo 885', 12, 123, 0.00, 45.32, 1, 'Local', '', 'Alquilado', 0),
(12, 'montevideo 1121', 123, 123, 22.33, 25.21, 1, 'Comercio', '', 'Disponible', 0),
(13, 'rivadavia 538', 2, 1000, 225.22, 35.33, 6, 'Local', '', 'Alquilado', 0),
(14, 'SAN MARTÍN 234', 2, 120, 15.22, 1544.22, 1, 'Comercio', '', 'Disponible', 0);

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
(16, 'Juan', 'Gomez', 'pp@pp.com', '123', 99123432, 0),
(17, 'Hernesto', 'Capobianco', 'hernesto@gmail.com', '123', 12776543, 0);

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
(13, 13, '2024-04-09', 1919.00, 0, 0, '0'),
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
(28, 'LORENA', 'CRUZADO', 99999123, 'llcruzado@gmail.com', '123', 0),
(29, 'PABLO JAVIER', 'KJKL', 21332121, 'pp@pp.com', '123', 0),
(30, 'LEOPOLDO', 'GUTIIERREZ', 12321654, 'leopoldo@gmail.com', '123', 0);

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
(26, 'Pablo', 'Lopez Pujato', 'pp@pp.com', 'k3ydslbaTcDJEL1NRHX+0Nh2UWI52IXsIB+W2d6k9Jc=', 0, 1, '/update\\avatar_26.png'),
(27, 'Lulu', 'Gutierrez', 'lulu@gmail.com', 'k3ydslbaTcDJEL1NRHX+0Nh2UWI52IXsIB+W2d6k9Jc=', 0, 2, '/update\\avatar_27.png'),
(28, 'Facundo', 'LOPEZ Pujato', 'ppppp@pp.com', 'k3ydslbaTcDJEL1NRHX+0Nh2UWI52IXsIB+W2d6k9Jc=', 0, 2, '/update\\avatar_28.png'),
(29, 'Pablo perfil Emplreado pr', 'Lopez Pujato', 'ppp@pp.com', 'k3ydslbaTcDJEL1NRHX+0Nh2UWI52IXsIB+W2d6k9Jc=', 0, 2, NULL),
(30, 'GOMEZ', 'JUAN', 'jj@gmail.com', 'k3ydslbaTcDJEL1NRHX+0Nh2UWI52IXsIB+W2d6k9Jc=', 0, 1, '/update\\avatar_30.jpg'),
(31, 'Facundo', 'Lopez Pujato', 'facu@gmail.com', 'k3ydslbaTcDJEL1NRHX+0Nh2UWI52IXsIB+W2d6k9Jc=', 0, 1, '/update\\avatar_32.png'),
(32, 'Esteban', 'Quito', 'pp@correo.com', 'k3ydslbaTcDJEL1NRHX+0Nh2UWI52IXsIB+W2d6k9Jc=', 0, 1, NULL),
(33, 'Usuario', 'usuarioultimo', 'qq@qq.com', 'k3ydslbaTcDJEL1NRHX+0Nh2UWI52IXsIB+W2d6k9Jc=', 0, 1, '/update\\avatar_33.png'),
(34, 'Eduardo', 'Rosso', 'eduardoroso@lacosta.com', 'k3ydslbaTcDJEL1NRHX+0Nh2UWI52IXsIB+W2d6k9Jc=', 0, 2, '/update\\avatar_34.png'),
(35, 'Pablo', 'Gomez', '99999999', 'k3ydslbaTcDJEL1NRHX+0Nh2UWI52IXsIB+W2d6k9Jc=', 0, 1, NULL),
(36, 'Marcelo', 'Gomez', 'qq@qqa.com', 'k3ydslbaTcDJEL1NRHX+0Nh2UWI52IXsIB+W2d6k9Jc=', 0, 2, '/update\\avatar_36.png'),
(37, 'Esteban', 'Martinez', 'pemamartinez@correo.com', 'k3ydslbaTcDJEL1NRHX+0Nh2UWI52IXsIB+W2d6k9Jc=', 0, 1, '/update\\avatar_37.jpg');

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
  MODIFY `IdAuditoria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=242;

--
-- AUTO_INCREMENT de la tabla `contratos`
--
ALTER TABLE `contratos`
  MODIFY `idcontrato` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT de la tabla `inmuebles`
--
ALTER TABLE `inmuebles`
  MODIFY `idinmueble` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de la tabla `inquilino`
--
ALTER TABLE `inquilino`
  MODIFY `idinquilino` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT de la tabla `pagos`
--
ALTER TABLE `pagos`
  MODIFY `idpago` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;

--
-- AUTO_INCREMENT de la tabla `propietario`
--
ALTER TABLE `propietario`
  MODIFY `idpropietario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `IdUsuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

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
