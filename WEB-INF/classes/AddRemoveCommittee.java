import java.io.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.sql.*;

@WebServlet("/addRemoveCommittee")
public class AddRemoveCommittee extends HttpServlet{
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
                } else {

                    String action = req.getParameter("action");
                    if(action.equals("add")){
                        String name = req.getParameter("name");
                        String email = req.getParameter("email");
                        String password = req.getParameter("password");

                        String query = "INSERT INTO ta_committee (email, password, firstname) VALUES(?,?,?)";
                        PreparedStatement addCommitteePS = connObject.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);
                        addCommitteePS.setString(1,email);
                        addCommitteePS.setString(2,password);
                        addCommitteePS.setString(3,name);
                        int updatedRows = addCommitteePS.executeUpdate();
                        if(updatedRows==1){
                            ResultSet generatedKeys = addCommitteePS.getGeneratedKeys();
                            if(generatedKeys.next()){
                                long insertedId = generatedKeys.getLong(1);
                                printWriter.print(insertedId);
                                System.out.println("Successfully added new member!!");
                                System.out.println("Inserted ID for Committee Member : "+insertedId);
                            } else {
                                printWriter.print("No Id");
                            }
                        }else{
                            printWriter.print("failed");
                            System.out.println("Failed to add Committee member!");
                        }
                    } else {
                        System.out.println(req.getParameter("ids"));
                        String ids = req.getParameter("ids");
                        String query = "DELETE FROM ta_committee WHERE id IN ("+ids+")";
                        Statement committeeStatement = connObject.createStatement();
                        int updatedRows = committeeStatement.executeUpdate(query);
                        if(updatedRows>=1){
                            printWriter.print("success");
                            System.out.println("successfully removed committee member");
                        }else{
                            printWriter.print("failed");
                            System.out.println("Failed to remove member");
                        }
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