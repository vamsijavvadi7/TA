import java.util.*;
import java.io.Serializable;

public class ApplicationStatusBean implements Serializable {

    private int id;
    private String departmentName, courseName, instructorName, status, offerStatus;
    private boolean offered;

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

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public boolean getOffered() {
        return offered;
    }

    public void setOffered(boolean offer) {
        this.offered = offer;
    }

    public void setOfferStatus(String offerStatus) {
        this.offerStatus = offerStatus;
    }

    public String getOfferStatus() {
        return offerStatus;
    }
    
}
