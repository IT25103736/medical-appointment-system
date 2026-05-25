package com.medical.medical_appointment_system.model;

public class Doctor implements Identifiable {
    private long id;
    private String name;
    private String specialization;
    private String contact;
    private String room;

    public Doctor() {}

    public Doctor(long id, String name, String specialization, String contact, String room) {
        this.id = id;
        this.name = name;
        this.specialization = specialization;
        this.contact = contact;
        this.room = room;
    }

    public long getId() { return id; }
    public void setId(long id) { this.id = id; }

    public String getName() { return name; }
    public void setName(String name) { this.name = name; }

    public String getSpecialization() { return specialization; }
    public void setSpecialization(String specialization) { this.specialization = specialization; }

    public String getContact() { return contact; }
    public void setContact(String contact) { this.contact = contact; }

    public String getRoom() { return room; }
    public void setRoom(String room) { this.room = room; }
}
