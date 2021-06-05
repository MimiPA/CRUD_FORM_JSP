<%@ include file="koneksi.jsp" %>
<%@ include file="cekSession.jsp" %>

<%
    Connection koneksi=DriverManager.getConnection("jdbc:mysql://localhost:3306/dosen","root","");
    String id_dosen=request.getParameter("id_dosen");
    ResultSet hasil=null;
    Statement stm=koneksi.createStatement();
    
    hasil=stm.executeQuery("SELECT * FROM tabel_dosen WHERE id_dosen='"+id_dosen+"'");
    hasil.next();
    
    String nidn = hasil.getString("nidn");
    String nama = hasil.getString("nama");
    String tmpLahir = hasil.getString("tmpLahir");
    String tglLahir = hasil.getString("tglLahir");
    String telepon = hasil.getString("telepon");
    String pendidikan = hasil.getString("pendidikan");
    String gender = hasil.getString("gender");
    String spesialisasi = hasil.getString("spesialisasi");
    String email = hasil.getString("username");
    String passku = hasil.getString("pass");
    String golongan = hasil.getString("golongan");
    String pangkat = hasil.getString("pangkat");
    String pengalaman = hasil.getString("pengalaman");
    String gajiPokok = hasil.getString("gajiPokok");
    String total_gaji = hasil.getString("total_gaji");
%>


<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Edit Form Pegawai</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css" integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/" crossorigin="anonymous">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</head>

<body class="bg-dark text-light font-weight-bold">
        <header>
          <div class="jumbotron text-center bg-danger">
          <p class="text-right"><a href="logout.jsp" class="text-light text-right"><i class='fas fa-sign-in-alt'></i> Logout</a></p>
            <div class="container">
              <div class="row">
                <div class="col">
                  <h1><p class="text-light">Selamat Datang di Website Mengisi Form Pegawai</p></h1>
                </div>
              </div>
            </div>
          </div>
        </header>
    </div>

    <div class="container">
        <h2>Edit Data Dosen</h2>
        <form method="post" action="update.jsp">
            <div class="form-group">
                <label>NIDN :</label>
                <input type="text" name="nidn" class="form-control" placeholder="Masukkan NIDN" value="<%=nidn%>" required/>
            </div>

            <div class="form-group">
                <label>Nama :</label>
                <input type="text" name="nama" class="form-control" placeholder="Nama Lengkap" value="<%=nama%>" required/>
            </div>

            <div class="form-group">
                <label>Tempat Lahir :</label>
                <input type="text" name="tmpLahir" class="form-control" placeholder="Makassar" value="<%=tmpLahir%>" required/>
            </div>

            <div class="form-group">
                <label>Tanggal Lahir :</label>
                <input type="date" name="tglLahir" class="form-control" value="<%=tglLahir%>" required/>
            </div>

            <div class="form-group">
                <label class="font-weight-bold">Telepon :</label>
                <input type="tel" name="telepon" pattern="^\d{4}-\d{4}-\d{4}$" class="form-control col-lg-3" placeholder="xxxx-xxxx-xxxx" value="<%=telepon%>" required/>
            </div>

            <div class="form-group">
                <label>Pendidikan Terakhir :</label>
                <select class="form-control" name="pendidikan">
                    <option value='S2' <% if (pendidikan.equals("S2")) out.println("selected"); %>>S2</option>
                    <option value='S3' <% if (pendidikan.equals("S3")) out.println("selected"); %>>S3</option>
                </select>
            </div>

            <div class="form-group">
                <label>Jenis Kelamin :</label>
                <div class="form-check">
                    <label class="form-check-label">
                        <input type="radio" name="gender" class="form-check-input" value="L" <% if(gender.equals("L")) out.println("checked"); %>>Laki-Laki
                    </label>
                </div>

                <div class="form-check">
                    <label class="form-check-label">
                        <input type="radio" name="gender" class="form-check-input" value="P"<% if(gender.equals("P")) out.println("checked"); %>>Perempuan
                    </label>
                </div>
            </div>

            <!--Spesialisasi-->
            <div class="form-group">
                <label class="font-weight-bold">Spesialisasi :</label><br>
                    <div class="form-check-inline">
                        <label class="form-check-label">
                            <input type="checkbox" name="ahli1" class="form-check-input" value="Programming" id="ahli" <% if(spesialisasi.contains("Programming")) out.println("checked"); %>>Programming
                        </label>
                    </div>
            
                    <div class="form-check-inline">
                        <label class="form-check-label">
                            <input type="checkbox" name="ahli2" class="form-check-input" value="Networking" id="ahli" <% if(spesialisasi.contains("Networking")) out.println("checked"); %>>Networking
                        </label>
                    </div>
            
                    <div class="form-check-inline">
                        <label class="form-check-label">
                            <input type="checkbox" name="ahli3" class="form-check-input" value="Database" id="ahli" <% if(spesialisasi.contains("Database")) out.println("checked"); %>>Database
                        </label>
                    </div>

                    <div class="form-check-inline">
                        <label class="form-check-label">
                            <input type="checkbox" name="ahli4" class="form-check-input" value="Analyst" id="ahli" <% if(spesialisasi.contains("Analyst")) out.println("checked"); %>>Analyst
                        </label>
                    </div>
            </div>

            <!--Username-->
            <div class="form-group">
                <label class="font-weight-bold">Username :</label>
                <div class="input-group-append">
                    <input type="email" class="form-control" name="email" placeholder="Masukkan Email" value="<%=email%>" required/>
                    <span class="input-group-text">@example.com</span>
                </div>
            </div>

            <div class="form-group">
                <label>Password  :</label>
                <input type="password" name="passku" class="form-control" placeholder="********" value="<%=passku%>" required/>
            </div>

            <!--Golongan-->
            <div class="form-group">
                <label>Golongan :</label>
                <select class="form-control" name="golongan">
                    <option value='3A' <% if(golongan.equals("3A")) out.println("selected"); %>>3A</option>
                    <option value='3B' <% if(golongan.equals("3B")) out.println("selected"); %>>3B</option>
                    <option value='3C' <% if(golongan.equals("3C")) out.println("selected"); %>>3C</option>
                    <option value='4A' <% if(golongan.equals("4A")) out.println("selected"); %>>4A</option>
                    <option value='4B' <% if(golongan.equals("4B")) out.println("selected"); %>>4B</option>
                    <option value='4C' <% if(golongan.equals("4C")) out.println("selected"); %>>4C</option>
                </select>
            </div>

            <!--Pangkat-->
            <div class="form-group">
                <label>Pangkat :</label>
                <select class="form-control" name="pangkat">
                    <option value='AA' <% if(pangkat.equals("AA")) out.println("selected"); %>>AA</option>
                    <option value='L' <% if(pangkat.equals("L")) out.println("selected"); %>>L</option>
                    <option value='LK' <% if(pangkat.equals("LK")) out.println("selected"); %>>LK</option>
                    <option value='GB' <% if(pangkat.equals("GB")) out.println("selected"); %>>GB</option>
                </select>
            </div>

            <div class="form-group">
                <label>Pengalaman Kerja :</label>
                <textarea class="form-control" name="pengalaman" rows="5" placeholder="Pengalaman"><%=pengalaman%></textarea>
            </div>


            <div class="form-group">
                <label>Gaji Pokok :</label>
                <input type="text" name="gajiPokok" class="form-control" placeholder="1000000" value="<%=gajiPokok%>" required/>
            </div>

            <input type="hidden" name="id_dosen" value="<%=id_dosen%>">
            <input type="hidden" name="gaji_lama" value="<%=total_gaji%>">

            <button type="submit" class="btn btn-success"><i class='fas fa-download'></i> Submit</button>
            <button type="reset" class="btn btn-warning"><i class='fas fa-cut'></i> Reset</button>
        </form>
    </div>
    <hr>

    <div id="dashboard" style="padding-top:30px;padding-bottom:0px">
        <footer>
          <div class="footer text-center bg-info">
            <div class="container">
              <div class="row">
                <div class="col">
                  <h1><p class="text-light">Terima Kasih Telah Mengisi Form Pegawai Ini</p></h1>
                  <div class="lead"><p class="text-warning font-weight-bold">Paramita Aditung</p></div>
                </div>
              </div>
            </div>
          </div>
    </footer>
    </div>
</body>

</html>