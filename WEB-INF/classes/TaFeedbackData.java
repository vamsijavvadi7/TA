import java.io.Serializable;


public class TaFeedbackData implements Serializable {

    private int taId;
    private String taName;
    private int instructorId;
    private int taApplicantId;
    private int courseId;
    private int departmentId;
    private String email;
    private boolean offerSent;
    private String offerStatus;
    private int instructorFeedbackId;
    private String instructorName;
    private int performanceRating;
    private int technicalSkill;
    private int communicationSkill;
    private String overallFeedback;

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

    public int getInstructorFeedbackId() {
        return instructorFeedbackId;
    }

    public void setInstructorFeedbackId(int instructorFeedbackId) {
        this.instructorFeedbackId = instructorFeedbackId;
    }

    public String getInstructorName() {
        return instructorName;
    }

    public void setInstructorName(String instructorName) {
        this.instructorName = instructorName;
    }

    public int getPerformanceRating() {
        return performanceRating;
    }

    public void setPerformanceRating(int performanceRating) {
        this.performanceRating = performanceRating;
    }

    public int getTechnicalSkill() {
        return technicalSkill;
    }

    public void setTechnicalSkill(int technicalSkill) {
        this.technicalSkill = technicalSkill;
    }

    public int getCommunicationSkill() {
        return communicationSkill;
    }

    public void setCommunicationSkill(int communicationSkill) {
        this.communicationSkill = communicationSkill;
    }

    public String getOverallFeedback() {
        return overallFeedback;
    }

    public void setOverallFeedback(String overallFeedback) {
        this.overallFeedback = overallFeedback;
    }
}
