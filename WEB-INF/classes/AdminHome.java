import java.io.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.sql.*;
import java.util.*;
// import java.io.Serializable;

@WebServlet("/adminHome")
public class AdminHome extends HttpServlet{
    public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException { 
	    try {
		    Class.forName("com.mysql.jdbc.Driver");
		    Connection connObject = DriverManager.getConnection("jdbc:mysql://127.8.9.0:3306/ta", "ta", "root");
		    PrintWriter printWriter = res.getWriter();
            Cookie[] cookies = req.getCookies();
            if (connObject != null) {
			    res.setContentType("text/html");
			    String username="", usertype="";
    
                for(int i=0; cookies!=null && i < cookies.length; i++) {
                      if("TAusername".equals(cookies[i].getName())) {
                          username = cookies[i].getValue();
                      }
                      else if("TAusertype".equals(cookies[i].getName())) {
                          usertype = cookies[i].getValue();
                      }
                }

                if(usertype.equals("admin")) {
                    Statement userStatement = connObject.createStatement();
			        ResultSet userResultSet = userStatement.executeQuery("SELECT * FROM admin WHERE email='" + username + "'");
                    if(userResultSet.next()){
                        req.setAttribute("applicationsList", getApplicationsList(connObject));
                        req.setAttribute("courseList", getCourseList(connObject));
                        req.setAttribute("instructorsList", getInstructorsList(connObject));
                        req.setAttribute("committeeList", getCommitteeList(connObject));
                        req.setAttribute("approvedApplicationsList", getApprovedApplicationsList(connObject));
                        req.setAttribute("departmentList", getDepartmentList(connObject));
                        req.setAttribute("firstname", userResultSet.getString("firstname"));
                        req.setAttribute("lastname", userResultSet.getString("lastname"));
                        req.setAttribute("email", userResultSet.getString("email"));
                        req.setAttribute("password", userResultSet.getString("password"));
                        req.getRequestDispatcher("/admin.jsp").forward(req, res);
                    } else{
                        req.getRequestDispatcher("/login.jsp").forward(req, res);
                    }
                } else{
                    req.getRequestDispatcher("/login.jsp").forward(req, res);
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

    public List<TaApplicationData> getApplicationsList(Connection con) {

        String applicationDataQuery = ""+
        "SELECT application.*, instructor.firstname as instructorFirstname, instructor.lastname as instructorLastname, "+
        "course.course_name, selectedDepartment.department_name as selected_department_name, "+
        "presentDepartment.department_name as present_department_name, CASE WHEN application.instructor_feedback_id IS NOT NULL "+
        "THEN (SELECT overall_feedback from instructor_feedback WHERE instructor_feedback.id=application.instructor_feedback_id) "+
        "ELSE 'NONE' END AS overall_feedback FROM ta_application as application, course, instructor, "+
        "department as selectedDepartment, department as presentDepartment "+
        "WHERE application.course_id=course.id AND application.department_id=selectedDepartment.id AND "+
        "application.present_department=presentDepartment.id AND application.instructor_id=instructor.id";
        Statement applicationsStatement=null;
        ResultSet applicationsResultSet=null;
        Statement feedbackStatement=null;
        ResultSet feedbackResultSet=null;
        List<TaApplicationData> applicationsList = new ArrayList<TaApplicationData>();
        System.out.println("==== In getApplicationsList Method Start==== ");
        try 
        {
            applicationsStatement = con.createStatement();
            feedbackStatement = con.createStatement();
            applicationsResultSet = applicationsStatement.executeQuery(applicationDataQuery);
            while(applicationsResultSet.next()){
                TaApplicationData application = new TaApplicationData();
                int instructorFeedbackId = applicationsResultSet.getInt("instructor_feedback_id");
                System.out.println("FeedbackId : "+applicationsResultSet.getInt("instructor_feedback_id"));
                if(instructorFeedbackId == 0) {
                    application.setInstructorFeedbackExists(false);
                } else {
                    String instructorFeedbackQuery="SELECT instructor_feedback.*, course.course_name FROM instructor_feedback, course WHERE instructor_feedback.id='"+instructorFeedbackId+"' AND instructor_feedback.course_id=course.id";
                    feedbackResultSet = feedbackStatement.executeQuery(instructorFeedbackQuery);
                    if(feedbackResultSet.next()){
                        application.setInstructorFeedbackExists(true);
                        application.setInstructorFeedbackName(feedbackResultSet.getString("instructor_name"));
                        application.setInstructorFeedbackCourseName(feedbackResultSet.getString("course_name"));
                        application.setPerformanceRating(feedbackResultSet.getInt("performance_rating"));
                        application.setTechnicalSkillRating(feedbackResultSet.getInt("technical_skill"));
                        application.setCommunicationSkillRating(feedbackResultSet.getInt("communication_skill"));
                        application.setInstructorOverallFeedback(feedbackResultSet.getString("overall_feedback"));
                    }else{
                        application.setInstructorFeedbackExists(false);
                    }
                }
                application.setDepartmentName(applicationsResultSet.getString("selected_department_name"));
                application.setCourseName(applicationsResultSet.getString("course_name"));
                application.setCourseInstructorName(applicationsResultSet.getString("instructorFirstname")+" "+ applicationsResultSet.getString("instructorLastname"));
                application.setTaApplicationId(applicationsResultSet.getInt("id"));
                application.setFirstname(applicationsResultSet.getString("firstname"));
                application.setLastname(applicationsResultSet.getString("lastname"));
                application.setEmail(applicationsResultSet.getString("email"));
                application.setZnumber(applicationsResultSet.getString("znumber"));
                application.setCgpa(applicationsResultSet.getFloat("cgpa"));
                application.setPresentDepartmentName(applicationsResultSet.getString("present_department_name"));
                application.setEducationLevel(applicationsResultSet.getString("education_level"));
                application.setGraduationDate(applicationsResultSet.getDate("graduation_date"));
                application.setCv(applicationsResultSet.getString("cv"));
                application.setPreviousExperience(applicationsResultSet.getBoolean("previous_experience"));
                application.setExpCourse(applicationsResultSet.getString("exp_course"));
                application.setExpDuration(applicationsResultSet.getInt("exp_duration"));
                application.setRecommended(applicationsResultSet.getBoolean("recommended"));
                application.setStatus(applicationsResultSet.getString("status"));
                applicationsList.add(application);
            }
        }catch (Exception e) {
            e.printStackTrace();   
        }
        System.out.println("==== In getApplicationsList Method End ==== ");
        return applicationsList;
    }

    public List<CourseData> getCourseList(Connection con) {

        String courseDataQuery = "SELECT course.*, instructor.firstname, instructor.lastname, department.department_name "+
        "FROM course, instructor, department WHERE course.department_id=department.id AND course.instructor_id=instructor.id";
        Statement courseStatement=null;
        ResultSet courseResultSet=null;
        List<CourseData> courseList = new ArrayList<CourseData>();
        System.out.println("==== In getCourseList Method Start==== ");
        try 
        {
            courseStatement = con.createStatement();
            courseResultSet = courseStatement.executeQuery(courseDataQuery);
            while(courseResultSet.next()){
                CourseData course = new CourseData();
                course.setDepartmentName(courseResultSet.getString("department_name"));
                course.setCourseName(courseResultSet.getString("course_name"));
                course.setCourseId(courseResultSet.getInt("id"));
                course.setStatus(courseResultSet.getBoolean("status"));
                course.setDepartmentId(courseResultSet.getInt("department_id"));
                String lastname = courseResultSet.getString("lastname");
                if(lastname.equals("null") || lastname==null)
                {
                    lastname = "";
                }
                course.setInstructorName(courseResultSet.getString("firstname")+" "+lastname);
                courseList.add(course);
            }
        }catch (Exception e) {
            e.printStackTrace();    
        }
        System.out.println("==== In getCourseList Method End ==== ");
        return courseList;
    }

    public List<InstructorBean> getInstructorsList(Connection con) {

        String instructorDataQuery = "SELECT instructor.*, department.department_name "+
        "FROM instructor, department WHERE instructor.department_id=department.id";
        Statement instructorStatement=null;
        ResultSet instructorResultSet=null;
        List<InstructorBean> instructorsList = new ArrayList<InstructorBean>();
        System.out.println("==== In getInstructorsList Method Start==== ");
        try 
        {
            instructorStatement = con.createStatement();
            instructorResultSet = instructorStatement.executeQuery(instructorDataQuery);
            while(instructorResultSet.next()){
                InstructorBean instructor = new InstructorBean();
                instructor.setDepartmentName(instructorResultSet.getString("department_name"));
                instructor.setCourseName(instructorResultSet.getString("course_name"));
                instructor.setId(instructorResultSet.getInt("id"));
                instructor.setEmail(instructorResultSet.getString("email"));
                String lastname = instructorResultSet.getString("lastname");
                if(lastname.equals("null") || lastname==null)
                {
                    lastname = "";
                }
                instructor.setInstructorName(instructorResultSet.getString("firstname")+" "+lastname);
                instructorsList.add(instructor);
            }
        }catch (Exception e) {
            e.printStackTrace();    
        }
        System.out.println("==== In getInstructorsList Method End ==== ");
        return instructorsList;
    }

    public List<CommitteeBean> getCommitteeList(Connection con) {

        String committeeDataQuery = "SELECT * FROM ta_committee";
        Statement committeeStatement=null;
        ResultSet committeeResultSet=null;
        List<CommitteeBean> committeeList = new ArrayList<CommitteeBean>();
        System.out.println("==== In getcommitteeList Method Start==== ");
        try 
        {
            committeeStatement = con.createStatement();
            committeeResultSet = committeeStatement.executeQuery(committeeDataQuery);
            while(committeeResultSet.next()){
                CommitteeBean committee = new CommitteeBean();
                String lastname = committeeResultSet.getString("lastname");
                if(lastname==null || lastname.equals("null")){
                    lastname="";
                }
                committee.setName(committeeResultSet.getString("firstname")+" "+lastname);
                committee.setId(committeeResultSet.getInt("id"));
                committee.setEmail(committeeResultSet.getString("email"));
                committeeList.add(committee);
            }
        }catch (Exception e) {
            e.printStackTrace();    
        }
        System.out.println("==== In getcommitteeList Method End ==== ");
        return committeeList;
    }

    public List<DepartmentData> getDepartmentList(Connection con) {
        
        String departmentDataQuery = "SELECT * FROM department";
        Statement departmentStatement=null;
        ResultSet departmentResultSet=null;
        List<DepartmentData> departmentList = new ArrayList<DepartmentData>();
        System.out.println("==== In getDepartmentList Method Start==== ");
        try 
        {
            departmentStatement = con.createStatement();
            departmentResultSet = departmentStatement.executeQuery(departmentDataQuery);
            while(departmentResultSet.next()){
                DepartmentData department = new DepartmentData();
                department.setDepartmentId(departmentResultSet.getInt("id"));
                department.setDepartmentName(departmentResultSet.getString("department_name"));
                departmentList.add(department);
            }
        }catch (Exception e) {
            e.printStackTrace();    
        }
        System.out.println("==== In getdepartmentList Method End ==== ");
        return departmentList;
    }

    public List<ApprovedApplicationsBean> getApprovedApplicationsList(Connection con) {

        String approvedAppsDataQuery = "SELECT tas.*, course.course_name FROM tas, course WHERE tas.course_id=course.id";
        Statement approvedAppsStatement=null;
        ResultSet approvedAppsResultSet=null;
        List<ApprovedApplicationsBean> approvedApplicationsList = new ArrayList<ApprovedApplicationsBean>();
        System.out.println("==== In getApprovedApplicationsList Method Start==== ");
        try 
        {
            approvedAppsStatement = con.createStatement();
            approvedAppsResultSet = approvedAppsStatement.executeQuery(approvedAppsDataQuery);
            while(approvedAppsResultSet.next()){
                ApprovedApplicationsBean approvedApp = new ApprovedApplicationsBean();
                approvedApp.setApplicantName(approvedAppsResultSet.getString("name"));
                approvedApp.setApplicationId(approvedAppsResultSet.getInt("ta_application_id"));
                approvedApp.setEmail(approvedAppsResultSet.getString("email"));
                approvedApp.setCourseName(approvedAppsResultSet.getString("course_name"));
                approvedApp.setCourseId(approvedAppsResultSet.getInt("course_id"));
                approvedApp.setInstructorId(approvedAppsResultSet.getInt("instructor_id"));
                approvedApp.setOffered(approvedAppsResultSet.getBoolean("offer_sent"));
                approvedApplicationsList.add(approvedApp);
            }
        }catch (Exception e) {
            e.printStackTrace();    
        }
        System.out.println("==== In getApplicationsList Method End ==== ");
        return approvedApplicationsList;
    }

}