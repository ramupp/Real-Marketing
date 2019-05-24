
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
    Author      : ARIJIT
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>

        <title>Reset Password</title>
        <%@include file="includeFiles.jsp" %>
        <style>
            table.smallTable{
                border-width: 15px;
                border-color: #000;
                border-collapse: collapse;
                border-spacing: 5px;
                color: #000;
                box-shadow: 10px 10px 10px #000;
                background-image: url('../images/ner.jpg');

            }  
            table.smallTable td {
                border-width: 1px;
                border-style: solid;
                border-color: #000;
                color: #333333;
                text-align: center;
                background-image: url('../images/ner.jpg');

            }  
            table.smallTable th {
                border-width: 1px;
                padding: 4px;
                font-size: medium;
                border-style: solid;
                border-color: #000;
                background-image: url('../images/ner.jpg');
                color: blue;
                width: 600px;
            } 
            .error{ outline: none;
                    background: none;
                    background-image: linear-gradient(#232526,#414345);
                    color: #fff;
                    width: 70%;
                    padding: 10px 10px;
                    border: 2px solid lightcoral;
                    font-size: 1em;
                    font-weight: 100;
                    margin-left: 15px;
                    margin-bottom: 1em;
                    float: right;
                    border-radius: 10px;
                    box-shadow: 5px 5px 5px tomato inset;
            }

        </style>
        <script >
            function check()
            {
                var oldpassword = document.getElementById("pass").value;
                var newpassword = document.getElementById("pass1").value;
                var confirmpassword = document.getElementById("pass2").value;
                var oldpasssession = document.getElementById("pwd1").value;
                //var w=document.oq.pro.value;
                // var a=document.oq.oqty.value;

                //alert(oldpasssession + oldpassword);
                if (oldpassword != oldpasssession)
                {
                    $.notify('Please provide valid old Password', {blur: 0.6, delay: 0});
                    return false;
                }
                if (newpassword == "")
                {
                    $.notify('Please provide New Password', {blur: 0.6, delay: 0});
                    return false;
                }
                if (confirmpassword == "" || (newpassword != confirmpassword))
                {
                    $.notify('Please provide Confirm Password', {blur: 0.6, delay: 0});
                    return false;
                }
                else {
                    return true;
                }

            }
            function test1()
            {
                // alert("helooo1");
                var oldpassword = document.getElementById("pass").value;
                //    var newpassword=document.getElementById("pass1").value;
                //    var confirmpassword=document.getElementById("pass2").value;
                var oldpasssession = document.getElementById("pwd1").value;
                //var w=document.oq.pro.value;
                // var a=document.oq.oqty.value;

                //alert(oldpasssession + oldpassword);
                if (oldpassword == oldpasssession)
                {
                    //alert("helloo2");
                    var start = 8;
                    var mid = 15;
                    var end = 820;
                    var width = 2;
                    var leftX = start;
                    var leftY = start;
                    var rightX = mid - (width / 2.7);
                    var rightY = mid + (width / 2.7);
                    var animationSpeed = 20;

                    var ctx = document.getElementsByTagName('canvas')[0].getContext('2d');
                    ctx.lineWidth = width;
                    ctx.strokeStyle = 'rgb(213, 255, 128)';

                    for (i = start; i < mid; i++) {
                        var drawLeft = window.setTimeout(function () {
                            ctx.beginPath();
                            ctx.moveTo(start, start);
                            ctx.lineTo(leftX, leftY);
                            ctx.stroke();
                            leftX++;
                            leftY++;
                        }, 1 + (i * animationSpeed) / 3);
                    }

                    for (i = mid; i < end; i++) {
                        var drawRight = window.setTimeout(function () {
                            ctx.beginPath();
                            ctx.moveTo(leftX, leftY);
                            ctx.lineTo(rightX, rightY);
                            ctx.stroke();
                            rightX++;
                            rightY--;
                        }, 1 + (i * animationSpeed) / 3);
                    }

                    document.getElementById("pass1").removeAttribute("readonly");
                    document.getElementById("pass2").removeAttribute("readonly");
                }
                else
                {
                    // alert("hiii guys");
                    $("#pass").removeClass("text1");
                    $("#pass").addClass("error");
                }

            }

            function matchPassword()
            {
                //alert("hiiiii");
                var p = document.getElementById("pass1").value;
                var q = document.getElementById("pass2").value;
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

        <meta name="keywords" content="Glossy_Textured Contact Form Responsive Templates, Iphone Widget Template, Smartphone login forms,Login form, Widget Template, Responsive Templates, a Ipad 404 Templates, Flat Responsive Templates" />

        <link href="css/jquery.ui.timepicker.css" rel="stylesheet" type="text/css"/>
        <script src="js/jquery.ui.timepicker.js" type="text/javascript"></script>
        <link href="css/style.css" rel='stylesheet' type='text/css' />
        <!--webfonts-->
        <link href='http://fonts.googleapis.com/css?family=Open+Sans:700,300,600,800,400' rel='stylesheet' type='text/css'>
        <link href='http://fonts.googleapis.com/css?family=Marvel:400,700' rel='stylesheet' type='text/css'>
        <style>

            input.text1 {
                outline: none;
                background: none;
                background-image: linear-gradient(#232526,#414345);
                color: #fff;
                width: 70%;
                padding: 10px 10px;
                border: 2px solid#fff;
                font-size: 1em;
                font-weight: 100;
                margin-left: 15px;
                margin-bottom: 1em;
                float: right;
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
                width: 55%;
                padding: 10px 10px;
                border: 2px solid#fff;
                font-size: 1em;
                font-weight: 100;
                margin-bottom: 1em;
                float: left;
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

        </style>
        <script >
            $(function () {
                $("#date1").datepicker({dateFormat: 'yy-mm-dd'});

            });
            $(document).ready(function () {
                $('#stime1').timepicker();
                $('#etime1').timepicker();
            });
        </script>

        <link href="css/jquery.bootgrid.css" rel="stylesheet" type="text/css"/>
        <link href="css/jquery.bootgrid.min.css" rel="stylesheet" type="text/css"/>
        <script src="js/jquery.bootgrid.js" type="text/javascript"></script>
        <script src="js/jquery.bootgrid.min.js" type="text/javascript"></script>
    </head>
    <body>
        <div style=" float: left"> <a style="color: #e15960; font-size: x-large; font-family: 'Marvel', sans-serif;" href="list.jsp"><img src="images/back.png"/></a> </div>

        <div class="container">
            <%
                Connection con2 = null;
                String db2 = "PSMS";
                String user_type = (String) session.getAttribute("user_type");
                String uid = (String) session.getAttribute("user_id");
                String uname = (String) session.getAttribute("user_name");
                String pwd = (String) session.getAttribute("pwd");
                con2 = ConnectDB.getDataSource(db2);
                Statement stmts = con2.createStatement();

                Statement stmt2 = con2.createStatement();
                ResultSet rs2 = stmt2.executeQuery("select op_id, cust_name, concat(manager_first_name,concat(' ',concat(ifnull(manager_middle_name,''),concat(' ',manager_last_name)))), op_details,d.customer_name, c.uname, ord_date, a.remarks from tbl_op_creation a left join tbl_master_manager b on(a.manager=b.manager_code) left join tbl_master_login c on(a.ps_engg=c.uid) left join vareli_sms.tbl_master_customer d on(a.oem=d.id) where a.ps_engg='" + uid + "' order by a.created_on desc");
                System.out.println("i m in main screen");


            %>


            <div class="registration">
                <h2>Change Password</h2>
                <div class="avtar"><img src="images/color.jpg" /></div>			
                <div class="form-info">
                    <center>
                        <%@include file="StatusPage.jsp" %><br>
                        <!--code end -->               

                        <%
                                   //  Class.forName("com.mysql.jdbc.Driver");
                                  // con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ocrs", "root", "root");
                            //  Statement stmt2 = con2.createStatement();
                            //   ResultSet rs2 = stmt2.executeQuery("select op_id, cust_name, concat(manager_first_name,concat(' ',concat(ifnull(manager_middle_name,''),concat(' ',manager_last_name)))), op_details, c.uname, ord_date, remarks from tbl_op_creation a left join tbl_master_manager b on(a.manager=b.manager_code) left join tbl_master_login c on(a.ps_engg=c.uid) where a.ps_engg='"+uid+"'");              
%>

                        <!--code end -->

                        <table>
                            <form name="oq" action="submited.jsp" method="post" onsubmit="return check()" > 
                                <tr>
                                    <td><text style="color: #ffffff; float: left;">User I.D :</text>                  
                                        <input type="text" style="height: 35px; width: 150px;"  class="text1" value="<%=uid%>" name="opid" id="opid" readonly>
                                </tr> 
                                <tr>
                                    <td> <text style="color: #ffffff; float: left;">Old Password :</text> 
                                    <input type="password" style="height: 35px; width: 150px;"  class="text1" value="" name="pass" id="pass" onchange="test1();">
                                    <input style="display : none;" type="password" style="height: 35px; width: 150px;"  class="text1" value="<%=pwd%>" name="pwd1" id="pwd1"  >  
                                </tr>

                                <tr>
                                    <td ><text style="color: #ffffff; float: left;">New Password :</text> 
                                    <input type="password" style="height: 35px; width: 150px;"  class="text1" value="" name="pass1" id="pass1" readonly>          
                                </tr>

                                <tr>
                                    <td ><text style="color: #ffffff; float: left;">Confirm Password :</text> 
                                    <input type="password" style="height: 35px; width: 150px;"  class="text1" value="" name="pass2" id="pass2" onkeyup="matchPassword();" readonly>       
                                </tr>
                                <tr>
                                    <td colspan="2">  <p id="xp" style=" color: #f7e1b5; font-size: larger; padding: 5px;"></p>               
                                </tr>


                                <%
                      //    ResultSet rs3 = stmt2.executeQuery("SELECT * FROM tbl_master_activity where flag='Y'");
                                %>                              
                                <tr>
                                    <td><input type="submit" id="startBtn" value="submit" style="width: 110px; margin-right: 100px;"/>
                                </tr>
                            </form> 
                            <tr><td colspan="3"></tr>  
                        </table>
                    </center>
                </div>
            </div>


        </div>



    </body>
</html>
