SET NAMES utf8mb4;
CREATE TABLE IF NOT EXISTS productos (
id INT AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(100) NOT NULL,
descripcion TEXT,
precio DECIMAL(10,2) NOT NULL,
existencia INT NOT NULL DEFAULT 0,
creado_en TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
CREATE TABLE IF NOT EXISTS usuarios (
id INT AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(100) NOT NULL,
correo VARCHAR(150) NOT NULL UNIQUE,
contrasena VARCHAR(255) NOT NULL,
creado_en TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
CREATE TABLE IF NOT EXISTS pedidos (
id INT AUTO_INCREMENT PRIMARY KEY,
usuario_id INT NOT NULL,
total DECIMAL(10,2) NOT NULL,
fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
FOREIGN KEY (usuario_id) REFERENCES usuarios(id)
);
CREATE TABLE IF NOT EXISTS pedido_detalle (
id INT AUTO_INCREMENT PRIMARY KEY,
pedido_id INT NOT NULL,
producto_id INT NOT NULL,
cantidad INT NOT NULL,
precio_unitario DECIMAL(10,2) NOT NULL,
FOREIGN KEY (pedido_id) REFERENCES pedidos(id),
FOREIGN KEY (producto_id) REFERENCES productos(id)
);
INSERT INTO productos (nombre, descripcion, precio, existencia) VALUES
('Cuaderno profesional', 'Cuaderno de 100 hojas, raya', 45.00, 50),
('Bolígrafo azul', 'Bolígrafo de tinta azul punto mediano', 8.50, 200),
('Mochila escolar', 'Mochila con tres compartimentos', 399.00, 15),
('Calculadora científica', 'Calculadora con 240 funciones', 299.00, 20),
('Lápiz 2B', 'Lápiz de grafito 2B', 5.00, 300);