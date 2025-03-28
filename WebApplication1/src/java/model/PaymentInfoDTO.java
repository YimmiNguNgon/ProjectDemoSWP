/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.time.LocalDateTime;

public class PaymentInfoDTO {

    private int paymentId;
    private String studentName;
    private String courseName;
    private double amount;
    private String status;
    private LocalDateTime date;

    public PaymentInfoDTO(int paymentId, String studentName, String courseName, double amount, String status, LocalDateTime date) {
        this.paymentId = paymentId;
        this.studentName = studentName;
        this.courseName = courseName;
        this.amount = amount;
        this.status = status;
        this.date = date;
    }

    public int getPaymentId() {
        return paymentId;
    }

    public String getStudentName() {
        return studentName;
    }

    public String getCourseName() {
        return courseName;
    }

    public double getAmount() {
        return amount;
    }

    public String getStatus() {
        return status;
    }

    public LocalDateTime getDate() {
        return date;
    }
}
