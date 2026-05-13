package com.medical.medical_appointment_system.controller;

import com.google.gson.Gson;
import com.medical.medical_appointment_system.model.Identifiable;
import com.medical.medical_appointment_system.service.CrudService;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

public abstract class AbstractCrudServlet<T extends Identifiable> extends HttpServlet {
    private final CrudService<T> service;
    private final Class<T> entityClass;
    private final String entityName;
    private final Gson gson = new Gson();

    protected AbstractCrudServlet(CrudService<T> service, Class<T> entityClass, String entityName) {
        this.service = service;
        this.entityClass = entityClass;
        this.entityName = entityName;
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        writeJson(response, service.getAll());
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        T entity = gson.fromJson(request.getReader(), entityClass);
        service.add(entity, System::currentTimeMillis);
        response.setStatus(HttpServletResponse.SC_CREATED);
        writeJson(response, entity);
    }

    @Override
    protected void doPut(HttpServletRequest request, HttpServletResponse response) throws IOException {
        long id = readId(request);
        T entity = gson.fromJson(request.getReader(), entityClass);
        if (service.update(id, entity)) {
            writeJson(response, entity);
        } else {
            response.sendError(HttpServletResponse.SC_NOT_FOUND, entityName + " not found");
        }
    }

    @Override
    protected void doDelete(HttpServletRequest request, HttpServletResponse response) throws IOException {
        if (service.delete(readId(request))) {
            response.setStatus(HttpServletResponse.SC_NO_CONTENT);
        } else {
            response.sendError(HttpServletResponse.SC_NOT_FOUND, entityName + " not found");
        }
    }

    @Override
    protected void doOptions(HttpServletRequest request, HttpServletResponse response) {
        addCorsHeaders(response);
        response.setStatus(HttpServletResponse.SC_OK);
    }

    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        addCorsHeaders(response);
        super.service(request, response);
    }

    private long readId(HttpServletRequest request) {
        String pathInfo = request.getPathInfo();
        if (pathInfo == null || pathInfo.length() <= 1) {
            throw new IllegalArgumentException("Missing " + entityName + " id");
        }
        return Long.parseLong(pathInfo.substring(1));
    }

    private void writeJson(HttpServletResponse response, Object body) throws IOException {
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(gson.toJson(body));
    }

    private void addCorsHeaders(HttpServletResponse response) {
        response.setHeader("Access-Control-Allow-Origin", "*");
        response.setHeader("Access-Control-Allow-Methods", "GET,POST,PUT,DELETE,OPTIONS");
        response.setHeader("Access-Control-Allow-Headers", "Content-Type");
    }
}
