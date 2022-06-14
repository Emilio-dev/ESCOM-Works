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
$sql = "CREATE TABLE Contacto (
id INT(6) UNSIGNED AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(30),
email VARCHAR(30),
telefono VARCHAR(12),
sitioWeb VARCHAR(50),
asunto VARCHAR(100),
mensaje VARCHAR (100)
)";

if ($conn->query($sql) === TRUE) {
  echo "Table Alumno created successfully";
} else {
  echo "Error creating table: " . $conn->error;
}

$conn->close();
?> 
