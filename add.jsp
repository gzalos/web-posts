
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page import="java.sql.*,java.util.*"%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add a new post</title>
        <meta charset="UTF-8">
       
    </head>
    
    
<form method="post">
   
  
    <textarea name="new_anakoinosi" cols="50" rows="10"></textarea> <br>
    <input type="submit" name="submit" value="Submit"/>
    <input type="reset" value="Reset" />
</form>
    
    
<body>
    
 <%
     
if (request.getParameter("submit") != null) {
      request.setCharacterEncoding("UTF-8");
        String text=request.getParameter("new_anakoinosi");

        try
        {   
            

            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/admindb", "root", "");
            PreparedStatement pstmt = conn.prepareStatement("INSERT INTO `posts`(post,timecreated) VALUES (?,?)");
               
            pstmt.setString(1, text);
            pstmt.setTimestamp(2, new Timestamp(System.currentTimeMillis()));
           
            pstmt.executeUpdate();
           
            
            
            response.sendRedirect("admin_loggedin.jsp");
            
        }
        catch(Exception e)
        {
            System.out.print(e);
            e.printStackTrace();
        }
}
%>


</body>
</html>
