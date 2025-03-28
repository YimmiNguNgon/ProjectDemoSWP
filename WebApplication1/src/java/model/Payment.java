/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author admin
 */

public class Payment {
    int PaymentID, StudentID, TutorID, CourseID;
    double Amount;
    String Status;

    public Payment() {
    }

    public Payment(int PaymentID, int StudentID, int TutorID, int CourseID, double Amountm, String Status) {
        this.PaymentID = PaymentID;
        this.StudentID = StudentID;
        this.TutorID = TutorID;
        this.CourseID = CourseID;
        this.Amount = Amount;
        this.Status = Status;
    }

    public int getPaymentID() {
        return PaymentID;
    }

    public String getStatus() {
        return Status;
    }

    public void setStatus(String Status) {
        this.Status = Status;
    }

    public void setPaymentID(int PaymentID) {
        this.PaymentID = PaymentID;
    }

    public int getStudentID() {
        return StudentID;
    }

    public void setStudentID(int StudentID) {
        this.StudentID = StudentID;
    }

    public int getTutorID() {
        return TutorID;
    }

    public void setTutorID(int TutorID) {
        this.TutorID = TutorID;
    }

    public int getCourseID() {
        return CourseID;
    }

    public void setCourseID(int CourseID) {
        this.CourseID = CourseID;
    }

    public double getAmount() {
        return Amount;
    }

    public void setAmount(double Amount) {
        this.Amount = Amount;
    }

    @Override
    public String toString() {
        return "Payment{" + "PaymentID=" + PaymentID + ", StudentID=" + StudentID + ", TutorID=" + TutorID + ", CourseID=" + CourseID + ", Amount=" + Amount + '}';
    }
}
