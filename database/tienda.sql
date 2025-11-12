-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 12, 2025 at 08:52 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `tienda`
--

-- --------------------------------------------------------

--
-- Table structure for table `productos`
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
-- Dumping data for table `productos`
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
(22, 1, 'Remera de C.R.O', 'Mi Chain de Roque', 20.00, '../src/img/ropa-Duki-1.png', 'Remeras'),
(23, 1, 'Vinilo de Duki', 'Ameri', 80.00, '../src/img/Vinilo-Duki-4.png', 'Accesorios'),
(24, 1, 'Cuadro de Duki', '24', 30.00, '../src/img/Cuadro-Duki-2.png', 'Accesorios'),
(25, 1, 'Remera de Duki', 'Negro', 30.00, '../src/img/ropa-Duki-7.png', 'Remeras'),
(26, 1, 'Remera Duki Tour', 'Negra Boxy', 30.00, '../src/img/ropa-Duki-6.png', 'Remeras'),
(27, 1, 'Remera Duki X YSY A', 'Corte Clásico', 35.00, '../src/img/ropa-Duki-5.png', 'Remeras'),
(28, 1, 'Remera Duki \"Goteo\" Gris', 'Corte Raglan', 30.00, '../src/img/ropa-Duki-4.png', 'Remeras'),
(29, 1, 'Remera Duki Logo Clásico', 'Boxy Fit', 30.00, '../src/img/ropa-Duki-3.png', 'Remeras'),
(30, 1, 'Remera Duki \"Ameri\"', 'Oversize Negra', 35.00, '../src/img/ropa-Duki-2.png', 'Remeras'),
(31, 1, 'Sticker Duki Logo', 'Pack de 5', 2.00, '../src/img/sticker-duki-3.png', 'Accesorios'),
(32, 1, 'Vinilo Duki \"Temporada de Reggaeton\"', 'Doble LP', 90.00, '../src/img/Vinilo-Duki-7.png', 'Accesorios'),
(33, 1, 'Vinilo Duki \"Super Sangre Joven\"', 'LP Colores', 90.00, '../src/img/Vinilo-Duki-5.png', 'Accesorios'),
(34, 1, 'Sticker Duki \"Jesus\"', 'Vinilo', 1.00, '../src/img/sticker-duki-2.png', 'Accesorios'),
(35, 1, 'Cuadro Duki \"Antes de Ameri\"', 'Canvas 40x40', 45.00, '../src/img/Cuadro-Duki-3.png', 'Accesorios'),
(36, 1, 'Llavero Duki Logo', 'Metal 3D', 8.00, '../src/img/Llavero-Duki-1.png', 'Accesorios'),
(37, 1, 'Remera de Duki ', '5202', 20.00, '../src/img/ropa-Duki-7.png', 'Remeras'),
(38, 1, 'Remera de Duki', 'Super Sangre Joven', 20.00, '../src/img/ropa-Duki-6.png', 'Remeras'),
(39, 1, 'Remera de Duki', 'Ameri Azul', 20.00, '../src/img/ropa-Duki-5.png', 'Remeras'),
(40, 1, 'Remera de Duki', 'Rockstar', 20.00, '../src/img/ropa-Duki-4.png', 'Remeras'),
(41, 1, 'Remera de Duki', 'Negro', 20.00, '../src/img/ropa-Duki-3.png', 'Remeras'),
(42, 1, 'Remera de Duki', 'Gris', 20.00, '../src/img/ropa-Duki-2.png', 'Remeras'),
(43, 1, 'Sticker de Duki', 'PLastificado', 1.00, '../src/img/sticker-duki-2.png', 'Accesorios'),
(44, 1, 'Sticker de Duki', 'PLastificado', 1.00, '../src/img/sticker-duki-3.png', 'Accesorios'),
(45, 1, 'Vinilo de Duki', 'Antes de Ameri', 80.00, '../src/img/Vinilo-Duki-7.png', 'Accesorios'),
(46, 1, 'Vinilo de Duki', 'Desde el Fin del Mundo', 80.00, '../src/img/Vinilo-Duki-5.png', 'Accesorios'),
(47, 1, 'Cuadro de Duki', 'Ameri', 30.00, '../src/img/Cuadro-Duki-3.png', 'Accesorios'),
(48, 1, 'Llavero Duki', 'Ameri', 8.00, '../src/img/Llavero-Duki-1.png', 'Accesorios');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`id_producto`),
  ADD KEY `id_artista` (`id_artista`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `productos`
--
ALTER TABLE `productos`
  MODIFY `id_producto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `productos`
--
ALTER TABLE `productos`
  ADD CONSTRAINT `productos_ibfk_1` FOREIGN KEY (`id_artista`) REFERENCES `artistas` (`id_artista`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
