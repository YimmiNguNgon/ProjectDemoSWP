/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author ADMIN-PC
 */
import java.io.Serializable;
import java.sql.Timestamp;

public class PaymentInfo implements Serializable {

    private int userId;
    private int tutorId;
    private int courseId;
    private String dayOfWeek;
    private Timestamp startTime;
    private Timestamp endTime;

    public PaymentInfo(int userId, int tutorId, int courseId, String dayOfWeek, Timestamp startTime, Timestamp endTime) {
        this.userId = userId;
        this.tutorId = tutorId;
        this.courseId = courseId;
        this.dayOfWeek = dayOfWeek;
        this.startTime = startTime;
        this.endTime = endTime;
    }

    public int getUserId() {
        return userId;
    }

    public int getTutorId() {
        return tutorId;
    }

    public int getCourseId() {
        return courseId;
    }

    public String getDayOfWeek() {
        return dayOfWeek;
    }

    public Timestamp getStartTime() {
        return startTime;
    }

    public Timestamp getEndTime() {
        return endTime;
    }
}
