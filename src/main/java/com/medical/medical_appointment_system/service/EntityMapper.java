package com.medical.medical_appointment_system.service;

public interface EntityMapper<T> {
    T fromLine(String line);
    String toLine(T entity);
}
