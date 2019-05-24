<%-- 
    Document   : country_master_qry
    Created on : Nov 3, 2017, 3:33:52 PM
    Author     : RAMU
--%>

<%@page import="net.ocrt.dao.ConnectDB"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.io.*,java.util.*,javax.mail.*"%>
<%@page import="javax.mail.internet.*,javax.activation.*"%>
<%@page import="javax.servlet.http.*,javax.servlet.*" %>
<%
   
   // Class.forName("com.mysql.jdbc.Driver");
    Connection con = null;
   // con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ocrs", "root", "root");
     String db="real_marketing";
    con=ConnectDB.getDataSource(db);
    Statement stmt = con.createStatement();
    
    
    Integer id = (Integer) request.getAttribute("id");
    String country_name=(String) request.getParameter("country_name");
   
   try{ 
    String sql="INSERT INTO tbl_country(country_name)" +"VALUES('"+country_name+"')";
    System.out.println("hello");
   
   
   int i=stmt.executeUpdate(sql);
   
    if(i>0)
    {
         session.setAttribute("m","yes");
        response.sendRedirect("country_master.jsp");
        
    }
    else
    {
         session.setAttribute("m","no");
        response.sendRedirect("country_master.jsp");
    }
  }catch(Exception e)
   {
       System.out.println(e);
       session.setAttribute("m","no");
        response.sendRedirect("country_master.jsp");}
   finally{

     stmt.close();
     con.close();

   }

  



%>
