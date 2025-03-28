/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author Admin
 */
public class Tutor1 {
    private int tutorID;
    private int userID;
    private String education;
    private String experience;
    private double hourlyRate;
    private boolean verified;

    public Tutor1() {
    }

    public Tutor1(int tutorID, int userID, String education, String experience, double hourlyRate, boolean verified) {
        this.tutorID = tutorID;
        this.userID = userID;
        this.education = education;
        this.experience = experience;
        this.hourlyRate = hourlyRate;
        this.verified = verified;
    }

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
        return "Tutor1{" + "tutorID=" + tutorID + ", userID=" + userID + ", education=" + education + ", experience=" + experience + ", hourlyRate=" + hourlyRate + ", verified=" + verified + '}';
    }
    
    
}
