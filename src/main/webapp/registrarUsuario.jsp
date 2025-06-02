<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="com.productos.negocio.*, java.sql.*, com.productos.datos.Conexion" %>
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

        <section>
        <%
            String nombre = request.getParameter("txtNombre");
            String cedula = request.getParameter("txtCedula");
            String correo = request.getParameter("txtEmail");
            int perfil = Integer.parseInt(request.getParameter("cmbPerfil"));
            int estadoCivil = Integer.parseInt(request.getParameter("cmbEstadoCivil"));
            String clave = "654321";

            Conexion conn = new Conexion();
            Connection con = conn.getConexion();

            String sql = "INSERT INTO tb_usuario(id_per, id_est, nombre_us, cedula_us, correo_us, clave_us) VALUES (?, ?, ?, ?, ?, ?)";

            try {
                PreparedStatement ps = con.prepareStatement(sql);
                ps.setInt(1, perfil);
                ps.setInt(2, estadoCivil);
                ps.setString(3, nombre);
                ps.setString(4, cedula);
                ps.setString(5, correo);
                ps.setString(6, clave);

                int filas = ps.executeUpdate();
                ps.close();
                con.close();

                if (filas > 0) {
        %>
                    <p>Registro exitoso. <a href="login.jsp">Iniciar sesión</a></p>
        <%
                } else {
        %>
                    <p>Error al registrar usuario.</p>
        <%
                }
            } catch (Exception e) {
                out.println("Error en registro: " + e.getMessage());
            }
        %>
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
