<%@ page import="java.sql.*" %>
<%
    boolean cek = false;
    try {
        Class.forName("com.mysql.jdbc.Driver");
    }
    catch (Exception ex) {
        out.println("Kesalahan " + ex);
        cek = true;
    }
    
    if (!cek) {
        Connection koneksi = null;
        try {
            koneksi = DriverManager.getConnection("jdbc:mysql://localhost:3306/dosen","root","");
        }
        catch(Exception ex) {
            out.println("Kesalahan " + ex);
            cek = true;
        }
    }
    
    if (cek) {
        out.println("Koneksi Gagal");
    }
%>