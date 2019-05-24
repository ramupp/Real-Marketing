<%@page import="net.ocrt.dao.ConnectDB"%>
<%@page import="net.ocrt.dao.QrWeb"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>

<%@page import="net.ocrt.dao.Qrcode"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%-- 
    Document    : order_cap
    Created on  : Apr 19, 2016, 11:25:18 AM
    Author      : RAMU
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Regestration</title>
        <%@include file="includeFiles.jsp" %>

        <meta name="keywords" content="Glossy_Textured Contact Form Responsive Templates, Iphone Widget Template, Smartphone login forms,Login form, Widget Template, Responsive Templates, a Ipad 404 Templates, Flat Responsive Templates" />
        <link href="css/style.css" rel='stylesheet' type='text/css' />
        <!--webfonts-->
        <link href='http://fonts.googleapis.com/css?family=Open+Sans:700,300,600,800,400' rel='stylesheet' type='text/css'>
        <link href='http://fonts.googleapis.com/css?family=Marvel:400,700' rel='stylesheet' type='text/css'>
        <link href="https://fonts.googleapis.com/css?family=Audiowide" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Allerta+Stencil" rel="stylesheet">
        <link href='http://fonts.googleapis.com/css?family=Marvel:400,700' rel='stylesheet' type='text/css'>
        <style>
            p.groove {border-style: groove;}


            table.smallTable{
                border-width: 15px;
                border-color: #fff;
                border-collapse: separate;
                margin-top: 5px;
                color: #fff;
                box-shadow: 10px 10px 10px #000;
                background-image: url('images/ner.jpg');
            }  
            table.smallTable td {
                border-width: 2px;
                border-style: solid;
                border-color: #fff;
                font-size: small;
                color: white;
                text-align: left;
                background-image: url('../images/ner.jpg');
            }  
            table.smallTable th {
                border-width: 2px;
                padding: 4px;
                font-size: medium;
                border-style: solid;
                border-color:  #fff;
                background-image: url('../images/ner.jpg');
                color: wheat;
                width: 300px;
                text-align: left;
            } 
            table.smallTable input[type="text"]{
                border: none;

            }
            table.smallTable select{
                border: none;
                background: none;
            }
            table.smallTable textarea:hover{ color: #fff;}
        </style>
        <style>
            input.text1 {
                outline: none;
                background: none;
                background-image: linear-gradient(#232526,#414345);
                color: #fff;
                width: 50%;
                padding: 10px 10px;
                border: 2px solid#fff;
                font-size: 1em;
                font-weight: 100;
                margin-bottom: 1em;
                float: left;
                border-radius: 10px;
                box-shadow: 5px 5px 5px #000;
            }
            input.text1:hover {
                background: #fff;
                color: #3E4E95;
                transition: 2s all;
                -webkit-transition: 2s all;
                -moz-transition: 2s all;
                -o-transition: 2s all;
            }
            input.text2 {
                outline: none;
                background: none;
                background-image: linear-gradient(#232526,#414345);
                color: #fff;
                padding: 5px 5px;
                border: 2px solid#fff;
                font-size: 1em;
                font-weight: 50;
                margin-bottom: 1em;
                border-radius: 10px;
                box-shadow: 5px 5px 5px #000;
            }
            input.text2:hover {
                background: #fff;
                color: #3E4E95;
                transition: 2s all;
                -webkit-transition: 2s all;
                -moz-transition: 2s all;
                -o-transition: 2s all;
            }
            textarea.text2 {
                outline: none;
                background: none;
                background-image: linear-gradient(#232526,#414345);
                color: #fff;
                width: 100%;
                padding: 10px 10px;
                border: 2px solid#fff;
                font-size: 1em;
                font-weight: 100;
                margin-bottom: 1em;
                float: right;
                border-radius: 10px;
                box-shadow: 5px 5px 5px #000;
            }
            textarea.text2:hover {
                background: none;
                color: #000;
                transition: 2s all;
                -webkit-transition: 2s all;
                -moz-transition: 2s all;
                -o-transition: 2s all;
            }
            input[type="checkbox"]{
                width: 20px; 
                height: 20px;
            }



            /* Full-width input fields */
            input[type=text], input[type=password] {
                width: 70%;
                padding: 12px 20px;
                margin: 8px 0;
                display: inline-block;
                border: 1px solid #ccc;
                box-sizing: border-box;
            }

            /* Set a style for all buttons */
            button {
                background-color: #4CAF50;
                color: white;
                padding: 14px 20px;
                margin: 8px 0;
                border: none;
                cursor: pointer;
                width: 30%;
            }

            /* Extra styles for the cancel button */
            .cancelbtn {
                padding: 14px 20px;
                background-color: #f44336;
            }

            /* Float cancel and signup buttons and add an equal width */
            .cancelbtn,.signupbtn {
                float: left;
                width: 10%;
            }

            /* Add padding to container elements */
            .container {
                padding: 16px;
            }

            /* Clear floats */
            .clearfix::after {
                content: "";
                clear: both;
                display: table;
            }

            /* Change styles for cancel button and signup button on extra small screens */
            @media screen and (max-width: 150px) {
                .cancelbtn, .signupbtn {
                    width: 100%;
                }
            }

        </style>
        <script>
            function matchPassword()
            {
                //alert("hiiiii");
                var p = document.getElementById("pwd").value;
                var q = document.getElementById("pass").value;
                // alert(p);
                if (p == q)
                {
                    //  alert("password matched");

                    document.getElementById("xp").innerText = "\u2714Password matched";
                }
                else
                {
                    //  alert("password didnt matched");
                    document.getElementById("xp").innerText = "\u274cPassword didnt matched";
                    document.oq.newpassword.focus();
                    document.oq.confirmpassword.focus();
                }
            }
        </script>




        <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
        <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
        <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
        <link href="css/jquery.bootgrid.css" rel="stylesheet" type="text/css"/>
        <link href="css/jquery.bootgrid.min.css" rel="stylesheet" type="text/css"/>
        <script src="js/jquery.bootgrid.js" type="text/javascript"></script>
        <script src="js/jquery.bootgrid.min.js" type="text/javascript"></script>

    </head>
    <body>

        <div style=" float: left"> <a style="color: #e15960; font-size: x-large; font-family: 'Marvel', sans-serif;" href="list.jsp"><img src="images/back.png"/></a> </div>

    <marquee style="color: #FFF;font-size: xx-large; font-family: 'Audiowide';"><b>Welcome to Real Marketing</b></marquee>
    <div class="registration">

        <h2 style="font-family: Audiowide">Registration</h2>
        <div class="avtar"><img src="images/color.jpg" /></div>			
        <div class="form-info">

            <center>
                <%
                    // Class.forName("com.mysql.jdbc.Driver");
                    Connection con = null;
                    // con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ocrs", "root", "root");
                    String db = "vss";
                    con = ConnectDB.getDataSource(db);
                    Statement stmt = con.createStatement();
                    Statement stmt1 = con.createStatement();
                    Statement stmt2 = con.createStatement();
                    Statement stmt3 = con.createStatement();


                %>

                <!--code end -->   

                <form name="oq" action="user_creation.jsp" method="post" onsubmit="return check()"> 
                    <table>
                        <tr>
                            <td><text style="color: #ffffff; float: left;">User Name:</text> </td>                
                            <td><input type="text" style="height: 35px;" class="text1" value="" name="uname" value=" "  id="uname" >
                        </tr> 
                        

                        <tr>
                            <td><text style="color: #ffffff; float: left;">User ID :</text> </td>                
                            <td><input type="text" style="height: 35px" class="text1" value="" name="uid" id="uid">
                        </tr> 
                        <tr>
                            <td> <text style="color: #ffffff; float: left;"> Password :</text> </td>
                            <td><input type="password" style="height: 35px" class="text1" value="" name="pwd" id="pwd" onchange="test1();">

                        </tr>
                        <tr>
                            <td><text style="color: #ffffff; float: left;">Confirm Password :</text> </td>
                            <td><input type="password" style="height: 35px" class="text1" value="" name="pass" id="pass" onkeyup="matchPassword();" readonly</td>

                        </tr>
                        <tr>
                            <td colspan="2">  <p id="xp" style=" color: #f7e1b5; font-size: larger; padding: 5px;"></p></tr>
                        <table>
                            <tr>
                                <td><input Style="width: 120px;" type="submit" id="startBtn" value="submit"/>
                            </tr>
                        </table>  
                </form> 

            </center>

        </div>

    </body>
</html>