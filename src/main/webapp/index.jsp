<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%
  String title = request.getParameter("title");
  String content = request.getParameter("content");
  String author = request.getParameter("author");
  java.util.Date date = new java.util.Date();
  java.sql.Timestamp timestamp = new java.sql.Timestamp(date.getTime());

//  Connection conn = DriverManager.getConnection("jdbc:mysql://0.0.0.0:62261/blog?autoReconnect=true&useSSL=false", "root", "123");
//  String query = "INSERT INTO posts (title, content, author, date) VALUES ('asdsada', 'sadadsa', 'asdasdasda', '12-03-23')";
//  PreparedStatement pst = conn.prepareStatement(query);
//  pst.executeUpdate();
//  pst.close();
//  conn.close();

  if(request.getMethod().equalsIgnoreCase("POST")) {
    try {
      Class.forName("com.mysql.jdbc.Driver");
      Connection conn = DriverManager.getConnection("jdbc:mysql://0.0.0.0:62261/blog?autoReconnect=true&useSSL=false", "root", "123");
      String query = "INSERT INTO posts (title, content, author, date) VALUES (?, ?, ?, '12-03-23')";
      PreparedStatement pst = conn.prepareStatement(query);
      pst.setString(1, title);
      pst.setString(2, content);
      pst.setString(3, author);
      pst.executeUpdate();
      pst.close();
      conn.close();
      String redirectURL = "http://localhost:8080/assignment-1.0-SNAPSHOT/posts";
      response.sendRedirect(redirectURL);
    } catch (Exception e) {
      e.printStackTrace();
    }
  }
%>
<html>
<head>
  <title>Post Form</title>
</head>
<body>
<form method="POST">
  <label for="title">Title:</label>
  <input type="text" id="title" name="title"><br>
  <label for="content">Content:</label>
  <textarea id="content" name="content"></textarea><br>
  <label for="author">Author:</label>
  <input type="text" id="author" name="author"><br>
  <input type="submit" value="Submit">
</form>
</body>
</html>