<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.productos.negocio.*" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="com.productos.datos.Conexion" %>

<%
    Producto producto = new Producto();
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
        <a class="active" href="index.jsp">Inicio</a>
        <a href="login.jsp">Login</a>
        <a href="productos.jsp">Productos</a>
        <a href="categorias.jsp">Categorias</a>
    </nav>
        
        <div class="agrupar">
			    <h1>Nuestros Productos</h1>
    
			    <div class="container-fluid mt-4">
				    <div class="card shadow">
				        <div class="card-header bg-primary text-white d-flex justify-content-between align-items-center">
				            <h1 class="h4 mb-0">Nuestros Productos</h1>
				            <a href="carrito.jsp" class="btn btn-light btn-sm">
				                <i class="bi bi-cart"></i> Ver Carrito (<%= session.getAttribute("carrito") != null ? ((Carrito)session.getAttribute("carrito")).getItems().size() : 0 %>)
				            </a>
				        </div>
				        
				        <div class="card-body">
				            <div class="table-responsive">
				                <table class="table table-striped table-hover table-bordered">
				                    <thead class="table-dark">
				                        <tr>
				                            <th>ID</th>
				                            <th>Nombre</th>
				                            <th>Precio</th>
				                            <th>Disponibles</th>
				                            <th>Cantidad</th>
				                            <th class="text-center">Acciones</th>
				                        </tr>
				                    </thead>
				                    <tbody>
				                        <% 
				                            String sql = "SELECT * FROM tb_productos ORDER BY id_pr ASC";
				                            Conexion con = new Conexion();
				                            ResultSet rs = con.Consulta(sql);
				                            
				                            while(rs.next()) {
				                                int id = rs.getInt("id_pr");
				                                String nombre = rs.getString("nombre_pr");
				                                int cantidad = rs.getInt("cantidad_pr");
				                                double precio = rs.getDouble("precio_pr");
				                        %>
				                        <tr>
				                            <td><%= id %></td>
				                            <td><%= nombre %></td>
				                            <td>$<%= String.format("%.2f", precio) %></td>
				                            <td><%= cantidad %></td>
				                            <td>
				                                <form action="agregarAlCarrito.jsp" method="post" class="d-flex">
				                                    <input type="hidden" name="id" value="<%= id %>">
				                                    <input type="hidden" name="nombre" value="<%= nombre %>">
				                                    <input type="hidden" name="precio" value="<%= precio %>">
				                                    
				                                    <input type="number" name="cantidad" class="form-control form-control-sm" 
				                                           style="width: 80px;" min="1" max="<%= cantidad %>" value="1">
				                                </form>
				                            </td>
				                            <td class="text-center">
				                                <button type="submit" form="form-<%= id %>" class="btn btn-success btn-sm">
				                                    <i class="bi bi-cart-plus"></i> Agregar
				                                </button>
				                            </td>
				                        </tr>
				                        <% 
				                            }
				                            rs.close();
				                        %>
				                    </tbody>
				                </table>
				            </div>
				            
				            <div class="mt-3 text-end">
				                <a href="carrito.jsp" class="btn btn-primary">
				                    <i class="bi bi-cart-check"></i> Ver Carrito Completo
				                </a>
				            </div>
				        </div>
				    </div>
				</div>
				
				<!-- Script para manejar el formulario correctamente -->
				<script>
				// Asignar IDs únicos a cada formulario
				document.querySelectorAll('form').forEach((form, index) => {
				    form.id = 'form-' + form.querySelector('input[name="id"]').value;
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