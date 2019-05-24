<%-- 
    Document   : city_master
    Created on : Nov 18, 2017, 11:24:52 AM
    Author     : RAMU
--%>

<%-- 
    Document   : state_master
    Created on : Nov 18, 2017, 10:46:33 AM
    Author     : RAMU
--%>


<%@page import="net.ocrt.dao.ConnectDB"%>
<%@page import="net.ocrt.dao.QrWeb"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>

<%@page import="net.ocrt.dao.Qrcode"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>


        <title>State Master</title>
        <%@include file="includeFiles.jsp" %>


        <meta name="keywords" content="Glossy_Textured Contact Form Responsive Templates, Iphone Widget Template, Smartphone login forms,Login form, Widget Template, Responsive Templates, a Ipad 404 Templates, Flat Responsive Templates" />
        <link href="css/style.css" rel='stylesheet' type='text/css' />

        <!--webfonts-->
        <link href='http://fonts.googleapis.com/css?family=Open+Sans:700,300,600,800,400' rel='stylesheet' type='text/css'>
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


        </style>
          <script >
            $(function () {
                $(".text").datepicker({dateFormat: 'yy-mm-dd'});
            });
            $(function () {
                var grid = $("#grid-selection").bootgrid({
                    ajax: false,
                    rowCount: [10, 15, -1],
                    columnSelection: false,
                    formatters: {
                        "link": function (column, row)
                        {
                           // return return "<button type=\"button\" class=\"btn btn-xs btn-default command-delete\" data-row-id=\"" + row.id + "\"><span class=\"fa fa-trash-o\"></span></button> " +
                                                   // "<button type=\"button\" class=\"btn btn-xs btn-default command-show\" data-row-id=\"" + row.id + "\"><span class=\"fa fa-caret-square-o-right\"></span></button>&nbsp &nbsp &nbsp &nbsp " +

                            return   "<button type=\"button\" class=\"btn btn-xs btn-default command-edit\" data-row-id=\"" + row.id + "\"><span class=\"fa fa-plus-square\"></span></button>&nbsp &nbsp &nbsp &nbsp  " +
                          "<button type=\"button\" class=\"btn btn-xs btn-default command-delete\" data-row-id=\"" + row.id + "\"><span class=\"fa fa-eye\"></span></button> " ;

                        }
                    }
                }).on("loaded.rs.jquery.bootgrid", function ()
                {
                    /* Executes after data is loaded and rendered */
                    grid.find(".command-edit").on("click", function (e)
                    {
                        var x = $(this).data("row-id").trim();
                        var flg = "add";
                        $.get('Ajax/getUpdateData.jsp', {op_id: x, flag: flg}, function (response) {
                            //alert(response); 
                            document.getElementById("details").style.display = "block";
                            document.getElementById("details").innerHTML = response;
                            $("#details").dialog({
                                open: function (event, ui) {
                                    $(".ui-dialog-titlebar-close", ui.dialog | ui).removeClass("ui-button-icon-only");
                                    $(".ui-button-text", ui.dialog | ui).hide();
                                    $(".ui-widget-header", ui.dialog | ui).css('background-color', '#d34836');
                                    // $(".ui-dialog-titlebar-close", ui.dialog | ui).css("margin","0px");
                                    // $(".ui-dialog-titlebar-close", ui.dialog | ui).css("text-align","central");
                                }, closeOnEscape: true, modal: true,
                                height: 600, width: 600,
                                show: {
                                    effect: "fold",
                                    //   direction: "up", 
                                    duration: 1000
                                },
                                hide: {
                                    effect: "blast",
                                    primary: "ui-icon-heart",
                                    duration: 1000
                                }});

                        });



                    }).end().find(".command-delete").on("click", function (e)
                   {
                        var x = $(this).data("row-id").trim();
                        var flg = "spec";
                        $.get('Ajax/getUpdateData.jsp', {op_id: x, flag: flg}, function (response) {
                            //alert(response); 
                            document.getElementById("details").style.display = "block";
                            document.getElementById("details").innerHTML = response;
                            $("#details").dialog({
                                open: function (event, ui) {
                                    $(".ui-dialog-titlebar-close", ui.dialog | ui).removeClass("ui-button-icon-only");
                                    $(".ui-button-text", ui.dialog | ui).hide();
                                    $(".ui-widget-header", ui.dialog | ui).css('background-color', '#d34836');
                                    // $(".ui-dialog-titlebar-close", ui.dialog | ui).css("margin","0px");
                                    // $(".ui-dialog-titlebar-close", ui.dialog | ui).css("text-align","central");
                                }, closeOnEscape: true, modal: true,
                                height: 600, width: 600,
                                show: {
                                    effect: "fold",
                                    //   direction: "up", 
                                    duration: 1000
                                },
                                hide: {
                                    effect: "blast",
                                    primary: "ui-icon-heart",
                                    duration: 1000
                                }});

                        });
                    }).end().find(".command-show").on("click", function (e)
                    {
                        //alert("heyyy");
                        var z = $(this).data("row-id").trim();
                        // alert(z);
                        var flg = "show";
                        //alert("You pressed show on row: " + $(this).data("row-id"));
                        $.get('Ajax/getUpdateData.jsp', {op_id: z, flag: flg}, function (response) {
                            //alert(response); 
                            document.getElementById("details").style.display = "block";
                            document.getElementById("details").innerHTML = response;
                            $("#details").dialog({
                                open: function (event, ui) {
                                    $(".ui-dialog-titlebar-close", ui.dialog | ui).removeClass("ui-button-icon-only");
                                    $(".ui-button-text", ui.dialog | ui).hide();
                                    $(".ui-widget-header", ui.dialog | ui).css('background-color', '#d34836');
                                    // $(".ui-dialog-titlebar-close", ui.dialog | ui).css("margin","0px");
                                    // $(".ui-dialog-titlebar-close", ui.dialog | ui).css("text-align","central");
                                }, closeOnEscape: true, modal: true,
                                height: 600, width: 600,
                                show: {
                                    effect: "fold",
                                    //   direction: "up", 
                                    duration: 1000
                                },
                                hide: {
                                    effect: "blast",
                                    primary: "ui-icon-heart",
                                    duration: 1000
                                }});

                        });




                    });
                });
            });
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
        <h2 style="font-family: Audiowide">City Master</h2>
        <div class="avtar"><img src="images/color.jpg" /></div>			
        <div class="form-info">
            <center>

                <%

                     Class.forName("com.mysql.jdbc.Driver");
                    Connection con = null;
                     con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ocrs", "root", "root");
                    String db = "real_marketing";
                    con = ConnectDB.getDataSource(db);
                    Statement stmt = con.createStatement();
                 
                    String city_name = request.getParameter("city_name");

                    ResultSet rs = stmt.executeQuery("select id, city_name from tbl_city order by trim(city_name) asc");
                %>

                <table id="grid-selection" class="table table-condensed table-hover table-striped">

                    <thead>

                        <tr>
                            <th data-column-id="id" data-type="string" data-visible="false">City ID</th>
                            <th data-column-id="city_name" data-order="desc">City Master</th>

                        </tr>
                    </thead>
                    <tbody>


                        <%while (rs.next()) {
                        %>
                        <tr id="normal_tr">

                            <td><%=rs.getString(1)%>

                            <td><%=rs.getString(2)%>

                        </tr>          
                        <%}%>
                    </tbody>

                </table>



                <%@include file="StatusPage.jsp" %><br>

                <form action="city_master_qry.jsp" method="post"  name="myform" onsubmit="return check();"> 
                    <table> 

                        <tr>
                        <td><text  style="color: #FFF; float: left; font-family: Allerta Stencil; font-size: larger;" class="Category">City Master:&nbsp;</text></td>
                        <td><input type="text" placeholder="City Master" maxlength="45"  class="text2" id="city_name" name="city_name"></td>                         
                        </tr>
                    </table> 
                    </div>
                    <table>
                        <tr>
                        <input style="font-family: Allerta Stencil;" type="submit" id="startBtn" value="Submit" /><br><br>
                        </tr>
                    </table>
                </form>                      

                <div id="details"    hidden>.....</div>
            </center>
        </div>
    </body>
</html>
