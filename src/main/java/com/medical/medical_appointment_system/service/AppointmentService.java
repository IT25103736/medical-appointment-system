package com.medical.medical_appointment_system.service;

import com.medical.medical_appointment_system.model.Appointment;
import com.medical.medical_appointment_system.util.FileHandler;

import java.io.IOException;
import java.util.Comparator;
import java.util.List;

public class AppointmentService extends CrudService<Appointment> {
    public AppointmentService() {
        super("appointments.txt", new AppointmentMapper());
    }

    @Override
    public List<Appointment> getAll() throws IOException {
        List<Appointment> appointments = super.getAll();
        appointments.sort(Comparator
                .comparingInt((Appointment appointment) -> urgencyRank(appointment.getUrgency()))
                .thenComparing(Appointment::getAppointmentDate, Comparator.nullsLast(String::compareTo))
                .thenComparing(Appointment::getAppointmentTime, Comparator.nullsLast(String::compareTo)));
        return appointments;
    }

    private static int urgencyRank(String urgency) {
        if (urgency == null) {
            return 3;
        }
        return switch (urgency.trim().toLowerCase()) {
            case "critical", "emergency", "high" -> 0;
            case "medium", "normal" -> 1;
            case "low" -> 2;
            default -> 3;
        };
    }

    private static class AppointmentMapper implements EntityMapper<Appointment> {
        public Appointment fromLine(String line) {
            List<String> p = FileHandler.split(line);
            if (p.size() < 7) {
                return null;
            }
            return new Appointment(Long.parseLong(p.get(0)), p.get(1), p.get(2), p.get(3), p.get(4), p.get(5), p.get(6));
        }

        public String toLine(Appointment appointment) {
            return appointment.getId() + "|" + FileHandler.escape(appointment.getPatientName()) + "|" +
                    FileHandler.escape(appointment.getDoctorName()) + "|" + FileHandler.escape(appointment.getAppointmentDate()) + "|" +
                    FileHandler.escape(appointment.getAppointmentTime()) + "|" + FileHandler.escape(appointment.getUrgency()) + "|" +
                    FileHandler.escape(appointment.getReason());
        }
    }
}
