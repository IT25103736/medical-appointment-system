package com.medical.medical_appointment_system.service;

import com.medical.medical_appointment_system.model.Patient;
import com.medical.medical_appointment_system.util.FileHandler;

import java.io.IOException;
import java.util.List;

public class PatientService extends CrudService<Patient> {
    public PatientService() {
        super("patients.txt", new PatientMapper());
    }

    public List<Patient> getAllPatients() throws IOException {
        return getAll();
    }

    public void addPatient(Patient patient) throws IOException {
        add(patient, System::currentTimeMillis);
    }

    public boolean updatePatient(long id, Patient updated) throws IOException {
        return update(id, updated);
    }

    public boolean deletePatient(long id) throws IOException {
        return delete(id);
    }

    private static class PatientMapper implements EntityMapper<Patient> {
        public Patient fromLine(String line) {
            List<String> p = FileHandler.split(line);
            if (p.size() < 4) {
                return null;
            }
            return new Patient(Long.parseLong(p.get(0)), p.get(1), p.get(2), p.get(3));
        }

        public String toLine(Patient patient) {
            return patient.getId() + "|" + FileHandler.escape(patient.getName()) + "|" +
                    FileHandler.escape(patient.getContact()) + "|" + FileHandler.escape(patient.getAddress());
        }
    }
}
