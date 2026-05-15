package com.medical.medical_appointment_system.model;

public class DoctorSchedule implements Identifiable {
    private long id;
    private String doctorName;
    private String specialty;
    private String scheduleDate;
    private String startTime;
    private String endTime;

    public DoctorSchedule() {}

    public DoctorSchedule(long id, String doctorName, String specialty, String scheduleDate,
                          String startTime, String endTime) {
        this.id = id;
        this.doctorName = doctorName;
        this.specialty = specialty;
        this.scheduleDate = scheduleDate;
        this.startTime = startTime;
        this.endTime = endTime;
    }

    public long getId() { return id; }
    public void setId(long id) { this.id = id; }

    public String getDoctorName() { return doctorName; }
    public void setDoctorName(String doctorName) { this.doctorName = doctorName; }

    public String getSpecialty() { return specialty; }
    public void setSpecialty(String specialty) { this.specialty = specialty; }

    public String getScheduleDate() { return scheduleDate; }
    public void setScheduleDate(String scheduleDate) { this.scheduleDate = scheduleDate; }

    public String getStartTime() { return startTime; }
    public void setStartTime(String startTime) { this.startTime = startTime; }

    public String getEndTime() { return endTime; }
    public void setEndTime(String endTime) { this.endTime = endTime; }
}
