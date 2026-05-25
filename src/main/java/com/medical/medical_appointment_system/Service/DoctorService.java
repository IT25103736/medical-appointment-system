package com.medical.medical_appointment_system.service;

import com.medical.medical_appointment_system.model.Doctor;
import com.medical.medical_appointment_system.util.FileHandler;

import java.util.List;

public class DoctorService extends CrudService<Doctor> {
    public DoctorService() {
        super("doctors.txt", new DoctorMapper());
    }

    private static class DoctorMapper implements EntityMapper<Doctor> {
        public Doctor fromLine(String line) {
            List<String> p = FileHandler.split(line);
            if (p.size() < 5) {
                return null;
            }
            return new Doctor(Long.parseLong(p.get(0)), p.get(1), p.get(2), p.get(3), p.get(4));
        }

        public String toLine(Doctor doctor) {
            return doctor.getId() + "|" + FileHandler.escape(doctor.getName()) + "|" +
                    FileHandler.escape(doctor.getSpecialization()) + "|" + FileHandler.escape(doctor.getContact()) + "|" +
                    FileHandler.escape(doctor.getRoom());
        }
    }
}
