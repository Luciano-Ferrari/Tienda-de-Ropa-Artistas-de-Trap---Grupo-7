<?php
// Incluir tu archivo de conexión.
// NO ASIGNAMOS EL RESULTADO DE INCLUDE. La variable $conexion debe crearse DENTRO de conexion.php.
@include '../includes/conexion.php';

// Lista de Artistas (Hardcodeada para el formulario temporal)
$artistas = [
    1 => 'Duki',
    2 => 'YSY A',
    3 => 'Trueno',
    4 => 'Neo Pistea',
    5 => 'C.R.O.',
    6 => 'Khea',
    7 => 'Milo j',
    8 => 'Barderos',
    9 => 'Modo Diablo',
    10 => 'Wos'
];

// Ruta de destino de las imágenes (Debe existir y tener permisos de escritura)
$target_dir = "../src/img/";

$mensaje_resultado = "";

// Verificamos si la conexión se estableció correctamente (variable $conexion existe y es un objeto mysqli)
$conexion_establecida = isset($conexion) && $conexion instanceof \mysqli && $conexion->connect_error === null;

if ($_SERVER['REQUEST_METHOD'] === 'POST') {

    if (!$conexion_establecida) {
        $mensaje_resultado = "<p style='color:red;'>FATAL ERROR: La conexión a la base de datos falló. Verifica conexion.php</p>";
    } else {
        // --- 1. Obtener datos del formulario ---
        $id_artista = filter_input(INPUT_POST, 'id_artista', FILTER_VALIDATE_INT);
        $nombre_base = filter_input(INPUT_POST, 'nombre_base', FILTER_SANITIZE_STRING);
        $categoria = filter_input(INPUT_POST, 'categoria', FILTER_SANITIZE_STRING);
        $precio = filter_input(INPUT_POST, 'precio', FILTER_VALIDATE_FLOAT);

        // Validaciones básicas
        if (!$id_artista || !$nombre_base || !$categoria || $precio === false) {
            $mensaje_resultado = "<p style='color:red;'>Error: Datos de formulario incompletos o inválidos.</p>";
        } elseif (!isset($_FILES['imagenes'])) {
            $mensaje_resultado = "<p style='color:red;'>Error: No se subió ningún archivo.</p>";
        } else {

            $imagenes_subidas = 0;
            $errores = [];

            // --- 2. Procesar Múltiples Archivos ---
            $file_count = count($_FILES['imagenes']['name']);

            for ($i = 0; $i < $file_count; $i++) {

                $file_name = basename($_FILES["imagenes"]["name"][$i]);
                $tmp_name = $_FILES["imagenes"]["tmp_name"][$i];

                if (empty($file_name))
                    continue;

                $target_file = $target_dir . $file_name;
                $imageFileType = strtolower(pathinfo($target_file, PATHINFO_EXTENSION));

                // --- 3. Validación y Subida ---

                // **CORRECCIÓN:** Se ha COMENTADO la verificación de 'file_exists' para permitir la sobrescritura.
                /*
                if (file_exists($target_file)) {
                    $errores[] = "Archivo ya existe: $file_name. Fue omitido. (Ruta: " . $target_file . ")";
                    continue;
                }
                */

                // Mueve el archivo a la carpeta de destino (ESSENCIAL)
                if (move_uploaded_file($tmp_name, $target_file)) {

                    // --- 4. Extracción de Descripción desde el Nombre de Archivo ---
                    $nombre_sin_extension = pathinfo($file_name, PATHINFO_FILENAME);
                    $partes = explode('-', $nombre_sin_extension);

                    // Asume que la descripción es la última parte
                    $descripcion = (count($partes) >= 3) ? $partes[2] : $nombre_sin_extension;

                    // Genera la ruta a guardar en la DB
                    $ruta_db = "../src/img/" . $file_name;

                    // --- 5. Inserción en la DB (Usando Prepared Statements) ---
                    $stmt = $conexion->prepare("INSERT INTO productos 
                        (id_artista, nombre, descripcion, precio, ruta_imagen, categoria) 
                        VALUES (?, ?, ?, ?, ?, ?)");

                    // Vincula los parámetros (i: integer, s: string, d: double)
                    $stmt->bind_param(
                        "issdss",
                        $id_artista,
                        $nombre_base,
                        $descripcion,
                        $precio,
                        $ruta_db,
                        $categoria
                    );

                    if ($stmt->execute()) {
                        $imagenes_subidas++;
                    } else {
                        $errores[] = "DB ERROR con $file_name: " . $stmt->error;
                    }
                    $stmt->close();

                } else {
                    $errores[] = "Fallo al subir el archivo: $file_name";
                }
            }

            $mensaje_resultado = "<p style='color:green;'>ÉXITO: $imagenes_subidas productos insertados.</p>";
            if (!empty($errores)) {
                $mensaje_resultado .= "<p style='color:orange;'>Advertencias/Errores:</p><ul><li>" . implode("</li><li>", $errores) . "</li></ul>";
            }
        }
    }

    // 6. Cierra la conexión si existe y es un objeto mysqli
    if ($conexion_establecida)
        $conexion->close();
}
?>

<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <title>Cargador Acelerado de Productos</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            padding: 20px;
            background-color: #f4f4f4;
        }

        .container {
            max-width: 600px;
            margin: auto;
            background: white;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        label {
            display: block;
            margin-top: 10px;
            font-weight: bold;
        }

        input[type="text"],
        input[type="number"],
        select {
            width: 100%;
            padding: 10px;
            margin-top: 5px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }

        input[type="submit"] {
            background-color: #007bff;
            color: white;
            padding: 12px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            margin-top: 20px;
            font-size: 16px;
        }

        input[type="submit"]:hover {
            background-color: #0056b3;
        }

        .file-upload {
            border: 2px dashed #ccc;
            padding: 20px;
            text-align: center;
            margin-top: 10px;
        }

        h2 {
            border-bottom: 2px solid #ccc;
            padding-bottom: 10px;
        }
    </style>
</head>

<body>
    <div class="container">
        <h2>Cargador de Productos Temporal</h2>

        <?php echo $mensaje_resultado; ?>

        <form method="POST" enctype="multipart/form-data">

            <h3>Datos Fijos (Aplicables a todos los archivos subidos)</h3>

            <label for="id_artista">Artista:</label>
            <select name="id_artista" id="id_artista" required>
                <option value="">-- Seleccionar Artista --</option>
                <?php foreach ($artistas as $id => $nombre): ?>
                    <option value="<?php echo $id; ?>"><?php echo $nombre; ?></option>
                <?php endforeach; ?>
            </select>

            <label for="categoria">Categoría (Clasificación Principal - Ej: Remeras, Buzos, Accesorios):</label>
            <select name="categoria" id="categoria" required>
                <option value="">-- Seleccionar Categoría --</option>
                <option value="Remeras">Remeras (Prioridad 1)</option>
                <option value="Buzos">Buzos (Prioridad 2)</option>
                <option value="Accesorios">Accesorios (Prioridad 3: Vinilos, Gorras, Stickers, etc.)</option>
            </select>

            <label for="nombre_base">Nombre Base del Producto (Ej: Remera de C.R.O., Vinilo de YSY A):</label>
            <input type="text" name="nombre_base" id="nombre_base" required placeholder="Ej: Remera de Trueno">

            <label for="precio">Precio (Ej: 20.00 para Remera, 80.00 para Vinilo):</label>
            <input type="number" step="0.01" name="precio" id="precio" required value="20.00">

            <h3>Archivos</h3>
            <p><strong>Convención de Nombres:</strong> La descripción se tomará de la última parte del nombre de
                archivo. Ejemplo: `Tipo-Artista-**Descripcion.ext**`</p>

            <div class="file-upload">
                <label for="imagenes">Seleccionar Fotos de Producto (Múltiples Archivos):</label>
                <input type="file" name="imagenes[]" id="imagenes" accept="image/png, image/jpeg" multiple required>
            </div>

            <input type="submit" value="Cargar e Insertar Productos">
        </form>
    </div>
</body>

</html>