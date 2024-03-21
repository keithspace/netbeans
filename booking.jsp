<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width,initial-scale=1,maximum-scale=1">
    <title>Admin Dashboard | Bookings</title>
    <link rel="stylesheet" href="style.css">
    <link rel="stylesheet" href="https://maxst.icons8.com/vue-static/landings/line-awesome/line-awesome/1.3.0/css/line-awesome.min.css">
</head>
<body>
   <input type="checkbox" id="menu-toggle">
    <div class="sidebar">
        <div class="side-header">
            <h3><span>Logo</span></h3>
        </div>
        
        <div class="side-content">
            <div class="profile">
                <div class="profile-img bg-img" style="background-image: url(img/1.jpeg)"></div>
                <h4>Admin</h4>
                <small>Property Owner</small>
            </div>

            <div class="side-menu">
                <ul>
                    <li>
                       <a href="index.html">
                            <span class="las la-home"></span>
                            <small>Properties</small>
                        </a>
                    </li>
                    <li>
                       <a href="booking.jsp" class="active">
                            <span class="las la-clipboard-list"></span>
                            <small>Bookings</small>
                        </a>
                    </li>
                    <li>
                       <a href="profile.html">
                            <span class="las la-user-alt"></span>
                            <small>Profile</small>
                        </a>
                    </li>
                </ul>
            </div>
        </div>
    </div>
    
    <div class="main-content">
        
        <header>
            <div class="header-content">
                <label for="menu-toggle">
                    <span class="las la-bars"></span>
                </label>
                
                <div class="header-menu">
                    <label for="">
                        <span class="las la-search"></span>
                    </label>
                    
                    <div class="notify-icon">
                        <span class="las la-bell"></span>
                        <span class="notify">3</span>
                    </div>
                    
                    <div class="user">
                        <div class="bg-img" style="background-image: url(img/1.jpeg)"></div>
                        
                        <span class="las la-power-off"></span>
                        <span>Logout</span>
                    </div>
                </div>
            </div>
        </header>
        
        
        <main>
            
            <div class="page-header">
                <h1>Bookings</h1>
                <small>Home / Bookings</small>
            </div>
            
            <div class="page-content">
            
                <div class="records table-responsive">

                    <div>
                        <table width="100%">
                            <thead>
                                <tr>
                                    <th>No.</th>
                                    <th><span class="las la-sort"></span> NAME</th>
                                    <th><span class="las la-sort"></span> EMAIL</th>
                                    <th><span class="las la-sort"></span> PHONE NUMBER</th>
                                    <th><span class="las la-sort"></span> DATE</th>
                                    <th><span class="las la-sort"></span> PROPERTY NAME</th>                          
                                    <th><span class="las la-sort"></span> STATUS</th>
                                </tr>
                            </thead>
                            <tbody>
                                <% 
                                    try {
                                        Class.forName("com.mysql.cj.jdbc.Driver");
                                        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/rpms", "root", "1234");
                                        Statement stmt = conn.createStatement();
                                        String query = "SELECT booking.bookingID, booking.customername, booking.phonenumber, booking.email, booking.date, p.propertyname " +
                                        "FROM booking " +
                                        "INNER JOIN property p ON booking.propertyID = p.propertyID";

                                        ResultSet rs = stmt.executeQuery(query);
                                        int counter = 1;
                                        while (rs.next()) {
                                            String customerName = rs.getString("customername");
                                            String email = rs.getString("email");
                                            String phoneNumber = rs.getString("phonenumber");
                                            Date date = rs.getDate("date");
                                            String propertyName = rs.getString("propertyname");
                                %>
                                <tr>
                                    <td><%= counter++ %></td>
                                    <td><%= customerName %></td>
                                    <td><%= email %></td>
                                    <td><%= phoneNumber %></td>
                                    <td><%= new SimpleDateFormat("dd MMMM, yyyy").format(date) %></td>
                                    <td><%= propertyName %></td>
                                    <td><span class="paid">Done</span></td>
                                </tr>
                                <%
                                        }
                                        rs.close();
                                        stmt.close();
                                        conn.close();
                                    } catch (Exception e) {
                                        e.printStackTrace();
                                    }
                                %>
                            </tbody>
                        </table>
                    </div>

                </div>
            
            </div>
            
        </main>
        
    </div>
</body>
</html>

