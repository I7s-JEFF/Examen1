<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.productos.negocio.*, java.util.*, java.text.NumberFormat" %>
<%
    // Obtener el carrito de la sesión o crear uno nuevo
    Carrito carrito = (Carrito) session.getAttribute("carrito");
    if (carrito == null) {
        carrito = new Carrito();
        session.setAttribute("carrito", carrito);
    }
    
    // Procesar acciones (agregar, eliminar, actualizar)
    String action = request.getParameter("action");
    if (action != null) {
        int idProducto = Integer.parseInt(request.getParameter("id"));
        Producto product = new Producto().obtenerProducto(idProducto);
        
        switch(action) {
            case "add":
                int cantidad = Integer.parseInt(request.getParameter("cantidad"));
                carrito.agregarItem(product, cantidad);
                break;
            case "remove":
                carrito.eliminarItem(idProducto);
                break;
            case "update":
                int nuevaCantidad = Integer.parseInt(request.getParameter("cantidad"));
                carrito.actualizarCantidad(idProducto, nuevaCantidad);
                break;
        }
    }
    
    // Formateador para moneda
    NumberFormat formatoMoneda = NumberFormat.getCurrencyInstance();
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>KATSEN - Play U R Game</title>
    <link href="css/estilos.css" rel="stylesheet" type="text/css">
	<link href="https://cdn.jsdelivr.net/npm/bootswatch@5.3.3/dist/cosmo/bootstrap.min.css" rel="stylesheet">
	
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
			    <h2>Tu Carrito de Compras</h2>
    
			    <div class="container mt-4">
			    <% if (carrito.getItems().isEmpty()) { %>
			        <div class="card text-center py-5">
			            <div class="card-body">
			                <i class="bi bi-cart-x text-muted" style="font-size: 3rem;"></i>
			                <h3 class="h4 mt-3">Tu carrito está vacío</h3>
			                <p class="text-muted">Agrega productos para comenzar tu compra</p>
			                <a href="mostrarProductos.jsp" class="btn btn-primary mt-3">
			                    <i class="bi bi-bag"></i> Ver Productos
			                </a>
			            </div>
			        </div>
			    <% } else { %>
			        <div class="card shadow">
			            <div class="card-header bg-light">
			                <h3 class="h5 mb-0">Mi Carrito</h3>
			            </div>
			            
			            <div class="card-body">
			                <div class="table-responsive">
			                    <table class="table">
			                        <thead class="table-light">
			                            <tr>
			                                <th>Producto</th>
			                                <th class="text-end">Precio Unitario</th>
			                                <th class="text-center">Cantidad</th>
			                                <th class="text-end">Subtotal</th>
			                                <th class="text-center">Acciones</th>
			                            </tr>
			                        </thead>
			                        <tbody>
			                            <% for (ItemCarrito item : carrito.getItems()) { 
			                                Producto producto = item.getProducto();
			                                double subtotal = producto.getPrecio() * item.getCantidad();
			                            %>
			                            <tr>
			                                <td><%= producto.getNombre() %></td>
			                                <td class="text-end"><%= formatoMoneda.format(producto.getPrecio()) %></td>
			                                <td class="text-center">
			                                    <form method="post" action="carrito.jsp" class="d-flex justify-content-center gap-2">
			                                        <input type="hidden" name="action" value="update">
			                                        <input type="hidden" name="id" value="<%= producto.getId() %>">
			                                        <input type="number" name="cantidad" value="<%= item.getCantidad() %>" 
			                                               min="1" max="<%= producto.getCantidad() %>" 
			                                               class="form-control form-control-sm text-center" style="width: 70px;">
			                                        <button type="submit" class="btn btn-sm btn-outline-primary">
			                                            <i class="bi bi-arrow-clockwise"></i>
			                                        </button>
			                                    </form>
			                                </td>
			                                <td class="text-end"><%= formatoMoneda.format(subtotal) %></td>
			                                <td class="text-center">
			                                    <a href="carrito.jsp?action=remove&id=<%= producto.getId() %>" 
			                                       class="btn btn-sm btn-outline-danger">
			                                        <i class="bi bi-trash"></i>
			                                    </a>
			                                </td>
			                            </tr>
			                            <% } %>
			                            <tr class="table-active">
			                                <td colspan="3" class="text-end"><strong>Total a Pagar</strong></td>
			                                <td class="text-end"><strong><%= formatoMoneda.format(carrito.getTotal()) %></strong></td>
			                                <td></td>
			                            </tr>
			                        </tbody>
			                    </table>
			                </div>
			                
			                <div class="d-flex justify-content-between mt-4">
			                    <a href="mostrarProductos.jsp" class="btn btn-outline-secondary">
			                        <i class="bi bi-arrow-left"></i> Seguir Comprando
			                    </a>
			                    <a href="checkout.jsp" class="btn btn-success">
			                        <i class="bi bi-credit-card"></i> Proceder al Pago
			                    </a>
			                </div>
			            </div>
			        </div>
			    <% } %>
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