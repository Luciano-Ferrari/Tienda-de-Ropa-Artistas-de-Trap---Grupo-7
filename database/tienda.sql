-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 28-11-2025 a las 11:19:19
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `tienda`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `artistas`
--

CREATE TABLE `artistas` (
  `id_artista` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `ruta_banner` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `artistas`
--

INSERT INTO `artistas` (`id_artista`, `nombre`, `ruta_banner`) VALUES
(1, 'Duki', '../src/img/Duki.png'),
(2, 'YSY A', '../src/img/Ysy.png'),
(3, 'Trueno', '../src/img/Trueno.png'),
(4, 'Neo Pistea', '../src/img/Neo.png'),
(5, 'C.R.O.', '../src/img/CRO.jpg'),
(6, 'Khea', '../src/img/Khea.png'),
(7, 'Milo j', '../src/img/Miloj.png'),
(8, 'Barderos', '../src/img/Barderos.png'),
(9, 'Modo Diablo', '../src/img/ModoDiablo.png'),
(10, 'Wos', '../src/img/Wos.png');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedidos`
--

CREATE TABLE `pedidos` (
  `id_pedido` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `calle` varchar(100) DEFAULT NULL,
  `numero` varchar(20) DEFAULT NULL,
  `ciudad` varchar(50) DEFAULT NULL,
  `provincia` varchar(50) DEFAULT NULL,
  `codigo_postal` varchar(20) DEFAULT NULL,
  `total` decimal(10,2) DEFAULT NULL,
  `titular_tarjeta` varchar(100) DEFAULT NULL,
  `ultimos4` char(4) DEFAULT NULL,
  `vencimiento` char(5) DEFAULT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `pedidos`
--

INSERT INTO `pedidos` (`id_pedido`, `id_usuario`, `nombre`, `calle`, `numero`, `ciudad`, `provincia`, `codigo_postal`, `total`, `titular_tarjeta`, `ultimos4`, `vencimiento`, `fecha`) VALUES
(1, 1, 'CRO', 'Jujuy', '255', 'Buenos Aires', 'CABA', '1428', 80.00, 'Tomás Manuel Campos', '1234', '02/28', '2025-11-28 10:18:56');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedido_detalle`
--

CREATE TABLE `pedido_detalle` (
  `id_detalle` int(11) NOT NULL,
  `id_pedido` int(11) NOT NULL,
  `id_producto` int(11) NOT NULL,
  `nombre_producto` varchar(255) DEFAULT NULL,
  `precio_unitario` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `pedido_detalle`
--

INSERT INTO `pedido_detalle` (`id_detalle`, `id_pedido`, `id_producto`, `nombre_producto`, `precio_unitario`) VALUES
(1, 1, 88, 'Vinilo de C.R.O.', 80.00);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `id_producto` int(11) NOT NULL,
  `id_artista` int(11) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `precio` decimal(10,2) NOT NULL,
  `ruta_imagen` varchar(255) NOT NULL,
  `categoria` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`id_producto`, `id_artista`, `nombre`, `descripcion`, `precio`, `ruta_imagen`, `categoria`) VALUES
(1, 9, 'Remera de Modo Diablo', 'Boxy fit', 20.00, '../src/img/ropa-MD-1.png', 'Remeras'),
(2, 9, 'Remera de Modo Diablo', 'Oversize', 20.00, '../src/img/ropa-MD-2.png', 'Remeras'),
(3, 9, 'Remera de Modo Diablo', 'Blanco', 20.00, '../src/img/ropa-MD-3.png', 'Remeras'),
(4, 9, 'Remera de Modo Diablo', 'Blanco Negro', 20.00, '../src/img/ropa-MD-4.png', 'Remeras'),
(5, 9, 'Buzo Modo Diablo', 'Negro', 50.00, '../src/img/buzo-MD-1.png', 'Buzos'),
(6, 9, 'Cadena De Modo Diablo', '247', 10.00, '../src/img/cadena-MD-1.png', 'Accesorios'),
(7, 9, 'Chapa de Antezana', '247', 30.00, '../src/img/chapa-MD-1.png', 'Accesorios'),
(8, 9, 'Buzo Modo Diablo', '247', 20.00, '../src/img/buzo-MD-2.png', 'Buzos'),
(9, 9, 'Remera de Modo Diablo', 'Skere', 20.00, '../src/img/ropa-MD-5.png', 'Remeras'),
(10, 9, 'Remera de Modo Diablo', 'Todo Negro', 20.00, '../src/img/ropa-MD-6.png', 'Remeras'),
(11, 9, 'Buzo de Modo Diablo', 'Antezana', 50.00, '../src/img/buzo-MD-3.png', 'Buzos'),
(12, 9, 'Remera de Modo Diablo', 'Guapo', 20.00, '../src/img/ropa-MD-7.png', 'Remeras'),
(13, 1, 'Sticker de Duki', 'Jesús', 1.00, '../src/img/sticker-duki.png', 'Accesorios'),
(14, 1, 'Cadena de Duki', '2 Alas', 10.00, '../src/img/cadena-Duki-1.png', 'Accesorios'),
(15, 1, 'Vinilo de Duki', '24', 80.00, '../src/img/Vinilo-Duki-1.png', 'Accesorios'),
(16, 1, 'Cadena de Duki', 'Vampiros', 10.00, '../src/img/cadena-Duki-2.png', 'Accesorios'),
(17, 1, 'Vinilo de Duki', 'Super Sangre Joven', 80.00, '../src/img/Vinilo-Duki-2.png', 'Accesorios'),
(18, 1, 'Cadena de Duki', '5202', 10.00, '../src/img/cadena-Duki-3.png', 'Accesorios'),
(19, 1, 'Gorra de Duki', 'Duki', 10.00, '../src/img/gorra-Duki-1.png', 'Accesorios'),
(20, 1, 'Cuadro de Duki', 'Antes de Ameri', 30.00, '../src/img/Cuadro-Duki-1.png', 'Accesorios'),
(21, 1, 'Vinilo de Duki', '5202', 80.00, '../src/img/Vinilo-Duki-3.png', 'Accesorios'),
(22, 1, 'Remera de Modo Diablo', 'Mi Chain de Roque', 20.00, '../src/img/ropa-Duki-1.png', 'Remeras'),
(23, 1, 'Vinilo de Duki', 'Ameri', 80.00, '../src/img/Vinilo-Duki-4.png', 'Accesorios'),
(24, 1, 'Cuadro de Duki', '24', 30.00, '../src/img/Cuadro-Duki-2.png', 'Accesorios'),
(31, 1, 'Sticker Duki Logo', 'Pack de 5', 2.00, '../src/img/sticker-duki-3.png', 'Accesorios'),
(34, 1, 'Sticker Duki \"Jesus\"', 'Vinilo', 1.00, '../src/img/sticker-duki-2.png', 'Accesorios'),
(37, 1, 'Remera de Duki ', '5202', 20.00, '../src/img/ropa-Duki-7.png', 'Remeras'),
(38, 1, 'Remera de Duki', 'Super Sangre Joven', 20.00, '../src/img/ropa-Duki-6.png', 'Remeras'),
(39, 1, 'Remera de Duki', 'Ameri Azul', 20.00, '../src/img/ropa-Duki-5.png', 'Remeras'),
(40, 1, 'Remera de Duki', 'Rockstar', 20.00, '../src/img/ropa-Duki-4.png', 'Remeras'),
(41, 1, 'Remera de Duki', 'Negro', 20.00, '../src/img/ropa-Duki-3.png', 'Remeras'),
(42, 1, 'Remera de Duki', 'Gris', 20.00, '../src/img/ropa-Duki-2.png', 'Remeras'),
(43, 1, 'Sticker de Duki', 'Plastificado', 1.00, '../src/img/sticker-duki-2.png', 'Accesorios'),
(44, 1, 'Sticker de Duki', 'PLastificado', 1.00, '../src/img/sticker-duki-3.png', 'Accesorios'),
(45, 1, 'Vinilo de Duki', 'Antes de Ameri', 80.00, '../src/img/Vinilo-Duki-7.png', 'Accesorios'),
(46, 1, 'Vinilo de Duki', 'Desde el Fin del Mundo', 80.00, '../src/img/Vinilo-Duki-5.png', 'Accesorios'),
(47, 1, 'Cuadro de Duki', 'Ameri', 30.00, '../src/img/Cuadro-Duki-3.png', 'Accesorios'),
(48, 1, 'Llavero Duki', 'Ameri', 8.00, '../src/img/Llavero-Duki-1.png', 'Accesorios'),
(49, 1, 'Póster/Cuadro AMERI', 'Cuadro decorativo con la portada y tracklist del álbum AMERI.', 99.99, 'Cuadro-Duki-3.png', 'Cuadro'),
(50, 1, 'Póster/Cuadro Antes de Ameri', 'Cuadro decorativo con la portada y tracklist del álbum Antes de Ameri.', 99.99, 'Cuadro-Duki-1.png', 'Cuadro'),
(51, 1, 'Portada Vinilo AMERI', 'Diseño de portada del álbum AMERI con Duki cayendo.', 79.99, 'Vinilo-Duki-4.png', 'Vinilo'),
(52, 1, 'Portada Vinilo Antes de Ameri', 'Diseño de portada del álbum Antes de Ameri (Planeta, Rayo Láser).', 79.99, 'Vinilo-Duki-7.png', 'Vinilo'),
(53, 1, 'Portada Vinilo Desde el Fin del Mundo', 'Diseño de portada del álbum Desde el Fin del Mundo (Mapa dibujado).', 79.99, 'Vinilo-Duki-5.jpg', 'Vinilo'),
(54, 1, 'Portada Vinilo 5202 (Mixtape)', 'Diseño de portada del Mixtape 5202 (Efecto Glitch, Códigos).', 79.99, 'Vinilo-Duki-3.png', 'Vinilo'),
(55, 1, 'Portada Vinilo Súper Sangre Joven', 'Diseño de portada del álbum Súper Sangre Joven (Estilo Dragon Ball).', 79.99, 'Vinilo-Duki-2.jpg', 'Vinilo'),
(56, 1, 'Sticker Duki Holográfico', 'Sticker con retrato de Duki en acabado iridiscente/holográfico.', 19.99, 'sticker-duki-2.jpg', 'Sticker'),
(57, 1, 'Sticker Duki Retrato', 'Sticker con retrato a color de Duki (Camisa negra).', 19.99, 'sticker-duki-3.jpg', 'Sticker'),
(58, 1, 'Llavero Logo Duki', 'Llavero metálico con el diseño del logo geométrico de Duki.', 29.99, 'Llavero-Duki-1.png', 'Llavero'),
(77, 5, 'Remera de C.R.O', 'Nirvana', 20.00, '../src/img/Remera-cro-nirvana.png', 'Remera'),
(78, 5, 'Remera de C.R.O', 'Alas', 20.00, '../src/img/Remera-cro-alas.png', 'Remera'),
(79, 5, 'Remera de C.R.O', 'Fuck love', 20.00, '../src/img/Remera-cro-fucklove.png', 'Remera'),
(80, 5, 'Remera de C.R.O', 'Tiempo', 20.00, '../src/img/Remera-cro-tiempo.png', 'Remera'),
(81, 5, 'Remera de C.R.O', 'Cara', 20.00, '../src/img/Remera-cro-cara.png', 'Remera'),
(82, 5, 'Remera de C.R.O', 'Gris', 20.00, '../src/img/Remera-cro-gris.png', 'Remera'),
(83, 5, 'Remera de C.R.O', 'Trucha', 20.00, '../src/img/Remera-cro-trucha.png', 'Remera'),
(84, 5, 'Remera de C.R.O', 'Mujer', 20.00, '../src/img/Remera-cro-mujer.png', 'Remera'),
(85, 5, 'Remera de C.R.O', 'Emo', 20.00, '../src/img/Remera-cro-emo.png', 'Remera'),
(86, 5, 'Cadena de C.R.O.', 'Alas', 10.00, '../src/img/Cadena-cro-alas.png', 'Accesorios'),
(87, 5, 'Cadena de C.R.O.', 'Logo C.R.O.', 10.00, '../src/img/Cadena-cro-cro.png', 'Accesorios'),
(88, 5, 'Vinilo de C.R.O.', 'Leyendas de la Noche', 80.00, '../src/img/Vinilo-cro-leyendasdelanoche.png', 'Accesorios'),
(89, 5, 'Vinilo de C.R.O.', 'Cápsula', 10.00, '../src/img/Vinilo-cro-capsula.png', 'Accesorios'),
(90, 5, 'Vinilo de C.R.O.', 'Mal de la Cabeza', 80.00, '../src/img/Vinilo-cro-maldelacabeza.png', 'Accesorios'),
(91, 5, 'Cuadro de C.R.O.', 'MDB Vol 1', 30.00, '../src/img/Cuadro-cro-mdbvol1.png', 'Accesorios'),
(92, 5, 'Vinilo de C.R.O.', 'Gedientos', 80.00, '../src/img/Vinilo-cro-gedientos.png', 'Accesorios'),
(93, 5, 'Cuadro de C.R.O.', 'Cápsula', 30.00, '../src/img/Cuadro-cro-capsula.png', 'Accesorios'),
(94, 5, 'Cuadro de C.R.O.', 'Temor', 30.00, '../src/img/Cuadro-cro-temor.png', 'Accesorios'),
(95, 5, 'Cuadro de C.R.O.', '542', 30.00, '../src/img/Cuadro-cro-542.png', 'Accesorios'),
(96, 5, 'Sticker de C.R.O.', 'Blanco', 1.00, '../src/img/Sticker-cro-blanco.png', 'Accesorios'),
(97, 5, 'Sticker de C.R.O.', 'Barderos X M.D.B', 1.00, '../src/img/Sticker-cro-barderosxmdb.png', 'Accesorios'),
(98, 5, 'Medias de C.R.O.', 'Medias', 10.00, '../src/img/Medias-cro-medias.png', 'Accesorios'),
(99, 5, 'Sticker de C.R.O.', 'Animado', 1.00, '../src/img/Sticker-cro-animado.png', 'Accesorios'),
(100, 2, 'Remera de YSY A', 'Ysysmo', 20.00, '../src/img/Remera-ysy-ysysmo.png', 'Remeras'),
(101, 2, 'Remera de YSY A', 'Dúo Favorito', 20.00, '../src/img/Remera-ysy-duo.png', 'Remeras'),
(102, 2, 'Remera de YSY A', 'Boxy Fit', 20.00, '../src/img/Remera-ysy-boxyfit.png', 'Remeras'),
(103, 2, 'Remera de YSY A', 'Overside', 20.00, '../src/img/Remera-ysy-overside.png', 'Remeras'),
(104, 2, 'Remera de YSY A', 'Gris', 20.00, '../src/img/Remera-ysy-gris.png', 'Remeras'),
(105, 2, 'Remera de YSY A', 'Money', 20.00, '../src/img/Remera-ysy-money.png', 'Remeras'),
(106, 2, 'Remera de YSY A', 'Flow Infarto (c/ Bizarrap)', 20.00, '../src/img/Remera-ysy-flowinfarto.png', 'Remeras'),
(107, 2, 'Cadena de YSY A', 'Sponsor dios', 10.00, '../src/img/Cadena-ysy-Sponsordios.png', 'Accesorios'),
(108, 2, 'Cadena de YSY A', 'Logo 56cm', 10.00, '../src/img/Cadena-ysy-56cm.png', 'Accesorios'),
(109, 2, 'Anillo de YSY A', 'Sponsor dios', 15.00, '../src/img/Anillo-ysy-sponsordios.png', 'Accesorios'),
(120, 2, 'Vinilo de YSY A', 'Mordiendo el Bozal', 80.00, '../src/img/Vinilo-ysy-mordiendoelbozal.png', 'Accesorios'),
(121, 2, 'Vinilo de YSY A', 'Trap de Verdad', 80.00, '../src/img/Vinilo-ysy-trapdeverdad.png', 'Accesorios'),
(122, 2, 'Vinilo de YSY A', 'Antezana 247', 80.00, '../src/img/Vinilo-ysy-antezana247.png', 'Accesorios'),
(123, 2, 'Vinilo de YSY A', 'Ysysmo', 80.00, '../src/img/Vinilo-ysy-ysysmo.png', 'Accesorios'),
(124, 2, 'Vinilo de YSY A', 'Full Ice', 80.00, '../src/img/Vinilo-ysy-fullice.png', 'Accesorios'),
(125, 2, 'Sticker de YSY A', 'Lenguitaa', 1.00, '../src/img/Sticker-ysy-lenguitaa.png', 'Accesorios'),
(126, 2, 'Sticker de YSY A', 'Plastificado', 1.00, '../src/img/Sticker-ysy-plastificado.png', 'Accesorios'),
(127, 2, 'Sticker de YSY A', 'Ysysmo', 1.00, '../src/img/Sticker-ysy-ysysmo.png', 'Accesorios'),
(128, 2, 'Sticker de YSY A', 'Ysysmo', 1.00, '../src/img/Sticker-ysy-ysysmo2.png', 'Accesorios'),
(129, 2, 'Gorra Pilusa de YSY A', 'Ysysmo', 10.00, '../src/img/Pilusa-ysy-ysysmo.png', 'Accesorios'),
(130, 2, 'Cuadro de YSY A', 'Antezana 247', 30.00, '../src/img/Cuadro-ysy-antezana247.png', 'Accesorios'),
(131, 2, 'Cuadro de YSY A', 'Mordiendo el Bozal', 30.00, '../src/img/Cuadro-ysy-moridiendoelbozal.png', 'Accesorios'),
(132, 2, 'Cuadro de YSY A', 'Trampa al Tiempo', 30.00, '../src/img/Cuadro-ysy-trampaaltiempo.png', 'Accesorios'),
(133, 2, 'Peluche de YSY A', 'Viejo Verde', 25.00, '../src/img/Peluche-ysy-viejoverde.png', 'Accesorios'),
(134, 3, 'Remera de Trueno', 'Campeón FMS', 20.00, '../src/img/Remera-trueno-fms.png', 'Remeras'),
(135, 3, 'Remera de Trueno', 'Logo Gris', 20.00, '../src/img/Remera-trueno-gris.png', 'Remeras'),
(136, 3, 'Remera de Trueno', 'Boca Juniors', 20.00, '../src/img/Remera-trueno-boca.png', 'Remeras'),
(137, 3, 'Remera de Trueno', 'Atrevido', 20.00, '../src/img/Remera-trueno-atrevido.png', 'Remeras'),
(138, 3, 'Remera de Trueno', 'Bien o mal', 20.00, '../src/img/Remera-trueno-bnomal.png', 'Remeras'),
(139, 3, 'Remera de Trueno', 'Boca Vintage', 20.00, '../src/img/Remera-trueno-bocavintage.png', 'Remeras'),
(150, 7, 'Buzo de Milo j', 'Overside', 30.00, '../src/img/Buzo-Miloj-overside.png', 'Buzos'),
(151, 7, 'Remera de Milo j', 'Overside', 20.00, '../src/img/Remera-Miloj-overside.png', 'Remeras'),
(152, 7, 'Remera de Milo j', '166', 20.00, '../src/img/Remera-Miloj-166.png', 'Remeras'),
(153, 7, 'Remera de Milo j', 'Morón', 20.00, '../src/img/Remera-Miloj-moron.png', 'Remeras'),
(154, 7, 'Remera de Milo j', 'Argentina', 20.00, '../src/img/Remera-Miloj-argentina.png', 'Remeras'),
(155, 7, 'Remera de Milo j', '111', 20.00, '../src/img/Remera-Miloj-111.png', 'Remeras'),
(156, 7, 'Remera de Milo j', 'Boxy Fit', 20.00, '../src/img/Remera-miloj-boxyfit.png', 'Remeras'),
(157, 7, 'Gorra de Milo j', 'Contorno Blanco', 10.00, '../src/img/Gorra-miloj-blanco.png', 'Accesorios'),
(158, 7, 'Pantalon de Milo j', 'Negro', 25.00, '../src/img/Pantalon-Miloj-negro.png', 'Accesorios'),
(159, 7, 'Medias de Milo j', 'Mierda', 10.00, '../src/img/Medias-miloj-mierda.png', 'Accesorios'),
(160, 7, 'Buzo de Milo j', '511', 30.00, '../src/img/Buzo-miloj-511.png', 'Buzos'),
(161, 7, 'Vinilo de Milo j', '166', 80.00, '../src/img/Vinilo-miloj-166.png', 'Accesorios'),
(162, 7, 'Vinilo de Milo j', '511', 80.00, '../src/img/Vinilo-miloj-511.png', 'Accesorios'),
(163, 7, 'Vinilo de Milo j', 'En Dormir Sin Madrid', 80.00, '../src/img/Vinilo-miloj-endormirsinmadrid.png', 'Accesorios'),
(164, 7, 'Vinilo de Milo j', 'La Vida Era Más Corta', 80.00, '../src/img/Vinilo-miloj-lavidaeramascorta.png', 'Accesorios'),
(165, 7, 'Vinilo de Milo j', '166 Deluxe', 80.00, '../src/img/Vinilo-miloj-166deluxe.png', 'Accesorios'),
(166, 7, 'Gorra de Milo j', '111', 10.00, '../src/img/Gorra-miloj-111.png', 'Accesorios'),
(167, 7, 'Cadena de Milo j', '111', 10.00, '../src/img/Cadena-miloj-111.png', 'Accesorios'),
(168, 7, 'Vinilo de Milo j', '111', 80.00, '../src/img/Vinilo-miloj-111.png', 'Accesorios'),
(169, 7, 'Sticker de Milo j', 'Ahora Estoy en el Mic', 1.00, '../src/img/Sticker-miloj-ahoraestoyenelmic.png', 'Accesorios'),
(170, 7, 'Sticker de Milo j', '166', 1.00, '../src/img/Sticker-miloj-166.png', 'Accesorios'),
(171, 7, 'Sticker de Milo j', 'Mil Ojotas', 1.00, '../src/img/Sticker-miloj-milojotas.png', 'Accesorios'),
(172, 7, 'Sticker de Milo j', '111', 1.00, '../src/img/Sticker-miloj-111.png', 'Accesorios'),
(173, 7, 'Sticker de Milo j', 'Love', 1.00, '../src/img/SSticker-miloj-love.png', 'Accesorios'),
(174, 4, 'Remera de Neo Pistea', 'Retrato', 20.00, '../src/img/Remera-Neo-cara.png', 'Remeras'),
(175, 4, 'Remera de Neo Pistea', 'Culto', 20.00, '../src/img/Remera-Neo-Culto.png', 'Remeras'),
(176, 4, 'Remera de Neo Pistea', 'Neo Diablo', 20.00, '../src/img/Remera-Neo-NeoDiablo.png', 'Remeras'),
(177, 4, 'Remera de Neo Pistea', 'Overside', 20.00, '../src/img/Remera-Neo-overside.png', 'Remeras'),
(178, 10, 'Remera de Wos', 'BoxyFit', 20.00, '../src/img/Ropa-Wos-BoxyFit.png', 'Remeras'),
(179, 10, 'Remera de Wos', 'Overside4', 20.00, '../src/img/Remera-Wos-Overside4.png', 'Remeras'),
(180, 10, 'Remera de Wos', 'x3', 20.00, '../src/img/Remera-Wos-x3.png', 'Remeras'),
(181, 10, 'Remera de Wos', 'Cara', 20.00, '../src/img/Remera-Wos-Cara.png', 'Remeras'),
(182, 10, 'Remera de Wos', 'Escenario', 20.00, '../src/img/Remera-Wos-Escenario.png', 'Remeras'),
(183, 10, 'Remera de Wos', 'Negro', 20.00, '../src/img/Remera-Wos-Negro.png', 'Remeras'),
(184, 10, 'Remera de Wos', 'OscuroExtasis', 20.00, '../src/img/Remera-Wos-OscuroExtasis.png', 'Remeras'),
(185, 10, 'Remera de Wos', 'Overside', 20.00, '../src/img/Remera-Wos-Overside.png', 'Remeras'),
(186, 10, 'Remera de Wos', 'Overside2', 20.00, '../src/img/Remera-Wos-Overside2.png', 'Remeras'),
(187, 10, 'Remera de Wos', 'Overside3', 20.00, '../src/img/Remera-Wos-Overside3.png', 'Remeras'),
(188, 10, 'Buzo de Wos', 'buzo-wos', 50.00, '../src/img/buzo-wos.png', 'Buzos'),
(189, 10, 'Buzo de Wos', 'buzo-wos2', 50.00, '../src/img/buzo-wos2.png', 'Buzos'),
(190, 4, 'Cuadro de Neo Pistea', 'punkdemia', 30.00, '../src/img/Cuadro-neo-punkdemia.png', 'Accesorios'),
(191, 4, 'Cuadro de Neo Pistea', 'culto', 30.00, '../src/img/Cuadro-neo-culto.png', 'Accesorios'),
(192, 4, 'Cuadro de Neo Pistea', 'culto2', 30.00, '../src/img/Cuadro-neo-culto2.png', 'Accesorios'),
(193, 4, 'Vinilo de Neo Pistea', 'tumbandoelclub', 80.00, '../src/img/Vinilo-neo-tumbandoelclub.png', 'Accesorios'),
(194, 4, 'Vinilo de Neo Pistea', 'culto', 80.00, '../src/img/Vinilo-neo-culto.png', 'Accesorios'),
(195, 4, 'Vinilo de Neo Pistea', 'culto2', 80.00, '../src/img/Vinilo-neo-culto2.png', 'Accesorios'),
(196, 4, 'Vinilo de Neo Pistea', 'neo', 80.00, '../src/img/Vinilo-neo-neo.png', 'Accesorios'),
(197, 4, 'Vinilo de Neo Pistea', 'punkdemia', 80.00, '../src/img/Vinilo-neo-punkdemia.png', 'Accesorios'),
(198, 4, 'Cadena de Neo Pistea', 'culto', 10.00, '../src/img/Cadena-neo-culto.png', 'Accesorios'),
(199, 4, 'Almohada de Neo Pistea', 'jesus', 12.00, '../src/img/Almohada-neo-jesus.png', 'Accesorios'),
(205, 3, 'Remera de Trueno', 'feelme', 20.00, '../src/img/Remera-trueno-feelme.png', 'Remeras'),
(208, 3, 'Remera de Trueno', 'EUBdeluxe', 20.00, '../src/img/Remera-trueno-EUBdeluxe.png', 'Remeras'),
(209, 3, 'Remera de Trueno', 'Salamandra', 20.00, '../src/img/Remera-trueno-Salamandra.png', 'Remeras'),
(210, 3, 'Remera de Trueno', 'Salamandra', 20.00, '../src/img/Remera-trueno-Salamandra.png', 'Remeras'),
(211, 3, 'Gorra de Trueno', 'pai', 1.00, '../src/img/Gorra-trueno-pai.png', 'Accesorios'),
(212, 3, 'Vinilo de Trueno', 'ultimobaile', 80.00, '../src/img/Vinilo-Trueno-ultimobaile.png', 'Accesorios'),
(213, 3, 'Vinilo de Trueno', 'atrevido', 80.00, '../src/img/Vinilo-Trueno-atrevido.png', 'Accesorios'),
(214, 3, 'Vinilo de Trueno', 'bienomal', 80.00, '../src/img/Vinilo-Trueno-bienomal.png', 'Accesorios'),
(215, 3, 'Vinilo de Trueno', 'Feelme', 80.00, '../src/img/Vinilo-Trueno-Feelme.png', 'Accesorios'),
(216, 3, 'Vinilo de Trueno', 'mafiesto', 80.00, '../src/img/Vinilo-Trueno-mafiesto.png', 'Accesorios'),
(217, 3, 'Cuadro de Trueno', 'Ultimobaile', 30.00, '../src/img/Cuadro-Trueno-Ultimobaile.png', 'Accesorios'),
(218, 3, 'Cuadro de Trueno', 'Bien o mal', 30.00, '../src/img/Cuadro-Trueno-Bien o mal.png', 'Accesorios'),
(219, 3, 'Cadena de Trueno', 'pai', 10.00, '../src/img/Cadena-Trueno-pai.png', 'Accesorios'),
(220, 3, 'Sticker de Trueno', 'elultimobaile', 1.00, '../src/img/Sticker-trueno-elultimobaile.png', 'Accesorios'),
(221, 3, 'Sticker de Trueno', 'gangstalove', 1.00, '../src/img/Sticker-trueno-gangstalove.png', 'Accesorios'),
(222, 3, 'Sticker de Trueno', 'pai', 1.00, '../src/img/Sticker-trueno-pai.png', 'Accesorios'),
(223, 3, 'Sticker de Trueno', 'pai2', 1.00, '../src/img/Sticker-trueno-pai2.png', 'Accesorios'),
(224, 3, 'Pack de Trueno', 'pai', 1.00, '../src/img/Pack-trueno-pai.png', 'Accesorios'),
(225, 6, 'Remera de Khea', 'overside1', 20.00, '../src/img/Remera-Khea-overside1.png', 'Remeras'),
(226, 6, 'Remera de Khea', 'trapicheo', 20.00, '../src/img/Remera-Khea-trapicheo.png', 'Remeras'),
(227, 6, 'Remera de Khea', 'Violeta', 20.00, '../src/img/Remera-Khea-Violeta.png', 'Remeras'),
(228, 6, 'Remera de Khea', 'BoxyFit', 20.00, '../src/img/Remera-Khea-BoxyFit.png', 'Remeras'),
(229, 6, 'Remera de Khea', 'buho', 20.00, '../src/img/Remera-Khea-buho.png', 'Remeras'),
(230, 6, 'Remera de Khea', 'overside', 20.00, '../src/img/Remera-Khea-overside.png', 'Remeras'),
(231, 6, 'Vinilo de Khea', '100mg', 80.00, '../src/img/Vinilo-khea-100mg.png', 'Accesorios'),
(232, 6, 'Vinilo de Khea', 'B.U.H.O', 80.00, '../src/img/Vinilo-khea-B.U.H.O.png', 'Accesorios'),
(233, 6, 'Vinilo de Khea', 'eldon', 80.00, '../src/img/Vinilo-khea-eldon.png', 'Accesorios'),
(234, 6, 'Vinilo de Khea', 'serotonina(delux)', 80.00, '../src/img/Vinilo-khea-serotonina(delux).png', 'Accesorios'),
(235, 6, 'Vinilo de Khea', 'serotonina', 80.00, '../src/img/Vinilo-khea-serotonina.png', 'Accesorios'),
(236, 6, 'Vinilo de Khea', 'trapicheo', 80.00, '../src/img/Vinilo-khea-trapicheo.png', 'Accesorios'),
(237, 6, 'Cuadro de Khea', 'eldon', 30.00, '../src/img/Cuadro-Khea-eldon.png', 'Accesorios'),
(238, 6, 'Cuadro de Khea', 'serotonina', 30.00, '../src/img/Cuadro-Khea-serotonina.png', 'Accesorios'),
(239, 6, 'Cuadro de Khea', 'trapicheo', 30.00, '../src/img/Cuadro-Khea-trapicheo.png', 'Accesorios'),
(240, 6, 'Cuadro de Khea', 'bzrpsession', 30.00, '../src/img/Cuadro-Khea-bzrpsession.png', 'Accesorios'),
(241, 6, 'Cadena de Khea', 'anashei', 10.00, '../src/img/Cadena-khea-anashei.png', 'Accesorios'),
(242, 6, 'Gorro de Khea', 'negro', 10.00, '../src/img/Gorro-khea-negro.png', 'Accesorios'),
(243, 8, 'Remera de Barderos', 'mujer', 20.00, '../src/img/Remera-barderos-mujer.png', 'Remeras'),
(244, 8, 'Remera de Barderos', 'negra', 20.00, '../src/img/Remera-barderos-negra.png', 'Remeras'),
(245, 8, 'Buzo de Barderos', 'puredrug', 50.00, '../src/img/Buzo-barderos-puredrug.png', 'Buzos'),
(246, 8, 'Gorra de Barderos', 'negra', 10.00, '../src/img/Gorra-barderos-negra.png', 'Accesorios'),
(247, 8, 'Gorro de Barderos', 'negro', 10.00, '../src/img/Gorro-Barderos-negro.png', 'Accesorios'),
(248, 8, 'Medias de Barderos', 'Negras', 10.00, '../src/img/Medias-Barderos-Negras.png', 'Accesorios'),
(249, 8, 'Medias de Barderos', 'Blancas', 10.00, '../src/img/Medias-Barderos-Blancas.png', 'Accesorios'),
(250, 8, 'Vinilo de Barderos', 'Ahoraesreligion', 80.00, '../src/img/Vinilo-barderos-Ahoraesreligion.png', 'Accesorios'),
(251, 8, 'Vinilo de Barderos', 'inmortales', 80.00, '../src/img/Vinilo-barderos-inmortales.png', 'Accesorios'),
(252, 8, 'Vinilo de Barderos', 'PureDrug', 80.00, '../src/img/Vinilo-barderos-PureDrug.png', 'Accesorios'),
(253, 8, 'Sticker de Barderos', 'plastificado', 1.00, '../src/img/Sticker-barderos-plastificado.png', 'Accesorios'),
(254, 9, 'Remera de Modo Diablo', 'Trio', 20.00, '../src/img/Ropa-MD-Trio.png', 'Remeras'),
(255, 9, 'Remera de Modo Diablo', 'trio2', 20.00, '../src/img/Ropa-MD-trio2.png', 'Remeras'),
(256, 9, 'Vinilo de Modo Diablo', 'quavo', 80.00, '../src/img/Vinilo-mododiablo-quavo.png', 'Accesorios'),
(257, 9, 'Vinilo de Modo Diablo', 'todonegro', 80.00, '../src/img/Vinilo-mododiablo-todonegro.png', 'Accesorios'),
(258, 9, 'Vinilo de Modo Diablo', 'trapnsport', 80.00, '../src/img/Vinilo-mododiablo-trapnsport.png', 'Accesorios'),
(259, 9, 'Vinilo de Modo Diablo', 'tumbandoelclub', 80.00, '../src/img/Vinilo-mododiablo-tumbandoelclub.png', 'Accesorios'),
(260, 9, 'Vinilo de Modo Diablo', 'Uh', 80.00, '../src/img/Vinilo-mododiablo-Uh.png', 'Accesorios'),
(261, 9, 'Vinilo de Modo Diablo', 'vueltaalaluna', 80.00, '../src/img/Vinilo-mododiablo-vueltaalaluna.png', 'Accesorios'),
(262, 9, 'Vinilo de Modo Diablo', 'laclase', 80.00, '../src/img/Vinilo-mododiablo-laclase.png', 'Accesorios'),
(263, 9, 'Cuadro de Modo Diablo', 'skere', 30.00, '../src/img/Cuadro-mododiablo-skere.png', 'Accesorios'),
(264, 9, 'Cuadro de Modo Diablo', 'antezana247', 30.00, '../src/img/Cuadro-mododiablo-antezana247.png', 'Accesorios'),
(265, 9, 'Gorro de Modo Diablo', 'fuck', 10.00, '../src/img/Gorro-mododiablo-fuck.png', 'Accesorios'),
(266, 10, 'Sticker de Wos', 'anashe', 1.00, '../src/img/Sticker-wos-anashe.png', 'Accesorios'),
(267, 10, 'Sticker de Wos', 'caravana', 1.00, '../src/img/Sticker-wos-caravana.png', 'Accesorios'),
(268, 10, 'Sticker de Wos', 'edgy', 1.00, '../src/img/Sticker-wos-edgy.png', 'Accesorios'),
(269, 10, 'Sticker de Wos', 'oscuroextasis', 1.00, '../src/img/Sticker-wos-oscuroextasis.png', 'Accesorios'),
(270, 10, 'Vinilo de Wos', 'trespuntossuspensivos', 80.00, '../src/img/Vinilo-wos-trespuntossuspensivos.png', 'Accesorios'),
(271, 10, 'Vinilo de Wos', 'caravana', 80.00, '../src/img/Vinilo-wos-caravana.png', 'Accesorios'),
(272, 10, 'Vinilo de Wos', 'conciertoenracing', 80.00, '../src/img/Vinilo-wos-conciertoenracing.png', 'Accesorios'),
(273, 10, 'Vinilo de Wos', 'descartable', 80.00, '../src/img/Vinilo-wos-descartable.png', 'Accesorios'),
(274, 10, 'Vinilo de Wos', 'oscuroextasis', 80.00, '../src/img/Vinilo-wos-oscuroextasis.png', 'Accesorios'),
(275, 10, 'Cuadro de Wos', 'oscuroextasis', 30.00, '../src/img/cuadro-wos-oscuroextasis.png', 'Accesorios'),
(276, 10, 'Cuadro de Wos', 'caravana', 30.00, '../src/img/cuadro-wos-caravana.png', 'Accesorios'),
(277, 10, 'Cuadro de Wos', 'descartable', 30.00, '../src/img/cuadro-wos-descartable.png', 'Accesorios');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id_usuario` int(11) NOT NULL,
  `nombre_usuario` varchar(50) NOT NULL,
  `correo` varchar(100) NOT NULL,
  `contrasena` varchar(255) NOT NULL,
  `provincia` varchar(100) DEFAULT NULL,
  `ciudad` varchar(100) DEFAULT NULL,
  `codigo_postal` varchar(20) DEFAULT NULL,
  `calle` varchar(120) DEFAULT NULL,
  `numero` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id_usuario`, `nombre_usuario`, `correo`, `contrasena`, `provincia`, `ciudad`, `codigo_postal`, `calle`, `numero`) VALUES
(1, 'CRO', 'CRO@gmail.com', 'cro', 'CABA', 'Buenos Aires', '1428', 'Jujuy', '255'),
(7, 'luciano', 'ferrari@gmail', 'cabral', NULL, NULL, NULL, NULL, NULL);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `artistas`
--
ALTER TABLE `artistas`
  ADD PRIMARY KEY (`id_artista`);

--
-- Indices de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  ADD PRIMARY KEY (`id_pedido`),
  ADD KEY `id_usuario` (`id_usuario`);

--
-- Indices de la tabla `pedido_detalle`
--
ALTER TABLE `pedido_detalle`
  ADD PRIMARY KEY (`id_detalle`),
  ADD KEY `id_pedido` (`id_pedido`),
  ADD KEY `id_producto` (`id_producto`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`id_producto`),
  ADD KEY `id_artista` (`id_artista`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id_usuario`),
  ADD UNIQUE KEY `nombre_usuario` (`nombre_usuario`),
  ADD UNIQUE KEY `correo` (`correo`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `artistas`
--
ALTER TABLE `artistas`
  MODIFY `id_artista` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  MODIFY `id_pedido` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `pedido_detalle`
--
ALTER TABLE `pedido_detalle`
  MODIFY `id_detalle` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `id_producto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=278;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `pedidos`
--
ALTER TABLE `pedidos`
  ADD CONSTRAINT `pedidos_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`);

--
-- Filtros para la tabla `pedido_detalle`
--
ALTER TABLE `pedido_detalle`
  ADD CONSTRAINT `pedido_detalle_ibfk_1` FOREIGN KEY (`id_pedido`) REFERENCES `pedidos` (`id_pedido`) ON DELETE CASCADE,
  ADD CONSTRAINT `pedido_detalle_ibfk_2` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id_producto`);

--
-- Filtros para la tabla `productos`
--
ALTER TABLE `productos`
  ADD CONSTRAINT `productos_ibfk_1` FOREIGN KEY (`id_artista`) REFERENCES `artistas` (`id_artista`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
