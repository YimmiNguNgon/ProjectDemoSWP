/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author Huy
 */
public class Courses {
    private int courseID;
    private String courseName;
    private String description;
    private String level;
    private double price;
    private float rating;
    private String category;

    // Constructor
    public Courses(int courseID, String courseName, String description, String level, double price, float rating, String category) {
        this.courseID = courseID;
        this.courseName = courseName;
        this.description = description;
        this.level = level;
        this.price = price;
        this.rating = rating;
        this.category = category;
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

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    // ToString method
    @Override
    public String toString() {
        return "Course{" +
                "courseID=" + courseID +
                ", courseName='" + courseName + '\'' +
                ", description='" + description + '\'' +
                ", level='" + level + '\'' +
                ", price=" + price +
                ", rating=" + rating +
                ", category='" + category + '\'' +
                '}';
    }
}