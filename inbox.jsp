<%@page import="com.oreilly.servlet.*,java.sql.*,java.lang.*,databaseconnection.*,java.text.SimpleDateFormat,java.util.*,java.io.*,javax.servlet.*, javax.servlet.http.*"  errorPage="Error.jsp"%>
<% 
	
	Statement st = null;
	ResultSet rs1=null;
	String name1=(String)session.getAttribute("name");
	String email1=(String)session.getAttribute("email");

	session.setAttribute("name",name1);
	session.setAttribute("email",email1);
	try{
		
		Class.forName("com.mysql.jdbc.Driver");	
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/five","root","admin");
		st=con.createStatement();
		String sql1="select * from profile where email='"+email1+"'";
		
		rs1=st.executeQuery(sql1);
%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="robots" content="index,follow" />
<meta name="keywords" content=" " />
<meta name="description" content=" " />
<title>Personalized Image Search </title>
<link type="text/css" href="css/style.css" rel="stylesheet" media="screen" />
<script type="text/javascript" src="js/jquery-1.4.2.js"></script>
<!--[if IE]>
<link type="text/css" href="css/ie.css" rel="stylesheet" media="screen" />
<![endif]-->
<!--[if IE 6]>
<script type="text/javascript" src="js/pngfix.js"></script>
<script type="text/javascript"> 
DD_belatedPNG.fix('img,#logo');
</script> 
<![endif]-->
<style type="text/css">
.submit_bg
{
	width:76px;
	height:27px;
	background-color:#1c8cb5;
}
</style>
</head>
<body>
<!-- * Project: BlueMasters
* PSD Designed by: Smashing Magazine
* URL:http://www.smashingmagazine.com/2010/06/22/free-portfolio-psd-template-bluemasters/
*
* XHTML/CSS Coded By: XhtmlWeaver
* URL: http://www.xhtmlweaver.com
* Email: info@xhtmlweaver.com
*
* Feel free to use, redistribute!
* - XhtmlWeaver, You Design, We code!
 -->
 <div style="position:absolute; left:50px; top:30px">
  <p><font color="#7a8090" size="+2">Personalized Image Search</font> <br/>
    <font color="#7a8090" size="+1"> &nbsp;&nbsp;from the Photo Sharing Websites</font></p>
</div>
<div class="main-bg">
  <div id="sub-page" class="main-wrap">
    <div id="header" class="mod-con"> 
      <ul id="main-menu">
        <li><a class="cur" href="index.html"><strong>Home</strong></a></li>
        <li><a href="about.html"><strong>About</strong></a></li>
        <li><a href="upload1.jsp"><strong>Upload</strong></a></li>
        <li><a href="viewgallery.jsp"><strong>My Gallery</strong></a></li>
        <li><a href="contact.jsp"><strong>Contact</strong></a></li>
      </ul>
    </div>
    <div id="main" class="mod-con">
      <div id="blog-page" class="container clearfix">
        <div class="main-con">
          <div class="title-nav">
            <h2>Blog</h2>
          </div>
          <ul class="blog-list">
            <li>
				<%while(rs1.next()){
				Connection con2=null;
				ResultSet rs2=null;
				Statement stmt2=null;
				int count1 = 0;
					try{
			 
						Class.forName("com.mysql.jdbc.Driver").newInstance();
						con2=DriverManager.getConnection("jdbc:mysql://localhost:3306/five","root","admin");
						stmt2 = con2.createStatement();
						String sql2= "SELECT * FROM view where email='"+email1+"'"; 
						rs2 = stmt2.executeQuery(sql2);

						while(rs2.next()){
						count1 = count1+1;;
						}
				%>
					<h3><%=rs1.getString(1)%></h3>
				
              
              <div class="author">Joined: &nbsp;&nbsp;&nbsp;<%=rs1.getString("date")%></div>
              <div class="pic"><img src="viewimage.jsp?email=<%=(String)session.getAttribute("email")%>" alt="" width="120" height="99" /></div>
       			
              <div class="clearfix"> <a href="#" class="btn"><<<%=count1%>>></a><a href="#" class="btn">Shared Photos</a> </div>
            </li>
     		<li>
              <h3>Search Image here</h3>
				              
            </li>
          </ul>
          <div class="pages-nav"> 
            <form name="f" action="search.jsp" method="post" onSubmit="return validation()">
              <table>
                <tr> 
                  <td>Tag:</td>
                  <td>&nbsp; <input type="text" name="tag"></td>
                  <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type="submit" name="search" value="Search" class="submit_bg"></td>
                </tr>
              </table>
            </form>
          </div>
        </div>
        <div class="sidebar">
          <div id="welcome-guest">
            <div class="title-nav">
              <h2>My Profile</h2>
            </div>
            <div class="con">
            <table height="150">
				<tr>
					<td>Email:</td>
					<td>&nbsp;<font color="#1c8cb5"><%=rs1.getString(2)%></font></td>
				</tr>
				
				<tr>
					<td>Gender:</td>
					<td>&nbsp;<font color="#1c8cb5"><%=rs1.getString(3)%></font></td>
				</tr>
				
				<tr>
					<td>About:</td>
					<td>&nbsp;<font color="#1c8cb5"><%=rs1.getString(4)%></font></td>
				</tr>

				<tr>
					<td></td>
					
                  <td><a href="editprofile.jsp?email=<%=rs1.getString(2)%>"><font color="blue">Edit Profile</font></a></td>
				</tr>
				
			</table>
            </div>
          </div>
          <div id="site-navigation">
            <div class="title-nav">
              <h2>Site Navigation</h2>
            </div>
            <div class="con">
              <ul>
                <li><a href="index.html">Welcome Home</a></li>
                <li><a href="about.html">About Us</a></li>
                <li><a href="upload1.jsp">Upload</a></li>
                <li><a href="viewgallery.jsp">My Gallery</a></li>
              </ul>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>


<%
	}
catch(Exception ex){
		out.println(ex.getMessage());
	}
}
	}
	catch(Exception e2){
		out.println(e2.getMessage());
	}
%>
</body>
</html>
