package com.productos.datos;
import java.sql.*;
public class Conexion
{
	private Statement St; 
	private String driver;
	private String user;
	private String pwd;
	private String cadena;
	private Connection con;

	String getDriver()
	{
		return this.driver;
	}
	String getUser()
	{
		return this.user;
	}
	String getPwd()
	{
		return this.pwd;
	}
	String getCadena()
	{
		return this.cadena;
	}
	public Connection getConexion()
	{ 
		return this.con; 
	}
	
	public Conexion() {
	    this.driver = "org.postgresql.Driver";
	    this.user = "postgres";
	    this.pwd = "1234";
	    this.cadena = "jdbc:postgresql://localhost:5432/bd_productos";
	    this.con = this.crearConexion();
	    
	    if (this.con == null) {
	        System.out.println("No se pudo establecer conexión con la base de datos.");
	    } else {
	        System.out.println("Conexión exitosa a la base de datos.");
	    }
	}
	
	Connection crearConexion() {
	    try {
	        Class.forName("org.postgresql.Driver");
	    } catch (ClassNotFoundException e) {
	        System.out.println("Error cargando el driver: " + e.getMessage());
	        return null;
	    }

	    try {
	        Connection con = DriverManager.getConnection(getCadena(), getUser(), getPwd());
	        return con;
	    } catch (SQLException ee) {
	        System.out.println("Error conectando a la base de datos: " + ee.getMessage());
	        return null;
	    }
	}


	public String Ejecutar(String sql)
	{
	String error="";
	try
	{
	St=getConexion().createStatement();
	St.execute(sql);
	error="Datos insertados";
	}
	catch(Exception ex)
	{
	error = ex.getMessage();
	}
	return(error);
	}



	public ResultSet Consulta(String sql)
	{
	String error="";
	ResultSet reg=null;
	
	try
	{
	St=getConexion().createStatement();
	reg=St.executeQuery(sql);
	

	}
	catch(Exception ee)
	{
	error = ee.getMessage();
	}
	return(reg);
	}
	public static Connection getCon() {
		Conexion con = new Conexion();
		return con.getConexion();
	}
}