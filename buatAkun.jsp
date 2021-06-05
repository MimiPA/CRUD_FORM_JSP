<%@ include file="koneksi.jsp" %>
<%
if(request.getParameter("buat") !=null) {
    Connection koneksi=DriverManager.getConnection("jdbc:mysql://localhost:3306/dosen","root","");
    String userAkun=request.getParameter("userAkun");
    String passAkun=request.getParameter("passAkun");
    String confirmPass=request.getParameter("confirmPass");
    
    boolean berhasil=true;

    if(passAkun.equals(confirmPass)){
        String query="INSERT INTO tabel_login (user, pass) VALUES('"+userAkun+"','"+passAkun+"')" ;
        try{
            Statement stm=koneksi.createStatement(); stm.executeUpdate(query);
        }
        catch(Exception ex) {
            out.println("Kesalahan " + ex);
            berhasil = false;
        }
        
        if (berhasil){
        %>
            <script>
			    alert('Barhasil Buat Akun');
			    document.location='login.jsp';
		    </script>
	    <%
        }
        else {
            out.println ("Gagal Buat Akun!");
        }
    }
    else {
        out.println ("Gagal Buat Akun! Password dan Confirm Pass Beda");
    }
}
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Buat Akun</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css" integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/" crossorigin="anonymous">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>

<body data-spy="scroll" data-target=".navbar" data-offset="50">
    <!--Login-->
    <div id="artikel" class="container" style="padding-top: 90px;">
        <div class="row">
            <div class="col-lg-12">
                <div class="card">
                    <div class="card-header bg-warning">
                        <h3 class="text-dark text-center">Membuat Akun Baru</h3>
                        <hr>
                    </div>

                    <div class="card-body">
                        <form method="post" action="buatAkun.jsp">
                            <!--Username-->
                            <div class="form-group">
                                <label class="font-weight-bold"><i class='fas fa-user'></i> Username :</label>
                                <input type="text" name="userAkun" class="form-control" placeholder="Masukkan username" autofocus required/>
                            </div>

                            <!--Password-->
                            <div class="form-group">
                                <label class="font-weight-bold"><i class='fas fa-cog'></i> Password :</label>
                                <input type="password" name="passAkun" class="form-control" placeholder="Masukkan password" required/>
                            </div>

                            <!--Password-->
                            <div class="form-group">
                                <label class="font-weight-bold"><i class='fas fa-lock'></i> Confirm Password :</label>
                                <input type="password" name="confirmPass" class="form-control" placeholder="Masukkan Ulang password" required/>
                            </div>
                    </div>

                    <div class="card-footer text-center">
                        <button type="submit" name="buat" class="btn btn-info btn-success"><i class='fas fa-pencil-alt'></i> Buat</button>
                    </div>
                        </form>
                </div>
            </div>
        </div>
        <br>

        <div class="row">
            <div class="col text-center">
                <h4>Sudah Punya Akun ? <a href="login.jsp">LOGIN</a></h4>
            </div>
        </div>
    </div>

</body>

</html>