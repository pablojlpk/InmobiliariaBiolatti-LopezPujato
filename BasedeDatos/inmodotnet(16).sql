-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 25-04-2024 a las 12:55:00
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
(365, 40, '2024-04-23 10:10:36', 'Usuario:lopez pujato, Pablo -(40)-Acción: cierre Sesión Modulo: usuarios'),
(366, 41, '2024-04-23 13:06:31', 'Usuario:Biolatti, Ana luz-(41)-Acción: ACCESO CORRECTO Modulo: LOGIN'),
(367, 41, '2024-04-23 13:08:34', 'Usuario:Biolatti, Ana luz-(41)-Acción: Alta Modulo: Propietarios'),
(368, 41, '2024-04-23 13:09:10', 'Usuario:Biolatti, Ana luz-(41)-Acción: Alta Modulo: Propietarios'),
(369, 41, '2024-04-23 13:09:53', 'Usuario:Biolatti, Ana luz-(41)-Acción: Alta Modulo: Propietarios'),
(370, 41, '2024-04-23 13:10:32', 'Usuario:Biolatti, Ana luz-(41)-Acción: Alta Modulo: Propietarios'),
(371, 41, '2024-04-23 13:11:14', 'Usuario:Biolatti, Ana luz-(41)-Acción: Alta Modulo: Inquilinos'),
(372, 41, '2024-04-23 13:11:57', 'Usuario:Biolatti, Ana luz-(41)-Acción: Alta Modulo: Inquilinos'),
(373, 41, '2024-04-23 13:12:31', 'Usuario:Biolatti, Ana luz-(41)-Acción: Alta Modulo: Inquilinos'),
(374, 41, '2024-04-23 13:13:00', 'Usuario:Biolatti, Ana luz-(41)-Acción: Alta Modulo: Inquilinos'),
(375, 41, '2024-04-23 13:16:00', 'Usuario:Biolatti, Ana luz-(41)-Acción: Modificar Modulo: Inmuebles'),
(376, 41, '2024-04-23 13:17:44', 'Usuario:Biolatti, Ana luz-(41)-Acción: Alta Modulo: Contrato'),
(377, 41, '2024-04-23 13:18:26', 'Usuario:Biolatti, Ana luz-(41)-Acción: Alta Modulo: Contrato'),
(378, 41, '2024-04-23 13:19:16', 'Usuario:Biolatti, Ana luz-(41)-Acción: Alta Modulo: Pagos'),
(379, 41, '2024-04-23 13:19:52', 'Usuario:Biolatti, Ana luz-(41)-Acción: MULTA Modulo: Pagos'),
(380, 41, '2024-04-23 13:20:10', 'Usuario:Biolatti, Ana luz-(41)-Acción: Anular Modulo: Pagos'),
(381, 41, '2024-04-23 13:20:48', 'Usuario:Biolatti, Ana luz-(41)-Acción: Alta Modulo: Contrato'),
(382, 41, '2024-04-23 13:21:43', 'Usuario:Biolatti, Ana luz-(41)-Acción: Modificar Modulo: Inmuebles'),
(383, 41, '2024-04-23 13:22:57', 'Usuario:Biolatti, Ana luz-(41)-Acción: Modificar Perfil Modulo: usuarios'),
(384, 41, '2024-04-23 13:23:31', 'Usuario:Biolatti, Ana luz-(41)-Acción: cierre Sesión Modulo: usuarios'),
(385, 40, '2024-04-23 13:43:45', 'Usuario:lopez pujato, Pablo -(40)-Acción: Alta Modulo: Propietarios'),
(386, 40, '2024-04-23 13:44:39', 'Usuario:lopez pujato, Pablo -(40)-Acción: Modificar Modulo: Inmuebles'),
(387, 40, '2024-04-23 13:45:30', 'Usuario:lopez pujato, Pablo -(40)-Acción: Modificar Modulo: Inmuebles'),
(388, 40, '2024-04-23 13:45:38', 'Usuario:lopez pujato, Pablo -(40)-Acción: Editar Modulo: Inmuebles'),
(389, 40, '2024-04-23 13:45:43', 'Usuario:lopez pujato, Pablo -(40)-Acción: Baja Modulo: Inmuebles'),
(390, 40, '2024-04-23 13:46:41', 'Usuario:lopez pujato, Pablo -(40)-Acción: Modificar Modulo: Inmuebles'),
(391, 40, '2024-04-23 13:48:16', 'Usuario:lopez pujato, Pablo -(40)-Acción: Modificar Modulo: Inmuebles'),
(392, 40, '2024-04-23 13:49:04', 'Usuario:lopez pujato, Pablo -(40)-Acción: Editar Modulo: Inmuebles'),
(393, 40, '2024-04-23 13:49:46', 'Usuario:lopez pujato, Pablo -(40)-Acción: Editar Modulo: Propietarios'),
(394, 40, '2024-04-23 13:49:50', 'Usuario:lopez pujato, Pablo -(40)-Acción: Modificar Modulo: Propietarios'),
(395, 40, '2024-04-23 13:51:40', 'Usuario:lopez pujato, Pablo -(40)-Acción: cierre Sesión Modulo: usuarios'),
(396, 42, '2024-04-23 13:51:47', 'Usuario:Cantero, Ricardo-(42)-Acción: ACCESO CORRECTO Modulo: LOGIN'),
(397, 42, '2024-04-23 13:55:37', 'Usuario:Cantero, Ricardo-(42)-Acción: Modificar Modulo: Inmuebles'),
(398, 41, '2024-04-24 16:38:09', 'Usuario:Biolatti, Ana -(41)-Acción: cierre Sesión Modulo: usuarios'),
(399, 43, '2024-04-24 16:38:13', 'Usuario:Rios, Javier-(43)-Acción: ACCESO CORRECTO Modulo: LOGIN'),
(400, 43, '2024-04-24 16:40:58', 'Usuario:Rios, Javier-(43)-Acción: Anular Modulo: Pagos'),
(401, 43, '2024-04-24 16:41:30', 'Usuario:Rios, Javier-(43)-Acción: Alta Modulo: Pagos'),
(402, 43, '2024-04-24 16:42:05', 'Usuario:Rios, Javier-(43)-Acción: Alta Modulo: Pagos'),
(403, 43, '2024-04-24 16:42:43', 'Usuario:Rios, Javier-(43)-Acción: Alta Modulo: Pagos'),
(404, 43, '2024-04-24 16:43:53', 'Usuario:Rios, Javier-(43)-Acción: MULTA Modulo: Pagos'),
(405, 43, '2024-04-24 16:44:16', 'Usuario:Rios, Javier-(43)-Acción: Modificar Modulo: Pagos'),
(406, 43, '2024-04-24 16:44:24', 'Usuario:Rios, Javier-(43)-Acción: Modificar Modulo: Pagos'),
(407, 43, '2024-04-24 16:46:04', 'Usuario:Rios, Javier-(43)-Acción: Anular Modulo: Pagos'),
(408, 43, '2024-04-24 16:46:13', 'Usuario:Rios, Javier-(43)-Acción: Anular Modulo: Pagos'),
(409, 43, '2024-04-24 16:49:41', 'Usuario:Rios, Javier-(43)-Acción: Modificar Modulo: Inmuebles'),
(410, 43, '2024-04-24 16:52:51', 'Usuario:Rios, Javier-(43)-Acción: Modificar Modulo: Inmuebles'),
(411, 43, '2024-04-24 16:54:22', 'Usuario:Rios, Javier-(43)-Acción: Modificar Modulo: Inmuebles'),
(412, 43, '2024-04-24 16:54:53', 'Usuario:Rios, Javier-(43)-Acción: cierre Sesión Modulo: usuarios'),
(413, 41, '2024-04-24 16:54:58', 'Usuario:Biolatti, Ana -(41)-Acción: ACCESO CORRECTO Modulo: LOGIN'),
(414, 41, '2024-04-24 16:55:04', 'Usuario:Biolatti, Ana -(41)-Acción: Alta Modulo: usuarios'),
(415, 41, '2024-04-24 16:55:39', 'Usuario:Biolatti, Ana -(41)-Acción: Alta Modulo: usuarios'),
(416, 41, '2024-04-24 16:55:55', 'Usuario:Biolatti, Ana -(41)-Acción: Modificar Perfil Modulo: usuarios'),
(417, 40, '2024-04-25 07:40:32', 'Usuario:lopez pujato, Pablo -(40)-Acción: ACCESO CORRECTO Modulo: LOGIN'),
(418, 40, '2024-04-25 07:43:28', 'Usuario:lopez pujato, Pablo -(40)-Acción: Modificar Modulo: Inmuebles'),
(419, 40, '2024-04-25 07:44:24', 'Usuario:lopez pujato, Pablo -(40)-Acción: Modificar Modulo: Inmuebles'),
(420, 40, '2024-04-25 07:50:50', 'Usuario:lopez pujato, Pablo -(40)-Acción: Editar Modulo: Inmuebles'),
(421, 40, '2024-04-25 07:50:57', 'Usuario:lopez pujato, Pablo -(40)-Acción: Editar Modulo: Inmuebles'),
(422, 40, '2024-04-25 07:51:01', 'Usuario:lopez pujato, Pablo -(40)-Acción: Editar Modulo: Inmuebles'),
(423, 40, '2024-04-25 07:51:07', 'Usuario:lopez pujato, Pablo -(40)-Acción: Editar Modulo: Inmuebles'),
(424, 40, '2024-04-25 07:51:14', 'Usuario:lopez pujato, Pablo -(40)-Acción: Editar Modulo: Inmuebles'),
(425, 40, '2024-04-25 07:51:21', 'Usuario:lopez pujato, Pablo -(40)-Acción: Editar Modulo: Inmuebles'),
(426, 40, '2024-04-25 07:51:28', 'Usuario:lopez pujato, Pablo -(40)-Acción: Editar Modulo: Inmuebles'),
(427, 40, '2024-04-25 07:51:46', 'Usuario:lopez pujato, Pablo -(40)-Acción: Editar Modulo: Inmuebles'),
(428, 40, '2024-04-25 07:52:05', 'Usuario:lopez pujato, Pablo -(40)-Acción: Editar Modulo: Inmuebles'),
(429, 40, '2024-04-25 07:52:15', 'Usuario:lopez pujato, Pablo -(40)-Acción: Editar Modulo: Inmuebles'),
(430, 40, '2024-04-25 07:52:47', 'Usuario:lopez pujato, Pablo -(40)-Acción: Editar Modulo: Inmuebles'),
(431, 40, '2024-04-25 07:52:51', 'Usuario:lopez pujato, Pablo -(40)-Acción: Editar Modulo: Inmuebles'),
(432, 40, '2024-04-25 07:52:57', 'Usuario:lopez pujato, Pablo -(40)-Acción: Editar Modulo: Inmuebles'),
(433, 40, '2024-04-25 07:53:02', 'Usuario:lopez pujato, Pablo -(40)-Acción: Editar Modulo: Inmuebles'),
(434, 40, '2024-04-25 07:53:08', 'Usuario:lopez pujato, Pablo -(40)-Acción: Editar Modulo: Inmuebles'),
(435, 40, '2024-04-25 07:53:13', 'Usuario:lopez pujato, Pablo -(40)-Acción: Editar Modulo: Inmuebles'),
(436, 40, '2024-04-25 07:53:27', 'Usuario:lopez pujato, Pablo -(40)-Acción: Editar Modulo: Inmuebles'),
(437, 40, '2024-04-25 07:53:32', 'Usuario:lopez pujato, Pablo -(40)-Acción: Editar Modulo: Inmuebles'),
(438, 40, '2024-04-25 07:53:45', 'Usuario:lopez pujato, Pablo -(40)-Acción: cierre Sesión Modulo: usuarios'),
(439, 40, '2024-04-25 07:53:58', 'Usuario:lopez pujato, Pablo -(40)-Acción: ACCESO CORRECTO Modulo: LOGIN'),
(440, 40, '2024-04-25 07:54:06', 'Usuario:lopez pujato, Pablo -(40)-Acción: Editar Modulo: Inmuebles');

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
(29, 24, 27, '2024-05-01', '2024-08-01', 120000.00, 0),
(30, 25, 30, '2024-10-01', '2024-12-01', 150000.00, 0),
(31, 22, 27, '2024-07-01', '2024-10-01', 70000.00, 0),
(32, 19, 25, '2024-05-07', '2024-07-07', 120000.00, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inmuebles`
--

CREATE TABLE `inmuebles` (
  `idinmueble` int(11) NOT NULL,
  `direccion` varchar(100) NOT NULL,
  `ambientes` int(2) NOT NULL,
  `superficie` int(4) NOT NULL,
  `latitud` decimal(10,3) NOT NULL,
  `longitud` decimal(10,3) NOT NULL,
  `idpropietario` int(11) NOT NULL,
  `tipoinmueble` varchar(20) NOT NULL,
  `nompropietario` varchar(100) NOT NULL,
  `importe` decimal(9,2) NOT NULL,
  `habilitado` varchar(2) NOT NULL,
  `estado` varchar(15) NOT NULL,
  `borrado` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `inmuebles`
--

INSERT INTO `inmuebles` (`idinmueble`, `direccion`, `ambientes`, `superficie`, `latitud`, `longitud`, `idpropietario`, `tipoinmueble`, `nompropietario`, `importe`, `habilitado`, `estado`, `borrado`) VALUES
(15, 'Av. Libertad 123', 3, 150, -99999.990, -99999.990, 33, 'Casa', '', 25412.22, 'SI', 'Alquilado', 0),
(16, 'San Martin 456', 3, 80, 2255.220, -99999.990, 34, 'Departamento', '', 100000.00, 'NO', 'Disponible', 0),
(17, 'Belgrano 789', 4, 200, -99999.990, -99999.990, 35, 'Casa', '', 50000.00, 'SI', 'Alquilado', 0),
(18, 'Corrientes 1010', 1, 50, -99999.990, -99999.990, 38, 'Local', '', 15000.00, 'SI', 'Alquilado', 0),
(19, 'General Paz 100', 1, 40, -99999.990, -99999.990, 36, 'Depósito', '', 25001.00, 'SI', 'Alquilado', 0),
(20, 'Junin 6060', 1, 300, -99999.990, -99999.990, 39, 'Depósito', '', 25000.00, 'SI', 'Disponible', 0),
(21, 'Entre rios 7070', 0, 500, -99999.990, -99999.990, 37, 'Terreno', '', 10250.22, 'SI', 'Disponible', 0),
(22, 'La Rioja 300', 2, 75, -225.220, -99999.990, 40, 'Departamento', '', 25144.00, 'SI', 'Alquilado', 0),
(23, 'Uruguay 1313', 4, 180, -99999.990, -99999.990, 31, 'Local', '', 25411.22, 'SI', 'Alquilado', 0),
(24, 'Av. Callao 909', 1, 80, -99999.990, -99999.990, 32, 'Local', '', 15222.00, 'SI', 'Alquilado', 0),
(25, 'Heras 131', 1, 45, -99999.990, -99999.990, 33, 'Departamento', '', 2551.00, 'SI', 'Alquilado', 0),
(26, 'Av. Cordoba 909', 2, 85, -99999.990, 15427.222, 39, 'Departamento', '', 25444.33, 'SI', 'Disponible', 0),
(29, 'MAIPU 316', 4, 250, 22250.330, 2341.220, 46, 'Casa', '', 26443.33, 'NO', 'Disponible', 0),
(30, 'MAIPU 990', 4, 1, 25411.330, 3332.220, 46, 'Local', '', 75500.00, 'SI', 'Disponible', 0),
(31, 'PRINGLES 435', 5, 3, 211.000, 33332.220, 46, 'Depósito', '', 1542.36, 'SI', 'Disponible', 0),
(32, 'hipolito yrigoyen 1345', 3, 80, 5630.000, 3389.000, 34, 'comercial', '', 80000.00, 'NO', 'Disponible', 0),
(33, 'humberto primo 2020', 1, 50, -53000.000, -670005.000, 41, 'Depósito', '', 20000.00, 'SI', 'Disponible', 0),
(34, 'MONTEVIDEO 525', 25, 12, 55.440, 1223.000, 41, 'Casa', '', 15000.00, 'SI', 'Disponible', 0);

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
(27, 'Micaela', 'Velasco', 'micavelasco', '123', 40879098, 0),
(28, 'Francisco', 'Caballero', 'francaballero@gmail.com', '123', 18654367, 0),
(29, 'cesar', 'camacho', 'cesarcamacho@gmail.com', '123', 40879876, 0),
(30, 'Jorge', 'Campos', 'jorgecampos@gmail.com', '123', 36813987, 0),
(31, 'Laura', 'Cardoso', 'laucardoso@gmail.com', '123', 35789654, 0);

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
(55, 20, '2024-04-30', 80000.00, 0, 0, ''),
(56, 22, '2024-04-23', 65000.00, 0, 0, ''),
(57, 23, '2024-05-01', 55000.00, 0, 0, ''),
(58, 24, '2024-04-24', 40000.00, 0, 0, ''),
(59, 25, '2024-04-24', 76000.00, 0, 0, ''),
(60, 27, '2024-04-24', 45000.00, 0, 0, ''),
(61, 28, '2024-04-26', 56000.00, 0, 1, ''),
(62, 29, '2024-04-25', 12000.00, 0, 0, ''),
(63, 19, '2024-04-24', 12555.00, 0, 0, 'Multa'),
(64, 20, '2024-04-23', 50822.66, 0, 0, 'Multa'),
(65, 26, '2024-04-10', 26.64, 0, 1, 'Multa'),
(66, 26, '2024-04-23', 254.00, 0, 1, ''),
(67, 31, '2024-05-01', 70000.00, 0, 0, ''),
(68, 31, '2024-05-01', 7000000.00, 0, 1, 'Multa'),
(69, 25, '2024-04-24', 80000.00, 0, 1, 'SEPTIEMBRE'),
(70, 20, '2024-04-24', 40000.00, 0, 0, 'MARZO'),
(71, 27, '2024-04-24', 1239090.00, 0, 1, 'ENERO'),
(72, 27, '2024-04-24', 45000.00, 0, 0, 'Multa');

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
(41, 'MARCELO', 'GOMEZ', 24499857, 'mmgomez@gmail.com', '123', 0),
(42, 'GABRIELA', 'BAEZ', 37155187, 'baezgabriela@gmail.com', '123', 0),
(43, 'ALBERTO', 'AYALA', 15444678, 'ayalaalberlo@gmail.com', '123', 0),
(44, 'ANTONIO', 'BANDERA', 17654909, 'banderaantonio@gmail.com', '123', 0),
(45, 'JULIETA', 'BERNAL', 39876589, 'julietabernal@gmail.com', '123', 0),
(46, 'ROBERTO', 'OLGUIN', 12456789, 'roberto@gmail.com', '123', 0);

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
(42, 'Ricardo', 'Cantero', 'empleado@gmail.com', 'k3ydslbaTcDJEL1NRHX+0Nh2UWI52IXsIB+W2d6k9Jc=', 0, 2, '/update\\avatar_42.png'),
(43, 'Javier', 'Rios', 'javirios@gmail.com', 'k3ydslbaTcDJEL1NRHX+0Nh2UWI52IXsIB+W2d6k9Jc=', 0, 2, '/update\\avatar_43.png'),
(44, 'Juan', 'Gomez', 'juangomez@gmail.com', 'k3ydslbaTcDJEL1NRHX+0Nh2UWI52IXsIB+W2d6k9Jc=', 0, 1, '/update\\avatar_44.png');

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
  MODIFY `IdAuditoria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=441;

--
-- AUTO_INCREMENT de la tabla `contratos`
--
ALTER TABLE `contratos`
  MODIFY `idcontrato` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT de la tabla `inmuebles`
--
ALTER TABLE `inmuebles`
  MODIFY `idinmueble` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT de la tabla `inquilino`
--
ALTER TABLE `inquilino`
  MODIFY `idinquilino` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT de la tabla `pagos`
--
ALTER TABLE `pagos`
  MODIFY `idpago` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=73;

--
-- AUTO_INCREMENT de la tabla `propietario`
--
ALTER TABLE `propietario`
  MODIFY `idpropietario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `IdUsuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

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
