<?php
$host = "localhost";
$usuario = "root";
$clave = "";
$base = "tienda";

$conexion = new mysqli($host, $usuario, $clave, $base);

if ($conexion->connect_error) {
    die("Error de conexión a la base de datos: " . $conexion->connect_error);
}

$conexion->set_charset("utf8");

?>