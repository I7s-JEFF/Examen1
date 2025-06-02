<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<%@ page import="com.productos.datos.Conexion" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>KATSEN - Cambiar Clave</title>
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
        <a href="productos.jsp">Productos</a>
        <a href="categorias.jsp">Categorias</a>
    </nav>

    <section>
        <article>
            <%
                // Verificar si el usuario está logueado
                if (session.getAttribute("id_usuario") == null) {
                    response.sendRedirect("login.jsp?error=Debe iniciar sesión para cambiar la clave");
                    return;
                }

                if ("POST".equalsIgnoreCase(request.getMethod())) {
                    int idUsuario = (Integer) session.getAttribute("id_usuario");
                    String claveAnterior = request.getParameter("clave_anterior");
                    String claveNueva = request.getParameter("clave_nueva");
                    String repetirClave = request.getParameter("repetir_clave");

                    // Validaciones
                    if (claveAnterior == null || claveNueva == null || repetirClave == null || 
                        claveAnterior.isEmpty() || claveNueva.isEmpty() || repetirClave.isEmpty()) {
                        out.println("<p class='error'>Todos los campos son obligatorios.</p>");
                    } else if (!claveNueva.equals(repetirClave)) {
                        out.println("<p class='error'>Las nuevas claves no coinciden.</p>");
                    } else if (claveNueva.length() < 6) {
                        out.println("<p class='error'>La nueva clave debe tener al menos 6 caracteres.</p>");
                    } else {
                        Conexion conn = new Conexion();
                        Connection con = null;
                        PreparedStatement psVerifica = null;
                        PreparedStatement psUpdate = null;
                        ResultSet rs = null;

                        try {
                            con = conn.getConexion();
                            // Verifica la clave anterior
                            String sqlVerifica = "SELECT clave_us FROM tb_usuario WHERE id_us = ?";
                            psVerifica = con.prepareStatement(sqlVerifica);
                            psVerifica.setInt(1, idUsuario);
                            rs = psVerifica.executeQuery();

                            if (rs.next() && rs.getString("clave_us").equals(claveAnterior)) {
                                // Actualiza la clave
                                String sqlUpdate = "UPDATE tb_usuario SET clave_us = ? WHERE id_us = ?";
                                psUpdate = con.prepareStatement(sqlUpdate);
                                psUpdate.setString(1, claveNueva);
                                psUpdate.setInt(2, idUsuario);

                                int filas = psUpdate.executeUpdate();
                                if (filas > 0) {
                                    out.println("<p class='success'>Clave actualizada correctamente.</p>");
                                } else {
                                    out.println("<p class='error'>Error al actualizar la clave.</p>");
                                }
                            } else {
                                out.println("<p class='error'>Clave anterior incorrecta.</p>");
                            }
                        } catch (SQLException e) {
                            out.println("<p class='error'>Error de base de datos: " + e.getMessage() + "</p>");
                        } finally {
                            // Cerrar recursos
                            if (rs != null) try { rs.close(); } catch (SQLException e) {}
                            if (psVerifica != null) try { psVerifica.close(); } catch (SQLException e) {}
                            if (psUpdate != null) try { psUpdate.close(); } catch (SQLException e) {}
                            if (con != null) try { con.close(); } catch (SQLException e) {}
                        }
                    }
                }
            %>

            <form method="post" action="cambioClave.jsp">
                <h2>Cambiar Clave</h2>
                <table>
                    <tr>
                        <td>Clave anterior:</td>
                        <td><input type="password" name="clave_anterior" required></td>
                    </tr>
                    <tr>
                        <td>Clave nueva:</td>
                        <td><input type="password" name="clave_nueva" required minlength="6"></td>
                    </tr>
                    <tr>
                        <td>Repetir clave:</td>
                        <td><input type="password" name="repetir_clave" required minlength="6"></td>
                    </tr>
                </table>

                <div class="botones">
                    <button type="submit">Guardar</button>
                    <button type="reset">Restablecer</button>
                </div>
            </form>
        </article>
    </section>

    <footer>
        <ul>
            <li><a href="https://www.facebook.com/"><img src="iconos/facebook_icon.png" width="40" height="40" alt="Facebook" /></a></li>
            <li><a href="https://www.linkedin.com/"><img src="iconos/linkedin_icon.png" width="40" height="40" alt="Linkedin" /></a></li>
            <li><a href="https://www.x.com/"><img src="iconos/x2_icon.png" width="33" height="33" alt="X" /></a></li>
            <li><a href="https://www.instagram.com/"><img src="iconos/instagram_icon.png" width="43" height="43" alt="Instagram" /></a></li>
        </ul>