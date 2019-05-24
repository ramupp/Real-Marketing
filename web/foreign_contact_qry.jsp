<%-- 
    Document   : foreign_contact_qry
    Created on : Nov 21, 2017, 11:38:04 AM
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
    Integer state_id = (Integer) request.getAttribute("state");
    Integer city_id = (Integer) request.getAttribute("city");
    Integer country_id = (Integer) request.getAttribute("country");
    String city_name=(String) request.getParameter("city_name");
    String mr=(String) request.getParameter("title");
    String fname=(String) request.getParameter("fname");
    String lname=(String) request.getParameter("lname");
    String tel_no=(String) request.getParameter("tel_no");
    String address1=(String) request.getParameter("address1");
   
   try{ 
    String sql="INSERT INTO tbl_foreign_contacts(title, firstname, lastname, address1, state, city, country, tel_no)VALUES('"+mr+"','"+fname+"','"+lname+"','"+address1+"','"+state_id+"','"+city_id+"','"+country_id+"','"+tel_no+"')";
    System.out.println("hello");
   
   
   int i=stmt.executeUpdate(sql);
   
    if(i>0)
    {
         session.setAttribute("m","yes");
        response.sendRedirect("foreign_contact.jsp");
        
    }
    else
    {
         session.setAttribute("m","no");
        response.sendRedirect("foreign_contact.jsp");
    }
  }catch(Exception e)
   {
       System.out.println(e);
       session.setAttribute("m","no");
        response.sendRedirect("foreign_cantact.jsp");}
   finally{

     stmt.close();
     con.close();

   }

  



%>
