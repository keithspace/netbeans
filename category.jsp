<%@ page import="java.util.List" %>
<%@ page import="Category.Category" %>
<%@ page import="Category.CategoryDAO" %>
<%@ page contentType="text/html; charset=UTF-8" %>

<!--<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>properties</title>
    <link rel="stylesheet" href="category.css">
</head>
<body>
    <header>PROPERTY CATEGORIES</header>
    <div class = "container">
        <div class="navbar">
            <nav>
                <a href="/home.html">Home</a>
                <a class="active" href="category.jsp">Properties</a>
                <a href="/careers.html">Careers</a>
                <a href="/testimonial.html">Testimonials</a>
                <a href="/AboutUs/about us.html">About us</a>
            </nav>
        </div>

        <div class="col">
           <%-- <% 
                // Fetch category data from the database
                List<Category> categories = CategoryDAO.getAllCategories(); // Implement CategoryDAO to fetch data
                if (categories != null) {
                    for (Category category : categories) {
            %>
                <div class="cards">
                    <div class="image"><img src="<%= category.getCategoryImage() %>"></div>
                    <h5><%= category.getCategoryName() %></h5>
                    <form action="properties.jsp" method="post">
                        <input type="hidden" name="categoryId" value="<%= category.getCategoryId() %>">
                        <button type="submit">explore</button>
                    </form>
                </div>
            <% 
                    }
                }
            %>
        </div>
        <footer>
            <a href="#" class="fa fa-facebook"></a>
            <a href="#" class="fa fa-twitter"></a>
            <a href="#" class="fa fa-instagram"></a>
            <p> &#169 copyright 2024 NestQuest.</p>
         </footer>
    </div>
</body>
</html>

--%> --> 


<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Properties</title>
    <link rel="stylesheet" href="category.css">
</head>
<body>
    <header>PROPERTY CATEGORIES</header>
    <div class="container">
        <div class="navbar">
            <nav>
                <a href="/home.html">Home</a>
                <a class="active" href="category.jsp">Properties</a>
                <a href="/careers.html">Careers</a>
                <a href="/testimonial.html">Testimonials</a>
                <a href="/AboutUs/about us.html">About us</a>
            </nav>
        </div>

        <div class="col"> 
            <% 
                // Database connection parameters
                String url = "jdbc:mysql://localhost:3306/rpms";
                String user = "root";
                String password = "1234";

                // JDBC objects
                Connection conn = null;
                Statement stmt = null;
                ResultSet rs = null;

                try {
                    // Establish database connection
                    Class.forName("com.mysql.jdbc.Driver");
                    conn = DriverManager.getConnection(url, user, password);

                    // Create and execute the query
                    stmt = conn.createStatement();
                    String query = "SELECT * FROM category";
                    rs = stmt.executeQuery(query);

                    // Iterate over the result set and display categories
                    while (rs.next()) {
                        int categoryId = rs.getInt("categoryID");
                        String categoryName = rs.getString("categoryname");
                        String categoryImage = rs.getString("categoryimage");
            %>
                
                <div class="cards">
                    <div class="image"><img src="<%= categoryImage %>"></div> 
                    <h5><%= categoryName %></h5>
                    <form action="properties.jsp" method="post">
                        <input type="hidden" name="categoryId" value="<%= categoryId %>">
                        <button type="submit">explore</button>
                    </form>
                </div>
            <% 
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                } finally {
                    // Close JDBC objects
                    try {
                        if (rs != null) rs.close();
                        if (stmt != null) stmt.close();
                        if (conn != null) conn.close();
                    } catch (SQLException e) {
                        e.printStackTrace();
                    }
                }
            %>
        </div>
        <footer>
            <a href="#" class="fa fa-facebook"></a>
            <a href="#" class="fa fa-twitter"></a>
            <a href="#" class="fa fa-instagram"></a>
            <p>&#169; copyright 2024 NestQuest.</p>
         </footer>
    </div>
</body>
</html>
