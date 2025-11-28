<?php
session_start();
require_once "../includes/conexion.php";

if (!isset($_SESSION['id_usuario'])) {
    header("Location: Profile.php");
    exit();
}

$idUser = $_SESSION['id_usuario'];

$sql = "UPDATE usuarios SET 
            provincia = NULL,
            ciudad = NULL,
            codigo_postal = NULL,
            calle = NULL,
            numero = NULL
        WHERE id_usuario = $idUser";

if ($conexion->query($sql)) {
    $_SESSION["mensaje"] = "Dirección eliminada correctamente.";
} else {
    $_SESSION["error"] = "Hubo un problema al eliminar la dirección.";
}

header("Location: Profile.php?edit=1");
exit();
?>