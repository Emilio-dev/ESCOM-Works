<?php
require_once('db.php');
//get results from database
$result = mysqli_query($conn, "SELECT * FROM Contacto");
?>
<!DOCTYPE html> 
<html> 
<head>
    <title>Listado de Alumnos</title>
    <link rel="icon" href="Recursos/icono.ico" type="image/x-icon">
	<link rel="stylesheet" href="Recursos/mystyle.css">
</head>
	<body> 
	<table class="global" align="center"> 
	<tr> 
		<th class="header" colspan="15"><h2>Listado</h2></th> 
		</tr> 
            <th class="cells">ID</th>
            <th class="cells">Nombre</th>
            <th class="cells">Email</th>
            <th class="cells">Telefono</th>
            <th class="cells">Sitio Web</th>
            <th class="cells">Asunto</th>
			<th class="cells">Mensaje</th>                   
		</tr> 

		<?php while($rows=mysqli_fetch_assoc($result)) 
		{ 
		?> 
		<tr>
        <td class="cells"><?php echo $rows['id']; ?></td> 
		<td class="cells"><?php echo $rows['nombre']; ?></td> 
		<td class="cells"><?php echo $rows['email']; ?></td> 
        <td class="cells"><?php echo $rows['telefono']; ?></td>
		<td class="cells"><?php echo $rows['sitioWeb']; ?></td> 
		<td class="cells"><?php echo $rows['asunto']; ?></td> 
		<td class="cells"><?php echo $rows['mensaje']; ?></td> 
		</tr> 
	<?php 
               } 
          ?> 

	</table> 
	<a href="index.html">Regresar al inicio</a>
	</body> 
	</html>