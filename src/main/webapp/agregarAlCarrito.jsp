<%@ page import="com.productos.negocio.*, java.util.*" %>
<%
	int idProducto = Integer.parseInt(request.getParameter("id"));
	String nombreProducto = request.getParameter("nombre");
	int cantidad = Integer.parseInt(request.getParameter("cantidad"));
    Producto producto = new Producto().obtenerProducto(idProducto);
    
    if (producto == null) {
        response.sendRedirect("error.jsp?mensaje=El producto no existe");
        return;
    }
    
    if (cantidad > producto.getCantidad()) {
        response.sendRedirect("error.jsp?mensaje=No hay suficiente stock");
        return;
    }
    
    Carrito carrito = (Carrito) session.getAttribute("carrito");
    if (carrito == null) {
        carrito = new Carrito();
        session.setAttribute("carrito", carrito);
    }
    
    carrito.agregarItem(producto, cantidad);
%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>KATSEN - Play U R Game</title>
    <link href="css/estilos.css" rel="stylesheet" type="text/css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet">
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

    <div class="agrupar">
        <section>
            <div class="container py-5">
                <div class="row justify-content-center">
                    <div class="col-md-8 col-lg-6">
                        <div class="card shadow-lg rounded-4 border-0">
                            <div class="card-header bg-success text-white text-center rounded-top-4">
                                <h2 class="h4 m-0"><i class="bi bi-check-circle-fill me-2"></i>Producto agregado</h2>
                            </div>
                            <div class="card-body bg-dark text-white">
                                <p class="text-center fs-5">
                                    Has agregado <strong><%= cantidad %></strong> unidad(es) de<br>
                                    <strong>"<%= nombreProducto %>"</strong> a tu carrito.
                                </p>
                                <div class="d-flex justify-content-center mt-4 gap-3">
                                    <a href="mostrarProductos.jsp" class="btn btn-outline-primary rounded-pill px-4">
                                        <i class="bi bi-arrow-left-circle me-1"></i> Seguir comprando
                                    </a>
                                    <a href="carrito.jsp" class="btn btn-primary rounded-pill px-4">
                                        <i class="bi bi-cart-check me-1"></i> Ver carrito
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </div>

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
