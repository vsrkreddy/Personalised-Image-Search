<%@ page import="java.sql.*"  import="databaseconnection.*" errorPage="" %>
<%
				String email=(String)session.getAttribute("email");
				String id=null;
				ResultSet rs=null;
				try
				{

					Class.forName("com.mysql.jdbc.Driver");

					Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/five","root","admin");
					Statement st = con.createStatement();	
	

					String qry="select * from gallery where email='"+email+"'";
					rs =st.executeQuery(qry);
		
		
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="robots" content="index,follow" />
<meta name="keywords" content=" " />
<meta name="description" content=" " />
<title>Personalized Image Search </title>
<link type="text/css" href="css/style.css" rel="stylesheet" media="screen" />
<script type="text/javascript" src="js/jquery-1.4.2.js"></script>
<style type="text/css">
#portfolio-page .portfolio-list1 {
	margin-left:150px;
}
#portfolio-page .portfolio-list1 li {
	width:150px;
	height:196px;
	float:left;
	display:inline;
	margin-left:22px;
}
#portfolio-page .portfolio-list1 li img {
	padding:4px;
	border:1px solid #ced1da;
	background:#eef0f5
}
#portfolio-page .portfolio-list2 {
	margin-left:150px;
}
#portfolio-page .portfolio-list2 li {
	width:150px;
	height:50px;
	float:left;
	display:inline;
	margin-left:22px;
}
#portfolio-page .portfolio-list2 li img {
	padding:4px;
	border:1px solid #ced1da;
	background:#eef0f5
}
</style>
<!--[if IE]>
<link type="text/css" href="css/ie.css" rel="stylesheet" media="screen" />
<![endif]-->
<!--[if IE 6]>
<script type="text/javascript" src="js/pngfix.js"></script>
<script type="text/javascript"> 
DD_belatedPNG.fix('img,#logo');
</script> 
<![endif]-->
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
<div class="top-bar-wrap">
  <div id="top-bar" class="mod-con">
    <div class="links">Search to:</div>
    <div class="search">
      <form name="f" action="search.jsp" method="post">
      <input type="text" value="Search here" name="tag" onkeypress="checkEnter(event)" />
	  </form>
    </div>
	<div style="position:absolute; right:100px; top:20px"><h1><%=session.getAttribute("name")%></h1></div>
  </div>
</div>
 <div style="position:absolute; left:50px; top:70px">
  <p><font color="#7a8090" size="+2">Personalized Image Search</font> <br/>
    <font color="#7a8090" size="+1"> &nbsp;&nbsp;from the Photo Sharing Websites</font></p>
</div>
<div class="main-bg">
  <div id="sub-page" class="main-wrap">
    <div id="header" class="mod-con"> 
      <ul id="main-menu">
        <li><a href="index.html"><strong>Home</strong></a></li>
        <li><a href="about.html"><strong>About</strong></a></li>
        <li><a href="upload1.jsp"><strong>Upload</strong></a></li>
        <li><a class="cur" href="#"><strong>My Gallery</strong></a></li>
        <li><a href="contact.jsp"><strong>Contact</strong></a></li>
      </ul>
    </div>
    <div id="main" class="mod-con">
      <div id="portfolio-page" class="container">
        <div class="main-con">
          <div class="title-nav">
            <h2>My Gallery</h2>
            </div>
			<ul class="portfolio-list2 clearfix">
		<li>
		      <p><font color="#1c8cb5" size="+1">Image</font></p>
		</li>
		<li>
		<p><font color="#1c8cb5" size="+1">Tagged by</font></p>
		</li>
		<li>
		<p><font color="#1c8cb5" size="+1">Tagged on</font></p>
		</li>
         </ul>
 			<%
			while(rs.next())
			{
				id=rs.getString("id");
			%>
		
		<ul class="portfolio-list1 clearfix">
		<li>
		<a href="#"><img src="view1.jsp?id=<%=id%>" height="125" width="125"></a>
		</li>
		<li>
		<a href="#"><%=rs.getString("email")%></a>
		</li>
		<li>
		<a href="#"><%=rs.getString("date")%></a>
		</li>
		<li>
		<a href="deletetag.jsp?id=<%=id%>">Delete</a>
		</li>
         </ul>    
    		  
    		 <%}%>       
          
       
          <div class="pages-nav"> 
            <marquee align="middle" behavior="alternate" direction="down" height="35" width="800">
            <font color="#1c8cb5" size="+1">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Personalized 
            Image Search from photosharing websites </font> 
            </marquee>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>


<%

	}
	catch(Exception e2){
		out.println(e2.getMessage());
	}
%>
</body>
</html>
