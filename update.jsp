<%@ include file="cekSession.jsp" %>
<%@ include file="koneksi.jsp" %>

<%
  Connection koneksi=DriverManager.getConnection("jdbc:mysql://localhost:3306/dosen","root","");
  
  String id_dosen = request.getParameter("id_dosen");
  String nidn = request.getParameter("nidn");
  String nama = request.getParameter("nama");
  String tmpLahir = request.getParameter("tmpLahir");
  String tglLahir = request.getParameter("tglLahir");
  String telepon = request.getParameter("telepon");
  String pendidikan = request.getParameter("pendidikan");
  String gender = request.getParameter("gender");

  String keahlian = "";
  String ahli;

  for(int i=1; i<=4; i++){
    ahli = request.getParameter("ahli" + i);
    if(ahli != null){
      keahlian += ahli + ", ";
    }
  }

  String email = request.getParameter("email");
  String passku = request.getParameter("passku");
  String golongan = request.getParameter("golongan");
  String pangkat = request.getParameter("pangkat");
  String pengalaman = request.getParameter("pengalaman");
  String gaji = request.getParameter("gajiPokok");

  String gaji_lama = request.getParameter("gaji_lama");

  int gajiPokok = Integer.parseInt(gaji);

  int total_gaji = 0;

  if(golongan.equals("3A") || golongan.equals("3B")){
    total_gaji = gajiPokok + 500000;
  }
  else if(golongan.equals("3C")){
    total_gaji = gajiPokok + 750000;
  }
  else if(golongan.equals("4A") || golongan.equals("4B")){
    total_gaji = gajiPokok + 1000000;
  }
  else if(golongan.equals("4C")){
    total_gaji = gajiPokok + 1500000;
  }

  if(pangkat.equals("AA")){
    total_gaji += 375000;
  }
  else if(pangkat.equals("L")){
    total_gaji += 750000;
  }
  else if(pangkat.equals("LK")){
    total_gaji += 1500000;
  }
  else if(pangkat.equals("GB")){
    total_gaji += 7500000;
  }

  java.text.DateFormat df = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
  String tanggal = df.format(new java.util.Date());

  boolean berhasil = true;

  String query="UPDATE tabel_dosen SET nidn='"+nidn+"', nama='"+nama+"', tmpLahir='"+tmpLahir+"', tglLahir='"+tglLahir+"', telepon='"+telepon+"', pendidikan='"+pendidikan+"', gender='"+gender+"', spesialisasi='"+keahlian+"', username='"+email+"', pass='"+passku+"', golongan='"+golongan+"', pangkat='"+pangkat+"', pengalaman='"+pengalaman+"', gajiPokok='"+gaji+"', total_gaji='"+total_gaji+"' WHERE id_dosen='"+id_dosen+"'";
  try {
    Statement stm=koneksi.createStatement();
    stm.executeUpdate(query);
  }
  catch(Exception ex) {
    out.println("Kesalahan " + ex);
    berhasil = false;
  }

  if (berhasil){
    boolean finish = true;
    String queryInsert="INSERT INTO log_data (id_dosen, total_gaji_lama, total_gaji_baru, waktu, pengedit) VALUES('"+id_dosen+"','"+gaji_lama+"','"+total_gaji+"','"+tanggal+"','"+username+"')" ;
    try {
      Statement stm=koneksi.createStatement();
      stm.executeUpdate(queryInsert);
    }
    catch(Exception ex) {
      out.println("Kesalahan " + ex);
      finish = false;
    }

    if(finish){
    %>
      <script>
			  alert('Berhasil Edit');
			  document.location='input.jsp';
		  </script>
	  <%
    }
    else{
    %>
      <script>
			  alert('Gagal Input Log');
			  document.location='input.jsp';
		  </script>
	  <%
    }
  }
  else {
  %>
    <script>
			alert('Gagal Edit');
			document.location='input.jsp';
		</script>
	<%
  }

%>