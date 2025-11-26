<?php
session_start();
include '../includes/conexion.php'; 

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $correo_o_usuario = $_POST['usuario'];
    $contrasena = $_POST['contrasena']; 

    $sql_select = $conexion->prepare("SELECT id_usuario, nombre_usuario, contrasena FROM usuarios WHERE correo = ? OR nombre_usuario = ?");
    $sql_select->bind_param("ss", $correo_o_usuario, $correo_o_usuario);
    $sql_select->execute();
    $result = $sql_select->get_result();

    if ($result->num_rows == 1) {
        $usuario = $result->fetch_assoc();

        if ($contrasena === $usuario['contrasena']) {
            $_SESSION['id_usuario'] = $usuario['id_usuario'];
            $_SESSION['nombre_usuario'] = $usuario['nombre_usuario'];
            $_SESSION['logeado'] = true;

            header("Location: ../Index.html"); 
            exit();
        } else {
            $_SESSION['error'] = "Contraseña incorrecta.";
            header("Location: Login.php");
            exit();
        }
    } else {
        $_SESSION['error'] = "Usuario o correo no encontrado.";
        header("Location: Login.php");
        exit();
    }

    $sql_select->close();
}
$conexion->close();
?>