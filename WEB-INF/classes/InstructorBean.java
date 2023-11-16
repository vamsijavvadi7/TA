import java.util.*;
import java.io.Serializable;

public class InstructorBean implements Serializable {

    private int id;
    private String departmentName, courseName, instructorName, email;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }
	
	public String getDepartmentName() {
        return departmentName;
    }

    public void setDepartmentName(String department) {
        this.departmentName = department;
    }

    public String getCourseName() {
        return courseName;
    }

    public void setCourseName(String course) {
        this.courseName = course;
    }

    public String getInstructorName() {
        return instructorName;
    }

    public void setInstructorName(String instructor) {
        this.instructorName = instructor;
    }

    // Setter for email
    public void setEmail(String email) {
        this.email = email;
    }

    // Getter for email
    public String getEmail() {
        return email;
    }  
    
}
