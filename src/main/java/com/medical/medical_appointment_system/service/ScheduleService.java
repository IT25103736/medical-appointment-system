package com.medical.medical_appointment_system.service;

import com.medical.medical_appointment_system.model.DoctorSchedule;
import com.medical.medical_appointment_system.util.FileHandler;

import java.io.IOException;
import java.util.List;

public class ScheduleService extends CrudService<DoctorSchedule> {
    public ScheduleService() {
        super("schedules.txt", new ScheduleMapper());
    }

    @Override
    public List<DoctorSchedule> getAll() throws IOException {
        List<DoctorSchedule> schedules = super.getAll();
        bubbleSortByDateTime(schedules);
        return schedules;
    }

    private void bubbleSortByDateTime(List<DoctorSchedule> schedules) {
        for (int i = 0; i < schedules.size() - 1; i++) {
            for (int j = 0; j < schedules.size() - i - 1; j++) {
                String left = schedules.get(j).getScheduleDate() + " " + schedules.get(j).getStartTime();
                String right = schedules.get(j + 1).getScheduleDate() + " " + schedules.get(j + 1).getStartTime();
                if (left.compareTo(right) > 0) {
                    DoctorSchedule temp = schedules.get(j);
                    schedules.set(j, schedules.get(j + 1));
                    schedules.set(j + 1, temp);
                }
            }
        }
    }

    private static class ScheduleMapper implements EntityMapper<DoctorSchedule> {
        public DoctorSchedule fromLine(String line) {
            List<String> p = FileHandler.split(line);
            if (p.size() < 6) {
                return null;
            }
            return new DoctorSchedule(Long.parseLong(p.get(0)), p.get(1), p.get(2), p.get(3), p.get(4), p.get(5));
        }

        public String toLine(DoctorSchedule schedule) {
            return schedule.getId() + "|" + FileHandler.escape(schedule.getDoctorName()) + "|" +
                    FileHandler.escape(schedule.getSpecialty()) + "|" + FileHandler.escape(schedule.getScheduleDate()) + "|" +
                    FileHandler.escape(schedule.getStartTime()) + "|" + FileHandler.escape(schedule.getEndTime());
        }
    }
}
