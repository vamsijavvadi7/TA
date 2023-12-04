import java.io.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.sql.*;
import java.util.*;

@WebServlet("/instructorHome")
public class InstructorHome extends HttpServlet{
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
                if(usertype.equals("instructor")) {
                    Statement userStatement = connObject.createStatement();
			        ResultSet userResultSet = userStatement.executeQuery("SELECT * FROM instructor WHERE email='" + username + "'");
                    if(userResultSet.next()){
                        System.out.println("Username: "+username);
                        req.setAttribute("taFeedbackList", getTaFeedbackList(connObject,username));
                         req.setAttribute("taList", getTasList(connObject,username));
                         String lastname = userResultSet.getString("lastname");
                         if(lastname.equals("") || lastname==null){
                            lastname = "";
                         }
                         req.setAttribute("instructorName",userResultSet.getString("firstname")+" "+lastname);
                        req.getRequestDispatcher("/instructorHome.jsp").forward(req, res);
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

    public List<TaFeedbackData> getTaFeedbackList(Connection con,String username) {
    String taDataQuery = "SELECT tas.id AS ta_id, "+
        "ta_applicant.firstname as ta_firstname, "+
        "ta_applicant.lastname as ta_lastname, "+
        "tas.instructor_id, "+
        "tas.ta_applicant_id, "+
        "tas.course_id, "+
        "tas.department_id, "+
        "tas.email, "+
        "tas.offer_sent, "+
        "tas.offer_status, "+
        "instructor_feedback.id AS instructor_feedback_id, "+
        "instructor_feedback.instructor_name, "+
        "instructor_feedback.performance_rating, "+
        "instructor_feedback.technical_skill, "+
        "instructor_feedback.communication_skill, "+
        "instructor_feedback.overall_feedback "+
        "FROM tas, ta_applicant, instructor_feedback, instructor WHERE "+
        "instructor.email='"+username+"' AND "+
        "ta_applicant.id=tas.ta_applicant_id AND tas.id = instructor_feedback.TA_id AND "+
        "tas.instructor_id=instructor_feedback.instructor_id AND "+
        " instructor_feedback.instructor_id=instructor.id";
        Statement taStatement=null;
        ResultSet taResultSet=null;
        List<TaFeedbackData> taList = new ArrayList<TaFeedbackData>();
        System.out.println("==== In tasFeedbackList Method Start==== ");
        try 
        {
            taStatement = con.createStatement();
            taResultSet = taStatement.executeQuery(taDataQuery);
            while(taResultSet.next()){
                TaFeedbackData ta = new TaFeedbackData();
               ta.setTaId(taResultSet.getInt("ta_id"));
               String lastname = taResultSet.getString("ta_lastname");
                if(lastname.equals("") || lastname==null){
                    lastname = "";
                }
               ta.setTaName(taResultSet.getString("ta_firstname")+" "+lastname);
               ta.setInstructorId(taResultSet.getInt("instructor_id"));
               ta.setTaApplicantId(taResultSet.getInt("ta_applicant_id"));
               ta.setCourseId(taResultSet.getInt("course_id"));
               ta.setDepartmentId(taResultSet.getInt("department_id"));
               ta.setEmail(taResultSet.getString("email"));
               ta.setOfferSent(taResultSet.getBoolean("offer_sent"));
               ta.setOfferStatus(taResultSet.getString("offer_status"));
               ta.setInstructorFeedbackId(taResultSet.getInt("instructor_feedback_id"));
               ta.setInstructorName(taResultSet.getString("instructor_name"));
               ta.setPerformanceRating(taResultSet.getInt("performance_rating"));
               ta.setTechnicalSkill(taResultSet.getInt("technical_skill"));
               ta.setCommunicationSkill(taResultSet.getInt("communication_skill"));
               ta.setOverallFeedback(taResultSet.getString("overall_feedback"));           
               taList.add(ta);
            }
        }catch (Exception e) {
            e.printStackTrace();    
        }
        System.out.println("==== In gettaFeedbackList Method End ==== ");
        return taList;
    }
    public List<TaData> getTasList(Connection con,String username) 
    {
        String taDataQuery = "SELECT tas.id as ta_id, tas.name as ta_name, " +
        "tas.instructor_id, tas.ta_applicant_id, " +
        "tas.course_id, tas.department_id, tas.email, " +
        "tas.ta_application_id, tas.offer_sent, tas.offer_status " +
        "FROM tas, instructor as inst " +
        "WHERE inst.email = '" +username+"' AND inst.id = tas.instructor_id";        
        Statement taStatement=null;
        ResultSet taResultSet=null;
        List<TaData> taList = new ArrayList<TaData>();
        System.out.println("==== In tasList Method Start==== ");
        try 
        {
            taStatement = con.createStatement();
            taResultSet = taStatement.executeQuery(taDataQuery);
            while(taResultSet.next()){
                TaData ta = new TaData();
                ta.setTaId(taResultSet.getInt("ta_id"));
                ta.setTaName(taResultSet.getString("ta_name"));
                ta.setInstructorId(taResultSet.getInt("instructor_id"));
                ta.setTaApplicantId(taResultSet.getInt("ta_applicant_id"));
                ta.setCourseId(taResultSet.getInt("course_id"));
                ta.setDepartmentId(taResultSet.getInt("department_id"));
                ta.setEmail(taResultSet.getString("email"));
                ta.setTaApplicationId(taResultSet.getInt("ta_application_id"));
                ta.setOfferSent(taResultSet.getBoolean("offer_sent"));
                ta.setOfferStatus(taResultSet.getString("offer_status"));
                taList.add(ta);
            }
        }catch (Exception e) {
            e.printStackTrace();    
        }
        System.out.println("==== In gettaList Method End ==== ");
        return taList;
    }









}