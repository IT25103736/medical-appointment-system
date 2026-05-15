package com.medical.medical_appointment_system.model;

public class Feedback implements Identifiable {
    private long id;
    private String patientName;
    private int rating;
    private String comment;
    private String reviewDate;

    public Feedback() {}

    public Feedback(long id, String patientName, int rating, String comment, String reviewDate) {
        this.id = id;
        this.patientName = patientName;
        this.rating = rating;
        this.comment = comment;
        this.reviewDate = reviewDate;
    }

    public long getId() { return id; }
    public void setId(long id) { this.id = id; }

    public String getPatientName() { return patientName; }
    public void setPatientName(String patientName) { this.patientName = patientName; }

    public int getRating() { return rating; }
    public void setRating(int rating) { this.rating = rating; }

    public String getComment() { return comment; }
    public void setComment(String comment) { this.comment = comment; }

    public String getReviewDate() { return reviewDate; }
    public void setReviewDate(String reviewDate) { this.reviewDate = reviewDate; }
}
