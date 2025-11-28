<?php
session_start();
require_once "../includes/conexion.php";

if (!isset($_SESSION['id_usuario'])) {
    header("Location: Profile.php");
    exit();
}

$idUser = $_SESSION['id_usuario'];

$actual = $_POST["actual"] ?? "";
$nueva = $_POST["nueva"] ?? "";
$repetir = $_POST["repetir"] ?? "";

if ($nueva !== $repetir) {
    $_SESSION["error"] = "Las contraseñas nuevas no coinciden.";
    header("Location: Profile.php?edit=1");
    exit();
}

$sql = "SELECT contrasena FROM usuarios WHERE id_usuario = $idUser";
$res = $conexion->query($sql);
$data = $res->fetch_assoc();

$pass_db = $data["contrasena"];

if ($actual !== $pass_db) {
    $_SESSION["error"] = "La contraseña actual es incorrecta.";
    header("Location: Profile.php?edit=1");
    exit();
}

$sqlUpdate = "UPDATE usuarios SET contrasena = '$nueva' WHERE id_usuario = $idUser";
$conexion->query($sqlUpdate);

$_SESSION["mensaje"] = "Contraseña cambiada correctamente.";
header("Location: Profile.php?edit=1");
exit();
?>
