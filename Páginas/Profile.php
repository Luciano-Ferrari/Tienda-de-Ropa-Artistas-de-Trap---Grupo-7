<?php
session_start();
require_once __DIR__ . "/../includes/conexion.php";

if (!isset($_SESSION['id_usuario'])) {
    header("Location: Login.php");
    exit();
}

$idUser = $_SESSION['id_usuario'];

$sql = "SELECT * FROM usuarios WHERE id_usuario = $idUser";
$resultado = $conexion->query($sql);

if (!$resultado || $resultado->num_rows < 1) {
    die("Error: no se encontró el usuario.");
}

$usuario = $resultado->fetch_assoc();
?>
<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Perfil de Usuario | Tienda Trap</title>
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
                    <a href="/Tienda-de-Ropa-Artistas-de-Trap---Grupo-7/Páginas/MetodosPago.php"
                        class="Btn-Pagar">Pagar</a>
                    <button class="Btn-Eliminar">Eliminar Productos</button>
                </div>
            </aside>
        </div>
    </nav>

    <?php if (isset($_SESSION['mensaje'])): ?>
        <div class="mensaje-login mensaje-exito" id="alerta-temporal">
            <?= $_SESSION['mensaje']; ?>
        </div>
        <?php unset($_SESSION['mensaje']); ?>
    <?php endif; ?>

    <?php if (isset($_SESSION['error'])): ?>
        <div class="mensaje-login mensaje-error" id="alerta-temporal">
            <?= $_SESSION['error']; ?>
        </div>
        <?php unset($_SESSION['error']); ?>
    <?php endif; ?>

    <main id="Perfil-Usuario">
        <div id="Cont-Perfil">

            <section class="bloque-perfil">
                <h3>Datos del Usuario</h3>
                <hr>

                <p>
                    Nombre: <?= $usuario['nombre_usuario'] ?>
                    <button class="btn-editar"
                        onclick="abrirModal('Editar Nombre','nombre_usuario','<?= htmlspecialchars($usuario['nombre_usuario'], ENT_QUOTES) ?>')">
                        <i class="bi bi-brush-fill"></i>
                    </button>
                </p>

                <p>
                    Email: <?= $usuario['correo'] ?>
                    <button class="btn-editar"
                        onclick="abrirModal('Editar Email','correo','<?= htmlspecialchars($usuario['correo'], ENT_QUOTES) ?>')">
                        <i class="bi bi-brush-fill"></i>
                    </button>
                </p>

                <p>
                    Contraseña: ********
                    <button class="btn-editar" onclick="abrirModalContrasena()">
                        <i class="bi bi-brush-fill"></i>
                    </button>
                </p>
            </section>

            <section class="direccion-perfil">
                <h3>Dirección del Usuario</h3>
                <hr>

                <p>Provincia: <?= $usuario['provincia'] ?? '—' ?>
                    <button class="btn-editar"
                        onclick="abrirModal('Editar Provincia','provincia','<?= htmlspecialchars($usuario['provincia'] ?? '', ENT_QUOTES) ?>')">
                        <i class="bi bi-brush-fill"></i>
                    </button>
                </p>

                <p>Ciudad: <?= $usuario['ciudad'] ?? '—' ?>
                    <button class="btn-editar"
                        onclick="abrirModal('Editar Ciudad','ciudad','<?= htmlspecialchars($usuario['ciudad'] ?? '', ENT_QUOTES) ?>')">
                        <i class="bi bi-brush-fill"></i>
                    </button>
                </p>

                <p>Código Postal: <?= $usuario['codigo_postal'] ?? '—' ?>
                    <button class="btn-editar"
                        onclick="abrirModal('Editar Código Postal','codigo_postal','<?= htmlspecialchars($usuario['codigo_postal'] ?? '', ENT_QUOTES) ?>')">
                        <i class="bi bi-brush-fill"></i>
                    </button>
                </p>

                <p>Calle: <?= $usuario['calle'] ?? '—' ?>
                    <button class="btn-editar"
                        onclick="abrirModal('Editar Calle','calle','<?= htmlspecialchars($usuario['calle'] ?? '', ENT_QUOTES) ?>')">
                        <i class="bi bi-brush-fill"></i>
                    </button>
                </p>

                <p>Número: <?= $usuario['numero'] ?? '—' ?>
                    <button class="btn-editar"
                        onclick="abrirModal('Editar Número','numero','<?= htmlspecialchars($usuario['numero'] ?? '', ENT_QUOTES) ?>')">
                        <i class="bi bi-brush-fill"></i>
                    </button>
                </p>

                <button class="btn-eliminar-direccion" onclick="eliminarDireccion()">Eliminar Dirección</button>
            </section>

            <div id="Acciones-Perfil">
                <button id="Btn-Editar-Perfil">Editar Perfil</button>
            </div>

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

    <div id="Modal-Fondo" class="modal-fondo"></div>

    <div id="Modal-Perfil" class="modal-contenedor">
        <div class="modal-caja">
            <h3 id="Modal-Titulo">Editar Dato</h3>

            <form id="Modal-Form" method="POST" action="update_profile.php">
                <label id="Modal-Label"></label>
                <input type="text" id="modalInput" name="valor" required>
                <input type="hidden" name="campo" id="modalCampo">
                <button type="submit" class="btn-modal">Guardar Cambios</button>
            </form>

            <button id="Cerrar-Modal" class="cerrar-modal">Cancelar</button>
        </div>
    </div>

    <div id="Modal-Contrasena" class="modal-contenedor">
        <div class="modal-caja">
            <h3>Cambiar Contraseña</h3>

            <form method="POST" action="update_password.php">

                <label>Contraseña actual</label>
                <div class="input-pass">
                    <input type="password" id="passActual" name="actual" required>
                    <i class="bi bi-eye-slash" onclick="verPassword(this, 'passActual')"></i>
                </div>

                <label>Nueva contraseña</label>
                <div class="input-pass">
                    <input type="password" id="passNueva" name="nueva" required>
                    <i class="bi bi-eye-slash" onclick="verPassword(this, 'passNueva')"></i>
                </div>

                <label>Repetir nueva contraseña</label>
                <div class="input-pass">
                    <input type="password" id="passRepetir" name="repetir" required>
                    <i class="bi bi-eye-slash" onclick="verPassword(this, 'passRepetir')"></i>
                </div>

                <button type="submit" class="btn-modal">Guardar Contraseña</button>
            </form>

            <button class="cerrar-modal" onclick="cerrarModalContrasena()">Cancelar</button>
        </div>
    </div>
</body>

</html>