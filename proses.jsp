<%@ include file="cekSession.jsp" %>
<%@ include file="koneksi.jsp" %>

<%
  Connection koneksi=DriverManager.getConnection("jdbc:mysql://localhost:3306/dosen","root","");
  
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

  boolean berhasil = true;

  String query = "INSERT INTO tabel_dosen (nidn, nama, tmpLahir, tglLahir, telepon, pendidikan, gender, spesialisasi, username, pass, golongan, pangkat, pengalaman, gajiPokok, total_gaji) VALUES ('"+nidn+"', '"+nama+"', '"+tmpLahir+"', '"+tglLahir+"', '"+telepon+"', '"+pendidikan+"', '"+gender+"', '"+keahlian+"', '"+email+"', '"+passku+"', '"+golongan+"', '"+pangkat+"', '"+pengalaman+"', '"+gajiPokok+"', '"+total_gaji+"')";
  try {
    Statement stm=koneksi.createStatement();
    stm.executeUpdate(query);
  }
  catch(Exception ex) {
    out.println("Kesalahan " + ex);
    berhasil = false;
  }

  if (berhasil){
  %>
    <script>
			alert('Berhasil Input');
			document.location='input.jsp';
		</script>
	<%
  }
  else {
  %>
    <script>
			alert('Gagal Input');
			document.location='input.jsp';
		</script>
	<%
  }

%>