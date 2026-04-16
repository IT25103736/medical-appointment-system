package com.medical.medical_appointment_system.controller;


import com.medical.medical_appointment_system.model.Patient;
import com.medical.medical_appointment_system.service.PatientService;

import org.springframework.web.bind.annotation.*;

import java.io.IOException;
import java.util.List;

@RestController
@RequestMapping("/patients")
@CrossOrigin
public class PatientController {

    private PatientService service = new PatientService();

    @GetMapping
    public List<Patient> getAll() throws IOException {
        return service.getAllPatients();
    }

    @PostMapping
    public void add(@RequestBody Patient p) throws IOException {
        service.addPatient(p);
    }

    @PutMapping("/{id}")
    public void update(@PathVariable long id, @RequestBody Patient p) throws IOException {
        service.updatePatient(id, p);
    }

    @DeleteMapping("/{id}")
    public void delete(@PathVariable long id) throws IOException {
        service.deletePatient(id);
    }
}