<?php
require_once('db.php');
//get results from database
$ID = $_GET['id'] ;
$op = $_GET['op'] ;
$result = mysqli_query($conn, "SELECT * FROM Alumno WHERE id='$ID'");
$rows=mysqli_fetch_assoc($result);
?>
<!DOCTYPE html>

<head>
        <title>Formulario de Inscripcion</title>
        <link rel="icon" href="Recursos/icono.ico" type="image/x-icon">
        <link rel="stylesheet" href="Recursos/mystyle.css">
</head>
<div class="global" id="header">
    FORMULARIO DE INSCRIPCION
</div>
<div class="global" id="subheader">
    DATOS PERSONALES
</div>
<form action="submit.php?id=<?php echo $rows['id'] ?> & op=<?php echo $op ?>" method="post">
    <table class="data" width="630px">
        <tbody>
            <tr>
                <td class="questions" colspan="2"><label for="nombre">Nombre</label></td>
                <td class="answers" colspan="4"><input  type="text" id="nombre" name="nombre" required
                        value="<?php echo $rows['nombre']; ?>"style="width: 300px;"></td>
            </tr>
            <tr>
                <td class="questions" colspan="2"><label for="apellido">Apellido</label></td>
                <td class="answers" colspan="4"><input  type="text" id="apellido" name="apellido" required
                        value="<?php echo $rows['apellido']; ?>"style="width: 300px;" required></td>
            </tr>
            <tr>
                <td class="questions" colspan="2"><label for="direccion">Apellido</label></td>
                <td class="answers" colspan="4"><input  type="text" id="direccion" name="direccion" required
                        value="<?php echo $rows['direccion']; ?>"style="width: 300px;" required></td>
            </tr>
            <tr>
                <td class="questions" colspan="2"><label for="telefono">Telefono</label></td>
                <td class="answers" colspan="4"><input  type="tel" id="telefono" name="telefono" required
                        value="<?php echo $rows['telefono']; ?>"style="width: 300px;" required></td>
            </tr>
            <tr>
                <td class="questions" colspan="2"><label for="correo">Correo</label></td>
                <td class="answers" colspan="4"><input  type="email" id="correo" name="correo" required
                        value="<?php echo $rows['correo']; ?>"style="width: 300px;" required></td>
            </tr>
            <tr>
                <td class="questions" colspan="2"><label for="documento">Documento</label></td>
                <td class="answers"><input type="radio" name="documento" value="si" required><label for="radio">Si</label><input type="radio" name="documento" value="no" required><label for="radio">No</label></td>
            </tr>
            <tr>
                <td class="questions" colspan="2"><label for="fechaNacimiento">Fecha de Nacimiento</label></td>
                <td class="answers" colspan="4"><input  type="date" id="fechaNacimiento" name="fechaNacimiento" required value="<?php echo $rows['fechaNacimiento'];?>"></td>
            </tr>
        </tbody>
    </table>
<div class="global" id="subheader">
    CAPACITACION
</div>

    <table class="data" width="630px">
        <tbody>
            <tr>
                <td class="questions">Curso</td>
                <td class="answers">
                    <select name="curso" id="curso" required>
                        <option value="">Elija un curso</option>
                        <option value="Matematicas">Matematicas</option>
                        <option value="Espanol">Espanol</option>
                        <option value="Ingles">Ingles</option>
                        <option value="Programacion">Programacion</option>
                    </select>
                </td>

                <td class="questions" colspan="4">Dias</td>
            </tr>
            <tr>
                <td class="questions">Horario</td>
                <td class="answers">
                    <select name="horario" id="horario" required>
                        <option value="">Elija un horario</option>
                        <option value="Matutino">Matutino</option>
                        <option value="Vespertino">Vespertino</option>
                        <option value="Mixto">Mixto</option>
                    </select>
                </td>
                <div>
                <td class="answers"><label for="lunes">Lunes</label><input type="checkbox" name="dias[]" value="lunes"> </td>
                <td class="answers"><label for="martes">Martes</label><input type="checkbox" name="dias[]" value="martes"> </td>
                <td class="answers"><label for="miercoles">Miercoles</label><input type="checkbox" name="dias[]" value="miercoles"></td>
                <td class="answers"><label for="jueves">Jueves</label><input type="checkbox" name="dias[]" value="jueves"> </td>
                </div>
            </tr>
        </tbody>
    </table>
<div class="global" id="subheader">
    PLAN DE PAGO
</div>
    <table class="data" width="630px">
        <tbody>
            <tr>
                <td class="answers"><input type="radio"  name="tipoPago" value="contado" required><label for="radio"></label></td>
                <td class="questions">Contado</td>
                <td class="answers" colspan="4">Moneda</td>
            </tr>
            <tr>
                <td class="answers"><input type="radio"  name="tipoPago" value="credito" required> <label for="radio"></label></td>
                <td class="questions">Credito</td>
                <td class="answers" colspan="4">Tarjeta</td>
            </tr>
        </tbody>
    </table>
<div class="global" id="subheader">
    DATOS DE LA INSTITUCION
</div>
    <table class="data" width="630px">
        <tbody>
            <tr>
                <td class="questions"><label for="numeroContrato">N de contrato</label></td>
                <td class="answers" colspan="5"><input  type="number" id="numeroContrato" name="numeroContrato" required
                        value="<?php echo $rows['numeroContrato'];?>" style="width: 300px;"></td>
            </tr>
            <tr>
                <td class="questions"><label for="personaAtendio">Persona que Atendio</label></td>
                <td class="answers" colspan="5"><input  type="text" id="personaAtendio" name="personaAtendio" required
                        value="<?php echo $rows['personaAtendio'];?>" style="width: 300px;"d></td>
            </tr>
            <tr>
                <td class="questions"><label for="fechaInscripcion">Fecha de Inscripcion</label></td>
                <td class="answers" colspan="5"><input  type="date" id="fechaInscripcion" name="fechaInscripcion" required value="<?php echo $rows['fechaInscripcion'];?>"></td>
            </tr>
        </tbody>
    </table>
    <input type="submit" name="formSubmit" value="Submit" >
</form>
<a href="index.html">Regresar al inicio</a>
</html>