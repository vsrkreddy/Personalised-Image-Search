<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<%@ page import="java.util.*"%>
<%@page import="com.oreilly.servlet.*,java.sql.*,java.lang.*,databaseconnection.*,java.text.SimpleDateFormat,java.util.*,java.io.*,javax.servlet.*, javax.servlet.http.*"  errorPage="Error.jsp"%>
<%@page import=" java.security.MessageDigest"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>Personalized Image Search</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<script type="text/javascript">

</script>
</head>

<body>

<%

java.util.Date now = new java.util.Date();
	String date=now.toString();
	 String DATE_FORMAT = "dd-MM-yyyy";
	 SimpleDateFormat sdf = new SimpleDateFormat(DATE_FORMAT);
     String strDateNew = sdf.format(now) ;

ResultSet rs=null;
PreparedStatement psmt1=null;
String id = request.getParameter("id");
String email = (String)session.getAttribute("email");

try{

	Class.forName("com.mysql.jdbc.Driver");	
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/five","root","admin");

	psmt1=con.prepareStatement("insert into gallery(id,email,date) values(?,?,?)");
	psmt1.setString(1,id);
	psmt1.setString(2,email);
	psmt1.setString(3,date);


int s = psmt1.executeUpdate();
response.sendRedirect("comment.jsp?message=tagged successfully");

con.close();
psmt1.close();

}catch(Exception ex){

out.println("Error in connection : "+ex);

}

%>

</body>
</html>