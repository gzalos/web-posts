

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>

<html>
<head>
    <meta charset="UTF-8">
</head>
<style>
ul {
    list-style-type: none;
    margin: 0;
    padding: 0;
    overflow: hidden;
    background-color: #2E8B57;
    font-size: 18px;
}

li {
    float: left;
}

li a {
    display: block;
    color: white;
    text-align: center;
    padding: 14px 30px;
    text-decoration: none;
}

li a:hover {
    background-color: #3CB371;
}
#MYTABLE {
    font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
    border-collapse: collapse;
    width: 80%;
    table-layout:fixed;
    word-break: keep-all;
}

#MYTABLE td, #MYTABLE th {
    border: 1px solid #ddd;
    padding: 8px;
}

#MYTABLE tr:nth-child(even){background-color: #f2f2f2;}


#MYTABLE th {
    padding-top: 12px;
    padding-bottom: 12px;
    text-align: left;
    background-color: #4CAF50;
    color: white;
}
</style>
<body>

<ul>
  <li><a>Simple Posts</a></li>
  <li style="float:right"><a  href="form.jsp">Log in</a></li>
</ul>

 <% 
           Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/admindb", "root", "");

            Statement statement = conn.createStatement() ;
            ResultSet resultset = statement.executeQuery("select * from posts") ; 
        %>

        <TABLE BORDER="1" ID="MYTABLE">
            <TR>
                
                <TH align="center">Posts</TH><br> 
                <TH align="center">Date Created</TH>

            </TR>
            <% while(resultset.next()){ %>
            <TR>
                
                <td align="center" style="word-wrap: break-word"> <%= resultset.getString(2) %></TD>  
                <td align="center" style="word-wrap: break-word"> <%= resultset.getString(3) %></TD>
                
            </TR>
            <% } %>
        </TABLE>
        
      
    <%
   if (request.getParameter("submit") != null) {
            String id = request.getParameter("id");
            try {
                Class.forName("com.mysql.jdbc.Driver");
               
                Statement st = conn.createStatement();
                int i = st.executeUpdate("DELETE FROM posts WHERE id=" + id);
                out.println("Data Deleted Successfully!");
            } catch (Exception e) {
                System.out.print(e);
                e.printStackTrace();
            }
}
   %>
</body>
</html>
