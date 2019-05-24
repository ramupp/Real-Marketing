<%-- 
    Document   : state_master_qry
    Created on : Nov 18, 2017, 10:47:58 AM
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
    
    
    Integer state_id = (Integer) request.getAttribute("state_id");
    String state_name=(String) request.getParameter("state_name");
    String country=(String) request.getParameter("country_id");

   try{ 
    String sql="INSERT INTO tbl_state(state_name,country_id)VALUES('"+state_name+"','"+country+"')";
    System.out.println("hello");
   
   
   int i=stmt.executeUpdate(sql);
   
    if(i>0)
    {
         session.setAttribute("m","yes");
        response.sendRedirect("state_master.jsp");
        
    }
    else
    {
         session.setAttribute("m","no");
        response.sendRedirect("state_master.jsp");
    }
  }catch(Exception e)
   {
       System.out.println(e);
       session.setAttribute("m","no");
        response.sendRedirect("state_master.jsp");}
   finally{

     stmt.close();
     con.close();

   }

  



%>
