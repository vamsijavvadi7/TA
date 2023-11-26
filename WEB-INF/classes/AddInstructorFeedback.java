import java.io.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.sql.*;

@WebServlet("/addInstructorFeedback")
public class AddInstructorFeedback extends HttpServlet{
  public void doPost(HttpServletRequest req, HttpServletResponse res)
  throws ServletException,IOException {
	  
	  try 
	   {
		  Class.forName("com.mysql.jdbc.Driver");
		  Connection connObject = DriverManager.getConnection("jdbc:mysql://10.0.0.224:3306/ta", "ta", "root");
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
                } else if(usertype.equals("committee")) {
                    req.getRequestDispatcher("/committeeHome.jsp").forward(req, res);
                } else if(usertype.equals("admin")) {
                    req.getRequestDispatcher("/adminHome.jsp").forward(req, res);
                } else {

                 
                        int technicalSkill = req.getParameter("technicalSkill");
                        int communicationSkill = req.getParameter("communicationSkill");
                        int performanceRating = req.getParameter("performanceRating");
                        String overallFeedback=req.getParameter("overallFeedback");
                        int course_id=req.getParameter("course_id");
                        int department_id=req.getParameter("department_id");
                        int instructorId=req.getParameter("instructorId");
                        String instructorName=req.getParameter("instructorName");
                        int taId=req.getParameter("taId");





                        String query = "INSERT INTO `ta`.`instructor_feedback` (`course_id`,`instructor_name`,`performance_rating`,`TA_id`,`technical_skill`,`communication_skill`,`overall_feedback`,`instructor_id`) VALUES (?,?,?,?,?,?,?,?);";
                        PreparedStatement addInstructorFeedback = connObject.prepareStatement(query);
                    addInstructorFeedback.setInt(1,course_id);
                    addInstructorFeedback.setString(2,instructorName);
                    
                       addInstructorFeedback.setInt(3,performanceRating);
                        addInstructorFeedback.setInt(4,taId);
                         addInstructorFeedback.setInt(5,technicalSkill);
                          addInstructorFeedback.setInt(6,communicationSkill);
                           addInstructorFeedback.setString(7,overallFeedback);
                            addInstructorFeedback.setInt(8,instructorId);
                        int updatedRows =addInstructorFeedback.executeUpdate();
                        if(updatedRows==1){
                          
                                printWriter.print("success");
                           
                        }else{
                            printWriter.print("failed");
                            System.out.println("Failed to add Committee member!");
                        }
                    } 
                }else {
                printWriter.print("Not connected to the database!");
        

        }
        } catch (SQLException e) {
            System.err.format("SQL State: %s\n%s", e.getSQLState(), e.getMessage());
        } catch (Exception e) {
            e.printStackTrace();
        }

  }
}
