<?php
session_start();
require_once "../includes/conexion.php";

if (!isset($_SESSION['id_usuario'])) {
    header("Location: Profile.php");
    exit();
}

$idUser = $_SESSION['id_usuario'];
$campo = $_POST['campo'] ?? '';
$valor = $_POST['valor'] ?? '';

if ($campo !== '') {

    $permitidos = [
        'nombre_usuario', 'correo',
        'provincia', 'ciudad',
        'codigo_postal', 'calle', 'numero'
    ];

    if (in_array($campo, $permitidos)) {

        $sql = "UPDATE usuarios 
                SET $campo = '$valor' 
                WHERE id_usuario = $idUser";

        if ($conexion->query($sql)) {
            $_SESSION["mensaje"] = "Dato actualizado correctamente.";
        } else {
            $_SESSION["error"] = "Hubo un problema al actualizar el dato.";
        }
    }
}

header("Location: Profile.php?edit=1");
exit();
?>
