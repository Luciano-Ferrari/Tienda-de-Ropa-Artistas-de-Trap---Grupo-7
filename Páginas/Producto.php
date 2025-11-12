<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Catálogo de Productos</title>
  <link rel="stylesheet" href="../src/css/Producto.css"> 
</head>
<body>
  
  <?php
  include '../includes/conexion.php'; 

  $sql = "SELECT 
            p.nombre AS nombre_producto, 
            p.descripcion, 
            p.precio, 
            p.ruta_imagen,
            p.categoria,       
            a.nombre AS nombre_artista
          FROM 
            productos p 
          JOIN 
            artistas a ON p.id_artista = a.id_artista
          ORDER BY
            CASE p.categoria
                WHEN 'Remeras' THEN 1   
                WHEN 'Buzos' THEN 2     
                WHEN 'Accesorios' THEN 3
                ELSE 4
            END,
            p.nombre ASC";
            
  $resultado = $conexion->query($sql);
  
  $nombre_artista = "CATÁLOGO DE PRODUCTOS";
  
  if ($resultado && $resultado->num_rows > 0) {
      $primera_fila = $resultado->fetch_assoc();
      $nombre_artista = strtoupper($primera_fila['nombre_artista']);
      
      $resultado->data_seek(0);
  }
  ?>

  <div id="TituloImagen">
    <h1><?php echo $nombre_artista; ?></h1>
    <img src="../src/img/ModoDiablo.png" alt="Modo Diablo">
  </div>
  
  <div id="Productos">
    <?php
    if ($resultado && $resultado->num_rows > 0) {
        while($fila = $resultado->fetch_assoc()) {
            ?>
            <div class="Ropa">
              <img src="<?php echo $fila['ruta_imagen']; ?>" alt="<?php echo $fila['nombre_producto']; ?>">
              <div id="texto-productos">
                <p><strong><?php echo $fila['nombre_producto']; ?></strong></p>
                <p><?php echo $fila['descripcion']; ?></p>
                <p>$<?php echo $fila['precio']; ?></p>
              </div>
            </div>
            <?php
        }
    }
    $conexion->close();
    ?>
  </div>
</body>
</html>