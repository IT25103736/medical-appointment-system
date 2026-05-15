package com.medical.medical_appointment_system.controller;

import com.medical.medical_appointment_system.model.DoctorSchedule;
import com.medical.medical_appointment_system.service.ScheduleService;

public class ScheduleController extends AbstractCrudServlet<DoctorSchedule> {
    public ScheduleController() {
        super(new ScheduleService(), DoctorSchedule.class, "Schedule");
    }
}
