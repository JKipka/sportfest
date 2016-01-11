<%--
  Created by IntelliJ IDEA.
  User: kipka
  Date: 08.01.2016
  Time: 20:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>

<html>
<head>
    <link rel="stylesheet" href="http://localhost:88/sportfest/styles.css">
    <title>100 Meter Lauf</title>
</head>
<body>
<table align="center">
    <tr>
        <td>
            <div class="main">
                <div id="header_main">
                    <h1>Bundes-Jugend-Spiele Zuckerberg 2015</h1>
                </div>

                <div id="navi_bar">
                    <ul>
                        <li class="active"><a href="index.jsp">Home</a></li>
                        <li><a href="termine.jsp">Termine</a></li>
                        <li><a href="vereine.jsp">Vereine</a></li>
                        <li><a href="wettkaempfe.jsp">Wettkämpfe</a></li>
                        <li><a href="galerie.jsp">Galerie</a></li>
                        <li><a href="kontakt.jsp">Kontakt</a></li>
                        <li><a href="historie.jsp">Historie</a></li>
                        <li><a href="impressum.jsp">Impressum</a></li>
                        <ul style="float:right;list-style-type:none;">
                            <li><a href="/checkLogin.jsp"><%=session.getAttribute("login")%></a></li>
                        </ul>

                    </ul>
                </div> <!--Navi Bar Ende**-->

                <div id="main_container">
                    <div id="container_form_register">
                        <%

                            PreparedStatement pS;
                            String query;
                            ResultSet rS;
                            try {
                                String connectionURL = "jdbc:mysql://localhost:3306/sportfest";
                                Connection connection = null;
                                Class.forName("com.mysql.jdbc.Driver").newInstance();
                                connection = DriverManager.getConnection(connectionURL, "root", "");
                                if(!connection.isClosed()){
                                    out.println("<html><body><h2>Ergebnisse der 100-Meter-Läufe: </h2>");

                                    //Tabelle
                                    out.println("<hr></br><table cellspacing='0' cellpadding='10' border='1'>");
                                    out.println("<tr>");
                                    out.println("<td><b>First Name</b></td>");
                                    out.println("<td><b>Last Name</b></td>");
                                    out.println("<td><b>Time</b></td>");
                                    out.println("<td><b>Verein</b></td>");
                                    out.println("</tr>");

                                    query = "SELECT * FROM 100meterlauf";
                                    pS = connection.prepareStatement(query);
                                    rS = pS.executeQuery();
                                    //Tabelle füllen mit den Daten aus der DB
                                    while(rS.next()) {
                                        out.println("<tr>");
                                        out.println("<td>"+rS.getString(1) + "</td>");
                                        out.println("<td>"+rS.getString(2) + "</td>");
                                        out.println("<td>"+rS.getString(3) + "</td>");
                                        out.println("<td>"+rS.getString(4) + "</td>");
                                        out.println("</tr>");

                                    }

                                    out.println("</table></br><hr></body></html>");

                                    connection.close();

                                }


                            }catch(Exception ex){
                                out.println("Unable to connect to database: "+ex);
                            }

                        %>

                    </div>

                </div>


                <div id="sidebar">
                    <div id="header_sidebar">
                        <h2 id="h2_news">Neuigkeiten</h2>
                    </div>

                    <div id="main_sidebar">
                        <div class="artikel">
                            <h3>Lorem mfka</h3>
                            <p>Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.</p>
                        </div>

                        <div class="artikel">
                            <h3>Lorem mfka</h3>
                            <p>Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.</p>
                        </div>
                    </div>

                </div>






</body>
</html>