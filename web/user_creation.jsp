<%-- 
    Document   : user_creation
    Created on : Nov 16, 2017, 3:52:55 PM
    Author     : RAMU
--%>

<%@page import="net.ocrt.dao.ConnectDB"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>

<%
    // Class.forName("com.mysql.jdbc.Driver");
    Connection con = null;
    // con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ocrs", "root", "root");
    String db = "real_marketing";
    con = ConnectDB.getDataSource(db);
    Statement stmt = con.createStatement();
    Statement stmt1 = con.createStatement();

//    String user_type = (String) session.getAttribute("user_type");
//    String uid = (String) session.getAttribute("user_id");
//    String uname = (String) session.getAttribute("user_name");
//    String pwd = (String) session.getAttribute("pwd");
    Integer id = (Integer) session.getAttribute("id");
    String uname = request.getParameter("uname");
    String uid = request.getParameter("uid");
    String pwd = request.getParameter("pwd");
    String pass = request.getParameter("pass");
  

    try {
        String sql = "INSERT INTO tbl_master_login(uid, pwd, uname) VALUES('" + uid + "', '" + pwd + "', '" + uname + "')";
        System.out.println("hello=> " + sql);
        int i = stmt.executeUpdate(sql);

        if (i > 0) {
            session.setAttribute("m", "yes");
            response.sendRedirect("registration.jsp");

        } else {
            session.setAttribute("m", "no");
            response.sendRedirect("registration.jsp");
        }
    } catch (Exception e) {
        System.out.println(e);
        session.setAttribute("m", "no");
        response.sendRedirect("registration.jsp");
    } finally {

        stmt.close();
        con.close();

    }


%>
