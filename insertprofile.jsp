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



ResultSet rs=null;
PreparedStatement psmt1=null;

FileInputStream fis;

String a = request.getParameter("name");
String b = request.getParameter("email");
String c = request.getParameter("gender");
String d = request.getParameter("describe");

java.util.Date now = new java.util.Date();
	String date=now.toString();
	 String DATE_FORMAT = "dd-MM-yyyy";
	 SimpleDateFormat sdf = new SimpleDateFormat(DATE_FORMAT);
     String strDateNew = sdf.format(now) ;

try{

Class.forName("com.mysql.jdbc.Driver");	
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/five","root","admin");
String f1="\\Tomcat 6.0";
String f2="\\webapps";
String f3="\\imsearch";
String f4="\\image\\";
String f = null;
if(c.equalsIgnoreCase("male")){
	f = "C:\\Program Files\\Apache Software Foundation\\Tomcat 6.0\\webapps\\imsearch\\image\\male.jpg";

}
else{
		f = "C:\\Program Files\\Apache Software Foundation\\Tomcat 6.0\\webapps\\imsearch\\image\\female.jpg";

}
String sql=null;
File image=new File(f);

psmt1=con.prepareStatement("insert into profile(name,email,gender,define,image,date) values(?,?,?,?,?,?)");
psmt1.setString(1,a);
psmt1.setString(2,b);
psmt1.setString(3,c);
psmt1.setString(4,d);
fis=new FileInputStream(image);
psmt1.setBinaryStream(5, (InputStream)fis, (int)(image.length()));
psmt1.setString(6,strDateNew);

int s = psmt1.executeUpdate();
response.sendRedirect("#?message=success");

con.close();
psmt1.close();

}catch(Exception ex){

out.println("Error in connection : "+ex);

}

%>

</body>
</html>