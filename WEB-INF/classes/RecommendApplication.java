import java.io.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.sql.*;

@WebServlet("/recommendApplication")
public class RecommendApplication extends HttpServlet{
  public void doPost(HttpServletRequest req, HttpServletResponse res)
  throws ServletException,IOException {
	  
	  try 
	  {
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
                } else if(usertype.equals("committee")) {
                    req.getRequestDispatcher("/committeeHome.jsp").forward(req, res);
                } else if(usertype.equals("instructor")) {
                    req.getRequestDispatcher("/instructorHome.jsp").forward(req, res);
                } else{

                    int taApplicationId = Integer.parseInt(req.getParameter("applicationId"));
                    int recommended=0;
                    System.out.println(req.getParameter("recommended"));
                    if(req.getParameter("recommended").equals("true")){
                        recommended = 1;
                    }else{
                        recommended = 0;
                    }

                    Statement st = connObject.createStatement();
                    String query = "Update ta_application SET recommended='"+recommended+"' WHERE id='"+taApplicationId+"'";
                    int updatedRows = st.executeUpdate(query);

                    if(updatedRows==1){
                        printWriter.print("success");
                        System.out.println("Successfully recommended!!");
                    }else{
                        printWriter.print("failed");
                        System.out.println("Failed Updating the recommendation!");
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