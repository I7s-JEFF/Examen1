<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.productos.seguridad.*"%>
<%
String usuario = (String)session.getAttribute("usuario");
if(usuario == null) {
    response.sendRedirect("login.jsp?error=Debe iniciar sesión primero");
    return;
}
Integer perfil = (Integer)session.getAttribute("perfil");
if(perfil == null) {
    response.sendRedirect("login.jsp?error=Perfil no reconocido");
    return;
}
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>KATSEN - Menú</title>
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
            <% if(perfil == 1) { // Administrador %>
                <a href="usuarioNuevo.jsp">Registrar Nuevo</a>
                <a href="bitacora.jsp">Bitacora</a>
            <% } else if(perfil == 2) { // Empleado %>
                <a href="adminProductos.jsp">Administrar Productos</a>
                <a href="categorias.jsp">Categorías</a>
                <a href="cambioClave.jsp">Cambiar Clave</a>
            <% } else if(perfil == 3) { // Cliente %>
                <a href="productos.jsp">Productos</a>
                <a href="categorias.jsp">Categorías</a>
                <a href="carrito.jsp">Carrito</a>
            <% } %>
            <a href="cerrarSesion.jsp">Cerrar Sesión</a>
        </nav>

        <div class="agrupar">
            <section>
                <h1>Bienvenido 
                <% if(perfil == 1) { %>
                    Administrador
                <% } else if(perfil == 2) { %>
                    Empleado
                <% } else if(perfil == 3) { %>
                    Cliente
                <% } %>
                <%= usuario %></h1>
                
                <p>
                <% if(perfil == 1) { %>
                    Acceda a las funciones administrativas del sistema.
                <% } else if(perfil == 2) { %>
                    Acceda a sus Productos Favoritos.
                <% } else if(perfil == 3) { %>
                    Acceda a sus funciones laborales.
                <% } %>
                </p>
            </section>
        </div>

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