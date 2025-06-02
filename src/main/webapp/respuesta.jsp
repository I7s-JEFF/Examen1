<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="com.productos.seguridad.*"%>

        <%
			Usuario us = new Usuario();
        	us.setEstadoCivil(Integer.parseInt(request.getParameter("cmbECivil")));
			us.setNombre(request.getParameter("txtNombre"));
			us.setCedula(request.getParameter("txtCedula"));
			us.setCorreo(request.getParameter("txtEmail"));
			us.setClave(request.getParameter("txtClave"));
			us.ingresarCliente();
		%>
   
