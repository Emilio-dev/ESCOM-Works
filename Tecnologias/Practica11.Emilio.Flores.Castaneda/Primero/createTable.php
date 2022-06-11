<?php
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "myDB";

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);
// Check connection
if ($conn->connect_error) {
  die("Connection failed: " . $conn->connect_error);
}

// sql to create table
$sql = "CREATE TABLE Alumno (
id INT(6) UNSIGNED AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(30),
apellido VARCHAR(30),
direccion VARCHAR(30),
telefono VARCHAR(12),
correo VARCHAR(50),
documento VARCHAR(12),
fechaNacimiento DATE,
curso VARCHAR(12),
horario VARCHAR(20),
dias VARCHAR(100),
tipoPago VARCHAR (12),
numeroContrato VARCHAR (20),
personaAtendio VARCHAR (100),
fechaInscripcion DATE
)";

if ($conn->query($sql) === TRUE) {
  echo "Table Alumno created successfully";
} else {
  echo "Error creating table: " . $conn->error;
}

$conn->close();
?> 
