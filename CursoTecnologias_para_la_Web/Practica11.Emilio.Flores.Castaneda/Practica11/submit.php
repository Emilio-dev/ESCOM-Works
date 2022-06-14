<?php
require_once('db.php');

// get the post records
$ID = $_GET['id'];
$op = $_GET['op'];

if ($op==1 || $op==2){
$txtNombre = $_POST['nombre'];
$txtApellido = $_POST['apellido'];
$txtDireccion = $_POST['direccion'];
$txtTelefono = $_POST['telefono'];
$txtCorreo = $_POST['correo'];
$txtDocumento= $_POST['documento'];
$txtFechaNacimiento = $_POST['fechaNacimiento'];
$txtCurso = $_POST['curso'];
$txtHorario= $_POST['horario'];
$txtDias = $_POST['dias'];
$txtTipoPago = $_POST['tipoPago'];
$txtNumeroContrato = $_POST['numeroContrato'];
$txtPersonaAtendio = $_POST['personaAtendio'];
$txtFechaInscripcion = $_POST['fechaInscripcion'];
$txtDias=implode(",", $txtDias);
}


// database insert SQL code
if ($op=='1'){
  $sql = "INSERT INTO Alumno (nombre, apellido, direccion, telefono, correo,documento, fechaNacimiento, curso, horario, dias, tipoPago, numeroContrato, personaAtendio, fechaInscripcion) 
  VALUES ('$txtNombre', '$txtApellido', '$txtDireccion', '$txtTelefono', '$txtCorreo','$txtDocumento','$txtFechaNacimiento', '$txtCurso', '$txtHorario', '$txtDias', '$txtTipoPago', '$txtNumeroContrato', '$txtPersonaAtendio', '$txtFechaInscripcion')";
}
elseif($op=='2'){
  $sql = "UPDATE Alumno SET nombre='$txtNombre', apellido='$txtApellido', direccion='$txtDireccion', telefono='$txtTelefono', correo='$txtCorreo', fechaNacimiento='$txtFechaNacimiento'
, curso='$txtCurso', horario='$txtHorario',dias='$txtDias', tipoPago='$txtTipoPago', numeroContrato='$txtNumeroContrato', personaAtendio='$txtPersonaAtendio', fechaInscripcion='$txtFechaInscripcion' 
WHERE id=$ID";
}
elseif($op=='3'){
  $sql = "DELETE FROM Alumno WHERE id='$ID'";
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
        <title>Practica11</title>
        <link rel="icon" href="Recursos/icono.ico" type="image/x-icon">
</head>
<a href="index.html">Regresar al inicio</a>
</html>