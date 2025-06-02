<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import ="com.productos.negocio.*"%>
<%
    String mensaje = "";
    int idProducto = 0;
    String nombreProducto = "";
    String categoria = "";

    // Si llega por GET
    if (request.getParameter("id") != null) {
        idProducto = Integer.parseInt(request.getParameter("id"));
        Producto pr = new Producto();
        Object[] datos = pr.obtenerProductoPorId(idProducto);

        if (datos != null) {
            nombreProducto = (String) datos[0];
            categoria = (String) datos[1];
        } else {
            mensaje = "❌ Producto no encontrado.";
        }
    }

    // Si el usuario confirma la eliminación (POST)
    if (request.getParameter("confirmar") != null && request.getParameter("id") != null) {
        idProducto = Integer.parseInt(request.getParameter("id"));
        Producto pr = new Producto();
        mensaje = pr.eliminarProductoPorId(idProducto);
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Activo Sportwear</title>
    <link href="../css/estilos.css" rel="stylesheet" type="text/css">
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
            <section>
                
				<div class="container mt-5">
				    <div class="row justify-content-center">
				        <div class="col-md-8">
				            <div class="card">
				                <div class="card-header bg-danger text-white">
				                    <h2 class="h4 mb-0">Eliminar Producto</h2>
				                </div>
				                
				                <div class="card-body">
				                    <% if (!mensaje.equals("")) { %>
				                        <div class="alert alert-success">
				                            <strong><%= mensaje %></strong>
				                        </div>
				                        <a href="productos.jsp" class="btn btn-primary">Volver a la lista de productos</a>
				                    
				                    <% } else if (nombreProducto != null && !nombreProducto.equals("")) { %>
				                        <div class="alert alert-warning">
				                            <p class="mb-0">¿Estás seguro de que deseas eliminar el siguiente producto?</p>
				                        </div>
				                        
				                        <div class="mb-4">
				                            <ul class="list-group">
				                                <li class="list-group-item"><strong>ID:</strong> <%= idProducto %></li>
				                                <li class="list-group-item"><strong>Nombre:</strong> <%= nombreProducto %></li>
				                                <li class="list-group-item"><strong>Categoría:</strong> <%= categoria %></li>
				                            </ul>
				                        </div>
				                        
				                        <form method="post" action="eliminar.jsp">
				                            <input type="hidden" name="id" value="<%= idProducto %>">
				                            <div class="d-flex gap-2">
				                                <button type="submit" name="confirmar" class="btn btn-danger">
				                                    <i class="bi bi-trash"></i> Sí, eliminar
				                                </button>
				                                <a href="productos.jsp" class="btn btn-secondary">Cancelar</a>
				                            </div>
				                        </form>
				                    
				                    <% } else { %>
				                        <div class="alert alert-danger">
				                            <p class="mb-0">No se ha especificado un producto válido para eliminar.</p>
				                        </div>
				                        <a href="productos.jsp" class="btn btn-primary">Volver</a>
				                    <% } %>
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