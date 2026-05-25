package com.medical.medical_appointment_system.controller;

import com.medical.medical_appointment_system.model.Admin;
import com.medical.medical_appointment_system.service.AdminService;

public class AdminController extends AbstractCrudServlet<Admin> {
    public AdminController() {
        super(new AdminService(), Admin.class, "Admin");
    }
}
