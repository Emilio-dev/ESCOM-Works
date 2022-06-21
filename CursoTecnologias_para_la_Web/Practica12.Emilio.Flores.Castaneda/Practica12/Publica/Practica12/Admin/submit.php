<?php
require_once('db.php');

// get the post records
$ID = $_GET['id'];
$op = $_GET['op'];

if ($op==1 || $op==2){
$txtNombre = $_POST['nombre'];
$txtEmail = $_POST['email'];
$txtTelefono= $_POST['telefono'];
$txtWeb = $_POST['sitioWeb'];
$txtAsunto = $_POST['asunto'];
$txtMensaje= $_POST['mensaje'];
}


// database insert SQL code
if ($op=='1'){
  $sql = "INSERT INTO Contacto (nombre, email, telefono, sitioWeb, asunto, mensaje) 
  VALUES ('$txtNombre','$txtEmail','$txtTelefono','$txtWeb', '$txtAsunto', '$txtMensaje')";
}
elseif($op=='2'){
  $sql = "UPDATE Contacto SET nombre='$txtNombre',telefono='$txtEmail', email='$txtTelefono', sitioWeb='$txtWeb'
, asunto='$txtAsunto', mensaje='$txtMensaje'WHERE id=$ID";
}
elseif($op=='3'){
  $sql = "DELETE FROM Contacto WHERE id='$ID'";
}

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