<%-- 
    Document   : index
    Created on : Mar 8, 2016, 4:11:18 PM
    Author     : SUNANDO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>List</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
        <meta name="keywords" content="Glossy_Textured Contact Form Responsive Templates, Iphone Widget Template, Smartphone login forms,Login form, Widget Template, Responsive Templates, a Ipad 404 Templates, Flat Responsive Templates" />
        <link href="css/style.css" rel='stylesheet' type='text/css' />
        <!--webfonts-->
        <link href='http://fonts.googleapis.com/css?family=Open+Sans:700,300,600,800,400' rel='stylesheet' type='text/css'>
        <link href='http://fonts.googleapis.com/css?family=Marvel:400,700' rel='stylesheet' type='text/css'>

        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
        <link href="https://fonts.googleapis.com/css?family=Audiowide" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Allerta+Stencil" rel="stylesheet">
        <script>
            $(document).ready(function(){
                 $(".menu").mouseenter(
                        function(){
                            $(this).css("font-size","x-large"); 
                                  });
                 $(".menu").mouseout(
                        function(){$(this).css("font-size","18px"); });
                $("a").hover(function(){
                    $(this).css("color", "#021638");
                    $(this).css("text-decoration", "underline");
                   
                  
                }, function(){
                    $(this).css("color", "#021638");
                    $(this).css("text-decoration", "none");
                });
                 $(".m1").mouseenter(
                        function(){
                            $(this).css("font-size","xx-large"); 
                                  });
                 $(".m1").mouseout(
                        function(){$(this).css("font-size","x-large"); });
                 $(".m1").hover(function(){
                    $(this).css("color", "#ff3300");
                    $(this).css("text-decoration", "underline");
                   
                  
                }, function(){
                    $(this).css("color", "#ff3300");
                    $(this).css("text-decoration", "none");
                });
            });
            
        </script>
      
    </head>
    <body>
        <%
            String user_type = (String) session.getAttribute("user_type");
            String uid=(String) session.getAttribute("user_id");
            String uname=(String) session.getAttribute("user_name");
            String dept=(String) session.getAttribute("dept");
           
        %>
    <marquee style="color: #fff;font-size: xx-large; font-family: 'Audiowide';"><b>Welcome to Real Marketing</b></marquee>
    <div class="registration">
        <h2 style="font-family: Audiowide">Menu</h2>
        <div class="avtar"><img src="images/color.jpg" /></div>			
        <div class="form-info" style=" float: left; margin-left: 250px;">
            
           <!--<a class="menu" style="color: darkcyan; font-family: Allerta Stencil" href="make_master.jsp">Make Master</a><br /> 
            <a class="menu" style="color: darkcyan; font-family: Allerta Stencil" href="item_master.jsp">Item Master</a><br />-->
           
        <a class="menu" style="color: #021638; font-family: Allerta Stencil; float: left" href="registration.jsp">User Registration</a><br />
        <a class="menu" style="color: #021638; font-family: Allerta Stencil;float: left" href="city_master.jsp">City Master</a><br/>
        <a class="menu" style="color: #021638; font-family: Allerta Stencil;float: left" href="state_master.jsp">State Master</a><br/>
        <a class="menu" style="color: #021638; font-family: Allerta Stencil;float: left" href="country_master.jsp">Country Master</a><br />
        <a class="menu" style="color: #021638; font-family: Allerta Stencil;float: left" href="foreign_contact.jsp">Foreign Contacts</a><br/>
             <!--<a class="menu" style="color: #269abc; font-family: Allerta Stencil" href="report.jsp">Report</a><br />-->
        <a class="menu" style="color: #021638;  font-family: Allerta Stencil;float: left" href="Reset_password.jsp">Change Password</a></br></br>
        <a class="m1" style="color:#ff3300; font-size: x-large;  font-family: Audiowide;" href="logout.jsp">Logout</a><br /><br /><br /> 
  
        </div>
           
    </div>

</body>
</html>
