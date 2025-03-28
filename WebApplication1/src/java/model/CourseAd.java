/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author Huy
 */
public class CourseAd {
    private int courseId;
    private String courseName;
    private String description;
    private String level;
    private double price;
    private float rating;
    private int totalSessions;
    private String courseStatus;
//    private String verify; // Thêm trạng thái verify

    public CourseAd() {
    }

    public CourseAd(int courseId, String courseName, String description, String level, double price, float rating, int totalSessions, String courseStatus) {
        this.courseId = courseId;
        this.courseName = courseName;
        this.description = description;
        this.level = level;
        this.price = price;
        this.rating = rating;
        this.totalSessions = totalSessions;
        this.courseStatus = courseStatus;
    }

    public int getCourseId() {
        return courseId;
    }

    public void setCourseId(int courseId) {
        this.courseId = courseId;
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

    @Override
    public String toString() {
        return "CourseAd{" + "courseId=" + courseId + ", courseName=" + courseName + ", description=" + description + ", level=" + level + ", price=" + price + ", rating=" + rating + ", totalSessions=" + totalSessions + ", courseStatus=" + courseStatus + '}';
    }

    
   
    
}
