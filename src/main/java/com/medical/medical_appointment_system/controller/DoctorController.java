package com.medical.medical_appointment_system.controller;

import com.medical.medical_appointment_system.model.Doctor;
import com.medical.medical_appointment_system.service.DoctorService;

public class DoctorController extends AbstractCrudServlet<Doctor> {
    public DoctorController() {
        super(new DoctorService(), Doctor.class, "Doctor");
    }
}
