import java.io.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.sql.*;

public class Login extends HttpServlet{
  public void doGet(HttpServletRequest req, HttpServletResponse res)
  throws ServletException,IOException {
	  
	  try 
	  {
		  Class.forName("com.mysql.jdbc.Driver");
		  Connection connObject = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/ta", "root", "root");
			PrintWriter printWriter = res.getWriter();
            if (connObject != null) 
			{
				res.setContentType("text/html");

				String username, password, usertype;
				username = req.getParameter("username");
				password = req.getParameter("password");
				usertype = req.getParameter("usertype");

				Statement statement = connObject.createStatement();
				ResultSet resultSet;
				boolean exists = false;
				if(usertype.equals("admin")){
					resultSet = statement.executeQuery("SELECT * FROM admin WHERE email='" + username + "' AND password='"+ password +"'");
					exists = true;
				}else if(usertype.equals("committee")){
					resultSet = statement.executeQuery("SELECT * FROM ta_committee WHERE email='" + username + "' AND password='"+ password +"'");
					exists = true;
				}else if(usertype.equals("instructor")){
					resultSet = statement.executeQuery("SELECT * FROM instructor WHERE email='" + username + "' AND password='"+ password +"'");
					exists = true;
				}else if(usertype.equals("applicant")){
					resultSet = statement.executeQuery("SELECT * FROM ta_applicant WHERE znumber='"+ username +"' OR email='" + username + "' AND password='"+ password +"'");
					exists = true;
				}else{
					exists = false;
					resultSet = statement.executeQuery("SELECT * FROM admin WHERE email='" + username + "' AND password='"+ password +"'");
				}

				if(exists && resultSet.next())
				{
					Cookie userCookie = new Cookie("TAusername", username);
					Cookie usertypeCookie = new Cookie("TAusertype", usertype);
					res.addCookie(userCookie);
					res.addCookie(usertypeCookie);
					printWriter.print("success");
				}
				else
				{
					printWriter.print("incorrect");
				}	
				
            } else {
                printWriter.print("Not connected to the database!");
            }

        } 
		catch (SQLException e) {
            System.err.format("SQL State: %s\n%s", e.getSQLState(), e.getMessage());
        } catch (Exception e) {
            e.printStackTrace();
        }

  }
}