<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="com.productos.negocio.*"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>KATSEN - Play U R Game</title>
    <link href="css/estilos.css" rel="stylesheet" type="text/css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
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

    <!-- Formulario -->
    <section>
        <form action="respuesta.jsp" method="post" enctype="multipart/form-data">
            <table class="table table-bordered w-75 mx-auto">
                <tr>
                    <td><label for="txtNombre">Nombre</label></td>
                    <td><input type="text" class="form-control" name="txtNombre" id="txtNombre" required /> *</td>
                </tr>
                <tr>
                    <td><label for="categoria">Categoría</label></td>
                    <td>
                        <%
                            Producto pr = new Producto();
                            out.print(pr.mostrarCategoria());
                        %>
                    </td>
                </tr>
                <tr>
                    <td><label for="txtCantidad">Cantidad</label></td>
                    <td><input type="text" class="form-control" name="txtCantidad" id="txtCantidad" required /> *</td>
                </tr>
                <tr>
                    <td><label for="txtPrecio">Precio</label></td>
                    <td><input type="text" class="form-control" name="txtPrecio" id="txtPrecio" required /> *</td>
                </tr>
                <tr>
                    <td><label for="fileFoto">Foto</label></td>
                    <td><input type="file" class="form-control" name="fileFoto" id="fileFoto" accept=".jpg, .jpeg, .png" /></td>
                </tr>
                <tr>
                    <td colspan="2" class="text-center">
                        <input type="submit" class="btn btn-success" name="btnEnviar" id="btnEnviar" value="Enviar" />
                        <input type="reset" class="btn btn-secondary" value="Borrar" />
                    </td>
                </tr>
            </table>
        </form>
    </section>

    <!-- Tabla de Productos -->
    <section class="tabla-container">
        <table class="table table-dark table-striped table-bordered table-hover">
            <tbody class="text-white text-center">
                <%
                    Producto producto = new Producto();
                    String resultados = producto.consultarTodoE();
                    // Reemplazamos los cierres de fila para añadir las columnas de acciones
                    out.print(resultados);
                %>
            </tbody>
        </table>
    </section>

    <!-- Footer -->
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