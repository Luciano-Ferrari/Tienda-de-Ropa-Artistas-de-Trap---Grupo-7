<?php
include '../includes/conexion.php';

$id_artista = $_GET['id_artista'] ?? null; 

$where_clause = "";

if ($id_artista && is_numeric($id_artista)) {
    $where_clause = " WHERE p.id_artista = " . $id_artista;
}

$sql = "SELECT 
        p.nombre AS nombre_producto, 
        p.descripcion, 
        p.precio, 
        p.ruta_imagen,
        p.categoria,       
        a.nombre AS nombre_artista,
        a.ruta_banner     
      FROM 
        productos p 
      JOIN 
        artistas a ON p.id_artista = a.id_artista"
      . $where_clause .
      " ORDER BY
        CASE p.categoria
            WHEN 'Remeras' THEN 1   
            WHEN 'Buzos' THEN 2     
            WHEN 'Accesorios' THEN 3
            ELSE 4
        END,
        p.nombre ASC";

$resultado = $conexion->query($sql);

$nombre_artista = "CATÁLOGO DE PRODUCTOS";
$ruta_banner = "";

if ($resultado && $resultado->num_rows > 0) {
    $primera_fila = $resultado->fetch_assoc();
    $nombre_artista = strtoupper($primera_fila['nombre_artista']);
    $ruta_banner = $primera_fila['ruta_banner'] ?? '';
    $resultado->data_seek(0);
} else if ($id_artista && is_numeric(value: $id_artista)) {
    $sql_artista = "SELECT nombre, ruta_banner FROM artistas WHERE id_artista = " . $id_artista;
    $res_artista = $conexion->query($sql_artista);

    if ($res_artista && $res_artista->num_rows > 0) {
        $data_artista = $res_artista->fetch_assoc();
        $nombre_artista = strtoupper($data_artista['nombre']);
        $ruta_banner = $data_artista['ruta_banner'] ?? '';
    }
}
?>