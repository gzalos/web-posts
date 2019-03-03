
<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<!DOCTYPE html>
<html lang="en">
    
    <head meta charset="UTF-8">
    
</head>
<body>
<ul>
  <li style="float:right"><a  href="index.jsp">Log out</a></li>
  <li style="float:right"><a> Welcome, Admin</a></li>
  <li><a  href="add.jsp">Add  new post</a></li>
 
  
</ul>

        <table  id="MYTABLE" align="center">
            <tr>
                
                <td align="center"><b>Posts</b></td>
                <td align="center"><b>Time Created</b></td>
            </tr>
            <%
                try {
                        Class.forName("com.mysql.jdbc.Driver");
                        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/" + "admindb", "root", "");
                        Statement s = con.createStatement();
                        ResultSet rs;
                        String sql = "select * from posts";
                        rs = s.executeQuery(sql);
                        int i = 0;
                        while (rs.next()) {
            %>
            <tr>
                
                <td align="center" style="word-wrap: break-word"><%=rs.getString("post")%></td>
                <td align="center"><%=rs.getString("timecreated")%></td>
                
                <td align="center"><a href="delete.jsp?id=<%=rs.getString("id")%>"><button type="button" class="delete">Delete Post</button></a></td>
            </tr>
            <%
                        i++;
                    }
                    con.close();
                } catch (Exception e) {
                    e.printStackTrace();
                }
            %>
             
</table>
    
</body>



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
</html>