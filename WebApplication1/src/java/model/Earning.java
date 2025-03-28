/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author admin
 */
public class Earning {
    int EarningID, TutorID, PaymentID, CourseID;
    double Amount;
    String Status;

    public Earning() {
    }

    public Earning(int EarningID, int TutorID, int PaymentID, int CourseID, double Amount, String Status) {
        this.EarningID = EarningID;
        this.TutorID = TutorID;
        this.PaymentID = PaymentID;
        this.CourseID = CourseID;
        this.Amount = Amount;
        this.Status = Status;
    }

    public String getStatus() {
        return Status;
    }

    public void setStatus(String Status) {
        this.Status = Status;
    }

    public int getEarningID() {
        return EarningID;
    }

    public void setEarningID(int EarningID) {
        this.EarningID = EarningID;
    }

    public int getTutorID() {
        return TutorID;
    }

    public void setTutorID(int TutorID) {
        this.TutorID = TutorID;
    }

    public int getPaymentID() {
        return PaymentID;
    }

    public void setPaymentID(int PaymentID) {
        this.PaymentID = PaymentID;
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
        return "Eearning{" + "EarningID=" + EarningID + ", TutorID=" + TutorID + ", PaymentID=" + PaymentID + ", CourseID=" + CourseID + ", Amount=" + Amount + '}';
    }
}
