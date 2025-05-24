<?php

// Conexión a la base de datos
$host = "localhost";
$user = "root";
$pass = "MrRoot313x2";
$db = "tienda";
$conn = new mysqli($host, $user, $pass, $db, 3306);

if ($conn->connect_error) {
    die("Error de conexión: " . $conn->connect_error);
}

// Procesar formulario
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $nombre = $conn->real_escape_string($_POST['nombre']);
    $precio = floatval($_POST['precio']);
    $descripcion = $conn->real_escape_string($_POST['descripcion']);

       // Procesar imagen
    if (isset($_FILES['imagen']) && $_FILES['imagen']['error'] == 0) {
        $permitidos = ['jpg', 'jpeg', 'png', 'gif','webp'];
        $img_tipo = strtolower(pathinfo($_FILES['imagen']['name'], PATHINFO_EXTENSION));

        if (in_array($img_tipo, $permitidos)) {
            $img_binario = file_get_contents($_FILES['imagen']['tmp_name']);
            $img_binario = $conn->real_escape_string($img_binario);
            
                // Guardar en la base de datos
                $sql = "INSERT INTO productos (nombre, precio, descripcion, img) VALUES ('$nombre', $precio, '$descripcion', '$img_binario')";
                if ($conn->query($sql) === TRUE) {
                    echo "<script>alert('Producto registrado correctamente.');</script>";
                    
                } else {
                    echo "<script>alert('Producto registrado correctamente. ". $conn->error."');</script>";
                }
            
        } else {
            echo "Formato de imagen no permitido.";
        }
    } else {
        echo "Debe seleccionar una imagen.";
    }
}

    class usr {
        public $ident;
        public $mail;
        public $pass;
        public $image;


        function __construct($ident, $mail, $pass, $image)
        {
            $this -> ident = $ident;
            $this -> mail = $mail;
            $this -> pass = $pass;
            $this -> image = $image;
            
        }

        function registrar()
        {

        }
    }




?>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Administrar Usuarios</title>
    <link rel="stylesheet" href="stylos/stylo.css">
    <link rel="icon" href="image/opia.ico">
</head>

<body>
    <header>
        <nav class="header-cont">
            <nav><img src="" alt=""></nav>
            <h2>Administrar Usuarios</h2>
        </nav>
        
    </header>
    <section>
        
    <form method="post" enctype="multipart/form-data">
        <label>Nombre:</label><br>
        <input type="text" name="nombre" required><br><br>
        <label>Precio:</label><br>
        <input type="number" step="0.01" name="precio" required><br><br>
        <label>Stock:</label><br>
        <input type="number" step="0.01" name="stock" required><br><br>
        <label>Descripción:</label><br>
        <textarea name="descripcion" required></textarea><br><br>
        <label>Imagen:</label><br>
        <input type="file" name="imagen" accept="image/*" required><br><br>
        <input type="submit" value="Registrar">
    </form>
    </section>
    <section>
    
        <?php
            echo "<h2>Productos en el carrito</h2>";
            $sql = "SELECT * from usuarios";
            $result = $conn->query($sql);
            if ($result && $result->num_rows > 0) {
        
            echo "<table border='2' class='usuarios table-scroll-wrapper'>
                <tr>
                <th>Id</th>
                <th>Email</th>
                <th>Password</th>
                <th>img</th>
                </tr>";
        
            while ($row = $result->fetch_assoc()) {
        
                echo "<tr>".
                "<td>{$row['id']}</td>".
                "<td>{$row['email']}</td>".
                "<td>{$row['password']}</td>".
                "<td><img src='data: image/png;base64,". base64_encode($row['img'])."'></td>".
                "<td>
                    <form method='post' action='editar_producto.php' style='display:inline;'>
                        <input type='hidden' name='id' value='{$row['id']}'>
                        <button type='submit'>Editar</button>
                    </form>
                    <br>
                    <form method='post' action='eliminar_producto.php' style='display:inline;' onsubmit=\"return confirm('¿Seguro que deseas eliminar este producto?');\">
                        <input type='hidden' name='id' value='{$row['id']}'>
                        <button type='submit'>Eliminar</button>
                    </form>
                </td>".
                "</tr>";
            }
            echo "</table>";
        } else {
            echo "No hay productos en el carrito.";
        }
        ?>
    </section>
