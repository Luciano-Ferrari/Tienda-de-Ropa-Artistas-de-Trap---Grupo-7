<?php
session_start();

if (!isset($_POST["carrito"])) {
    echo "error";
    exit;
}

$carrito = json_decode($_POST["carrito"], true);

$_SESSION["carrito"] = $carrito;

echo "ok";
?>
