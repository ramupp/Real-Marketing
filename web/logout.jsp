<%-- 
    Document   : logout
    Created on : Mar 15, 2016, 2:09:50 PM
    Author     : SUNANDO
--%>

<%


session.invalidate();
response.sendRedirect("login.jsp?d=yes");


%>
