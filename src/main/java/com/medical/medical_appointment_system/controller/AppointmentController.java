package com.medical.medical_appointment_system.controller;

import com.medical.medical_appointment_system.model.Appointment;
import com.medical.medical_appointment_system.service.AppointmentService;

public class AppointmentController extends AbstractCrudServlet<Appointment> {
    public AppointmentController() {
        super(new AppointmentService(), Appointment.class, "Appointment");
    }
}
