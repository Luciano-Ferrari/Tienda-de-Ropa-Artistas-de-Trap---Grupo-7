-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 26-11-2025 a las 05:01:11
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

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
(4, 'Neo Pistea', '../src/img/Duki.png'),
(5, 'C.R.O.', '../src/img/CRO.jpg'),
(6, 'Khea', 'HTML'),
(7, 'Milo j', NULL),
(8, 'Barderos', '../src/img/Duki.png'),
(9, 'Modo Diablo', '../src/img/ModoDiablo.png'),
(10, 'Wos', '../src/img/Wos.png');

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
(68, 9, 'Remera Chain Roquero (Duki x C.R.O.)', 'Remera negra con el diseño de la portada del single \"Mi Chain de Roque\" (Duki x C.R.O.).', 59.99, 'Remera-cro-chainroque.png', 'Remera'),
(69, 9, 'Remera Fuck Luv (Duki x C.R.O.)', 'Remera negra con el diseño de la portada del single \"Fuck Luv\" (Duki x C.R.O.), diseño glitch.', 59.99, 'Remera-cro-fucklove.jpg', 'Remera'),
(70, 9, 'Remera Retrato C.R.O. (Gorro)', 'Remera negra oversized con retrato en blanco y negro de C.R.O. con gorro.', 64.99, 'Remera-cro-cara.jpg', 'Remera'),
(71, 9, 'Remera Retrato C.R.O. (Gris)', 'Remera gris con foto de C.R.O. en musculosa y gorra.', 64.99, 'Remera-cro-gris.png', 'Remera'),
(72, 9, 'Remera Retrato C.R.O. (Tiempo)', 'Remera negra con retrato en blanco y negro de C.R.O. fumando y usando gorra.', 59.99, 'Remera-cro-tiempo.png', 'Remera'),
(73, 9, 'Remera C.R.O. Alas', 'Remera negra con logo \"C.R.O.\" blanco, alas de demonio y halo.', 54.99, 'Remera-cro-alas.png', 'Remera'),
(74, 9, 'Remera C.R.O. Trucha (Logo Cadena)', 'Remera negra con diseño de cadena y dije de logo \"C.R.O.\" alado.', 54.99, 'Remera-cro-trucha.png', 'Remera'),
(75, 9, 'Crop Top C.R.O. Luna', 'Remera corta para mujer con diseño de luna y estrellas \"C.R.O.\". ', 49.99, 'Remera-cro-mujer.png', 'Remera'),
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
(139, 3, 'Remera de Trueno', 'Boca Vintage', 20.00, '../src/img/Remera-trueno-bocavintage.png', 'Remeras');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `artistas`
--
ALTER TABLE `artistas`
  ADD PRIMARY KEY (`id_artista`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`id_producto`),
  ADD KEY `id_artista` (`id_artista`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `artistas`
--
ALTER TABLE `artistas`
  MODIFY `id_artista` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `id_producto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=140;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `productos`
--
ALTER TABLE `productos`
  ADD CONSTRAINT `productos_ibfk_1` FOREIGN KEY (`id_artista`) REFERENCES `artistas` (`id_artista`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
