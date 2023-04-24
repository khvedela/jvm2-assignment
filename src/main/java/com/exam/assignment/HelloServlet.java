package com.exam.assignment;

import java.io.*;
import java.sql.*;

import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

@WebServlet(name = "helloServlet", value = "/posts")
public class HelloServlet extends HttpServlet {
    public void init() { }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setContentType("text/html");

        PrintWriter out = response.getWriter();
        response.setContentType("text/html");
        out.println("<html><body>");
        try
        {
            Connection con = DriverManager.getConnection("jdbc:mysql://0.0.0.0:62261/blog?autoReconnect=true&useSSL=false", "root", "123");
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery("select * from posts");
            out.println("<table border=1 width=50% height=50%>");
            out.println("<tr><th>title</th><th>content</th><th>author</th><th>date</th><tr>");
            while (rs.next())
            {
                String title = rs.getString("title");
                String content = rs.getString("content");
                String author = rs.getString("author");
                Date date = rs.getDate("date");
                out.println("<tr><td>" + title + "</td><td>" + content + "</td><td>" + author + "</td><td>" + date + "</td></tr>");
            }
            out.println("</table>");
            out.println("<a href='/assignment-1.0-SNAPSHOT'>create new</a>");
            out.println("</html></body>");
            con.close();
        }
        catch (Exception e)
        {
            out.println(e);
        }
    }



    public void destroy() {
    }
}