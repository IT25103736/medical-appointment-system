package com.medical.medical_appointment_system.service;

import com.medical.medical_appointment_system.model.Patient;
import com.medical.medical_appointment_system.util.FileHandler;

import java.io.IOException;
import java.util.*;

public class PatientService {

    public List<Patient> getAllPatients() throws IOException {
        List<String> lines = FileHandler.readFile();
        List<Patient> patients = new ArrayList<>();

        for (String line : lines) {
            String[] p = line.split("\\|");
            patients.add(new Patient(
                    Long.parseLong(p[0]), p[1], p[2], p[3]
            ));
        }
        return patients;
    }

    public void addPatient(Patient patient) throws IOException {
        List<String> lines = FileHandler.readFile();
        lines.add(patient.getId() + "|" + patient.getName() + "|" +
                patient.getContact() + "|" + patient.getAddress());
        FileHandler.writeFile(lines);
    }

    public void updatePatient(long id, Patient updated) throws IOException {
        List<String> lines = FileHandler.readFile();
        List<String> newLines = new ArrayList<>();

        for (String line : lines) {
            String[] p = line.split("\\|");
            if (Long.parseLong(p[0]) == id) {
                newLines.add(updated.getId() + "|" + updated.getName() + "|" +
                        updated.getContact() + "|" + updated.getAddress());
            } else {
                newLines.add(line);
            }
        }
        FileHandler.writeFile(newLines);
    }

    public void deletePatient(long id) throws IOException {
        List<String> lines = FileHandler.readFile();
        List<String> newLines = new ArrayList<>();

        for (String line : lines) {
            String[] p = line.split("\\|");
            if (Long.parseLong(p[0]) != id) {
                newLines.add(line);
            }
        }
        FileHandler.writeFile(newLines);
    }
}