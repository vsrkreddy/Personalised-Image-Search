<%@page import="com.oreilly.servlet.*,java.sql.*,databaseconnection.*,java.util.*,java.io.*,javax.servlet.*, javax.servlet.http.*"%>
<html>
<head>
<title>Untitled Document</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>

<body>
<%

Statement st = null;
ResultSet rs = null;
String email = request.getParameter("email");
String name = request.getParameter("name");
session.setAttribute("name",name);
session.setAttribute("email",email);
try{
	Class.forName("com.mysql.jdbc.Driver");	
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/five","root","admin");
	st = con.createStatement();
	String qry ="select * from profile where  name='"+name+"' AND email='"+email+"'"; 
	rs = st.executeQuery(qry);
	if(!rs.next()){
	out.println("Enter correct username, password");
	
	}
	else{
		response.sendRedirect("inbox.jsp");	
	}
	con.close();
	st.close();
}
catch(Exception ex){
	out.println(ex);
}
%>
</body>
</html>


