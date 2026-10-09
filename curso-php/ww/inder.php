<?php
// www/index.php - Página de inicio de Mi Tienda (versión de prueba)
header("Content-Type: text/html; charset=utf-8");
$conexion = new PDO("mysql:host=db;dbname=tienda;charset=utf8mb4", "alumno", 
"alumno123");
$conexion->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
echo "<h1>Mi Tienda</h1>";
echo "<p>Si ves la lista de productos, Apache, PHP y MySQL ya funcionan.</p>";
echo "<ul>";
$consulta = $conexion->query("SELECT nombre, precio FROM productos");
foreach ($consulta as $fila) {
echo "<li>" . $fila["nombre"] . " - $" . $fila["precio"] . "</li>";
}
echo "</ul>"
