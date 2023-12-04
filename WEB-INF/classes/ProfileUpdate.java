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
                String firstname, lastname, usertype, email, password, queryString, oldEmail, sqlQuery;
                firstname = req.getParameter("firstname");
                lastname = req.getParameter("lastname");
                usertype = req.getParameter("usertype");
                email = req.getParameter("email");
                oldEmail = req.getParameter("oldEmail");
                password = req.getParameter("password");
                queryString = "";
                sqlQuery="";
                System.out.println("Email : " + email);

                if (!"".equals(firstname) && firstname!=null) {
                    queryString += "firstname = '" + firstname + "', ";
                }
                if (!"".equals(lastname) && lastname!=null) {
                    queryString += "lastname = '" + lastname + "', ";
                }
                if (!"".equals(email) && email!=null) {
                    queryString += "email = '" + email + "', ";
                }
                if (!"".equals(password) && password!=null) {
                    queryString += "password = '" + password + "', ";
                }

                if(usertype.equals("applicant")){
                    String znumber, oldZnumber;
                    znumber = req.getParameter("znumber");
                    oldZnumber = req.getParameter("oldZnumber");
                    if (!"".equals(znumber) & znumber!=null) {
                        queryString += "znumber = '" + znumber + "'";
                    }
                    if (!queryString.isEmpty()) {
                        queryString = queryString.substring(0, queryString.length() - 2);
                        sqlQuery = "UPDATE ta_applicant SET " + queryString + " WHERE znumber='" + oldZnumber + "' OR email='" + oldEmail + "'";
                    }
                }else if(usertype.equals("committee")){
                    if (!queryString.isEmpty()) {
                        queryString = queryString.substring(0, queryString.length() - 2);
                        sqlQuery = "UPDATE ta_committee SET " + queryString + " WHERE email='" + oldEmail + "'";
                    }

                }else if(usertype.equals("admin")){
                    if (!queryString.isEmpty()) {
                        queryString = queryString.substring(0, queryString.length() - 2);
                        sqlQuery = "UPDATE admin SET " + queryString + " WHERE email='" + oldEmail + "'";
                    }

                }else{
                    if (!queryString.isEmpty()) {
                        queryString = queryString.substring(0, queryString.length() - 2);
                        sqlQuery = "UPDATE instructor SET " + queryString + " WHERE email='" + oldEmail + "'";
                    }
                }
                if(!sqlQuery.equals("")){
                    Statement statement = connObject.createStatement();
                    int updatedRows = statement.executeUpdate(sqlQuery);
                    if (updatedRows == 1) {
                        printWriter.print("success");
                        System.out.println("Successfully updated!!");
                    }
                    else{
                        printWriter.print("failed");
                        System.out.println("==== 0 rows updated ====");
                    }
                }else{
                        printWriter.print("NoUpdatedData");
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