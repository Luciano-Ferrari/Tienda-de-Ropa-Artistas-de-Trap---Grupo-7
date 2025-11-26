<?php
session_start(); // Iniciar la sesión para poder usar $_SESSION
?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>PAGO | Tienda Trap</title>
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
            <a href="../Páginas/<?php echo (isset($_SESSION['logeado']) && $_SESSION['logeado']) ? 'Logout.php' : 'Registro.php'; ?>" class="btn-nav-der">
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

    <main class="pago-main">
        <div class="pago-cont">
            <div class="pago-form">
                <h2>Método de pago</h2>

                <label>Número de la tarjeta</label>
                <input type="text" placeholder="XXXX XXXX XXXX XXXX">

                <label>Titular de la tarjeta</label>
                <input type="text" placeholder="Nombre completo">

                <div class="pago-venc-cvc">
                    <div>
                        <label>Vencimiento</label>
                        <input type="text" placeholder="MM/AA">
                    </div>
                    <div>
                        <label>CVC</label>
                        <input type="text" placeholder="CVC">
                    </div>
                </div>
            </div>

            <div class="pago-resumen">
                <h3>Resumen del pedido</h3>

                <div class="resumen-cont-int">
                    <div id="Productos">
                        <ul id="Lista-Productos">
                            </ul>
                    </div>
                    <hr>
                    <div>
                        <ul id="Lista-Nombre-Precio">
                            </ul>
                    </div>
                    </div>

                <div class="total">
                    <h6>Total</h6>
                    <p id="Suma-Total-Precios"></p>
                </div>

                <button class="btn-realizar">Realizar pedido</button>
                <button class="btn-cancelar">Cancelar pedido</button>

                <p class="legal">
                    Al realizar este pedido confirmas que tienes autorización para usar este método de pago.
                </p>
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
</body>

</html>