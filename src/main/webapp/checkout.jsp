<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.productos.negocio.*, java.text.*, java.util.*"%>
<%
    Carrito carrito = (Carrito) session.getAttribute("carrito");
    if (carrito == null || carrito.getItems().isEmpty()) {
        response.sendRedirect("carrito.jsp");
        return;
    }
    
    // Procesar pago
    if ("POST".equalsIgnoreCase(request.getMethod())) {
        // Simular procesamiento de pago
        // En una aplicación real, aquí integrarías con un gateway de pago
        
        // Registrar la compra
        Compra nuevaCompra = new Compra();
        nuevaCompra.setItems(new ArrayList<>(carrito.getItems()));
        nuevaCompra.setTotal(carrito.getTotal());
        nuevaCompra.setEstado("Completada");
        
        // Actualizar stock
        Producto producto = new Producto();
        for (ItemCarrito item : carrito.getItems()) {
            producto.actualizarStock(item.getProducto().getId(), item.getCantidad());
        }
        
        // Guardar en historial (simulado)
        List<Compra> historial = (List<Compra>) session.getAttribute("historialCompras");
        if (historial == null) {
            historial = new ArrayList<>();
        }
        historial.add(nuevaCompra);
        session.setAttribute("historialCompras", historial);
        
        // Limpiar carrito
        session.removeAttribute("carrito");
        
        // Redirigir a confirmación
        response.sendRedirect("confirmacion.jsp");
        return;
    }
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
			    <h2>Finalizar Compra</h2>
    
			    <h3>Resumen de tu pedido</h3>
			    
			    <div class="container mt-4">
				    <div class="row">
				        <div class="col-md-8">
				            <div class="card mb-4">
				                <div class="card-header bg-light">
				                    <h3 class="h5 mb-0">Resumen de Compra</h3>
				                </div>
				                <div class="card-body">
				                    <div class="table-responsive">
				                        <table class="table table-bordered">
				                            <thead class="table-light">
				                                <tr>
				                                    <th>Producto</th>
				                                    <th class="text-center">Cantidad</th>
				                                    <th class="text-end">Precio Unitario</th>
				                                    <th class="text-end">Subtotal</th>
				                                </tr>
				                            </thead>
				                            <tbody>
				                                <% for (ItemCarrito item : carrito.getItems()) { %>
				                                <tr>
				                                    <td><%= item.getProducto().getNombre() %></td>
				                                    <td class="text-center"><%= item.getCantidad() %></td>
				                                    <td class="text-end">$<%= String.format("%.2f", item.getProducto().getPrecio()) %></td>
				                                    <td class="text-end">$<%= String.format("%.2f", item.getProducto().getPrecio() * item.getCantidad()) %></td>
				                                </tr>
				                                <% } %>
				                                <tr class="table-active">
				                                    <td colspan="3" class="text-end"><strong>Total:</strong></td>
				                                    <td class="text-end"><strong>$<%= String.format("%.2f", carrito.getTotal()) %></strong></td>
				                                </tr>
				                            </tbody>
				                        </table>
				                    </div>
				                </div>
				            </div>
				        </div>
				        
				        <div class="col-md-4">
				            <div class="card">
				                <div class="card-header bg-primary text-white">
				                    <h3 class="h5 mb-0">Información de Pago</h3>
				                </div>
				                <div class="card-body">
				                    <form method="post" id="formPago" onsubmit="return validarFormulario()">
				                        <div class="mb-3">
				                            <label for="nombreTarjeta" class="form-label">Nombre en la Tarjeta</label>
				                            <input type="text" class="form-control" id="nombreTarjeta" name="nombreTarjeta" required>
				                        </div>
				                        
				                        <div class="mb-3">
				                            <label for="numeroTarjeta" class="form-label">Número de Tarjeta</label>
				                            <input type="text" class="form-control" id="numeroTarjeta" name="numeroTarjeta" 
				                                   pattern="[0-9]{16}" title="Debe contener exactamente 16 dígitos" required>
				                            <small class="text-muted">16 dígitos sin espacios</small>
				                            <div class="invalid-feedback">Por favor ingrese un número de tarjeta válido (16 dígitos)</div>
				                        </div>
				                        
				                        <div class="row">
				                            <div class="col-md-6 mb-3">
				                                <label for="fechaExpiracion" class="form-label">Expiración (MM/AA)</label>
				                                <input type="text" class="form-control" id="fechaExpiracion" name="fechaExpiracion" 
				                                       placeholder="MM/AA" pattern="(0[1-9]|1[0-2])\/?([0-9]{2})" 
				                                       title="Formato MM/AA" required>
				                            </div>
				                            <div class="col-md-6 mb-3">
				                                <label for="cvv" class="form-label">CVV</label>
				                                <input type="text" class="form-control" id="cvv" name="cvv" 
				                                       pattern="[0-9]{3}" title="Debe contener exactamente 3 dígitos" required>
				                                <div class="invalid-feedback">El CVV debe tener 3 dígitos</div>
				                            </div>
				                        </div>
				                        
				                        <div class="d-grid">
				                            <button type="submit" class="btn btn-success btn-lg">
				                                <i class="bi bi-credit-card"></i> Confirmar Pago
				                            </button>
				                        </div>
				                    </form>
				                </div>
				            </div>
				        </div>
				    </div>
				</div>
				
				<!-- Script de validación -->
				<script>
				function validarFormulario() {
				    const form = document.getElementById('formPago');
				    const numeroTarjeta = document.getElementById('numeroTarjeta');
				    const cvv = document.getElementById('cvv');
				    
				    // Validar número de tarjeta (16 dígitos)
				    const tarjetaValida = /^\d{16}$/.test(numeroTarjeta.value);
				    if (!tarjetaValida) {
				        numeroTarjeta.classList.add('is-invalid');
				    } else {
				        numeroTarjeta.classList.remove('is-invalid');
				    }
				    
				    // Validar CVV (3 dígitos)
				    const cvvValido = /^\d{3}$/.test(cvv.value);
				    if (!cvvValido) {
				        cvv.classList.add('is-invalid');
				    } else {
				        cvv.classList.remove('is-invalid');
				    }
				    
				    // Validar fecha de expiración
				    const fechaValida = /^(0[1-9]|1[0-2])\/?([0-9]{2})$/.test(fechaExpiracion.value);
				    if (!fechaValida) {
				        fechaExpiracion.classList.add('is-invalid');
				    } else {
				        fechaExpiracion.classList.remove('is-invalid');
				    }
				    
				    // Si hay errores, prevenir el envío del formulario
				    if (!tarjetaValida || !cvvValido || !fechaValida) {
				        return false;
				    }
				    
				    return true;
				}
				
				// Validación en tiempo real
				document.getElementById('numeroTarjeta').addEventListener('input', function(e) {
				    // Solo permitir números y limitar a 16 caracteres
				    this.value = this.value.replace(/\D/g, '').substring(0, 16);
				    
				    // Validar y mostrar feedback
				    if (/^\d{16}$/.test(this.value)) {
				        this.classList.remove('is-invalid');
				        this.classList.add('is-valid');
				    } else {
				        this.classList.remove('is-valid');
				    }
				});
				
				document.getElementById('cvv').addEventListener('input', function(e) {
				    // Solo permitir números y limitar a 3 caracteres
				    this.value = this.value.replace(/\D/g, '').substring(0, 3);
				    
				    // Validar y mostrar feedback
				    if (/^\d{3}$/.test(this.value)) {
				        this.classList.remove('is-invalid');
				        this.classList.add('is-valid');
				    } else {
				        this.classList.remove('is-valid');
				    }
				});
				
				document.getElementById('fechaExpiracion').addEventListener('input', function(e) {
				    // Formatear automáticamente como MM/AA
				    let value = this.value.replace(/\D/g, '');
				    if (value.length > 2) {
				        value = value.substring(0, 2) + '/' + value.substring(2, 4);
				    }
				    this.value = value;
				    
				    // Validar y mostrar feedback
				    if (/^(0[1-9]|1[0-2])\/?([0-9]{2})$/.test(this.value)) {
				        this.classList.remove('is-invalid');
				        this.classList.add('is-valid');
				    } else {
				        this.classList.remove('is-valid');
				    }
				});
				</script>
			    
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