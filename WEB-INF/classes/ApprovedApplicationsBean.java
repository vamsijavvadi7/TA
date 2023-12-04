import java.io.Serializable;
import java.util.*;

public class ApprovedApplicationsBean implements Serializable{
    private String applicantName;
    private String email;
    private String courseName;
    private int courseId;
    private int instructorId;
    private int applicationId;
    private boolean offered;

    public String getApplicantName() {
        return applicantName;
    }

    public void setApplicantName(String applicantName) {
        this.applicantName = applicantName;
    }

    // Getter and Setter for 'email'
    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    // Getter and Setter for 'courseName'
    public String getCourseName() {
        return courseName;
    }

    public void setCourseName(String courseName) {
        this.courseName = courseName;
    }

    // Getter and Setter for 'courseId'
    public int getCourseId() {
        return courseId;
    }

    public void setCourseId(int courseId) {
        this.courseId = courseId;
    }

    // Getter and Setter for 'instructorId'
    public int getInstructorId() {
        return instructorId;
    }

    public void setInstructorId(int instructorId) {
        this.instructorId = instructorId;
    }

    // Getter and Setter for 'applicationId'
    public int getApplicationId() {
        return applicationId;
    }

    public void setApplicationId(int applicationId) {
        this.applicationId = applicationId;
    }

    public boolean getOffered() {
        return offered;
    }

    public void setOffered(boolean offer) {
        this.offered = offer;
    }
}