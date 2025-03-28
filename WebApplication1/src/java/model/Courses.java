package model;

import java.text.DecimalFormat;

public class Courses {
    private int courseID;
    private String courseName;
    private String description;
    private String level;
    private double price; // Giá của khóa học (giữ nguyên là kiểu double để tính toán chính xác)
    private float rating;
    private int totalSessions; // Số buổi học
    private String courseStatus; // Trạng thái khóa học
    private int studentId;

    // Constructor
    public Courses(int courseID, String courseName, String description, String level, double price, float rating, int totalSessions, String courseStatus) {
        this.courseID = courseID;
        this.courseName = courseName;
        this.description = description;
        this.level = level;
        this.price = price;
        this.rating = rating;
        this.totalSessions = totalSessions;
        this.courseStatus = courseStatus;
    }

    // Getters and Setters
    public int getCourseID() {
        return courseID;
    }

    public void setCourseID(int courseID) {
        this.courseID = courseID;
    }

    public String getCourseName() {
        return courseName;
    }

    public void setCourseName(String courseName) {
        this.courseName = courseName;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getLevel() {
        return level;
    }

    public void setLevel(String level) {
        this.level = level;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public float getRating() {
        return rating;
    }

    public void setRating(float rating) {
        this.rating = rating;
    }

    public int getTotalSessions() {
        return totalSessions;
    }

    public void setTotalSessions(int totalSessions) {
        this.totalSessions = totalSessions;
    }

    public String getCourseStatus() {
        return courseStatus;
    }

    public void setCourseStatus(String courseStatus) {
        this.courseStatus = courseStatus;
    }

    // Method to get formatted price with thousands separator
    public String getFormattedPrice() {
        DecimalFormat formatter = new DecimalFormat("#,###");
        return formatter.format(price); // Return price formatted with commas (e.g., "3,000,000")
    }

    // ToString method
    @Override
    public String toString() {
        return "Course{" +
                "courseID=" + courseID +
                ", courseName='" + courseName + '\'' +
                ", description='" + description + '\'' +
                ", level='" + level + '\'' +
                ", price=" + getFormattedPrice() + // Use formatted price here
                ", rating=" + rating +
                ", totalSessions=" + totalSessions +
                ", courseStatus='" + courseStatus + '\'' +
                '}';
    }
    
    public int getStudentId() {
        return studentId;
    }

    public void setStudentId(int studentId) {
        this.studentId = studentId;
    }
}
