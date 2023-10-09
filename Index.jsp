<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Drink List</title>
</head>
<body>
    <h1>Drink List</h1>
    <form action="#" method="post">
        <label for="drinkSelect">Select a Drink:</label>
        <select name="drinkSelect" id="drinkSelect">
            <option value="">Select a drink</option>
            
            <!-- Java code to fetch drinks from the database -->
            <%
                String jdbcUrl = "jdbc:mysql://localhost:3306/Database";
                String dbUser = "your_username";
                String dbPassword = "your_password";

                try {
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection connection = DriverManager.getConnection(jdbcUrl, dbUser, dbPassword);
                    Statement statement = connection.createStatement();
                    String query = "SELECT name, rate FROM beverages";
                    ResultSet resultSet = statement.executeQuery(query);

                    while (resultSet.next()) {
                        String drinkName = resultSet.getString("name");
                        int drinkRate = resultSet.getInt("rate");
            %>
                        <option value="<%= drinkRate %>"><%= drinkName %> - $<%= drinkRate %></option>
            <%
                    }
                    resultSet.close();
                    statement.close();
                    connection.close();
                } catch (Exception e) {
                    e.printStackTrace();
                }
            %>
        </select>
        <br>
        <input type="submit" value="Submit">
    </form>
</body>
</html>
