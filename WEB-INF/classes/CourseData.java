
import java.io.Serializable;

public class CourseData implements Serializable {

    private int courseId;
    private String courseName;
    private int departmentId;
    private String departmentName;
    private boolean status;
    private String instructorName;


    public String getCourseName() {
        return courseName;
    }

    public void setCourseName(String course) {
        this.courseName = course;
    }
	
	public int getCourseId() {
        return courseId;
    }

    public void setCourseId(int id) {
        this.courseId = id;
    } 

    public int getdepartmentId() {
        return departmentId;
    }

    public void setDepartmentId(int deptId) {
        this.departmentId = deptId;
    }   

    public String getDepartmentName() {
        return departmentName;
    }

    public void setDepartmentName(String department) {
        this.departmentName = department;
    }

    // Setter for 'status'
    public void setStatus(boolean status) {
        this.status = status;
    }

    // Getter for 'status'
    public boolean isStatus() {
        return status;
    }

    // Setter for 'instructorName'
    public void setInstructorName(String instructorName) {
        this.instructorName = instructorName;
    }

    // Getter for 'instructorName'
    public String getInstructorName() {
        return instructorName;
    }
    
}
