<%-- 
    Document   : login
    Created on : Apr 26, 2017, 11:31:27 AM
    Author     : VTPL
--%>
<%@page import="net.ocrt.dao.ConnectDB"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%

   //Class.forName("com.mysql.jdbc.Driver");
    Connection con = null;
    String db="real_marketing";
    con=ConnectDB.getDataSource(db);
  // con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ocrs", "root", "root");
    Statement stmt = con.createStatement();
    
    
    String unm=request.getParameter("unm");
    String pwd=request.getParameter("pwd");
   
    //System.out.println(unm+".."+pwd);
    //String sql="select * from tbl_login where uname='"+unm+"' and pwd='"+pwd+"' and org_id="+org+" and loc_id='"+lnm+"'";
  // String sql="select * from tbl_login a,tbl_login_loc b where a.id=b.id and a.uname='"+unm+"' and a.pwd='"+pwd+"' and a.org_id='"+org+"' and b.loc_id='"+lnm+"';";
    String sql="select user_type,uid,uname,pwd from tbl_master_login where uid='"+unm+"' and pwd='"+pwd+"'";
    ResultSet rs=stmt.executeQuery(sql);        
    if(rs.next())
    {
        session.setAttribute("user_id", rs.getObject("uid"));
        session.setAttribute("user_type", rs.getObject("user_type"));
        session.setAttribute("user_name", rs.getObject("uname"));
        session.setAttribute("pwd", rs.getObject("pwd"));
       
       
        response.sendRedirect("list.jsp"); 
               
    }
    else
    {
        response.sendRedirect("login.jsp"); 
    
    }

   rs.close();
   stmt.close();
   con.close();



%>
