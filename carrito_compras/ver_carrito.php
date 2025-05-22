<?php
session_start();
require 'db.php';
if (!isset($_SESSION['user_id'])) {
    header("Location: login.php");
    exit();
}
$stmt = $conn->prepare("
    SELECT c.id, p.nombre, p.precio 
    FROM carrito c 
    JOIN productos p ON c.producto_id = p.id 
    WHERE c.user_id = ?");
$stmt->bind_param("i", $_SESSION['user_id']);
$stmt->execute();
$result = $stmt->get_result();
?>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Carrito</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    <h1>Tu Carrito</h1>
    <a href="index.php">Seguir comprando</a>
    <ul>
        <?php while ($item = $result->fetch_assoc()): ?>
            <li>
                <?= htmlspecialchars($item['nombre']) ?> - $<?= number_format($item['precio'], 2) ?>
                <a href="eliminar_carrito.php?id=<?= $item['id'] ?>">Eliminar</a>
            </li>
        <?php endwhile; ?>
    </ul>
</body>
</html>
