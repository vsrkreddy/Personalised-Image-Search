

<%@ page import="java.sql.*,java.lang.*,databaseconnection.*"%>
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
<script language="JavaScript">
function validation()
{
var a = document.form.secretkey.value;
if(a=="")
{
alert("Enter the Secret Message");
document.form.secretkey.focus();
return false;
}
}

</script>
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
<form enctype="multipart/form-data" action="uploadinsert1.jsp" method="post" name="form" onsubmit="return validation();">
			
 <div style="position:absolute; left:50px; top:30px">
  <p><font color="#7a8090" size="+2">Personalized Image Search</font> <br/>
    <font color="#7a8090" size="+1"> &nbsp;&nbsp;from the Photo Sharing Websites</font></p>
</div>
<div class="main-bg">
  <div id="sub-page" class="main-wrap">
      <div id="header" class="mod-con"> 
        <ul id="main-menu">
          <li><a href="index.html"><strong>Home</strong></a></li>
          <li><a href="about.html"><strong>About</strong></a></li>
          <li><a class="cur" href="upload1.jsp"><strong>Upload</strong></a></li>
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

%>
					<h3><%=rs1.getString(1)%></h3>
				
              
              <div class="author"></div>
              <div class="pic"><img src="viewimage.jsp?email=<%=(String)session.getAttribute("email")%>" alt="" width="120" height="99" /></div>
          
            </li>
     		<li>
              <h3>Describe this upload</h3>
            <!--  <div class="pic"><img src="image/temp4.jpg" alt="" /></div>-->
              <div class="con">
			   <%
				int n=1,s=0;
 				Connection con2=null;
				Statement st2=null;
				ResultSet rs2=null;
				String sql2="select max(id) from view";
				try
	{
		//con=databasecon.getconnection();
Class.forName("com.mysql.jdbc.Driver");	
			con2 = DriverManager.getConnection("jdbc:mysql://localhost:3306/five","root","admin");
		st2=con.createStatement();
		rs2=st2.executeQuery(sql2);
		if(rs2.next())
		{
		if(rs2.getInt(1)==0)
		n=1;
		else
		n=rs2.getInt(1)+1;
		session.setAttribute( "id", n );
		}
				%>
            <table height="200" width="300">
				<tr>
					<td>ID:</td>
					<td>&nbsp;<input type="text" name="id" value="<%=n%>"></td>
				</tr>
				<tr>
					<td>Tag:</td>
					<td>&nbsp;<input type="text" name="tag"></td>
				</tr>
				<tr>
					<td>Title:</td>
					<td>&nbsp;<input type="text" name="title"></td>
				</tr>
				<tr>
					<td>Visible:</td>
					<td>&nbsp;<input type="radio" name="visible" value="private">Private<input type="radio" name="visible" value="public">Public</td>
				</tr>
				<tr>
					<td>Description:</td>
					<td>&nbsp;<textarea name="description"></textarea></td>
				</tr>

				<tr>
					<table align="center" background="images/templatemo_header.jpg">
              <td>Select Image:&nbsp;&nbsp;  
                <input type="file" id="files" name="image" multiple />
<output id="list"></output></td>

<script>
  function handleFileSelect(evt) {
    var file = evt.target.files; // FileList object

    // Loop through the FileList and render image files as thumbnails.
    for (var i = 0, f; f = file[i]; i++) {

      // Only process image files.
      if (!f.type.match('image.*')) {
        continue;
      }

      var reader = new FileReader();

      // Closure to capture the file information.
      reader.onload = (function(theFile) {
        return function(e) {
          // Render thumbnail.
          var span = document.createElement('span');
          span.innerHTML = ['<img class="thumb" src="', e.target.result,
                            '" title="', theFile.name, '"/>'].join('');
          document.getElementById('list').insertBefore(span, null);
        };
      })(f);

      // Read in the image file as a data URL.
      reader.readAsDataURL(f);
    }
  }

  document.getElementById('files').addEventListener('change', handleFileSelect, false);
</script>
</table>
				</tr>
				
				<tr>
					<td><input type="reset" value="Clear" name="reset" class="submit_bg"></td>
					<td><input type="submit" value="Upload" name="update" class="submit_bg"></td>
				</tr>
				
			</table>
			
			  </div>
             </li>
          </ul>
			
            <div class="pages-nav"> 
              <p>You can give your uploads a 'tag', which is like a keyword. Tags 
                help you find things which have something in common. </p>
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
					
                  <td><a href="editprofile.jsp?email=<%=rs1.getString(2)%>"><font color="#1c8cb5">Edit Profile</font></a></td>
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
                <li><a href="#">Upload</a></li>
                <li><a href="viewgallery.jsp">My Gallery</a></li>
                <li><a href="contact.jsp">Contact</a></li>
              </ul>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>

<div class="footer-wrap">
  <div id="footer" class="mod-con">
        <div class="copyright">&copy; 2012 Copyright. All Rights Reserved.&nbsp;&nbsp;<font size="+1">www.chennaisunday.com</font></div>
    <div class="links"><a href="#">Log in</a> | <a href="#">Privacy Policy</a> | <a href="#">Contact Us</a></div>
  </div>
</div>
<%
}
catch(Exception e)
	{
		System.out.println(e);
	}
	  finally
	{
		con2.close();
		st2.close();
	}
 
}%>
<%
	}
	catch(Exception e2){
		out.println(e2.getMessage());
	}
%>
</form>
</body>
</html>