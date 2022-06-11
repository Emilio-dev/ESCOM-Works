<?php
require_once('db.php');
//get results from database
$result = mysqli_query($conn, "SELECT * FROM Alumno");
$po = $_GET['po'];
if($po==1){
$link='modificacionFormulario.php';    
$op='2';
}
elseif($po==2){
$link='submit.php';    
$op='3';
}
?>
<!DOCTYPE html> 
<html> 
<head>
    <title>Listado de Alumnos</title>
    <link rel="icon" href="Recursos/icono.ico" type="image/x-icon">
	<link rel="stylesheet" href="Recursos/mystyle.css">
</head>
	<body> 
	<table class="data" align="center"> 
	<tr> 
		<th class="header" colspan="15"><h2>Listado</h2></th> 
		</tr> 
            <th class="questions">ID</th>
            <th class="questions">Nombre</th>
            <th class="questions">Apellido</th>
            <th class="questions">Direccion</th>
            <th class="questions">Documento</th>
            <th class="questions">Telefono</th>
            <th class="questions">Correo</th>
            <th class="questions">Fecha de Nacimiento</th>
            <th class="questions">Curso</th>
            <th class="questions">Horario</th>
            <th class="questions">Dias</th>
            <th class="questions">Tipo de Pago</th>
            <th class="questions">Numero de Contrato</th>
            <th class="questions">Persona que Atendio</th>
            <th class="questions">Fecha de Inscripcion</th>
                    
		</tr> 

		<?php while($rows=mysqli_fetch_assoc($result)) 
		{  
		?> 
		<tr>
        <td class="questions"><a href="<?php echo $link ?>?id=<?php echo $rows['id'] ?> & op=<?php echo $op ?>"><?php echo $rows['id']; ?></a></td> 
        <td class="questions"><?php echo $rows['nombre']; ?></td> 
		<td class="questions"><?php echo $rows['apellido']; ?></td> 
		<td class="questions"><?php echo $rows['direccion']; ?></td> 
        <td class="questions"><?php echo $rows['telefono']; ?></td>
        <td class="questions"><?php echo $rows['correo']; ?></td> 
        <td class="questions"><?php echo $rows['documento']; ?></td> 
		<td class="questions"><?php echo $rows['fechaNacimiento']; ?></td> 
		<td class="questions"><?php echo $rows['curso']; ?></td> 
		<td class="questions"><?php echo $rows['horario']; ?></td> 
        <td class="questions"><?php echo $rows['dias']; ?></td> 
		<td class="questions"><?php echo $rows['tipoPago']; ?></td> 
		<td class="questions"><?php echo $rows['numeroContrato']; ?></td> 
		<td class="questions"><?php echo $rows['personaAtendio']; ?></td> 
        <td class="questions"><?php echo $rows['fechaInscripcion']; ?></td> 
		</tr> 
	<?php 
               } 
          ?> 
	</table> 
	</body> 
	</html>