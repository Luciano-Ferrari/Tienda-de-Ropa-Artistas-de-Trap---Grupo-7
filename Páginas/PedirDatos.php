<?php
session_start();
include '../includes/conexion.php';

if (!isset($_SESSION["id_usuario"])) {
    header("Location: Registro.php");
    exit();
}

if ($_SERVER["REQUEST_METHOD"] === "POST") {

    $_SESSION["pedido_datos"] = [
        "nombre" => $_POST["nombre"],
        "calle" => $_POST["calle"],
        "numero" => $_POST["numero"],
        "ciudad" => $_POST["ciudad"],
        "provincia" => $_POST["provincia"],
        "codigo" => $_POST["codigo"],
        "guardar" => $_POST["guardar"]
    ];

    header("Location: MetodosPago.php");
    exit();
}

$id = $_SESSION["id_usuario"];
$sql = "SELECT * FROM usuarios WHERE id_usuario = $id LIMIT 1";
$res = $conexion->query($sql);
$usuario = $res->fetch_assoc();
?>

<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Procesar Datos | Tienda de Trap</title>
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

    <main id="PedirDatos-Main">

        <div id="PedirDatos-Cont">

            <form id="PedirDatos-Form" action="PedirDatos.php" method="POST">

                <h2>Datos de Entrega</h2>

                <label for="nombre">Nombre Completo</label>
                <input type="text" name="nombre" id="nombre" required value="<?php echo $usuario['nombre_usuario']; ?>">

                <label for="calle">Calle</label>
                <input type="text" name="calle" id="calle" required value="<?php echo $usuario['calle']; ?>">

                <label for="numero">Número</label>
                <input type="text" name="numero" id="numero" required value="<?php echo $usuario['numero']; ?>">

                <label for="ciudad">Ciudad</label>
                <input type="text" name="ciudad" id="ciudad" required value="<?php echo $usuario['ciudad']; ?>">

                <label for="provincia">Provincia</label>
                <input type="text" name="provincia" id="provincia" required
                    value="<?php echo $usuario['provincia']; ?>">

                <label for="codigo">Código Postal</label>
                <input type="text" name="codigo" id="codigo" required value="<?php echo $usuario['codigo_postal']; ?>">

                <div class="opciones-direccion">
                    <h4>Opciones de Dirección</h4>

                    <label>
                        <input type="radio" name="guardar" value="si" checked>
                        Guardar como predeterminada
                    </label>

                    <label>
                        <input type="radio" name="guardar" value="no">
                        Usar solo para este pedido
                    </label>
                </div>

                <button type="submit" class="btn-generico">Continuar</button>
                <button type="button" class="btn-cancelar-pedido" onclick="window.history.back()">Cancelar</button>

            </form>

        </div>

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

    <script>
        document.getElementById("PedirDatos-Form").addEventListener("submit", async (e) => {
            const carrito = localStorage.getItem("carritoTiendaTrap");

            if (!carrito || carrito.length === 0) {
                alert("El carrito está vacío");
                e.preventDefault();
                return;
            }

            await fetch("guardar_carrito.php", {
                method: "POST",
                headers: { "Content-Type": "application/x-www-form-urlencoded" },
                body: "carrito=" + encodeURIComponent(carrito)
            });
        });
    </script>

</body>

</html>