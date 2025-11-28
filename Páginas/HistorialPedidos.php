<?php
session_start();
require_once "../includes/conexion.php";

if (!isset($_SESSION['id_usuario'])) {
    header("Location: Login.php");
    exit();
}

$idUser = $_SESSION['id_usuario'];

$pedidosPorPagina = 3;

$pagina = isset($_GET['pagina']) ? intval($_GET['pagina']) : 1;
if ($pagina < 1) $pagina = 1;

$inicio = ($pagina - 1) * $pedidosPorPagina;

$sqlTotal = "SELECT COUNT(*) AS total FROM pedidos WHERE id_usuario = $idUser";
$resTotal = $conexion->query($sqlTotal);
$totalPedidos = $resTotal->fetch_assoc()['total'];

$totalPaginas = ceil($totalPedidos / $pedidosPorPagina);

$sql = "
    SELECT * 
    FROM pedidos 
    WHERE id_usuario = $idUser
    ORDER BY fecha DESC
    LIMIT $inicio, $pedidosPorPagina
";
$pedidos = $conexion->query($sql);
?>

<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Historial de Pedidos | Tienda Trap</title>
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

            <?php if (isset($_SESSION['logeado']) && $_SESSION['logeado']): ?>

                <a href="/Tienda-de-Ropa-Artistas-de-Trap---Grupo-7/Páginas/Profile.php" class="btn-nav-der">
                    <i class="bi bi-person"></i>
                </a>

            <?php else: ?>

                <a href="/Tienda-de-Ropa-Artistas-de-Trap---Grupo-7/Páginas/Registro.php" class="btn-nav-der">
                    Registrarse
                </a>

            <?php endif; ?>

            <img src="/Tienda-de-Ropa-Artistas-de-Trap---Grupo-7/src/img/c7e684b2a435c066935b4e6b856ea2444d134640.jpg"
                alt="Carrito" id="Btn-Carrito">

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
                    <a href="../Páginas/PedirDatos.php" class="Btn-Pagar">Pagar</a>
                    <button class="Btn-Eliminar">Eliminar Productos</button>
                </div>
            </aside>
        </div>
    </nav>

    <main id="Historial-Cont">

        <h2>Historial de Pedidos</h2>
        <hr>

        <?php if ($pedidos->num_rows > 0): ?>
            <?php while ($p = $pedidos->fetch_assoc()): ?>

                <div class="pedido-historial">
                    <h3>Pedido #<?= $p['id_pedido'] ?></h3>

                    <p><strong>Fecha:</strong> <?= $p['fecha'] ?></p>
                    <p><strong>Envío:</strong> <?= $p['calle'] ?>         <?= $p['numero'] ?>, <?= $p['ciudad'] ?>,
                        <?= $p['provincia'] ?></p>
                    <p><strong>Total:</strong> $<?= number_format($p['total'], 2) ?></p>
                    <p><strong>Tarjeta:</strong> **** **** **** <?= $p['ultimos4'] ?></p>
                </div>

            <?php endwhile; ?>
        <?php else: ?>

            <p style="text-align:center; font-size:22px; font-weight:700; margin-top:40px;">
                No tienes pedidos todavía.
            </p>

        <?php endif; ?>

        <?php if ($totalPaginas > 1): ?>
            <div class="paginacion">

                <?php if ($pagina > 1): ?>
                    <a href="?pagina=<?= $pagina - 1 ?>">&lt;</a>
                <?php else: ?>
                    <span class="disabled">&lt;</span>
                <?php endif; ?>

                <?php for ($i = 1; $i <= $totalPaginas; $i++): ?>
                    <?php if ($i == $pagina): ?>
                        <span class="actual"><?= $i ?></span>
                    <?php else: ?>
                        <a href="?pagina=<?= $i ?>"><?= $i ?></a>
                    <?php endif; ?>
                <?php endfor; ?>

                <?php if ($pagina < $totalPaginas): ?>
                    <a href="?pagina=<?= $pagina + 1 ?>">&gt;</a>
                <?php else: ?>
                    <span class="disabled">&gt;</span>
                <?php endif; ?>

            </div>
        <?php endif; ?>

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