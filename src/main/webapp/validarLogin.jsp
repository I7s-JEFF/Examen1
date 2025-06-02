<%@ page import="com.productos.seguridad.Usuario" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    String correo = request.getParameter("txtEmail");
    String clave = request.getParameter("txtClave");
    
    if (correo == null || clave == null || correo.isEmpty() || clave.isEmpty()) {
        response.sendRedirect("login.jsp?error=Por favor complete todos los campos");
        return;
    }
    
    Usuario usuario = new Usuario();
    boolean autenticado = usuario.verificarUsuario(correo, clave);
    
    if (autenticado) {
        session.setAttribute("usuario", usuario.getCorreo());
        session.setAttribute("id_usuario", usuario.getId());
        session.setAttribute("perfil", usuario.getPerfil());
        session.setAttribute("nombre_usuario", usuario.getNombre());
        
        response.sendRedirect("menu.jsp");
    } else {
        response.sendRedirect("login.jsp?error=Credenciales incorrectas");
    }
%>