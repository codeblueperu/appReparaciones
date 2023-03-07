-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 11-11-2022 a las 16:25:21
-- Versión del servidor: 10.4.14-MariaDB
-- Versión de PHP: 7.4.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `sis_inventario`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

CREATE TABLE `categorias` (
  `id` int(11) NOT NULL,
  `categoria` text COLLATE utf8_spanish_ci NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `categorias`
--

INSERT INTO `categorias` (`id`, `categoria`, `fecha`) VALUES
(1, 'COMPACTACION', '2022-05-12 19:46:30'),
(2, 'MARTILLOS DEMOLEDORES', '2022-05-11 21:01:39'),
(3, 'CORTADORAS DE PAVIMENTO', '2022-05-11 21:23:05'),
(4, 'Generadores de energía', '2017-12-21 20:53:29'),
(5, 'ALISADORAS DE PAVIMENTO', '2022-05-11 21:23:30'),
(6, 'BETONERAS', '2022-05-11 20:39:04'),
(7, 'REPUESTOS', '2022-05-10 14:30:13'),
(8, 'EQUIPOS ELECTRICOS', '2022-05-11 20:41:04'),
(9, 'CERCHAS VIBRADORAS', '2022-05-11 21:29:48');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `id` int(11) NOT NULL,
  `nombre` text COLLATE utf8_spanish_ci NOT NULL,
  `documento` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  `email` text COLLATE utf8_spanish_ci NOT NULL,
  `telefono` text COLLATE utf8_spanish_ci NOT NULL,
  `direccion` text COLLATE utf8_spanish_ci NOT NULL,
  `fecha_nacimiento` date NOT NULL,
  `compras` int(11) NOT NULL,
  `ultima_compra` datetime NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`id`, `nombre`, `documento`, `email`, `telefono`, `direccion`, `fecha_nacimiento`, `compras`, `ultima_compra`, `fecha`) VALUES
(1, 'OBRAS CIVILES MMHE', '76499321', 'manuel_ovallino2@hotmail.com', '(569) 746-0726', 'MAULLIN 5998 OHIGGINS', '2000-01-11', 0, '0000-00-00 00:00:00', '2022-05-12 20:42:24'),
(2, 'SODIMAC SA la portada', '96792430', 'jandcodocedo@sodimac.cl', '(569) 561-9552', 'Av. Pedro Aguirre Cerda 10578', '2011-11-11', 0, '0000-00-00 00:00:00', '2022-05-12 20:42:15'),
(3, 'ARRIENDO DE MAQUINARIAS Y SERVICIOS ICA SPA', '77433731', 'cobranza@icaservicios.cl', '(569) 3468-3801', 'AVENIDA ANDRES SABELLA 50 PARQUE INGLES', '1999-11-19', 0, '0000-00-00 00:00:00', '2022-05-11 18:48:39'),
(4, 'SERVICIOS INTEGRALES API', '76451669', 'bodega@apoyointegral.cl', '(569) 5702-6328', 'ISMAEL VALDES VERGARA 514 D-4', '1999-11-11', 0, '0000-00-00 00:00:00', '2022-05-11 18:50:42'),
(5, 'SERVICIOS Y CONSTRUCCION MALVE', '76826241', 'contacto.sycmalve@gmail.com', '(569) 6207-8455', '14 de Febrero 2534 303 CENTRO', '1999-11-11', 0, '0000-00-00 00:00:00', '2022-05-11 18:53:08'),
(6, 'CMR CONTRUCCIONES SPA', '77451387', 'amichea.cmrspa@gmail.com', '(569) 4599-6560', 'COQUIMBO 3485 GUSTAVO LE PAIGE', '1199-11-11', 0, '0000-00-00 00:00:00', '2022-05-11 18:55:50'),
(7, 'LUISA NICOLE YANCA', '17437687', 'administrador@fyfreparaciones.cl', '(569) 8705-1316', 'LOS POETAS10900DP', '1999-11-11', 0, '0000-00-00 00:00:00', '2022-05-11 19:06:50'),
(8, 'SOCIEDAD DE INGENIERÍA CONSTRUCCION Y SERVICIOS INCOSEK SPA', '77086091', 'administrador@fyfreparaciones.cl', '(569) 6821-6249', 'URIBE 636', '1999-11-11', 0, '0000-00-00 00:00:00', '2022-05-11 19:08:17'),
(9, 'SERVICIO OBRAS CIVILES GLORIA PIZARRO EIRL', '77031674', 'administrador@fyfreparaciones.cl', '(569) 3652-7351', 'PASAJE RENE PERI FAGESTRO 8876 VILLA ESCONDIDA', '1999-11-11', 0, '0000-00-00 00:00:00', '2022-05-11 19:10:33'),
(10, 'SERVICIOS ELECTRICOS EULER', '76395435', 'Euler@sermeic.cl', '(569) 9252-2440', 'BIO BIO 6210', '1999-11-11', 0, '0000-00-00 00:00:00', '2022-05-11 19:14:39'),
(11, 'EULEN CHILES SA', '96937270', 'mppinilla@eulen.com', '(569) 3867-2114', 'AV DEL VALLE 765 201', '1999-11-11', 0, '0000-00-00 00:00:00', '2022-05-11 19:34:31'),
(12, 'SAN JUAN CIMENTACIONES LIMITADA', '76266348', 'mitorres@armsanjuan.com', '(569) 9433-0977', 'AVENIDA VITACURA 2909 1002', '1999-11-11', 0, '0000-00-00 00:00:00', '2022-05-11 19:36:59'),
(13, 'J Y V CONSTRUCCION Y SERVICIOS LIMITADA', '76604226', 'administrador@fyfreparaciones.cl', '(569) 5001-1503', 'URIBE 636 707', '1199-11-11', 0, '0000-00-00 00:00:00', '2022-05-11 19:41:50'),
(14, 'PAOLO CRISTIAN LOPEZ BUSTAMANTE', '13218638', 'administrador@fyfreparaciones.cl', '(569) 8278-5104', 'EL ROBLE 8908 JUAN PABLO II', '1199-11-11', 0, '0000-00-00 00:00:00', '2022-05-11 19:43:28'),
(15, 'REMAVESA S A', '96753020', 'Ipoblete@remavesa.cl', '(569) 8182-4876', 'ANIBAL ZANARTU 2601', '1999-11-11', 0, '0000-00-00 00:00:00', '2022-05-11 19:45:38'),
(16, 'SODIMAC SA el mall', '96792430', 'arriendo_05@sodimac.cl', '(569) 6569-8991', 'Balmaceda 2355', '1999-11-11', 0, '0000-00-00 00:00:00', '2022-05-11 19:48:45'),
(18, 'ICADAT SPA', '76578726', 'fantivilo@grupoicadat.com', '(569) 4030-0420', 'ANTONIO POUPIN 1052', '1999-11-11', 0, '0000-00-00 00:00:00', '2022-05-11 19:57:39'),
(19, 'MAIGAL INVERSIONES LIMITADA', '77391518', 'gerencia@inversionesmaigal.cl', '(123) 4567-8912', 'AVENIDA RICA AVENTURA 11780 LA CHIMBA', '1999-11-11', 0, '0000-00-00 00:00:00', '2022-05-11 20:01:14'),
(20, 'CONSTRUMART SA', '96511460', 'csoza@construmart.cl', '(569) 7669-1485', 'EDUARDO FREI MONTALVA 9275', '1999-11-11', 0, '0000-00-00 00:00:00', '2022-05-11 20:11:15'),
(23, 'Tulio San Martin Valdivia', '22842555-9', 'sertaball@hotmail.com', '(569) 7137-5002', 'Manuel Rodriguez 1029 dpto 02', '2022-05-12', 0, '0000-00-00 00:00:00', '2022-05-12 18:18:44'),
(24, 'PATICULAR', '76957462-1', 'administrador@fyfreparaciones.cL', '(569) 4002-8545', 'av. huamachuco 9962', '1999-11-11', 2, '2022-05-13 09:24:37', '2022-05-13 14:24:37'),
(25, 'BENIGNO LOPEZ ', '76957462-1', 'administrador@fyfreparaciones.cl', '(569) 400-2854', 'av. huamachuco 9962', '1999-11-11', 1, '2022-05-12 15:42:05', '2022-05-12 20:42:05'),
(26, 'SOMACOR', '84182700-7', 'administrador@fyfreparaciones.cl', '(569) 400-2854', 'av. huamachuco 9962', '1999-11-11', 0, '0000-00-00 00:00:00', '2022-05-12 20:43:42');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `id` int(11) NOT NULL,
  `id_categoria` int(11) NOT NULL,
  `codigo` text COLLATE utf8_spanish_ci NOT NULL,
  `descripcion` text COLLATE utf8_spanish_ci NOT NULL,
  `imagen` text COLLATE utf8_spanish_ci NOT NULL,
  `stock` int(11) NOT NULL,
  `precio_compra` float NOT NULL,
  `precio_venta` float NOT NULL,
  `ventas` int(11) NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`id`, `id_categoria`, `codigo`, `descripcion`, `imagen`, `stock`, `precio_compra`, `precio_venta`, `ventas`, `fecha`) VALUES
(5, 7, 'BF7866', 'FILTRO DE AIRE', 'vistas/img/productos/BF7866/455.png', 1, 48000, 57120, 0, '2022-05-20 21:44:09'),
(7, 7, 'GF-61M5-16', 'FILTRO DE BENCINA', 'vistas/img/productos/GF-61M5-16/296.png', 17, 8000, 9520, 0, '2022-05-20 21:47:28'),
(8, 7, 'ALTERNATIVO', 'LLAVE DE PASO DE BENCINA', 'vistas/img/productos/ALTERNATIVO/826.png', 9, 25000, 29750, 0, '2022-05-20 20:39:12'),
(9, 7, '0157-193', 'FILTRO WACKER', 'vistas/img/productos/0157-193/901.png', 1, 114000, 135000, 0, '2022-05-20 21:48:25'),
(10, 7, 'ALTERNATIVO', 'LLAVE DE PASO DE BENCINA', 'vistas/img/productos/ALTERNATIVO/826.png', 9, 25000, 29750, 0, '2022-05-20 20:39:12'),
(11, 7, 'ALTERNATIVO', 'LLAVE DE PASO DE BENCINA', 'vistas/img/productos/ALTERNATIVO/826.png', 9, 25000, 29750, 0, '2022-05-20 20:39:12'),
(13, 4, '036', 'GENERADOR EMARESA 10KVA', 'vistas/img/productos/036/187.jpg', 1, 25000, 25000, 0, '2022-05-10 21:24:41'),
(14, 7, 'ALTERNATIVO', 'LLAVE DE PASO DE BENCINA', 'vistas/img/productos/ALTERNATIVO/826.png', 9, 25000, 29750, 1, '2022-05-20 20:39:12'),
(15, 4, '044', 'GENERADOR EMARESA 10KVA', 'vistas/img/productos/044/735.jpg', 1, 25000, 25000, 0, '2022-05-10 21:25:31'),
(16, 4, '047', 'GENERADOR EMARESA 10KVA', 'vistas/img/productos/047/947.jpg', 1, 25000, 25000, 0, '2022-05-10 21:26:05'),
(18, 4, '052', 'GENERADOR EMARESA 10KVA', 'vistas/img/productos/052/488.jpg', 1, 25000, 25000, 0, '2022-05-10 21:35:43'),
(19, 4, '53', 'GENERADOR EMARESA 10KVA', 'vistas/img/productos/53/969.jpg', 1, 25000, 25000, 0, '2022-05-10 21:39:48'),
(20, 7, '17-0100-821-12-39', 'LOMBARDINI ANILLO 6KVA', 'vistas/img/productos/17-0100-821-12-39/266.png', 3, 59000, 70210, 0, '2022-05-20 21:27:34'),
(21, 4, '064', 'GENERADOR EMARESA 10KVA', 'vistas/img/productos/064/586.jpg', 1, 25000, 25000, 0, '2022-05-20 21:23:21'),
(22, 7, '17-0100-021-0032', 'LOMBARDINI DE 10KVA', 'vistas/img/productos/17-0100-021-0032/833.png', 5, 90000, 107100, 0, '2022-05-20 21:22:22'),
(23, 7, '17-0100-821-1251', 'ANILLO LOMBARDINI', 'vistas/img/productos/17-0100-821-1251/724.png', 1, 60000, 71400, 0, '2022-05-20 21:21:47'),
(25, 7, '17-0100-821-1056', 'ANILLO LOMBARDINI', 'vistas/img/productos/17-0100-821-1056/649.png', 1, 90000, 107100, 0, '2022-05-20 21:19:50'),
(26, 7, '267-23501-07', 'ANILLO SUBARU EH4L', 'vistas/img/productos/267-23501-07/324.png', 4, 65000, 77350, 0, '2022-05-20 21:12:43'),
(27, 4, '021', 'GENERADOR EMARESA 7KVA', 'vistas/img/productos/021/753.jpg', 1, 25000, 25000, 0, '2022-05-11 20:26:22'),
(28, 4, '024', 'GENERADOR EMARESA 7KVA', 'vistas/img/productos/024/992.jpg', 1, 25000, 25000, 0, '2022-05-11 20:28:01'),
(29, 4, '045', 'GENERADOR EMARESA 7KVA', 'vistas/img/productos/045/988.jpg', 0, 25000, 25000, 1, '2022-05-12 20:42:05'),
(30, 4, '026', 'GENERADOR EMARESA 4KVA', 'vistas/img/productos/026/105.jpg', 1, 25000, 25000, 0, '2022-05-11 20:30:22'),
(31, 4, '037', 'GENERADOR EMARESA 5KVA', 'vistas/img/productos/037/650.jpg', 1, 25000, 25000, 0, '2022-05-11 20:31:34'),
(32, 4, '034', 'GENERADOR EMARESA 2KVA', 'vistas/img/productos/034/251.png', 1, 25000, 25000, 0, '2022-05-11 20:32:58'),
(33, 4, '055', 'GENERADOR EMARESA 15KVA', 'vistas/img/productos/055/815.jpg', 1, 25000, 25000, 0, '2022-05-11 20:34:32'),
(34, 8, '001', 'HIDROLAVADORA', 'vistas/img/productos/001/100.png', 1, 10000, 10000, 0, '2022-05-20 20:57:55'),
(35, 8, '002', 'SOLDADORA', 'vistas/img/productos/002/562.jpg', 1, 8400, 9996, 0, '2022-05-20 20:56:03'),
(36, 8, '003', 'SOLDADORA', 'vistas/img/productos/003/415.jpg', 1, 8400, 9996, 0, '2022-05-20 20:55:37'),
(37, 8, '004', 'SOLDADORA', 'vistas/img/productos/004/145.jpg', 1, 8400, 9996, 0, '2022-05-20 20:55:09'),
(38, 2, '007', 'MARTILLO DEMOLEDOR MAKITA HM0810', 'vistas/img/productos/007/419.jpg', 1, 5000, 5950, 0, '2022-05-11 21:03:23'),
(39, 2, '012', 'MARTILLO DEMOLEDOR MAKITA HM1307C', 'vistas/img/productos/012/510.jpg', 1, 12000, 14280, 0, '2022-05-11 21:05:04'),
(40, 2, '019', 'MARTILLO DEMOLEDOR MAKITA HM1307C', 'vistas/img/productos/019/842.jpg', 1, 12000, 14280, 0, '2022-05-11 21:06:16'),
(41, 2, '027', 'MARTILLO DEMOLEDOR MAKITA HM1307C', 'vistas/img/productos/027/701.jpg', 1, 12000, 14280, 0, '2022-05-11 21:07:55'),
(42, 2, '028', 'MARTILLO DEMOLEDOR MAKITA HM1307C', 'vistas/img/productos/028/838.jpg', 1, 12000, 14280, 0, '2022-05-11 21:08:30'),
(43, 2, '040', 'MARTILLO DEMOLEDOR MAKITA HM1203C', 'vistas/img/productos/040/520.jpg', 1, 10000, 11900, 0, '2022-05-11 21:10:58'),
(44, 2, '054', 'MARTILLO DEMOLEDOR MAKITA HM0810', 'vistas/img/productos/054/305.jpg', 1, 5000, 5950, 0, '2022-05-11 21:11:57'),
(45, 2, '058', 'MARTILLO DEMOLEDOR MAKITA HM1201', 'vistas/img/productos/058/120.jpg', 1, 7000, 8330, 0, '2022-05-11 21:12:51'),
(46, 2, '059', 'MARTILLO DEMOLEDOR MAKITA HM1201', 'vistas/img/productos/059/347.jpg', 1, 7000, 8330, 0, '2022-05-11 21:13:32'),
(47, 2, '078', 'MARTILLO DEMOLEDOR MAKITA HM0810', 'vistas/img/productos/078/136.jpg', 1, 5000, 5950, 0, '2022-05-11 21:14:33'),
(48, 2, '080', 'MARTILLO DEMOLEDOR MAKITA HM0810', 'vistas/img/productos/080/890.jpg', 1, 5000, 5950, 0, '2022-05-11 21:15:12'),
(49, 3, '008', 'CORTADORA DE PAVIMENTO CON DISCO', 'vistas/img/productos/008/743.jpg', 1, 25000, 29750, 0, '2022-05-11 21:17:35'),
(50, 3, '009', 'CORTADORA DE PAVIMENTO CON DISCO', 'vistas/img/productos/009/308.jpg', 1, 25000, 29750, 0, '2022-05-11 21:18:12'),
(51, 3, '015', 'CORTADORA DE PAVIMENTO CON DISCO', 'vistas/img/productos/015/185.jpg', 1, 25000, 29750, 0, '2022-05-11 21:18:51'),
(54, 5, '013', 'ALISADORA DE PAVIMENTO CON PLATO', 'vistas/img/productos/013/251.jpg', 1, 25000, 29750, 0, '2022-05-11 21:24:31'),
(55, 5, '031', 'ALISADORA DE PAVIMENTO CON PLATO', 'vistas/img/productos/031/724.jpg', 1, 25000, 29750, 0, '2022-05-11 21:26:43'),
(56, 5, '065', 'ALISADORA DE PAVIMENTO CON PLATO', 'vistas/img/productos/065/989.jpg', 1, 25000, 29750, 0, '2022-05-11 21:27:34'),
(57, 9, '016', 'CERCHA VIBRADORA ', 'vistas/img/productos/016/932.png', 1, 25000, 29750, 0, '2022-05-11 21:45:33'),
(58, 9, '057', 'CERCHA VIBRADORA ', 'vistas/img/productos/057/187.png', 1, 25000, 29750, 0, '2022-05-11 21:46:39'),
(59, 9, '056', 'CERCHA VIBRADORA ', 'vistas/img/productos/056/398.png', 1, 25000, 29750, 0, '2022-05-11 21:47:21'),
(60, 6, '017', 'BETONERA 150LT', 'vistas/img/productos/017/747.png', 1, 10000, 11900, 0, '2022-05-11 21:48:29'),
(61, 6, '048', 'BETONERA 150LT', 'vistas/img/productos/048/345.png', 1, 10000, 11900, 0, '2022-05-20 20:54:13'),
(62, 8, '018', 'GALLETERA MAKITA GA9020', 'vistas/img/productos/018/672.png', 1, 2500, 2975, 0, '2022-05-20 20:48:32'),
(63, 8, 'ESMERIL ANGULAR MAKITA GA7020', 'ESMERIL ANGULAR', 'vistas/img/productos/ESMERIL ANGULAR MAKITA GA7020/206.jpg', 1, 2500, 2975, 0, '2022-05-12 19:45:34'),
(64, 1, '023', 'PLACA COMPACTADORA ', 'vistas/img/productos/023/715.jpg', 1, 8000, 9520, 0, '2022-05-12 19:47:36'),
(65, 1, '010', 'VIBROPISON WACKER NEUSON', 'vistas/img/productos/010/211.png', 1, 18000, 21420, 0, '2022-05-12 19:49:42'),
(66, 1, '011', 'VIBROPISON BOMAG', 'vistas/img/productos/011/154.png', 1, 18000, 21420, 0, '2022-05-12 19:56:54'),
(67, 1, '025', 'PLACA COMPACTADORA DPU 2550 ', 'vistas/img/productos/025/994.jpg', 1, 15000, 17850, 0, '2022-05-12 19:59:43'),
(68, 1, '030', 'PLACA COMPACTADORA WACKER NEUSON DPU 2550', 'vistas/img/productos/030/261.jpg', 1, 15000, 17850, 0, '2022-05-12 20:03:48'),
(69, 1, '032', 'PLACA COMPACTADORA DPU5545', 'vistas/img/productos/032/474.png', 1, 25000, 29750, 0, '2022-05-12 20:05:14'),
(70, 1, '033', 'PLACA COMPACTADORA ', 'vistas/img/productos/033/517.jpg', 1, 8000, 9520, 0, '2022-05-12 20:05:49'),
(71, 1, '035', 'PLACA COMPACTADORA ', 'vistas/img/productos/035/182.jpg', 1, 8000, 9520, 0, '2022-05-12 20:06:53'),
(72, 2, '039', 'ROTOMARTILLO MAKITA HR5202C', 'vistas/img/productos/039/780.png', 1, 18000, 21420, 0, '2022-05-12 20:08:20'),
(73, 8, '042', 'TABLERO ELECTRICO 320 A 220', 'vistas/img/productos/042/286.jpg', 1, 25000, 29750, 0, '2022-05-12 20:09:59'),
(74, 8, '049', 'UNIDAD MOTRIZ ALTA FRECUENCIA CON SONDA', 'vistas/img/productos/049/801.jpg', 1, 12000, 14280, 0, '2022-05-12 20:11:23'),
(75, 8, '50', 'UNIDAD MOTRIZ ALTA FRECUENCIA CON SONDA', 'vistas/img/productos/50/464.jpg', 1, 12000, 14280, 0, '2022-05-12 20:12:02'),
(76, 8, '060', 'UNIDAD MOTRIZ BAJA FRECUENCIA CON SONDA', 'vistas/img/productos/060/245.jpg', 1, 8000, 9520, 0, '2022-05-12 20:12:50'),
(77, 8, '061', 'UNIDAD MOTRIZ BAJA FRECUENCIA CON SONDA', 'vistas/img/productos/061/564.jpg', 1, 8000, 9520, 0, '2022-05-12 20:23:06'),
(78, 8, '062', 'SOLDADORA', 'vistas/img/productos/062/756.jpg', 1, 12000, 14280, 0, '2022-05-12 20:24:00'),
(79, 8, '063', 'UNIDAD MOTRIZ ALTA FRECUENCIA CON SONDA', 'vistas/img/productos/063/678.jpg', 1, 12000, 14280, 0, '2022-05-12 20:24:57'),
(80, 8, '071', 'SOLDADORA 380vol', 'vistas/img/productos/071/307.jpg', 1, 12000, 14280, 0, '2022-05-12 20:25:53'),
(81, 1, '072', 'PLACA COMPACTADORA ', 'vistas/img/productos/072/228.jpg', 1, 8000, 9520, 0, '2022-05-12 20:26:45'),
(82, 2, '073', 'MARTILLO DEMOLEDOR MAKITA HM1203C', 'vistas/img/productos/073/811.jpg', 1, 9000, 10710, 0, '2022-05-12 20:28:44'),
(83, 8, '074', 'SOPLADOR', 'vistas/img/productos/074/273.jpg', 1, 2500, 2975, 0, '2022-05-12 20:29:47'),
(84, 8, '075', 'ASPIRADORA LUSTER BFS80', 'vistas/img/productos/075/910.png', 1, 10000, 11900, 0, '2022-05-20 20:52:53'),
(85, 1, '082', 'RODILLO DOBLE TAMBOR WACKER NEUSON RD7', 'vistas/img/productos/082/283.png', 1, 38000, 45220, 0, '2022-05-20 20:51:49'),
(86, 7, 'ALTERNATIVO', 'LLAVE DE PASO DE BENCINA', 'vistas/img/productos/ALTERNATIVO/826.png', 9, 25000, 29750, 1, '2022-05-20 20:39:12'),
(87, 7, 'CARBURADOR PARA MOTOR GX160 BOMBA DE AGUA ', 'CARBURADOR', 'vistas/img/productos/CARBURADOR PARA MOTOR GX160 BOMBA DE AGUA/325.png', 5, 11900, 90000, 0, '2022-05-27 16:07:33'),
(88, 7, 'CARBURADOR PARA MOTOR GX160 BOMBA DE AGUA', 'CARBURADOR', 'vistas/img/productos/CARBURADOR PARA MOTOR GX160 BOMBA DE AGUA/325.png', 5, 11900, 90000, 0, '2022-05-27 16:07:33'),
(90, 7, 'CARBURADOR PARA MOTOR GX390 ', 'AUTOMATCO', 'vistas/img/productos/CARBURADOR PARA MOTOR GX390/812.png', 2, 17490, 20813, 0, '2022-05-20 20:29:42'),
(91, 7, 'CARBURADOR PARA MOTOR GX390', 'AUTOMATCO', 'vistas/img/productos/CARBURADOR PARA MOTOR GX390/812.png', 2, 17490, 20813, 0, '2022-05-20 20:29:42'),
(92, 7, 'CARBURADOR GENERADOR ET950 ', 'CARBURADOR', 'vistas/img/productos/CARBURADOR GENERADOR ET950 /717.png', 2, 10490, 12483, 0, '2022-05-20 20:27:30'),
(93, 7, 'CARBURADOR MOTOR EX17', 'CARBURADOR', 'vistas/img/productos/CARBURADOR MOTOR EX17/692.png', 1, 21990, 26168, 0, '2022-05-20 20:25:27'),
(94, 7, 'CARBURADOR PARA MOTOR EX27', 'CARBURADOR', 'vistas/img/productos/CARBURADOR PARA MOTOR EX27/468.jpg', 1, 33990, 40448, 0, '2022-05-20 19:49:14'),
(95, 7, 'GENERADOR PARA MOTOR EX40', 'CARBURADOR', 'vistas/img/productos/GENERADOR PARA MOTOR EX40/589.png', 1, 31990, 38068, 0, '2022-05-20 20:24:26'),
(96, 7, 'CARBURADOR PARA MOTOR EH12', 'CARBURADOR', 'vistas/img/productos/CARBURADOR PARA MOTOR EH12/166.png', 1, 23990, 28548, 0, '2022-05-20 20:16:47'),
(97, 7, 'METALES DE BIELA PARA MOTOR 188F', 'STD', 'vistas/img/productos/METALES DE BIELA PARA MOTOR 188F/950.jpg', 10, 3290, 3915, 0, '2022-05-20 15:56:30'),
(98, 7, 'METALES DE BIELA PARA MOTOR192F STD', 'BIELA', 'vistas/img/productos/METALES DE BIELA PARA MOTOR192F STD/545.jpg', 10, 3290, 6250, 0, '2022-05-20 15:54:27'),
(99, 7, 'KIT DE ANILLOS PARA MOTOR 186F', 'ANILLO', 'vistas/img/productos/KIT DE ANILLOS PARA MOTOR 186F/811.jpg', 15, 4990, 5938, 0, '2022-05-20 15:45:56'),
(100, 7, 'FILTRO DE AIRE PARA MOTOR GX160', 'FILTRO DE AIRE', 'vistas/img/productos/FILTRO DE AIRE PARA MOTOR GX160/832.jpg', 10, 15000, 28500, 0, '2022-05-20 15:42:18'),
(101, 7, 'FILTRO DE AIRE PARA MOTOR EY17', 'FILTRO DE AIRE', 'vistas/img/productos/FILTRO DE AIRE PARA MOTOR EY17/334.jpg', 10, 2990, 3550, 0, '2022-05-20 15:39:21'),
(102, 7, 'AVR5 KW6,5 KW380V  14 CABLES ', 'AVR', 'vistas/img/productos/AVR5 KW6,5 KW380V  14 CABLES /834.jpg', 1, 24990, 29738, 0, '2022-05-20 15:31:54'),
(103, 7, 'AVR 5 KW 6.5 KW', 'MONOFACICO', 'vistas/img/productos/AVR 5 KW 6.5 KW/999.jpg', 1, 49900, 58380, 0, '2022-05-20 15:28:21'),
(104, 7, 'AVR SX460', 'AVR', 'vistas/img/productos/AVR SX460/549.jpg', 2, 36900, 43900, 0, '2022-05-20 15:21:22'),
(105, 7, 'FITRO DE AIRE PARA MOTOR GX390', 'FILTRO DE AIRE', 'vistas/img/productos/FITRO DE AIRE PARA MOTOR GX390/224.jpg', 5, 2990, 3558, 0, '2022-05-20 15:18:16'),
(106, 7, 'FILTRO DE AIRE MOTOR GX270', 'FILTRO DE AIRE', 'vistas/img/productos/FILTRO DE AIRE MOTOR GX270/817.jpg', 3, 2990, 3558, 0, '2022-05-20 15:12:50'),
(107, 7, 'INYECTOR DIESE. MOTOR 188F', 'INYECTOR', 'vistas/img/productos/INYECTOR DIESE. MOTOR 188F/259.jpg', 1, 22900, 43500, 0, '2022-05-20 15:05:54'),
(108, 7, 'FILTRO DE AIREMOTOR ', 'EH12', 'vistas/img/productos/FILTRO DE AIREMOTOR /364.jpg', 2, 4990, 5930, 0, '2022-05-20 15:01:52'),
(109, 7, 'FILTRO DE AIRE MOTOR', '15LD350', 'vistas/img/productos/FILTRO DE AIRE MOTOR/194.jpg', 5, 6990, 8318, 0, '2022-05-20 14:59:00'),
(110, 7, 'FILTRO DE AIRE MOTOR', '15LD350', 'vistas/img/productos/FILTRO DE AIRE MOTOR/194.jpg', 5, 6990, 8318, 0, '2022-05-20 14:59:00'),
(111, 7, 'PORTA FILTRO DE AIRE MOTOR GX390', 'GENERADOR', 'vistas/img/productos/PORTA FILTRO DE AIRE MOTOR GX390/701.jpg', 2, 9900, 11780, 0, '2022-05-20 14:56:25'),
(112, 7, 'ROLLO DE CUERDA 2,5 MM100MMROJOY BLAN0', 'CUERDA ', 'vistas/img/productos/ROLLO DE CUERDA 2,5 MM100MMROJOY BLAN0/699.jpg', 1, 12190, 14506, 0, '2022-05-20 14:50:47'),
(113, 7, 'ROLLO DE CUERDA 3.0 MM 100', 'BLANCO Y ROJO ', 'vistas/img/productos/ROLLO DE CUERDA 3.0 MM 100/344.jpg', 1, 12900, 15350, 0, '2022-05-20 14:49:18'),
(114, 7, 'ROLLO DE CUERDA 4.0 100MM', 'ROJO Y BLANCO', 'vistas/img/productos/ROLLO DE CUERDA 4.0 100MM/917.jpg', 1, 18990, 22590, 0, '2022-05-20 14:48:47'),
(115, 7, 'ROLLO DE CUERDA 5.0 MM 100MM', 'BLANCO Y ROJO ', 'vistas/img/productos/ROLLO DE CUERDA 5.0 MM 100MM/789.jpg', 1, 23900, 28440, 0, '2022-05-20 14:44:56'),
(116, 7, 'MOTOR DE PARTIDA', '186F', 'vistas/img/productos/MOTOR DE PARTIDA/761.png', 4, 57900, 68900, 0, '2022-05-20 20:13:08'),
(117, 7, 'TAPA DE ACEITE MOTOR ', '186F', 'vistas/img/productos/TAPA DE ACEITE MOTOR /497.jpg', 10, 1290, 1535, 0, '2022-05-20 20:04:27'),
(118, 7, 'INTERRUCTOR MOTOR', 'EY20', 'vistas/img/productos/INTERRUCTOR MOTOR/968.jpg', 20, 1290, 1530, 0, '2022-05-20 13:47:09'),
(119, 7, 'AVR 5 KW 450 V 8 ', 'CABLE TRIFASICO', 'vistas/img/productos/AVR 5 KW 450 V 8 /957.png', 2, 7490, 8910, 0, '2022-05-20 19:59:23'),
(120, 7, 'AVR 5 KW 220 V 6', 'CABLES', 'vistas/img/productos/AVR 5 KW 220 V 6/383.jpg', 1, 55000, 65450, 0, '2022-05-19 20:12:00'),
(121, 7, 'AVR 6.5 220 V  10 CABLES', 'AVR', 'vistas/img/productos/AVR 6.5 220 V  10 CABLES/853.jpg', 1, 22900, 27250, 0, '2022-05-19 20:08:42'),
(122, 7, 'PACK CONECTORES MAQUINA DE SOLDAR', '1025', 'vistas/img/productos/PACK CONECTORES MAQUINA DE SOLDAR/648.jpg', 3, 5990, 7128, 0, '2022-05-19 20:01:12'),
(123, 7, 'PUENTE DIODOS RETIFICADOR ', 'S50VB100WL', 'vistas/img/productos/PUENTE DIODOS RETIFICADOR /360.jpg', 3, 6690, 8318, 0, '2022-05-19 19:47:11'),
(124, 7, '1VIA12', 'PRESOSTATO COMPRESOR', 'vistas/img/productos/1VIA12/350.jpg', 2, 9900, 11780, 0, '2022-05-19 19:15:36'),
(125, 7, '1VIA CON PALANCA', 'PRESOSTATO CMPRESOR', 'vistas/img/productos/1VIA CON PALANCA/876.jpg', 2, 12990, 15450, 0, '2022-05-19 19:09:43'),
(126, 7, '3.8', 'FILTRO DE AIRE COMPRESOSR PLASTICO', 'vistas/img/productos/3.8/760.jpg', 5, 2090, 2480, 0, '2022-05-19 18:52:03'),
(127, 7, '32MM', 'FILTRO DE AIRE COMPRESOSR PLASTICO', 'vistas/img/productos/32MM/301.jpg', 1, 2490, 2960, 0, '2022-05-19 18:46:55'),
(128, 7, '25MM', 'FILTRO DE AIRE COMPRESOSR PLASTICO', 'vistas/img/productos/25MM/916.jpg', 1, 2490, 2960, 0, '2022-05-19 18:42:07'),
(130, 7, '20MMX10MM', 'VALVULA DE RETENCION', 'vistas/img/productos/20MMX10MM/545.jpg', 1, 3690, 4390, 0, '2022-05-19 15:58:21'),
(131, 7, 'PURGADOR1 4', 'PURGADOR', 'vistas/img/productos/PURGADOR1 4/250.jpg', 1, 1390, 1650, 0, '2022-05-19 15:54:48'),
(132, 7, 'PURGADOR 3 8', 'PURGADOR', 'vistas/img/productos/PURGADOR 3 8/565.jpg', 1, 1490, 1770, 0, '2022-05-19 15:51:48'),
(133, 7, 'CAJA DE CONEXION CONDENSADORES', 'CONDENSADORES', 'vistas/img/productos/CAJA DE CONEXION CONDENSADORES/925.png', 5, 7490, 8910, 0, '2022-05-20 19:12:46'),
(134, 7, '186F', 'BIELA PARAMOTOR', 'vistas/img/productos/186F/468.jpg', 5, 11990, 14268, 0, '2022-05-19 15:41:10'),
(135, 7, '186F O 25', 'METALES DE BIELA', 'vistas/img/productos/186F O 25/242.jpg', 10, 2990, 3590, 0, '2022-05-19 15:38:49'),
(136, 7, '6204-2RS C3', 'RODAMIENTO', 'vistas/img/productos/default/anonymous.png', 7, 20000, 23800, 0, '2022-05-23 13:33:52'),
(137, 7, '6203 2CR C3', 'RODAMIENTO', 'vistas/img/productos/default/anonymous.png', 7, 20000, 23800, 0, '2022-05-23 13:36:34'),
(138, 7, '6205 2RS C3', 'RODAMIENTO', 'vistas/img/productos/default/anonymous.png', 1, 20000, 23800, 0, '2022-05-23 14:07:55'),
(139, 7, '6204 2RS C3', 'RODAMIENTO', 'vistas/img/productos/default/anonymous.png', 4, 20000, 28000, 0, '2022-05-23 14:10:46'),
(140, 7, '6206 2RS C3', 'RODAMIENTO', 'vistas/img/productos/default/anonymous.png', 3, 25000, 29750, 0, '2022-05-23 14:12:52'),
(141, 7, '6304 LU', 'RODAMIENTO', 'vistas/img/productos/default/anonymous.png', 1, 20000, 23800, 0, '2022-05-23 14:14:48'),
(142, 7, '6202', 'RODAMIENTO', 'vistas/img/productos/default/anonymous.png', 2, 15000, 17850, 0, '2022-05-23 14:16:33'),
(143, 7, '6304 LU', 'RODAMIENTO', 'vistas/img/productos/default/anonymous.png', 1, 15000, 17850, 0, '2022-05-23 14:18:26'),
(144, 7, '6001', 'RODAMIENTO', 'vistas/img/productos/default/anonymous.png', 2, 15000, 17750, 0, '2022-05-23 14:20:30'),
(145, 7, '6003', 'RODAMIENTO', 'vistas/img/productos/default/anonymous.png', 1, 15000, 17750, 0, '2022-05-23 14:22:10'),
(146, 7, '5025', 'RODAMIENTO', 'vistas/img/productos/default/anonymous.png', 1, 20000, 23800, 0, '2022-05-23 14:23:22'),
(147, 7, '6002 VV', 'RODAMIENTO', 'vistas/img/productos/default/anonymous.png', 2, 15000, 17750, 0, '2022-05-23 14:24:13'),
(148, 7, '6305 RS', 'RODAMIENTO', 'vistas/img/productos/default/anonymous.png', 1, 25000, 29750, 0, '2022-05-23 14:25:49'),
(149, 7, '6002 LU', 'RODAMIENTO', 'vistas/img/productos/6002 LU/950.png', 1, 15000, 17750, 0, '2022-05-23 21:53:21'),
(150, 7, '6302', 'RODAMIENTO DE METAL', 'vistas/img/productos/6302/726.png', 2, 35000, 41650, 0, '2022-05-23 21:52:19'),
(151, 7, '30204 JR', 'RODAMIENTO METAL', 'vistas/img/productos/30204 JR/630.png', 1, 35000, 41650, 0, '2022-05-23 21:51:33'),
(152, 7, '303004', 'RODAMIENTO DE METAL', 'vistas/img/productos/303004/917.png', 1, 25000, 29750, 0, '2022-05-23 21:50:34'),
(153, 7, '6305C3', 'RODAMIENTO DE METAL', 'vistas/img/productos/6305C3/810.png', 1, 350000, 41650, 0, '2022-05-23 21:49:26'),
(154, 7, '6308-2RS C3', 'RODAMIENTO', 'vistas/img/productos/6308-2RS C3/705.png', 1, 450000, 53550, 0, '2022-05-23 21:48:27'),
(155, 7, 'RODAMIENTO', '6204', 'vistas/img/productos/RODAMIENTO/193.png', 1, 15000, 17750, 0, '2022-05-23 21:47:03'),
(156, 7, 'RODAMIENTO', '6204', 'vistas/img/productos/RODAMIENTO/193.png', 1, 15000, 17750, 0, '2022-05-23 21:47:03'),
(157, 7, '6270', 'RODAMIENTO', 'vistas/img/productos/6270/573.png', 1, 5000, 5950, 0, '2022-05-23 21:46:20'),
(158, 6, '6001Z03', 'RODAMIENTO', 'vistas/img/productos/6001Z03/773.png', 2, 10000, 11900, 0, '2022-05-23 21:45:24'),
(159, 7, 'PFI30205 40021526-3', 'RODAMIENTO', 'vistas/img/productos/PFI30205 40021526-3/670.png', 1, 20000, 23800, 0, '2022-05-23 21:43:44'),
(160, 7, '50000154741', 'CABLE PITCH CONTROL', 'vistas/img/productos/default/anonymous.png', 1, 23500, 27960, 0, '2022-05-23 15:47:01'),
(161, 7, '5100034471', 'KIT THROTTLE CABLE WESCON', 'vistas/img/productos/default/anonymous.png', 2, 85000, 101150, 0, '2022-05-23 15:56:46'),
(162, 7, '500048374', 'SPRING BELLEVILLE TYPE', 'vistas/img/productos/default/anonymous.png', 1, 45000, 53550, 0, '2022-05-23 16:02:10'),
(163, 7, 'ED00674RO470', 'SELENOIDE DE 10KVA', 'vistas/img/productos/default/anonymous.png', 1, 4500000, 535500, 0, '2022-05-23 18:59:47'),
(164, 7, '7512229', 'VILTIMETRO ANALOGO', 'vistas/img/productos/7512229/280.png', 2, 11500, 13685, 0, '2022-05-23 21:31:04'),
(166, 7, '7512239', 'VILTIMETRO ANALOGO', 'vistas/img/productos/7512239/840.png', 2, 10468, 12450, 0, '2022-05-23 21:30:22'),
(167, 7, '7512205', 'CHAPA CONTACTO ENCENDIDO GENERADOR 4 PINES', 'vistas/img/productos/7512205/432.png', 14, 10000, 11900, 0, '2022-05-23 21:28:11'),
(168, 7, '7512201', 'CHAPA CONTACTO ENCENDIDO GENERADOR 6 PINES', 'vistas/img/productos/7512201/618.png', 4, 10000, 11900, 0, '2022-05-23 21:27:17'),
(169, 7, '5 PIMES', 'CHAPA DE GENERADOR', 'vistas/img/productos/5 PIMES/400.png', 8, 25000, 29750, 0, '2022-05-23 21:20:46'),
(170, 7, '7512236', 'VOLTIMETRO DIGITAL', 'vistas/img/productos/7512236/324.png', 2, 25000, 29750, 0, '2022-05-23 21:23:15');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `nombre` text COLLATE utf8_spanish_ci NOT NULL,
  `usuario` text COLLATE utf8_spanish_ci NOT NULL,
  `password` text COLLATE utf8_spanish_ci NOT NULL,
  `perfil` text COLLATE utf8_spanish_ci NOT NULL,
  `foto` text COLLATE utf8_spanish_ci NOT NULL,
  `estado` int(11) NOT NULL,
  `ultimo_login` datetime NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `nombre`, `usuario`, `password`, `perfil`, `foto`, `estado`, `ultimo_login`, `fecha`) VALUES
(1, 'Administrador', 'admin', '$2a$07$asxx54ahjppf45sd87a5auKkVn2znOdg.XFP5ck39yu5/Sequ5tde', 'Administrador', 'vistas/img/usuarios/admin/395.jpg', 1, '2022-05-12 13:09:29', '2022-05-12 18:09:29'),
(60, 'Tulio San martin', 'tulio', '$2a$07$asxx54ahjppf45sd87a5auQvCYIDp3lbgoB2vdyuoQ9ILJxqs09Vu', 'Administrador', 'vistas/img/usuarios/tulio/666.jpg', 1, '0000-00-00 00:00:00', '2022-05-10 14:28:00'),
(61, 'Sara', 'sara', '$2a$07$asxx54ahjppf45sd87a5auFL5K1.Cmt9ZheoVVuudOi5BCi10qWly', 'Vendedor', '', 1, '2022-05-10 14:59:05', '2022-05-10 19:59:05'),
(62, 'Yara', 'yara', '$2a$07$asxx54ahjppf45sd87a5aunB4y206TBfA8Kb39yWqIUa3ilMXLo0S', 'Especial', '', 1, '2022-05-23 08:21:30', '2022-05-23 13:21:30'),
(63, 'Carlos medina', 'carlos', '$2a$07$asxx54ahjppf45sd87a5aunB4y206TBfA8Kb39yWqIUa3ilMXLo0S', 'Administrador', 'vistas/img/usuarios/carlos/489.jpg', 1, '2022-10-07 14:37:26', '2022-10-07 19:37:26');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ventas`
--

CREATE TABLE `ventas` (
  `id` int(11) NOT NULL,
  `codigo` int(11) NOT NULL,
  `id_cliente` int(11) NOT NULL,
  `id_vendedor` int(11) NOT NULL,
  `productos` text COLLATE utf8_spanish_ci NOT NULL,
  `impuesto` float NOT NULL,
  `neto` float NOT NULL,
  `total` float NOT NULL,
  `metodo_pago` text COLLATE utf8_spanish_ci NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `ventas`
--

INSERT INTO `ventas` (`id`, `codigo`, `id_cliente`, `id_vendedor`, `productos`, `impuesto`, `neto`, `total`, `metodo_pago`, `fecha`) VALUES
(3, 10003, 25, 63, '[{\"id\":\"29\",\"descripcion\":\"GENERADOR EMARESA 7KVA\",\"cantidad\":\"1\",\"stock\":\"0\",\"precio\":\"25000\",\"total\":\"44000\"}]', 0, 44000, 44000, 'Efectivo', '2022-05-12 20:42:06'),
(4, 10004, 24, 63, '[{\"id\":\"14\",\"descripcion\":\"FILTRO DE AIRE\",\"cantidad\":\"1\",\"stock\":\"4\",\"precio\":\"7140\",\"total\":\"15000\"}]', 0, 15000, 15000, 'Efectivo', '2022-05-12 20:48:02'),
(5, 10005, 24, 63, '[{\"id\":\"86\",\"descripcion\":\"LLAVE DE PASO DE BENCINA\",\"cantidad\":\"1\",\"stock\":\"9\",\"precio\":\"29750\",\"total\":\"25000\"}]', 0, 25000, 25000, 'TD-1', '2022-05-13 14:24:37');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `categorias`
--
ALTER TABLE `categorias`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=171;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=64;

--
-- AUTO_INCREMENT de la tabla `ventas`
--
ALTER TABLE `ventas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
