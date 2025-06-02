<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="com.productos.negocio.*"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>KATSEN - Productos</title>
    <link href="css/estilos.css" rel="stylesheet" type="text/css">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
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
            <a href="categorias.jsp">Categorias</a>
        </nav>
        
        <section> 
            <h3>Nuestros Productos</h3>
            <div class="tabla-container">
                <%
                    Producto pr = new Producto();
                    out.print(pr.consultarTodo());
                %>
            </div>
        </section>

        <footer>
            <ul>
                <li><a href="https://www.facebook.com/"><img src="iconos/facebook_icon.png" width="40" height="40" alt="Facebook" /></a></li>
                <li><a href="https://www.linkedin.com/"><img src="iconos/linkedin_icon.png" width="40" height="40" alt="Linkedin" /></a></li>
                <li><a href="https://www.x.com/"><img src="iconos/x2_icon.png" width="33" height="33" alt="X" /></a></li>
                <li><a href="https://www.instagram.com/"><img src="iconos/instagram_icon.png" width="43" height="43" alt="Instagram" /></a></li>
            </ul>
        </footer>
    </main>
</body>
</html>