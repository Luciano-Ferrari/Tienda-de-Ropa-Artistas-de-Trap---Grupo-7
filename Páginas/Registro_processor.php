<?php
session_start();

include '../includes/conexion.php'; 

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $nombre_usuario = $_POST['nombre_usuario'];
    $correo = $_POST['usuario']; 
    $contrasena = $_POST['contrasena'];

    $sql_insert = $conexion->prepare("INSERT INTO usuarios (nombre_usuario, correo, contrasena) VALUES (?, ?, ?)");
    
    $sql_insert->bind_param("sss", $nombre_usuario, $correo, $contrasena);

    if ($sql_insert->execute()) {
        $_SESSION['mensaje'] = "¡Registro exitoso! Ya puedes iniciar sesión con tu nueva cuenta.";
        header("Location: Login.php"); 
        exit();
    } else {
        if ($conexion->errno == 1062) {
             $_SESSION['error'] = "Error al registrar. El nombre de usuario o el correo ya están en uso.";
        } else {
             $_SESSION['error'] = "Error al registrar: " . $conexion->error;
        }
        
        header("Location: Registro.php"); 
        exit();
    }

}
$conexion->close();
?>