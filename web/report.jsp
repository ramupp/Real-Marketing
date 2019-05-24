<%-- 
    Document   : index
    Created on : Apr 22, 2016, 4:11:18 PM
    Author     : ARIJIT
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Reports</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
        <meta name="keywords" content="Glossy_Textured Contact Form Responsive Templates, Iphone Widget Template, Smartphone login forms,Login form, Widget Template, Responsive Templates, a Ipad 404 Templates, Flat Responsive Templates" />
        <link href="css/style.css" rel='stylesheet' type='text/css' />
        
        <!--webfonts-->
        
        <link href='http://fonts.googleapis.com/css?family=Open+Sans:700,300,600,800,400' rel='stylesheet' type='text/css'>
        <link href='http://fonts.googleapis.com/css?family=Marvel:400,700' rel='stylesheet' type='text/css'>

        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
        <script>
            $(document).ready(function(){
                $(".menu").mouseenter(
                        function(){
                            $(this).css("font-size","x-large"); 
                                  });
                 $(".menu").mouseout(
                        function(){$(this).css("font-size","18px"); });
                $("a").hover(function(){
                    $(this).css("color", "red");
                    $(this).css("text-decoration", "underline");
                }, function(){
                    $(this).css("color", "red");
                    $(this).css("text-decoration", "none");
                });
            });
        </script>
    </head>
    <body>
        <div style=" float: left"> <a style="color: #e15960; font-size: x-large; font-family: 'Marvel', sans-serif;" href="assignlist.jsp"><img src="images/back.png"/></a> </div>

        <%
            String user_type = (String) session.getAttribute("user_type");
            String uid=(String) session.getAttribute("user_id");
            String uname=(String) session.getAttribute("user_name");
        %>
    <marquee style="color: aqua;font-size: xx-large; font-family: 'Marvel', sans-serif;"><b>Welcome to RK Project</b></marquee>
    <div class="registration">
        <h2>Reports</h2>
        <div class="avtar"><img src="images/color.jpg" /></div>			
        <div class="form-info">
            <a class="menu" style="color: red;" href="emp_entry_dtl_report.jsp">Employee Entry Details Reports</a><br /> 
            
            
                      
            <a style="color: aqua;" href="list.jsp"><b>Back to menu</b></a><br /><br />
        </div>
    </div>

</body>
</html>
