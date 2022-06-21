<?php
require_once('db.php');
//get results from database
$ID = $_GET['id'] ;
$op = $_GET['op'] ;
$result = mysqli_query($conn, "SELECT * FROM Contacto WHERE id='$ID'");
$rows=mysqli_fetch_assoc($result);
?>
<!DOCTYPE html>
<html> 
    <head>
        <title>Listado de Alumnos</title>
        <link rel="icon" href="Recursos/icono.ico" type="image/x-icon">
        <link rel="stylesheet" href="Recursos/mystyle.css">
    </head>
<body> 
</head>
<form action="submit.php?id=<?php echo $rows['id'] ?> & op=<?php echo $op ?>" method="post">
<div class="global">
    <div id="header">Formulario de contacto</div>
    <div id="text">Escribe y en breve me pondre en contacto contigo</div>
    <div id="text"><label for="nombre">Nombre<br></label><input type="text" name="nombre" style="width:380px" value="<?php echo $rows['nombre']; ?>" required /></div>
    <div id="text"><label for="email">Email<br></label><input  type="email" name="email" style="width:380px" value="<?php echo $rows['email']; ?>" required /></div>
    <div id="text"><label for="telefono">Telefono<br></label><input  type="tel" name="telefono" style="width:380px" value="<?php echo $rows['telefono']; ?>" required /></div>
    <div id="text"><label for="sitioWeb">Sitio web<br></label><input  type="text" name="sitioWeb" style="width:380px" value="<?php echo $rows['sitioWeb']; ?>" /></div>
    <div id="text"><label for="asunto">Asunto<br></label><input type="text" name="asunto" style="width:380px" value="<?php echo $rows['asunto']; ?>" required /></div>
    <div id="text"><label for="mensaje">Mensaje<br></label><textarea rows = "5" cols = "60" name="mensaje" style="width:380px;height:200px;"><?php echo $rows['mensaje']; ?></textarea>    </div>
    <div ><input id="boton" type = "submit" value = "Submit" /></div>
</div>
</form>
<a href="index.html">Regresar al inicio</a>
</body>
</html>