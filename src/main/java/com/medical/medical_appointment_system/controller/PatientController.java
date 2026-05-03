package com.medical.medical_appointment_system.controller;

import com.medical.medical_appointment_system.model.Patient;
import com.medical.medical_appointment_system.service.PatientService;

public class PatientController extends AbstractCrudServlet<Patient> {
    public PatientController() {
        super(new PatientService(), Patient.class, "Patient");
    }
}
