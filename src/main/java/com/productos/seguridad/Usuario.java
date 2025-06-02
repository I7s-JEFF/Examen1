package com.productos.seguridad;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import com.productos.datos.Conexion;

public class Usuario {
    private int id;
    private int perfil;
    private int estadoCivil;
    private String cedula;
    private String nombre;
    private String correo;
    private String clave;
    private boolean activo;

    // Constructor vacío
    public Usuario() {}

    // Getters y Setters
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public int getPerfil() { return perfil; }
    public void setPerfil(int perfil) { this.perfil = perfil; }

    public int getEstadoCivil() { return estadoCivil; }
    public void setEstadoCivil(int estadoCivil) { this.estadoCivil = estadoCivil; }

    public String getCedula() { return cedula; }
    public void setCedula(String cedula) { this.cedula = cedula; }

    public String getNombre() { return nombre; }
    public void setNombre(String nombre) { this.nombre = nombre; }

    public String getCorreo() { return correo; }
    public void setCorreo(String correo) { this.correo = correo; }

    public String getClave() { return clave; }
    public void setClave(String clave) { this.clave = clave; }

    public boolean isActivo() { return activo; }
    public void setActivo(boolean activo) { this.activo = activo; }

    // Verifica si el usuario existe con las credenciales
    public boolean verificarUsuario(String ncorreo, String nclave) {
        String sql = "SELECT id_us, id_per, nombre_us, correo_us FROM tb_usuario WHERE correo_us = ? AND clave_us = ?";
        try (Connection conn = Conexion.getCon();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, ncorreo);
            ps.setString(2, nclave);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    this.setId(rs.getInt("id_us"));
                    this.setPerfil(rs.getInt("id_per"));
                    this.setNombre(rs.getString("nombre_us"));
                    this.setCorreo(rs.getString("correo_us"));
                    return true;
                }
            }
        } catch (Exception ex) {
            System.out.println("Error en verificación: " + ex.getMessage());
        }
        return false;
    }

    // Inserta un nuevo cliente (perfil fijo en 2)
    public String ingresarCliente() {
        String sql = "INSERT INTO tb_usuario (id_per, id_est, nombre_us, cedula_us, correo_us, clave_us) VALUES (?, ?, ?, ?, ?, ?)";
        try (Connection conn = Conexion.getCon();
             PreparedStatement pr = conn.prepareStatement(sql)) {
            pr.setInt(1, 3);
            pr.setInt(2, this.getEstadoCivil());
            pr.setString(3, this.getNombre());
            pr.setString(4, this.getCedula());
            pr.setString(5, this.getCorreo());
            pr.setString(6, this.getClave());
            return pr.executeUpdate() == 1 ? "Inserción correcta" : "Error en inserción";
        } catch (Exception ex) {
            return "Error: " + ex.getMessage();
        }
    }

    public boolean ingresarEmpleado(int perfil, int estado, String cedula, String nombre, String correo, boolean activo) {
        String sql = "INSERT INTO tb_usuario (id_per, id_est, nombre_us, cedula_us, correo_us, clave_us, activo_us) VALUES (?, ?, ?, ?, ?, ?, ?)";
        try (Connection conn = Conexion.getCon();
             PreparedStatement pr = conn.prepareStatement(sql)) {
            pr.setInt(1, perfil);
            pr.setInt(2, estado);
            pr.setString(3, nombre);
            pr.setString(4, cedula);
            pr.setString(5, correo);
            pr.setString(6, this.getClave());
            pr.setBoolean(7, activo);
            return pr.executeUpdate() == 1;
        } catch (Exception ex) {
            System.out.println("Error: " + ex.getMessage());
            return false;
        }
    }

    public boolean verificarClave(String nclave) {
        String sql = "SELECT 1 FROM tb_usuario WHERE clave_us = ?";
        try (Connection conn = Conexion.getCon();
             PreparedStatement pr = conn.prepareStatement(sql)) {
            pr.setString(1, nclave);
            try (ResultSet rs = pr.executeQuery()) {
                return rs.next();
            }
        } catch (Exception ex) {
            System.out.println("Error: " + ex.getMessage());
            return false;
        }
    }

    public boolean coincidirClave(String nclave, String repetir) {
        return nclave.equals(repetir);
    }

    public boolean cambiarClave(String correo, String nuevaClave) {
        String sql = "UPDATE tb_usuario SET clave_us = ? WHERE correo_us = ?";
        try (Connection conn = Conexion.getCon();
             PreparedStatement pr = conn.prepareStatement(sql)) {
            pr.setString(1, nuevaClave);
            pr.setString(2, correo);
            return pr.executeUpdate() == 1;
        } catch (Exception ex) {
            System.out.println("Error: " + ex.getMessage());
            return false;
        }
    }

    public Usuario buscarUsuario(String nombre) {
        String sql = "SELECT * FROM tb_usuario WHERE nombre_us = ?";
        try (Connection conn = Conexion.getCon();
             PreparedStatement pr = conn.prepareStatement(sql)) {
            pr.setString(1, nombre);
            try (ResultSet rs = pr.executeQuery()) {
                if (rs.next()) {
                    Usuario usuario = new Usuario();
                    usuario.setId(rs.getInt("id_us"));
                    usuario.setPerfil(rs.getInt("id_per"));
                    usuario.setEstadoCivil(rs.getInt("id_est"));
                    usuario.setNombre(rs.getString("nombre_us"));
                    usuario.setCedula(rs.getString("cedula_us"));
                    usuario.setCorreo(rs.getString("correo_us"));
                    usuario.setClave(rs.getString("clave_us"));
                    usuario.setActivo(rs.getBoolean("activo_us"));
                    return usuario;
                }
            }
        } catch (SQLException e) {
            System.out.println("Error: " + e.getMessage());
        }
        return null;
    }

    public Usuario buscarUsuarioPorCorreo(String correo) {
        String sql = "SELECT * FROM tb_usuario WHERE correo_us = ?";
        try (Connection conn = Conexion.getCon();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, correo);
            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    Usuario usuario = new Usuario();
                    usuario.setId(rs.getInt("id_us"));
                    usuario.setPerfil(rs.getInt("id_per"));
                    usuario.setEstadoCivil(rs.getInt("id_est"));
                    usuario.setCedula(rs.getString("cedula_us"));
                    usuario.setNombre(rs.getString("nombre_us"));
                    usuario.setCorreo(rs.getString("correo_us"));
                    usuario.setActivo(rs.getBoolean("activo_us"));
                    return usuario;
                }
            }
        } catch (Exception e) {
            System.out.println("Error: " + e.getMessage());
        }
        return null;
    }

    public static List<Usuario> obtenerTodosUsuarios() {
        List<Usuario> usuarios = new ArrayList<>();
        String sql = "SELECT * FROM tb_usuario";
        try (Connection conn = Conexion.getCon();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {
            while (rs.next()) {
                Usuario u = new Usuario();
                u.setId(rs.getInt("id_us"));
                u.setPerfil(rs.getInt("id_per"));
                u.setEstadoCivil(rs.getInt("id_est"));
                u.setCedula(rs.getString("cedula_us"));
                u.setNombre(rs.getString("nombre_us"));
                u.setCorreo(rs.getString("correo_us"));
                u.setActivo(rs.getBoolean("activo_us"));
                usuarios.add(u);
            }
        } catch (Exception e) {
            System.out.println("Error: " + e.getMessage());
        }
        return usuarios;
    }

    public static boolean cambiarEstadoUsuario(int idUsuario, boolean activo) {
        String sql = "UPDATE tb_usuario SET activo_us = ? WHERE id_us = ?";
        try (Connection conn = Conexion.getCon();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setBoolean(1, activo);
            pstmt.setInt(2, idUsuario);
            return pstmt.executeUpdate() > 0;
        } catch (Exception e) {
            System.out.println("Error: " + e.getMessage());
            return false;
        }
    }

    public static boolean actualizarUsuario(Usuario usuario) {
        String sql = "UPDATE tb_usuario SET id_per = ?, id_est = ?, nombre_us = ?, cedula_us = ?, correo_us = ? WHERE id_us = ?";
        try (Connection conn = Conexion.getCon();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, usuario.getPerfil());
            pstmt.setInt(2, usuario.getEstadoCivil());
            pstmt.setString(3, usuario.getNombre());
            pstmt.setString(4, usuario.getCedula());
            pstmt.setString(5, usuario.getCorreo());
            pstmt.setInt(6, usuario.getId());
            return pstmt.executeUpdate() > 0;
        } catch (Exception e) {
            System.out.println("Error: " + e.getMessage());
            return false;
        }
    }
}
