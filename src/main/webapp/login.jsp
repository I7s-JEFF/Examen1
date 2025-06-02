<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>KATSEN - Login</title>
    <link href="css/estilos.css" rel="stylesheet" type="text/css">
</head>
<body>
    <main>
        <header>
            <img src="image/katsen_logo.jpeg" width="100" height="100" alt="logo KATSEN" />
            <h1>KATSEN</h1>
            <h2 class="destacado">Equipa como un pro, juega como una leyenda.</h2>
        </header>

        <nav>
            <a class="active" href="index.jsp">Inicio</a>
          	<a href="login.jsp">Login</a>
            <a href="productos.jsp">Productos</a>
            <a href="categorias.jsp">Categorias</a>
            
        </nav>

        <section> 
            <article>
			    <% if(request.getParameter("msg") != null) { %>
    			<div class="mensaje"><%= request.getParameter("msg") %></div>
				<% } %>
			     
                <h3>Ingresar al sistema</h3>
                <% if(request.getParameter("error") != null) { %>
                    <div class="error"><%= request.getParameter("error") %></div>
                <% } %>
                
                <form action="validarLogin.jsp" method="post">
                    <table border="1">
                        <tr>
                            <td>Correo electrónico</td>
                            <td><input type="text" name="txtEmail" required/>*</td>
                        </tr>
                        <tr>
                            <td>Clave</td>
                            <td><input type="password" name="txtClave" required/>*</td>
                        </tr>
                        <tr>
                            <td colspan="2">*campo obligatorio</td>
                        </tr>
                        <tr> 
                            <td><input type="submit" name="btnEnviar" value="Enviar"/></td>
                            <td><input type="reset" name="btnDelete" value="Borrar"/></td>
                        </tr>
                    </table>
                </form>
                <a href="registro.jsp">Registrarse</a>
            </article>
        </section>

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