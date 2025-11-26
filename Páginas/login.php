<?php session_start(); ?> 
<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Tienda de Ropa Artistas de Trap - Iniciar Sesión</title>
    <link rel="stylesheet" href="../src/Css/Style.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.13.1/font/bootstrap-icons.min.css">
    <script src="../src/JavaScript/Script.js" defer></script>
    
    <style>
        .mensaje-login {
            padding: 10px;
            margin-bottom: 15px;
            border-radius: 4px;
            font-weight: bold;
            text-align: center;
        }
        .mensaje-exito {
            background-color: #d4edda;
            color: #155724;
            border: 1px solid #c3e6cb;
        }
        .mensaje-error {
            background-color: #f8d7da;
            color: #721c24;
            border: 1px solid #f5c6cb;
        }
    </style>
</head>

<body>
    <nav>
        <div class="nav-izq">
            <div class="Menu-Desplegable">
                <img src="../src/img/82cb671fe93aec295a64e6810373d6dba70ff39c.png" alt="Menú" id="btnMenu">
                <aside id="menuLateral" class="panel-izq">
                    <h2>Artistas</h2>
                    <ul>
                        <li><a href="#">Duki</a></li>
                        <li><a href="#">YSY A</a></li>
                        <li><a href="#">Trueno</a></li>
                        <li><a href="#">Neo Pistea</a></li>
                        <li><a href="#">C.R.O.</a></li>
                        <li><a href="#">Khea</a></li>
                        <li><a href="#">Milo j</a></li>
                        <li><a href="#">Barderos</a></li>
                        <li><a href="#">Wos</a></li>
                        <li><a href="#">Modo Diablo</a></li>
                        <li><a href="../Index.html">Todos</a></li>
                    </ul>
                </aside>
            </div>
            <h2><a href="../Index.html">Inicio</a></h2>
        </div>

        <div class="nav-der">
            <a href="../Páginas/Login.php" class="btn-nav-der">
                <?php echo isset($_SESSION['logeado']) ? "Perfil de " . $_SESSION['nombre_usuario'] : "Registrarse"; ?>
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
                    <button class="Btn-Pagar">Pagar</button>
                </div>
            </aside>
        </div>
    </nav>

    <main id="Inicio-Sesion">
        <div id="Cont-Login">
            
            <?php if (isset($_SESSION['mensaje'])): ?>
                <div class="mensaje-login mensaje-exito">
                    <?php echo $_SESSION['mensaje']; ?>
                </div>
                <?php unset($_SESSION['mensaje']); ?>
            <?php endif; ?>

            <?php if (isset($_SESSION['error'])): ?>
                <div class="mensaje-login mensaje-error">
                    <?php echo $_SESSION['error']; ?>
                </div>
                <?php unset($_SESSION['error']); ?>
            <?php endif; ?>
            <h2>Iniciar Sesión</h2>
            <form id="Login-Form" action="Login_processor.php" method="post">
                <label id="Usuario" for="usuario">Correo electrónico o nombre de usuario</label>
                <input type="text" id="usuario" name="usuario" required>

                <label id="Contraseña" for="Contrasena_login">Contraseña</label>
                <input type="password" id="Contrasena_login" name="contrasena" required>

                <button type="submit" id="Btn-Login">Iniciar Sesión</button>
            </form>

            <p><a href="Registro.php">No tengo cuenta. Regístrate</a></p>

            <hr id="Separador-Login">

            <div id="Otros-Login">
                <button class="btn-google">
                    <img src="../src/img/google.png" alt="Google"><a href="">Iniciar sesión en Google</a>
                </button>

                <button class="btn-facebook">
                    <img src="../src/img/facebook.png" alt="Facebook"><a href="">Iniciar sesión en Facebook</a>
                </button>

                <button class="btn-apple">
                    <img src="../src/img/logotipo-de-apple.png" alt="Apple"><a href="">Iniciar sesión en Apple</a>
                </button>
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