import java.io.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.sql.*;
import java.util.*;
// import java.io.Serializable;

public class Admin extends HttpServlet{
    public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException { 
	    try {
		    Class.forName("com.mysql.jdbc.Driver");
		    Connection connObject = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/ta", "root", "root");
		    PrintWriter printWriter = res.getWriter();
            Cookie[] cookies = req.getCookies();
            if (connObject != null) {
			    res.setContentType("text/html");
			    String username="", usertype="";
    
                for(int i=0; i < cookies.length; i++) {
                      if("TAusername".equals(cookies[i].getName())) {
                          username = cookies[i].getValue();
                      }
                      else if("TAusertype".equals(cookies[i].getName())) {
                          usertype = cookies[i].getValue();
                      }
                }

			    Statement statement = connObject.createStatement();
			    ResultSet userResultSet = statement.executeQuery("SELECT * FROM users WHERE usertype='" + usertype + "' AND znumber='"+ username +"' OR email='" + username + "'");
			    // ResultSet departmentResultSet = statement.executeQuery("SELECT * FROM department;");
                // ResultSet courseResultSet = statement.executeQuery("SELECT * FROM course;");
                userResultSet.next();
                req.setAttribute("firstname", userResultSet.getString("firstname"));
                req.setAttribute("lastname", userResultSet.getString("lastname"));
                req.setAttribute("znumber", userResultSet.getString("znumber"));
                req.setAttribute("email", userResultSet.getString("email"));
                req.setAttribute("password",userResultSet.getString("password"));
                req.setAttribute("username", username);
                req.getRequestDispatcher("/admin.jsp").forward(req, res);
			
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