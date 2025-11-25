<?php
include '../includes/conexion.php';

$id_producto = $_GET['id_producto'] ?? null;

$nombre_producto = "Producto No Encontrado";
$precio = "0.00";
$ruta_imagen = "../src/img/default.png";
$texto_acciones = "";
$producto_info = "Información no disponible.";

if ($id_producto && is_numeric($id_producto)) {
  $sql = "SELECT 
                p.nombre AS nombre_producto, 
                p.descripcion AS producto_info,
                p.precio, 
                p.ruta_imagen,
                a.nombre AS nombre_artista
            FROM 
                productos p 
            JOIN 
                artistas a ON p.id_artista = a.id_artista
            WHERE 
                p.id_producto = " . $id_producto . " 
            LIMIT 1";

  $resultado = $conexion->query($sql);

  if ($resultado && $resultado->num_rows > 0) {
    $fila = $resultado->fetch_assoc();
    $nombre_producto = $fila['nombre_producto'];
    $producto_info = $fila['producto_info'];
    $precio = number_format($fila['precio'], 2);
    $ruta_imagen = $fila['ruta_imagen'];
    $nombre_artista = $fila['nombre_artista'];
    $texto_acciones = "AGREGAR AL CARRITO";
  }
}
$conexion->close();
?>

<!DOCTYPE html>
<html lang="es">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title><?php echo $nombre_producto; ?> | Tienda Trap</title>
  <link rel="stylesheet" href="../src/Css/Style.css">
  <link rel="stylesheet" href="../src/Css/DetalleProducto.css">
  <script src="../src/JavaScript/Script.js" defer></script>
</head>

<body>
  <nav class="nav-minimal">
    <div class="nav-izq">
      <div class="Menu-Desplegable">
        <img src="../src/img/82cb671fe93aec295a64e6810373d6dba70ff39c.png" alt="Menú" id="btnMenu">
        <aside id="menuLateral" class="panel-izq">
          <h2>Artistas</h2>
          <ul>
            <li><a href="Artista.php?id_artista=1">Duki</a></li>
            <li><a href="Artista.php?id_artista=2">YSY A</a></li>
            <li><a href="Artista.php?id_artista=3">Trueno</a></li>
            <li><a href="Artista.php?id_artista=4">Neo Pistea</a></li>
            <li><a href="Artista.php?id_artista=5">C.R.O.</a></li>
            <li><a href="Artista.php?id_artista=6">Khea</a></li>
            <li><a href="Artista.php?id_artista=7">Milo j</a></li>
            <li><a href="Artista.php?id_artista=8">Barderos</a></li>
            <li><a href="Artista.php?id_artista=9">Modo Diablo</a></li>
            <li><a href="Artista.php?id_artista=10">Wos</a></li>
            <li><a href="../Index.html">Todos</a></li>
          </ul>
        </aside>
      </div>
      <h2><a href="../Index.html">Inicio</a></h2>
    </div>

    <div class="nav-der">
      <a href="../Páginas/Registro.html" class="btn-nav-der">Registrarse</a>

      <img src="../src/img/c7e684b2a435c066935b4e6b856ea2444d134640.jpg" alt="Carrito" id="Btn-Carrito">
      <aside id="carritoLateral" class="panel-der">
        <h2>Carrito</h2>
        <div id="Productos">
          <ul id="Lista-Productos"></ul>
        </div>
        <hr>
        <div>
          <ul id="Lista-Nombre-Precio"></ul>
        </div>
        <h5>Total</h5>
        <p id="Suma-Total-Precios">$</p>
        <div class="Btn-Carrito">
          <button class="Btn-Pagar">Pagar</button>
        </div>
      </aside>
    </div>
  </nav>
  
  <main id="Detalle-Producto-Contenedor">
    <section class="info-principal-producto">
      <div class="imagen-producto-wrapper">
        <img src="<?php echo $ruta_imagen; ?>" alt="<?php echo $nombre_producto; ?>" class="imagen-producto">
      </div>

      <div class="datos-producto-acciones">
        <div id="Info-Producto-detalle">
          <p id="nombre-p-detalle"><?php echo $nombre_producto; ?></p>
          <p id="info-p-detalle"><?php echo $producto_info; ?></p>
          <p id="precio-p-detalle">$<?php echo $precio; ?></p>
        </div>

        <div class="acciones-producto">
          <button class="Btn-Comprar-Producto">COMPRAR</button>
          <p class="agregar-carrito-texto"><?php echo $texto_acciones; ?></p>
        </div>
      </div>
    </section>
  </main>

  <footer class="footer-minimal">
    <div class="Footer-Cont">
      <div class="info-footer">
        <div class="direccion">
          <p>DIRECCION <br>
            DR. NORBERTO QUIERNO COSTA 1209 <br>
            2B</p>
        </div>

        <div class="pais">
          <span class="btn-pais">Argentina</span>
        </div>
      </div>

      <hr>

      <div class="Footer-Contacto">
        <div class="redes">
          <div>
            <img src="../src/img/instagram.png" alt="Instagram">
            <p>@sebas.rzq09</p>
          </div>
          <div>
            <img src="../src/img/instagram.png" alt="Instagram">
            <p>@lixhca2</p>
          </div>
          <div>
            <img src="../src/img/instagram.png" alt="Instagram">
            <p>@trapshop_"247</p>
          </div>
        </div>

        <div class="logo-footer">
          <img src="../src/img/Trap-Footer.png" alt="Logo-Trap Footer">
        </div>
      </div>

      <hr>

      <p class="copyright">
        © 2025 Trap Company malvados y asociados
      </p>
    </div>
  </footer>
</body>

</html>