<%@page import="com.oreilly.servlet.*,java.sql.*,databaseconnection.*,java.util.*,java.io.*,javax.servlet.*, javax.servlet.http.*"%>

<%

		String name=request.getParameter("name");
		String email=(String)session.getAttribute("email");
		String gender=request.getParameter("gender");
		String define=request.getParameter("define");

		try {

			Class.forName("com.mysql.jdbc.Driver");	
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/five","root","admin"); 

			PreparedStatement ps=con.prepareStatement("Update profile set name=?,email=?,gender=?,define=? where email='"+email+"'");
			
           
				ps.setString(1,name);
				ps.setString(2,email);
				ps.setString(3,gender);
				ps.setString(4,define);
						      
				int x=ps.executeUpdate();
				response.sendRedirect("inbox.jsp");			
		} 
		catch (Exception e) 
		{
			out.println(e.getMessage());
		}
	
 %>
