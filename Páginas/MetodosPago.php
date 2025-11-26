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
                <div>
                    <p class="product-titulo"></p>
                    <p class="product-info"></p>
                    <p class="product-price"></p>
                </div>
            </div>

            <div class="total">
                <h6>Total</h6>
                <p></p>
            </div>

            <button class="btn-realizar">Realizar pedido</button>
            <button class="btn-cancelar">Cancelar pedido</button>

            <p class="legal">
                Al realizar este pedido confirmas que tienes autorización para usar este método de pago.
            </p>
        </div>
    </div>
    </main>
</body>

</html>