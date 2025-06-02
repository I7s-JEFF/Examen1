<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.productos.negocio.*, java.text.NumberFormat" %>
<%
    // Obtener información de la última compra si es necesario
    Carrito carrito = (Carrito) session.getAttribute("carrito");
    NumberFormat formatoMoneda = NumberFormat.getCurrencyInstance();
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>KATSEN - Play U R Game</title>
    <link href="css/estilos.css" rel="stylesheet" type="text/css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4Q6Gf2aSP4eDXB8Miphtr37CMZZQ5oXLH2yaXMJ2w8e2ZtHTl7GptT4jmndRuHDT" crossorigin="anonymous">
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
            <a href="#" onclick="window.history.back(); return false;">Volver atrás</a>
            <a href="menu.jsp">Menú</a>
            <a href="cerrarSesion.jsp">Cerrar Sesion</a>
        </nav>
        
        <div class="agrupar">
            <section> 
			    <div class="container py-5">
			        <div class="row justify-content-center">
			            <div class="col-lg-8">
			                <div class="card confirmation-card mb-4">
			                    <div class="card-header confirmation-header text-center py-4">
			                        <i class="bi bi-check-circle check-icon"></i>
			                        <h2 class="mt-3 mb-0">¡Compra Exitosa!</h2>
			                    </div>
			                    <div class="card-body p-5">
			                        <div class="text-center mb-4">
			                            <p class="lead">Tu pedido ha sido procesado exitosamente.</p>
			                            <p>Hemos enviado los detalles de tu compra al correo electrónico registrado.</p>
			                        </div>
			                        
			                        <% if (carrito != null && !carrito.getItems().isEmpty()) { %>
			                        <div class="mt-4">
			                            <h5 class="mb-3"><i class="bi bi-receipt"></i> Resumen de tu compra</h5>
			                            <div class="bg-light p-3 rounded-3">
			                                <% for (ItemCarrito item : carrito.getItems()) { %>
			                                <div class="d-flex justify-content-between summary-item">
			                                    <span><%= item.getProducto().getNombre() %> x <%= item.getCantidad() %></span>
			                                    <strong><%= formatoMoneda.format(item.getProducto().getPrecio() * item.getCantidad()) %></strong>
			                                </div>
			                                <% } %>
			                                <div class="d-flex justify-content-between mt-3 pt-2">
			                                    <span class="fw-bold">Total:</span>
			                                    <span class="fw-bold fs-5 text-success"><%= formatoMoneda.format(carrito.getTotal()) %></span>
			                                </div>
			                            </div>
			                        </div>
			                        <% } %>
			                        
			                        <div class="d-flex flex-column flex-md-row justify-content-center gap-3 mt-5 pt-3">
			                            <a href="historial.jsp" class="btn btn-outline-primary action-btn">
			                                <i class="bi bi-clock-history"></i> Ver Historial de Compras
			                            </a>
			                            <a href="carrito.jsp" class="btn btn-success action-btn">
			                                <i class="bi bi-cart-plus"></i> Continuar Comprando
			                            </a>
			                        </div>
			                        

			                    </div>
			                </div>
			                
			                <div class="text-center">
			                    <a href="index.jsp" class="text-decoration-none">
			                        <i class="bi bi-arrow-left"></i> Volver al inicio
			                    </a>
			                </div>
			            </div>
			        </div>
			    </div>
			
			    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
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