import java.io.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.*;
import java.sql.*;
import java.nio.file.*;
import java.text.*;
import java.util.*;
import java.util.Date;

@WebServlet("/applicationStatus")
public class ApplicationStatus extends HttpServlet{
    public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException { 
	    try {
		    Class.forName("com.mysql.jdbc.Driver");
		    Connection connObject = DriverManager.getConnection("jdbc:mysql://127.8.9.0:3306/ta", "ta", "root");
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

                /** Redirecting to their respective pages for other users */
                if(username.equals("none")) {
                    req.getRequestDispatcher("/login.jsp").forward(req, res);
                } else if(usertype.equals("admin")) {
                    req.getRequestDispatcher("/adminHome.jsp").forward(req, res);
                } else if(usertype.equals("committee")) {
                    req.getRequestDispatcher("/committeeHome.jsp").forward(req, res);
                } else if(usertype.equals("instructor")) {
                    req.getRequestDispatcher("/instructorHome.jsp").forward(req, res);
                }
                
			    Statement statement = connObject.createStatement();
                ResultSet applicantDetails, applicationsResultSet;
                List<ApplicationStatusBean> applicationsList = new ArrayList<ApplicationStatusBean>();
                applicantDetails = statement.executeQuery("SELECT * FROM ta_applicant WHERE znumber='" + username + "' OR email='" + username + "'");
                applicantDetails.next();
                int applicantId = applicantDetails.getInt("id");
                applicantDetails.close();
                Statement statement3 = connObject.createStatement();
                applicationsResultSet = statement3.executeQuery("SELECT * FROM ta_application WHERE ta_applicant_id='" + applicantId + "'");
                while(applicationsResultSet.next()){
                    Statement statement1 = connObject.createStatement();
                    ResultSet departmentResultSet = statement1.executeQuery("SELECT * FROM department WHERE id='" + applicationsResultSet.getInt("department_id") + "'");
                    departmentResultSet.next();
                    Statement statement2 = connObject.createStatement();
                    ResultSet courseResultSet = statement2.executeQuery("SELECT * FROM course WHERE id='" + applicationsResultSet.getInt("course_id") + "'");
                    courseResultSet.next();
                    ApplicationStatusBean app = new ApplicationStatusBean();
                    app.setId(applicationsResultSet.getInt("id"));
                    app.setDepartmentName(departmentResultSet.getString("department_name"));
                    app.setCourseName(courseResultSet.getString("course_name"));
                    app.setInstructorName("Dummy Instructor Name");
                    app.setStatus(applicationsResultSet.getString("status"));
                    applicationsList.add(app);
                    departmentResultSet.close();
                    courseResultSet.close();
                }
                connObject.close();
                req.setAttribute("applicationsList", applicationsList);
                req.getRequestDispatcher("/applicantHome.jsp").forward(req, res);
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

    public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException { 
	    try {
		    Class.forName("com.mysql.jdbc.Driver");
		    Connection connObject = DriverManager.getConnection("jdbc:mysql://127.8.9.0:3306/ta", "ta", "root");
		    PrintWriter printWriter = res.getWriter();
            Cookie[] cookies = req.getCookies();
            if (connObject != null) {
			    res.setContentType("text/html");

                /** Fetching Username and Usertype from cookies */
                String username="", usertype="";
                for(int i=0; i < cookies.length; i++) {
                      if("TAusername".equals(cookies[i].getName())) {
                          username = cookies[i].getValue();
                      }
                      else if("TAusertype".equals(cookies[i].getName())) {
                          usertype = cookies[i].getValue();
                      }
                }

                /** Redirecting to their respective pages for other users */
                if(username.equals("none")) {
                    req.getRequestDispatcher("/login.jsp").forward(req, res);
                } else if(usertype.equals("admin")) {
                    req.getRequestDispatcher("/adminHome.jsp").forward(req, res);
                } else if(usertype.equals("applicant")) {
                    req.getRequestDispatcher("/applicantHome.jsp").forward(req, res);
                } else if(usertype.equals("instructor")) {
                    req.getRequestDispatcher("/instructorHome.jsp").forward(req, res);
                }

                int applicationId = Integer.parseInt(req.getParameter("applicationId"));
                String status = req.getParameter("status");
			    Statement statement = connObject.createStatement();
                int updatedRows = statement.executeUpdate("UPDATE ta_application SET status='" + status + "' WHERE id='" + applicationId + "'");
                statement.close();
                if(updatedRows==1){
                    if(status.equals("Approved")){
                        Statement applicationStatement = connObject.createStatement();
                        ResultSet appResultSet = applicationStatement.executeQuery("SELECT * FROM ta_application WHERE id='"+applicationId+"'");
                        appResultSet.next();
                        String query = "INSERT INTO tas (name, email, ta_applicant_id, ta_application_id, instructor_id, course_id, department_id) values(?,?,?,?,?,?,?)";
                        PreparedStatement tasPS = connObject.prepareStatement(query);
                        tasPS.setString(1, appResultSet.getString("firstname")+" "+appResultSet.getString("lastname"));
                        tasPS.setString(2, appResultSet.getString("email"));
                        tasPS.setInt(3, appResultSet.getInt("ta_applicant_id"));
                        tasPS.setInt(4, applicationId);
                        tasPS.setInt(5, appResultSet.getInt("instructor_id"));
                        tasPS.setInt(6, appResultSet.getInt("course_id"));
                        tasPS.setInt(7, appResultSet.getInt("department_id"));
                        int updatedTasRows = tasPS.executeUpdate();   
                        appResultSet.close();
                        applicationStatement.close();
                        if(updatedTasRows==1){
                            printWriter.print("success");
                            System.out.println("Successfully updated the application status!");
                        }else{
                            printWriter.print("failed");
                            System.out.println("Failed to insert application data into TAS table!");
                        }
                    }else{
                        Statement tasStatement = connObject.createStatement();
                        ResultSet tasResultSet = tasStatement.executeQuery("SELECT * FROM tas WHERE ta_application_id='"+applicationId+"'");
                        if(tasResultSet.next()){
                            Statement tasDeleteStatement = connObject.createStatement();
                            int deletedRows = tasDeleteStatement.executeUpdate("DELETE FROM tas WHERE id='"+tasResultSet.getInt("id")+"'");
                            if(deletedRows==1){
                                printWriter.print("success");
                                System.out.println("Successfully deleted the application from tas table!");
                            }else{
                                printWriter.print("failed");
                                System.out.println("Failed to delete application from tas table!");
                            }
                        }else{
                            printWriter.print("success");
                            System.out.println("Successfully updated the application status!");
                        }
                    }
                } else {
                    printWriter.print("failed");
                    System.out.println("==== 0 rows updated ====");
                }
                connObject.close();
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