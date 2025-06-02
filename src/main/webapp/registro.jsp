<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="com.productos.negocio.*"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>KATSEN - Play U R Game</title>
    <link href="css/estilos.css" rel="stylesheet" type="text/css">
</head>
<body>
    <main>

        <header>
            <img src="image/katsen_logo.jpeg" width="100" height="100" alt="logo KATSEN" />
            <h1>KATSEN</h1>
            <h2 class="destacado">Equipa como un pro, juega como una leyenda.</h2>
            <h2 id="favorito">Equipamiento profesional para competir al máximo nivel</h2>
        </header>

        <nav>
            <a class="active" href="index.jsp">Inicio</a>
      		<a href="login.jsp">Login</a>
            <a href="contacto.jsp">Contacto</a>
            <a href="carrito.jsp">Carrito</a>
        </nav>
		<h3>Registro Nuevo Cliente</h3>
		<form action = "respuesta.jsp" method = "post">
		    <table border = "1"> 
		    	<tr> <td>Nombre</td> <td> <input type = "text" name ="txtNombre" required/>*</td></tr>
		    	<tr> <td>Cedula</td> <td> <input type = "text" name ="txtCedula" maxlength="10" required/>*</td></tr>
		    	<tr> <td>Estado Civil</td> <td><select name="cmbECivil"> 
													<option value="1">Soltero</option>
													<option value="2">Casado</option>
													<option value="3">Divorciado</option>
													<option value="4">Viudo</option>
												</select></td></tr>
				<tr> <td>Lugar de residencia</td> <td> <input type="radio" name="rdResidencia" value="Sur"/>Sur  
														<input type="radio" name="rdResidencia" value="Norte"/>Norte
														<input type="radio" name="rdResidencia" value="Centro"/>Centro</td></tr>
				<tr> <td>Foto</td> <td><input type="file" name="fileFoto" accept=".jpg, .jpeg, .png"  /> </td></tr>
				<tr> <td>Mes y año de nacimiento</td> <td><input type="month" name="fecha"/></td></tr>
				<tr> <td>Color favorito</td> <td> <input type="color" id="color" name="cColor"/>*</td></tr>
				<tr> <td>Correo Electronico</td> <td><input type="email" id="email" name="txtEmail" placeholder="usuario@nombreProveedor.dominio" required />*</td> </tr>
				<tr> <td>Clave</td> <td> <input type="password" id="clave" name="txtClave" required/></td></tr>
				<tr> <td colspan="2">*Campo Obligatorio</td></tr>
		    	<tr><td><input type = "submit" name = "btnEnviar" id = "btnEnviar" value = "Enviar registro"/></td> <td><input type = "reset"/></td></tr>
		    </table>
		</form>
        <footer>
            <ul>
                <li><a href="https://www.facebook.com/"><img src="iconos/facebook_icon.png" width="40" height="40" alt="Facebook" /></a></li>
                <li><a href="https://www.linkedin.com/"><img src="iconos/linkedin_icon.png" width="40" height="40" alt="Linkedin" /></a></li>
                <li><a href="https://www.x.com/"><img src="iconos/x2_icon.png" width="33" height="33" alt="X" /></a></li>
                <li><a href="https://www.intagram.com/"><img src="iconos/instagram_icon.png" width="43" height="43" alt="Instagram" /></a></li>
            </ul>
        </footer>
    </main>
</body>
</html>
