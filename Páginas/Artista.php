<?php
include '../includes/conexion.php';
session_start();

$products_per_page = 12;
$page = isset($_GET['page']) && is_numeric($_GET['page']) ? (int) $_GET['page'] : 1;
$offset = ($page - 1) * $products_per_page;

$id_artista = $_GET['id_artista'] ?? null;
$where_clause = "";
if ($id_artista && is_numeric($id_artista)) {
    $where_clause = " WHERE p.id_artista = " . $id_artista;
}

$count_sql = "SELECT COUNT(p.id_producto) AS total_products 
              FROM productos p 
              JOIN artistas a ON p.id_artista = a.id_artista"
    . $where_clause;
$count_result = $conexion->query($count_sql);
$total_products = $count_result->fetch_assoc()['total_products'] ?? 0;
$total_pages = ceil($total_products / $products_per_page);

$sql = "SELECT DISTINCT 
        p.id_producto,     
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
    " GROUP BY p.id_producto "
    . " ORDER BY
        CASE p.categoria
            WHEN 'Remeras' THEN 1   
            WHEN 'Buzos' THEN 2     
            WHEN 'Accesorios' THEN 3
            ELSE 4
        END,
        CASE
            WHEN p.categoria = 'Accesorios' THEN
                CASE
                    WHEN p.nombre LIKE '%Gorra%' THEN 1
                    WHEN p.nombre LIKE '%Cadena%' THEN 2
                    WHEN p.nombre LIKE '%Vinilo%' THEN 3
                    WHEN p.nombre LIKE '%Cuadro%' THEN 4
                    ELSE 5
                END
            ELSE 0 
        END,
        p.nombre ASC"
    . " LIMIT " . $products_per_page . " OFFSET " . $offset;

$resultado = $conexion->query($sql);

$nombre_artista = "CATÁLOGO DE PRODUCTOS";
$ruta_banner = "";

if ($resultado && $resultado->num_rows > 0) {
    $primera_fila = $resultado->fetch_assoc();
    $nombre_artista = strtoupper($primera_fila['nombre_artista']);
    $ruta_banner = $primera_fila['ruta_banner'] ?? '';
    $resultado->data_seek(0);
}
?>

<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Tienda de Ropa Artistas de Trap</title>
    <link rel="stylesheet" href="../src/Css/Style.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.13.1/font/bootstrap-icons.min.css">
    <script src="../src/JavaScript/Script.js" defer></script>
</head>

<body>
    <nav>
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
            <a href="../Páginas/Login.php" class="btn-nav-der">
                <?php if (isset($_SESSION['logeado']) && $_SESSION['logeado']): ?>
                    <i class="bi bi-person"></i>
                <?php else: ?>
                    Registrarse
                <?php endif; ?>
            </a>
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
                    <a href="../Páginas/MetodosPago.php" class="Btn-Pagar">Pagar</a>
                    <button class="Btn-Eliminar">Eliminar Productos</button>
                </div>
            </aside>
        </div>
    </nav>

    <main id="Pagina-Artista">
        <h1><?php echo $nombre_artista; ?></h1>

        <div class="Banner-Artista">
            <img src="<?php echo $ruta_banner; ?>" alt="Banner de <?php echo $nombre_artista; ?>" id="afa">
        </div>

        <section id="Seccion-Productos">
            <?php
            if ($resultado && $resultado->num_rows > 0) {
                while ($fila = $resultado->fetch_assoc()) {
                    ?>
                    <div id="Cont-Producto" class="Ropa">
                        <a href="Producto.php?id_producto=<?php echo $fila['id_producto']; ?>">

                            <div id="Celda-producto">
                                <img src="<?php echo $fila['ruta_imagen']; ?>" alt="<?php echo $fila['nombre_producto']; ?>">

                                <div id="Info-Producto">
                                    <p id="nombre-p"><?php echo $fila['nombre_producto']; ?></p>
                                    <p id="info-p"><?php echo $fila['descripcion']; ?></p>
                                    <p id="precio-p">$<?php echo $fila['precio']; ?></p>
                                </div>
                            </div>

                        </a>
                    </div>

                    <?php
                }
            }
            ?>
        </section> <?php
        $max_visible_page = 2;
        $num_pages_to_display = min($total_pages, $max_visible_page);

        if ($num_pages_to_display > 0) {
            ?>
            <div class="pagination-container">
                <nav class="Nav-de-abajo" aria-label="Navegación de productos">
                    <ul class="pagination">
                        <li class="page-item <?php echo ($page <= 1) ? 'disabled' : ''; ?>">
                            <a class="page-link"
                                href="?<?php echo isset($id_artista) ? 'id_artista=' . $id_artista . '&' : ''; ?>page=<?php echo $page - 1; ?>"
                                aria-label="Anterior">
                                <span aria-hidden="true">&lt;</span>
                            </a>
                        </li>

                        <?php
                        for ($i = 1; $i <= $num_pages_to_display; $i++) {
                            ?>
                            <li class="page-item <?php echo ($i == $page) ? 'active' : ''; ?>">
                                <a class="page-link"
                                    href="?<?php echo isset($id_artista) ? 'id_artista=' . $id_artista . '&' : ''; ?>page=<?php echo $i; ?>">
                                    <?php echo $i; ?>
                                </a>
                            </li>
                            <?php
                        }
                        ?>

                        <li
                            class="page-item <?php echo ($page >= $max_visible_page || $page >= $total_pages) ? 'disabled' : ''; ?>">
                            <a class="page-link"
                                href="?<?php echo isset($id_artista) ? 'id_artista=' . $id_artista . '&' : ''; ?>page=<?php echo $page + 1; ?>"
                                aria-label="Siguiente">
                                <span aria-hidden="true">&gt;</span>
                            </a>
                        </li>
                    </ul>
                </nav>
            </div>
        <?php } ?>
    </main>
    <footer>
        <div class="Footer-Cont">
            <div class="info-footer">
                <div class="direccion">
                    <p>DIRECCION <br>
                        DR. NORBERTO QUIERNO COSTA 1209 <br>
                        2B</p>
                </div>

                <div class="pais">
                    <p>Argentina</p>
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
<?php
$conexion->close();
?>