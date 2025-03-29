/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.sql.Time;

/**
 *
 * @author Huy
 */
public class Schedule1 {
    private int scheduleID;
    private int tutorID;
    private int studentID;
    private String dayOfWeek;
    private Time startTime;
    private Time endTime;

    public Schedule1(int scheduleID, int tutorID, int studentID, String dayOfWeek, Time startTime, Time endTime) {
        this.scheduleID = scheduleID;
        this.tutorID = tutorID;
        this.studentID = studentID;
        this.dayOfWeek = dayOfWeek;
        this.startTime = startTime;
        this.endTime = endTime;
    }

    public Schedule1() {
    }

    public int getScheduleID() {
        return scheduleID;
    }

    public int getTutorID() {
        return tutorID;
    }

    public int getStudentID() {
        return studentID;
    }

    public String getDayOfWeek() {
        return dayOfWeek;
    }

    public Time getStartTime() {
        return startTime;
    }

    public Time getEndTime() {
        return endTime;
    }

    public void setScheduleID(int scheduleID) {
        this.scheduleID = scheduleID;
    }

    public void setTutorID(int tutorID) {
        this.tutorID = tutorID;
    }

    public void setStudentID(int studentID) {
        this.studentID = studentID;
    }

    public void setDayOfWeek(String dayOfWeek) {
        this.dayOfWeek = dayOfWeek;
    }

    public void setStartTime(Time startTime) {
        this.startTime = startTime;
    }

    public void setEndTime(Time endTime) {
        this.endTime = endTime;
    }
    
    
}
