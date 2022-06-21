<?php
require_once('db.php');

// get the post records

$txtNombre = $_POST['nombre'];
$txtEmail = $_POST['email'];
$txtTelefono= $_POST['telefono'];
$txtWeb = $_POST['sitioWeb'];
$txtAsunto = $_POST['asunto'];
$txtMensaje= $_POST['mensaje'];

// database insert SQL code
  $sql = "INSERT INTO contacto (nombre, email, telefono, sitioWeb, asunto, mensaje) 
  VALUES ('$txtNombre','$txtEmail','$txtTelefono','$txtWeb', '$txtAsunto', '$txtMensaje')";


  if ($conn->query($sql) === TRUE && $conn->affected_rows > 0) {
    echo "Operacion realizada exitosamente";
    } else {
    echo "Error: " . $sql . "<br>" . $conn->error;
    }
  $conn->close(); 
?>

<!DOCTYPE html>
<head>
        <title>Submit</title>
        <link rel="icon" href="Recursos/icono.ico" type="image/x-icon">
</head>
<a href="index.html">Regresar al inicio</a>
</html>