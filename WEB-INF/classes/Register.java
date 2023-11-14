import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;

public class Register extends HttpServlet {
    public void doGet(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        try {
            Class.forName("com.mysql.jdbc.Driver");// postgresql.org.postgresql.Driver
            Connection conObject = DriverManager.getConnection("jdbc:mysql://10.0.0.224:3306/ta", "ta", "root");// postgresql://localhost:5433/
            PrintWriter printWriter = res.getWriter();
            ResultSet resultSet = null;
            if (conObject != null) {
                res.setContentType("text/html");
                System.out.println("Connected to the database!");
                String firstname, lastname, email, znumber, password, usertype;
                firstname = req.getParameter("firstname");
                lastname = req.getParameter("lastname");
                email = req.getParameter("email");
                znumber = req.getParameter("znumber");
                password = req.getParameter("password");
                usertype = "applicant";
                System.out.println("Captured all details : " + firstname + ", " + lastname + ", " + email + ", "
                        + znumber + ", " + password + ", " + usertype);
                Statement statement = conObject.createStatement();
                resultSet = statement.executeQuery("select * from users where usertype='applicant' AND email='" + email
                        + "' OR znumber='" + znumber + "';");
                if (resultSet.next() == false) {
                    System.out.println("User not exists");
                    int insertedRows = statement.executeUpdate("INSERT INTO users (`firstname`, `lastname`, `znumber`, `email`, `password`, `usertype`) VALUES ('" + firstname + "', '" + lastname + "', '" + znumber + "', '" + email + "', '" + password + "', '" + usertype + "')");
                    System.out.println("User inserted in DB!!");
                    if (insertedRows == 1) {
                        printWriter.print("success");
                        System.out.println("Successfully created!!");
                    }
                    else{
                        printWriter.print("Failed");
                        System.out.println("==== 0 rows inserted ====");
                    }
                } else {
                    printWriter.print("exists");
                    System.out.println("User already exists!!");
                }

            } else {
                printWriter.print("Not connected to the database!");
            }

        } catch (SQLException e) {
            System.err.format("SQL State: %s\n%s", e.getSQLState(), e.getMessage());
        } catch (Exception e) {
            e.printStackTrace();
        }

    }
}