import java.io.Serializable;
import java.util.*;

public class TaApplicationData implements Serializable {

    private int taApplicationId;
    private String firstname;
    private String lastname;
    private String email;
    private String znumber;
    private String presentDepartmentName;
    private float cgpa ;
    private String educationLevel;
    private java.util.Date graduationDate;
    private String cv;
    private boolean previousExperience;
    private String expCourse;
    private int expDuration;
    private boolean instructorFeedbackExists;
    private String instructorFeedbackName;
    private String instructorFeedbackCourseName;
    private int performanceRating;
    private int technicalSkillRating;
    private int communicationSkillRating;
    private String instructorOverallFeedback;
    private String courseName;
    private String departmentName;
    private String courseInstructorName;
    private boolean recommended;
    private String status;


    public String getCourseName() {
        return courseName;
    }

    public void setCourseName(String course) {
        this.courseName = course;
    }

    public String getDepartmentName() {
        return departmentName;
    }

    public void setDepartmentName(String department) {
        this.departmentName = department;
    }

    public int getTaApplicationId() {
        return taApplicationId;
    }

    public void setTaApplicationId(int taApplicationId) {
        this.taApplicationId = taApplicationId;
    }

    // Getter and Setter methods for firstname
    public String getFirstname() {
        return firstname;
    }

    public void setFirstname(String firstname) {
        this.firstname = firstname;
    }

    // Getter and Setter methods for lastname
    public String getLastname() {
        return lastname;
    }

    public void setLastname(String lastname) {
        this.lastname = lastname;
    }

    // Getter and Setter methods for email
    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    // Getter and Setter methods for znumber
    public String getZnumber() {
        return znumber;
    }

    public void setZnumber(String znumber) {
        this.znumber = znumber;
    }

    // Getter and Setter methods for cgpa
    public float getCgpa() {
        return cgpa;
    }

    public void setCgpa(float cgpa) {
        this.cgpa = cgpa;
    }

    // Getter and Setter methods for presentDepartment
    public String getPresentDepartmentName() {
        return presentDepartmentName;
    }

    public void setPresentDepartmentName(String presentDepartmentName) {
        this.presentDepartmentName = presentDepartmentName;
    }

    // Getter and Setter methods for educationLevel
    public String getEducationLevel() {
        return educationLevel;
    }

    public void setEducationLevel(String educationLevel) {
        this.educationLevel = educationLevel;
    }

    // Getter and Setter methods for graduationDate
    public java.util.Date getGraduationDate() {
        return graduationDate;
    }

    public void setGraduationDate(java.util.Date graduationDate) {
        this.graduationDate = graduationDate;
    }

    // Getter and Setter methods for cv
    public String getCv() {
        return cv;
    }

    public void setCv(String cv) {
        this.cv = cv;
    }

    // Getter and Setter methods for previousExperience
    public boolean isPreviousExperience() {
        return previousExperience;
    }

    public void setPreviousExperience(boolean previousExperience) {
        this.previousExperience = previousExperience;
    }

    // Getter and Setter methods for expCourse
    public String getExpCourse() {
        return expCourse;
    }

    public void setExpCourse(String expCourse) {
        this.expCourse = expCourse;
    }

    // Getter and Setter methods for expDuration
    public int getExpDuration() {
        return expDuration;
    }

    public void setExpDuration(int expDuration) {
        this.expDuration = expDuration;
    }

    // Getter and Setter methods for recommended
    public boolean isRecommended() {
        return recommended;
    }

    public void setRecommended(boolean recommended) {
        this.recommended = recommended;
    }

    // Getter and Setter methods for status
    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    // Getter method
    public boolean isInstructorFeedbackExists() {
        return instructorFeedbackExists;
    }

    // Setter method
    public void setInstructorFeedbackExists(boolean instructorFeedbackExists) {
        this.instructorFeedbackExists = instructorFeedbackExists;
    }

    // Getter and setter for instructorFeedbackName
    public String getInstructorFeedbackName() {
        return instructorFeedbackName;
    }

    public void setInstructorFeedbackName(String instructorFeedbackName) {
        this.instructorFeedbackName = instructorFeedbackName;
    }

    // Getter and setter for instructorFeedbackCourseName
    public String getInstructorFeedbackCourseName() {
        return instructorFeedbackCourseName;
    }

    public void setInstructorFeedbackCourseName(String instructorFeedbackCourseName) {
        this.instructorFeedbackCourseName = instructorFeedbackCourseName;
    }

    // Getter and setter for performanceRating
    public int getPerformanceRating() {
        return performanceRating;
    }

    public void setPerformanceRating(int performanceRating) {
        this.performanceRating = performanceRating;
    }

    // Getter and setter for technicalSkillRating
    public int getTechnicalSkillRating() {
        return technicalSkillRating;
    }

    public void setTechnicalSkillRating(int technicalSkillRating) {
        this.technicalSkillRating = technicalSkillRating;
    }

    // Getter and setter for communicationSkillRating
    public int getCommunicationSkillRating() {
        return communicationSkillRating;
    }

    public void setCommunicationSkillRating(int communicationSkillRating) {
        this.communicationSkillRating = communicationSkillRating;
    }

    // Getter and setter for instructorOverallFeedback
    public String getInstructorOverallFeedback() {
        return instructorOverallFeedback;
    }

    public void setInstructorOverallFeedback(String instructorOverallFeedback) {
        this.instructorOverallFeedback = instructorOverallFeedback;
    }

    // Getter and setter for courseInstructorName
    public String getCourseInstructorName() {
        return courseInstructorName;
    }

    public void setCourseInstructorName(String courseInstructorName) {
        this.courseInstructorName = courseInstructorName;
    }
}
