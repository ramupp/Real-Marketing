<%-- 
    Document   : update
    Created on : May 16, 2017, 3:08:23 PM
    Author     : VTPL
--%>

<%@page import="net.ocrt.dao.ConnectDB"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%
     Connection con2 = null;
    String db2 = "cal_amount";
String v_no=request.getParameter("v_no");
int no=Integer.parseInt(v_no);
String name=request.getParameter("name");
String item=request.getParameter("item");
String description = (String)request.getParameter("description");
String quantity = request.getParameter("quantity");
String unit_cost = request.getParameter("unit_cost");

String amount = request.getParameter("amount");


    
try{
Connection conn = null;
Class.forName("com.mysql.jdbc.Driver").newInstance();
conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/cal_amount","root", "root");
Statement stmt=null;
stmt=conn.createStatement();
stmt.executeUpdate("update tbl_employee_activity1 set name='"+name+"',item='"+item+"',description='"+description+"',quantity='"+quantity+"',unit_cost='"+unit_cost+"' ,amount='"+amount+"' where v_no='"+v_no+"'");
response.sendRedirect("voucher.jsp");
}
catch(Exception e){
   System.out.println(e); 
System.out.println("updated Sucsessfully");
}
%>