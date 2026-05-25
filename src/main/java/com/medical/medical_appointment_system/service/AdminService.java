package com.medical.medical_appointment_system.service;

import com.medical.medical_appointment_system.model.Admin;
import com.medical.medical_appointment_system.util.FileHandler;

import java.util.List;

public class AdminService extends CrudService<Admin> {
    public AdminService() {
        super("admins.txt", new AdminMapper());
    }

    private static class AdminMapper implements EntityMapper<Admin> {
        public Admin fromLine(String line) {
            List<String> p = FileHandler.split(line);
            if (p.size() < 5) {
                return null;
            }
            return new Admin(Long.parseLong(p.get(0)), p.get(1), p.get(2), p.get(3), p.get(4));
        }

        public String toLine(Admin admin) {
            return admin.getId() + "|" + FileHandler.escape(admin.getUsername()) + "|" +
                    FileHandler.escape(admin.getFullName()) + "|" + FileHandler.escape(admin.getEmail()) + "|" +
                    FileHandler.escape(admin.getRole());
        }
    }
}
