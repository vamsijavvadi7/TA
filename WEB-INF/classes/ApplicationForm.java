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

@WebServlet("/applicationForm")
@MultipartConfig(fileSizeThreshold = 1024 * 1024,
  maxFileSize = 1024 * 1024 * 5,
  maxRequestSize = 1024 * 1024 * 5 * 5)
public class ApplicationForm extends HttpServlet{
    public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException { 
	    try {
		    Class.forName("com.mysql.jdbc.Driver");
		    Connection connObject = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/ta", "root", "root");
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
                } else if(usertype.equals("committee")) {
                    req.getRequestDispatcher("/committeeHome.jsp").forward(req, res);
                } else if(usertype.equals("instructor")) {
                    req.getRequestDispatcher("/instructorHome.jsp").forward(req, res);
                }

                /** Declaring the variables */
			    String presentDepartment, cgpaString, uploadPath, targetPath, firstname, lastname, email, znumber, educationLevel, cvfileName, expCourse="none";
                float cgpa;
                int applicantId, courseId, departmentId, expDuration=0;
                boolean previousExperienceExists;
                java.sql.Date gradDate;
                InputStream cvInputStream;
                Part cv;
			    Statement statement = connObject.createStatement();
                ResultSet applicantDetails;
                PreparedStatement applicationPS;
                long cvFileSize=0;
                java.util.Date parsedDate;
                SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
                String applicationInsertQuery;

                /** Initializing the variables fetching from UI Form */
                applicantDetails = statement.executeQuery("SELECT * FROM users WHERE znumber='"+username+"' OR email='"+username+"'");
                applicantDetails.next();
                firstname = applicantDetails.getString("firstname");
                lastname = applicantDetails.getString("lastname");
                znumber = applicantDetails.getString("znumber");
                email = applicantDetails.getString("email");
                applicantId = applicantDetails.getInt("id");
                presentDepartment = req.getParameter("presentDepartment");
                System.out.println("CGPA read from UI : "+ req.getParameter("cgpa"));
                if(req.getParameter("cgpa") == null){
                    System.out.println("Extra cgpa val : " + req.getParameter("extraCgpa"));
                    cgpaString = req.getParameter("extraCgpa");
                }else{
                    cgpaString = req.getParameter("cgpa");
                }
                cgpa = Float.parseFloat(cgpaString);
                educationLevel = req.getParameter("educationLevel");
                departmentId = Integer.parseInt(req.getParameter("department"));
                courseId = Integer.parseInt(req.getParameter("course"));
                parsedDate = dateFormat.parse(req.getParameter("gradDate"));
                gradDate = new java.sql.Date(parsedDate.getTime());
                cv = req.getPart("cv");
                cvfileName = cv.getSubmittedFileName();
                uploadPath = "D:\\work\\apache\\apache-tomcat-9.0.80\\webapps\\ta" + File.separator + "uploads";
                targetPath = uploadPath + File.separator + znumber + cvfileName.substring(cvfileName.indexOf('.'));
                if("on".equals(req.getParameter("workExperienceBoolean"))){
                    previousExperienceExists = true;
                    expCourse = req.getParameter("expCourse");
                    expDuration = Integer.parseInt(req.getParameter("expDuration"));
                }else{
                    previousExperienceExists = false;
                }
                applicationInsertQuery = "INSERT INTO ta_application (ta_applicant_id, firstname, lastname, email, znumber, cgpa, present_department, education_level, graduation_date, previous_experience, exp_course, exp_duration, cv, course_id, department_id, status) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

                Statement taAppsStatement = connObject.createStatement();
                ResultSet taAppsResultSet = taAppsStatement.executeQuery("SELECT * FROM ta_application WHERE znumber='"+znumber+"' AND course_id='"+courseId+"'");
                if(taAppsResultSet.next()){
                    printWriter.print("Already Applied");
                } else {

                    /** Printing the above values for reference */
                    System.out.println("cgpa : "+cgpa+", presentDepartment: "+presentDepartment+", educationLevel: "+educationLevel+", gradDate: "+gradDate);
                    System.out.println("previousExperienceExists : "+previousExperienceExists+", expCourse: "+expCourse+", expDuration: "+expDuration);
                    System.out.println("cvfileName : "+cvfileName);

                    try (InputStream cvFileContent = cv.getInputStream()) {
                        Files.copy(cvFileContent, Paths.get(targetPath), StandardCopyOption.REPLACE_EXISTING);
                    }

                    applicationPS = connObject.prepareStatement(applicationInsertQuery);

                    Files.createDirectories(Paths.get(uploadPath));

                    applicationPS.setInt(1, applicantId);
                    applicationPS.setString(2, firstname);
                    applicationPS.setString(3, lastname);
                    applicationPS.setString(4, email);
                    applicationPS.setString(5, znumber);
                    applicationPS.setFloat(6, cgpa);
                    applicationPS.setString(7, presentDepartment);
                    applicationPS.setString(8, educationLevel);
                    applicationPS.setDate(9, gradDate);
                    applicationPS.setBoolean(10, previousExperienceExists);
                    applicationPS.setString(11, expCourse);
                    applicationPS.setInt(12, expDuration);
                    applicationPS.setString(13, cvfileName);
                    applicationPS.setInt(14, courseId);
                    applicationPS.setInt(15, departmentId);
                    applicationPS.setString(16, "Open");

                    int rowsAffected = applicationPS.executeUpdate();

                    if(rowsAffected==1){
                        printWriter.print("success");
                    }else{
                        printWriter.print("Failed");
                    }
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