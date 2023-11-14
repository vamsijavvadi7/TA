import java.io.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.sql.*;
import java.util.*;
// import java.io.Serializable;

public class ApplicantHome extends HttpServlet{
    public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException { 
	    try {
		    Class.forName("com.mysql.jdbc.Driver");
		    Connection connObject = DriverManager.getConnection("jdbc:mysql://10.0.0.224:3306/ta", "ta", "root");
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
			    ResultSet userResultSet = statement.executeQuery("SELECT * FROM ta_applicant WHERE znumber='"+ username +"' OR email='" + username + "'");
                userResultSet.next();
                req.setAttribute("firstname", userResultSet.getString("firstname"));
                req.setAttribute("lastname", userResultSet.getString("lastname"));
                req.setAttribute("znumber", userResultSet.getString("znumber"));
                req.setAttribute("email", userResultSet.getString("email"));
                req.setAttribute("password",userResultSet.getString("password"));
                req.setAttribute("username", username);
                req.setAttribute("departmentList", getDepartmentList(connObject));  
                req.setAttribute("courseList", getCourseList(connObject));
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

    public List<DepartmentData> getDepartmentList(Connection connObject)
    {
    	System.out.println("In ApplicantHome.java getDepartmentList START::");
        ResultSet departmentResultSet = null;
    	Statement st1 = null;
        DepartmentData DepartmentData = null;
        List<DepartmentData> DepartmentList = new ArrayList<DepartmentData>();
        try 
        {
    		st1 = connObject.createStatement();
            departmentResultSet = st1.executeQuery("SELECT * FROM department;");
            while(departmentResultSet.next())
    		{
                DepartmentData = new DepartmentData();
                int department_id = departmentResultSet.getInt("id");
                DepartmentData.setDepartmentId(department_id);
                DepartmentData.setDepartmentName(departmentResultSet.getString("department_name"));
                DepartmentList.add(DepartmentData);
            }

        } catch (Exception e) {
            e.printStackTrace();    
        }
    
    	System.out.println("In ApplicantHome getDepartmentList END::");
        return DepartmentList;
    }

    public List<CourseData> getCourseList(Connection connObject)
    {
    	System.out.println("In ApplicantHome.java getCourseList START::");
        ResultSet courseResultSet = null;
    	Statement st1 = null;
        CourseData courseData = null;
        List<CourseData> CourseList = new ArrayList<CourseData>();
        try 
        {
    		st1 = connObject.createStatement();
            courseResultSet = st1.executeQuery("SELECT * FROM course;");
            while(courseResultSet.next())
    		{
                courseData = new CourseData();
                int course_id = courseResultSet.getInt("id");
                int department_id = courseResultSet.getInt("department_id");

                courseData.setCourseId(course_id);
                courseData.setCourseName(courseResultSet.getString("course_name"));
                courseData.setDepartmentId(department_id);
                CourseList.add(courseData);
            }

        } catch (Exception e) {
            e.printStackTrace();    
        }
    
    	System.out.println("In ApplicantHome getCourseList END::");
        return CourseList;
    }

}