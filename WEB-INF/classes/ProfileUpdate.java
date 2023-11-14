import java.io.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.sql.*;

@WebServlet("/profileUpdate")
public class ProfileUpdate extends HttpServlet{
  public void doPost(HttpServletRequest req, HttpServletResponse res)
  throws ServletException,IOException {
	  
	  try 
	  {
		  Class.forName("com.mysql.jdbc.Driver");
		  Connection connObject = DriverManager.getConnection("jdbc:mysql://10.0.0.224:3306/ta", "ta", "root");
			PrintWriter printWriter = res.getWriter();
            if (connObject != null) 
			{
				res.setContentType("text/html");
                String firstname, lastname, usertype, email, znumber, password, queryString, oldEmail, oldZnumber;

                firstname = req.getParameter("firstname");
                lastname = req.getParameter("lastname");
                usertype = req.getParameter("usertype");
                email = req.getParameter("email");
                oldEmail = req.getParameter("oldEmail");
                znumber = req.getParameter("znumber");
                oldZnumber = req.getParameter("oldZnumber");
                password = req.getParameter("password");

                queryString = "";

                if (!"".equals(firstname)) {
                    queryString += "firstname = '" + firstname + "', ";
                }
                if (!"".equals(lastname)) {
                    queryString += "lastname = '" + lastname + "', ";
                }
                if (!"".equals(email)) {
                    queryString += "email = '" + email + "', ";
                }
                if (!"".equals(password)) {
                    queryString += "password = '" + password + "', ";
                }
                if (!"".equals(znumber)) {
                    queryString += "znumber = '" + znumber + "'";
                }
                // Remove the trailing comma and space
                if (!queryString.isEmpty()) {
                    queryString = queryString.substring(0, queryString.length() - 2);
                }

                // Ensure there's a space before "WHERE"
                String sqlQuery = "UPDATE users SET " + queryString + " WHERE znumber='" + oldZnumber + "' OR email='" + oldEmail + "'";

                Statement statement = connObject.createStatement();
                int updatedRows = statement.executeUpdate(sqlQuery);



                System.out.println("User updated in DB!!");
                if (updatedRows == 1) {
                    printWriter.print("success");
                    System.out.println("Successfully updated!!");
                            // req.getRequestDispatcher("/applicantHome.jsp").forward(req, res);
                }
                else{
                    printWriter.print("Failed");
                    System.out.println("==== 0 rows updated ====");
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