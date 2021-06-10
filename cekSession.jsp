<%
	String id = (String) session.getId();
	String username = (String) session.getAttribute("user");
	String password = (String) session.getAttribute("pass");

	if (username == null) {
        %>
		<script>
			alert('Session Habis bro');
			document.location='login.jsp';
		</script>
		<%
		session.removeAttribute("user");
		session.removeAttribute("pass");
	}
%>