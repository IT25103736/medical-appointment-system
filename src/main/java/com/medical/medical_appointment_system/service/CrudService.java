package com.medical.medical_appointment_system.service;

import com.medical.medical_appointment_system.model.Identifiable;
import com.medical.medical_appointment_system.util.FileHandler;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;
import java.util.Optional;
import java.util.function.Supplier;

public class CrudService<T extends Identifiable> {
    private final String fileName;
    private final EntityMapper<T> mapper;

    public CrudService(String fileName, EntityMapper<T> mapper) {
        this.fileName = fileName;
        this.mapper = mapper;
    }

    public List<T> getAll() throws IOException {
        List<T> entities = new ArrayList<>();
        for (String line : FileHandler.readFile(fileName)) {
            if (line == null || line.isBlank()) {
                continue;
            }
            T entity = mapper.fromLine(line);
            if (entity != null) {
                entities.add(entity);
            }
        }
        entities.sort(Comparator.comparingLong(Identifiable::getId));
        return entities;
    }

    public Optional<T> getById(long id) throws IOException {
        return getAll().stream().filter(entity -> entity.getId() == id).findFirst();
    }

    public T add(T entity, Supplier<Long> idSupplier) throws IOException {
        if (entity.getId() <= 0) {
            entity.setId(idSupplier.get());
        }
        List<T> entities = getAll();
        entities.removeIf(existing -> existing.getId() == entity.getId());
        entities.add(entity);
        saveAll(entities);
        return entity;
    }

    public boolean update(long id, T updated) throws IOException {
        List<T> entities = getAll();
        boolean found = false;
        for (int i = 0; i < entities.size(); i++) {
            if (entities.get(i).getId() == id) {
                updated.setId(id);
                entities.set(i, updated);
                found = true;
                break;
            }
        }
        if (found) {
            saveAll(entities);
        }
        return found;
    }

    public boolean delete(long id) throws IOException {
        List<T> entities = getAll();
        boolean removed = entities.removeIf(entity -> entity.getId() == id);
        if (removed) {
            saveAll(entities);
        }
        return removed;
    }

    protected void saveAll(List<T> entities) throws IOException {
        List<String> lines = new ArrayList<>();
        for (T entity : entities) {
            lines.add(mapper.toLine(entity));
        }
        FileHandler.writeFile(fileName, lines);
    }
}
