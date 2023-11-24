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
                        req.setAttribute("taFeedbackList", getTaFeedbackList(connObject));
                         req.setAttribute("taList", getTasList(connObject));
                        req.getRequestDispatcher("/InstructorHome.jsp").forward(req, res);
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

    public List<TaFeedbackData> getTaFeedbackList(Connection con) {

                   String taDataQuery = "SELECT tas.id as ta_id, tas.name as ta_name, " +
                     "tas.instructor_id, tas.ta_applicant_id, " +
                     "tas.course_id, tas.department_id, tas.email, " +
                     "tas.offer_sent, tas.offer_status, Instruc_f.id as instructor_feedback_id, " +
                     "Instruc_f.instructor_name, Instruc_f.performance_rating, " +
                     "Instruc_f.technical_skill, Instruc_f.communication_skill, " +
                     "Instruc_f.overall_feedback " +
                     "FROM tas, instructor_feedback as Instruc_f " +
                     "WHERE tas.id = Instruc_f.TA_id";




        

        
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
               ta.setTaName(taResultSet.getString("ta_name"));
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



    public List<TaData> getTasList(Connection con) {

                   String taDataQuery = "SELECT tas.id as ta_id, tas.name as ta_name, " +
                     "tas.instructor_id, tas.ta_applicant_id, " +
                     "tas.course_id, tas.department_id, tas.email, " +
                     "tas.ta_application_id,tas.offer_sent, tas.offer_status " +
                     "FROM tas";




        

        
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