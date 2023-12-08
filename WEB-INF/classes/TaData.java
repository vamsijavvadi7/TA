import java.io.Serializable;

public class TaData implements Serializable {

    private int taId;
    private String taName;
    private int instructorId;
    private int taApplicantId;
    private int courseId;
    private int departmentId;
    private String email;
    private int taApplicationId;
    private boolean offerSent;
    private String offerStatus;

    // Constructors, getters, and setters

    public int getTaId() {
        return taId;
    }

    public void setTaId(int taId) {
        this.taId = taId;
    }

    public String getTaName() {
        return taName;
    }

    public void setTaName(String taName) {
        this.taName = taName;
    }

    public int getInstructorId() {
        return instructorId;
    }

    public void setInstructorId(int instructorId) {
        this.instructorId = instructorId;
    }

    public int getTaApplicantId() {
        return taApplicantId;
    }

    public void setTaApplicantId(int taApplicantId) {
        this.taApplicantId = taApplicantId;
    }

    public int getCourseId() {
        return courseId;
    }

    public void setCourseId(int courseId) {
        this.courseId = courseId;
    }

    public int getDepartmentId() {
        return departmentId;
    }

    public void setDepartmentId(int departmentId) {
        this.departmentId = departmentId;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public int getTaApplicationId() {
        return taApplicationId;
    }

    public void setTaApplicationId(int taApplicationId) {
        this.taApplicationId = taApplicationId;
    }

    public boolean isOfferSent() {
        return offerSent;
    }

    public void setOfferSent(boolean offerSent) {
        this.offerSent = offerSent;
    }

    public String getOfferStatus() {
        return offerStatus;
    }

    public void setOfferStatus(String offerStatus) {
        this.offerStatus = offerStatus;
    }
}