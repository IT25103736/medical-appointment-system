package com.medical.medical_appointment_system.model;

public class Appointment implements Identifiable {
    private long id;
    private String patientName;
    private String doctorName;
    private String appointmentDate;
    private String appointmentTime;
    private String urgency;
    private String reason;

    public Appointment() {}

    public Appointment(long id, String patientName, String doctorName, String appointmentDate,
                       String appointmentTime, String urgency, String reason) {
        this.id = id;
        this.patientName = patientName;
        this.doctorName = doctorName;
        this.appointmentDate = appointmentDate;
        this.appointmentTime = appointmentTime;
        this.urgency = urgency;
        this.reason = reason;
    }

    public long getId() { return id; }
    public void setId(long id) { this.id = id; }

    public String getPatientName() { return patientName; }
    public void setPatientName(String patientName) { this.patientName = patientName; }

    public String getDoctorName() { return doctorName; }
    public void setDoctorName(String doctorName) { this.doctorName = doctorName; }

    public String getAppointmentDate() { return appointmentDate; }
    public void setAppointmentDate(String appointmentDate) { this.appointmentDate = appointmentDate; }

    public String getAppointmentTime() { return appointmentTime; }
    public void setAppointmentTime(String appointmentTime) { this.appointmentTime = appointmentTime; }

    public String getUrgency() { return urgency; }
    public void setUrgency(String urgency) { this.urgency = urgency; }

    public String getReason() { return reason; }
    public void setReason(String reason) { this.reason = reason; }
}
