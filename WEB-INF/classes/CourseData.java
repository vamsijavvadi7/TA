
import java.io.Serializable;

public class CourseData implements Serializable {

    private int courseId;
    private String courseName;
    private int departmentId;


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
    
}
