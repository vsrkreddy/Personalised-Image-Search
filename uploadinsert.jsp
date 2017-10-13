<%@page import="com.oreilly.servlet.*,java.sql.*,java.lang.*,databaseconnection.*,java.text.SimpleDateFormat,java.util.*,java.io.*,javax.servlet.*, javax.servlet.http.*"  errorPage="Error.jsp"%>
<%@page import=" java.security.MessageDigest"%>
<%@page import=" java.security.*"%>
<%@page import="javax.crypto.*"%>



<html>
<head>
</head>
<body>
<%

ArrayList list = new ArrayList();
		ServletContext context = getServletContext();

		String dirName =context.getRealPath("\\Gallery");
		String paramname=null;
		String file=null;
		String tag=null,title=null,visible=null,description=null,image=null,name=null,email=null;
		name=(String)session.getAttribute("name");
		email=(String)session.getAttribute("email");
		java.util.Date now = new java.util.Date();
	String date=now.toString();
	 String DATE_FORMAT = "dd-MM-yyyy";
	 SimpleDateFormat sdf = new SimpleDateFormat(DATE_FORMAT);
     String strDateNew = sdf.format(now) ;
 
		File file1 = null;
			
		
		try {
			
			MultipartRequest multi = new MultipartRequest(request, dirName,	10 * 1024 * 1024); // 10MB

			Enumeration params = multi.getParameterNames();
			while (params.hasMoreElements()) 
			{
				paramname = (String) params.nextElement();
				
				if(paramname.equalsIgnoreCase("tag"))
				{
					tag=multi.getParameter(paramname);
				}
				if(paramname.equalsIgnoreCase("title"))
				{
					title=multi.getParameter(paramname);
				}
				if(paramname.equalsIgnoreCase("visible"))
				{
					visible=multi.getParameter(paramname);
				}
				if(paramname.equalsIgnoreCase("description"))
				{
					description=multi.getParameter(paramname);
				}
				if(paramname.equalsIgnoreCase("image"))
				{
					image=multi.getParameter(paramname);
				}
				
				}
					
			int f = 0;
	Enumeration files = multi.getFileNames();	
	while (files.hasMoreElements()) 
	{
		paramname = (String) files.nextElement();
		if(paramname.equals("d1"))
		{
			paramname = null;
		}
		
		if(paramname != null)
		{
			f = 1;
			image = multi.getFilesystemName(paramname);
			String fPath = context.getRealPath("\\Gallery\\"+image);
			file1 = new File(fPath);
			FileInputStream fs = new FileInputStream(file1);
			list.add(fs);
		}		
	}
	        FileInputStream fs1 = null;
            //name=dirName+"\\Gallery\\"+image;
			
			
			
	 
			
			
			Class.forName("com.mysql.jdbc.Driver");	
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/five","root","admin"); 

			PreparedStatement ps=con.prepareStatement("INSERT INTO view VALUES(?,?,?,?,?,?,?,?)");
				ps.setString(1,image);
               	ps.setString(2,tag);
				ps.setString(3,title);	
       			ps.setString(4,visible);
       			ps.setString(5,description);
			    ps.setString(6,name);
			    ps.setString(7,email);
				ps.setString(8,strDateNew);
				
				
				
				
       if(f == 0)
			ps.setObject(1,null);
		else if(f == 1)
		{
			fs1 = (FileInputStream)list.get(0);
			ps.setBinaryStream(1,fs1,fs1.available());
		}	
			int x=ps.executeUpdate();
		
			if(x!=0)
			{
				response.sendRedirect("upload.jsp?message=success");
			}
			else
			{
				response.sendRedirect("upload.jsp?message=fail");
			}
				
		} 
		catch (Exception e) 
		{
			out.println(e.getMessage());
		}
	
 %>
</body>
</html>