<%@ include file="cekSession.jsp" %>
<%@ include file="koneksi.jsp" %>
<%
    Connection koneksi = DriverManager.getConnection("jdbc:mysql://localhost:3306/dosen","root","");
    String id_dosen = request.getParameter("id_dosen");
    boolean berhasil = true;
    String query = "DELETE tabel_dosen.*, log_data.* FROM tabel_dosen, log_data WHERE tabel_dosen.id_dosen='"+id_dosen+"' AND tabel_dosen.id_dosen=log_data.id_dosen";
    
    try {
        Statement stm = koneksi.createStatement();
        stm.executeUpdate(query);
    }
    catch (Exception ex) {
        out.println("Kesalahan " + ex);
        berhasil = false;
    }

    if (berhasil) {
    %>
        <script>
			alert('Berhasil Hapus');
			document.location='input.jsp';
		</script>
	<%
    }
    else {
    %>
        <script>
			alert('Gagal Hapus');
			document.location='input.jsp';
		</script>
	<%
    }
%>