<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    // Invalidar la sesión
    HttpSession sesion = request.getSession(false);
    if (sesion != null) {
        sesion.removeAttribute("usuario");
        sesion.removeAttribute("perfil");
        sesion.removeAttribute("id_usuario");
        sesion.invalidate();
    }

    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
    response.setHeader("Pragma", "no-cache");
    response.setHeader("Expires", "0");

    response.sendRedirect("login.jsp?msg=Sesion cerrada correctamente");
%>
