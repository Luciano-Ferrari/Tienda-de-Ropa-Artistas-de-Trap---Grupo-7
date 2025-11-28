<?php
session_start();
require_once "../includes/conexion.php";

/* 1. Validar login */
if (!isset($_SESSION['logeado']) || !$_SESSION['logeado']) {
    header("Location: Registro.php?error=login_requerido");
    exit();
}

/* 2. Validar datos de envío */
if (!isset($_SESSION['pedido_datos'])) {
    header("Location: PedirDatos.php?error=faltan_datos");
    exit();
}

$datos = $_SESSION['pedido_datos'];

/* Datos */
$nombre    = $datos["nombre"];
$calle     = $datos["calle"];
$numero    = $datos["numero"];
$ciudad    = $datos["ciudad"];
$provincia = $datos["provincia"];
$codigo    = $datos["codigo"];
$guardar   = $datos["guardar"];

/* 3. Validar pago */
if (!isset($_POST["tarjeta"]) || !isset($_POST["titular"]) || !isset($_POST["vencimiento"]) || !isset($_POST["cvc"])) {
    header("Location: MetodosPago.php?error=faltan_datos_pago");
    exit();
}

$tarjeta      = $_POST["tarjeta"];
$titular      = $_POST["titular"];
$vencimiento  = $_POST["vencimiento"];
$cvc          = $_POST["cvc"];

/* Solo guardar últimos 4 números */
$ultimos4 = substr($tarjeta, -4);

/* 4. Cargar carrito */
$carrito = $_SESSION["carrito"] ?? [];

if (count($carrito) === 0) {
    header("Location: ../Index.html?error=carrito_vacio");
    exit();
}

/* Total del carrito */
$total = 0;
foreach ($carrito as $item) {
    $total += floatval($item["precio"]);
}

/* 5. Insertar pedido */
$stmt = $conexion->prepare("
    INSERT INTO pedidos 
    (id_usuario, nombre, calle, numero, ciudad, provincia, codigo_postal, total, titular_tarjeta, ultimos4, vencimiento, fecha) 
    VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, NOW())
");

$stmt->bind_param(
    "issssssdsss",
    $_SESSION['id_usuario'],
    $nombre,
    $calle,
    $numero,
    $ciudad,
    $provincia,
    $codigo,
    $total,
    $titular,
    $ultimos4,
    $vencimiento
);

if (!$stmt->execute()) {
    die("ERROR al guardar pedido: " . $stmt->error);
}

$id_pedido = $stmt->insert_id;
$stmt->close();

/* 6. Insertar detalles */
$stmt_det = $conexion->prepare("
    INSERT INTO pedido_detalle 
    (id_pedido, id_producto, nombre_producto, precio_unitario)
    VALUES (?, ?, ?, ?)
");

foreach ($carrito as $item) {
    $stmt_det->bind_param(
        "iisd",
        $id_pedido,
        $item["id"],
        $item["nombre"],
        $item["precio"]
    );
    $stmt_det->execute();
}

$stmt_det->close();

/* 7. Guardar dirección si eligió */
if ($guardar === "si") {

    $stmt_dir = $conexion->prepare("
        UPDATE usuarios 
        SET nombre_usuario=?, calle=?, numero=?, ciudad=?, provincia=?, codigo_postal=?
        WHERE id_usuario=?
    ");

    $stmt_dir->bind_param(
        "ssssssi",
        $nombre,
        $calle,
        $numero,
        $ciudad,
        $provincia,
        $codigo,
        $_SESSION['id_usuario']
    );

    $stmt_dir->execute();
    $stmt_dir->close();
}

/* 8. Limpiar sesión */
unset($_SESSION["carrito"]);
unset($_SESSION["pedido_datos"]);

/* 9. Redirigir */
header("Location: ../Index.html?carrito_vacio=1");
exit();
?>
