-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 12-11-2025 a las 01:20:10
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
(12, 9, 'Remera de Modo Diablo', 'Guapo', 20.00, '../src/img/ropa-MD-7.png', 'Remeras');

--
-- Índices para tablas volcadas
--

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
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `id_producto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

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
