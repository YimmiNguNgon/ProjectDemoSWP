/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author Admin
 */
public class Tutor2 {

    private int tutorID;
    private int userID;
    private String name;
    private String email;
    private String phone;
    private String gender;
    private String address;
    private String imageUrl;
    private String education;
    private String experience;
    private double hourlyRate;
    private boolean verified;

    public Tutor2() {
    }

    public Tutor2(int tutorID, int userID, String name, String email, String phone, String gender, String address, String imageUrl, String education, String experience, double hourlyRate, boolean verified) {
        this.tutorID = tutorID;
        this.userID = userID;
        this.name = name;
        this.email = email;
        this.phone = phone;
        this.gender = gender;
        this.address = address;
        this.imageUrl = imageUrl;
        this.education = education;
        this.experience = experience;
        this.hourlyRate = hourlyRate;
        this.verified = verified;
    }

    
    
    
    // Getters và Setters
    public int getTutorID() {
        return tutorID;
    }

    public void setTutorID(int tutorID) {
        this.tutorID = tutorID;
    }

    public int getUserID() {
        return userID;
    }

    public void setUserID(int userID) {
        this.userID = userID;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getImageUrl() {
        return imageUrl;
    }

    public void setImageUrl(String imageUrl) {
        this.imageUrl = imageUrl;
    }

    public String getEducation() {
        return education;
    }

    public void setEducation(String education) {
        this.education = education;
    }

    public String getExperience() {
        return experience;
    }

    public void setExperience(String experience) {
        this.experience = experience;
    }

    public double getHourlyRate() {
        return hourlyRate;
    }

    public void setHourlyRate(double hourlyRate) {
        this.hourlyRate = hourlyRate;
    }

    public boolean isVerified() {
        return verified;
    }

    public void setVerified(boolean verified) {
        this.verified = verified;
    }

    @Override
    public String toString() {
        return "Tutor2{" + "tutorID=" + tutorID + ", userID=" + userID + ", name=" + name + ", email=" + email + ", phone=" + phone + ", gender=" + gender + ", address=" + address + ", imageUrl=" + imageUrl + ", education=" + education + ", experience=" + experience + ", hourlyRate=" + hourlyRate + ", verified=" + verified + '}';
    }
    
    
}
