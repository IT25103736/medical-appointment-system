package com.medical.medical_appointment_system.controller;

import jakarta.servlet.*;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

public class AuthFilter implements Filter {
    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain chain)
            throws IOException, ServletException {
        HttpServletRequest request = (HttpServletRequest) servletRequest;
        HttpServletResponse response = (HttpServletResponse) servletResponse;
        String path = request.getServletPath();

        boolean publicPage = path.equals("/login.jsp") || path.equals("/login");
        boolean apiRequest = path.startsWith("/patients") || path.startsWith("/appointments") ||
                path.startsWith("/schedules") || path.startsWith("/doctors") ||
                path.startsWith("/feedback") || path.startsWith("/admins");

        HttpSession session = request.getSession(false);
        boolean loggedIn = session != null && session.getAttribute("loggedUser") != null;

        if (loggedIn || publicPage || apiRequest) {
            chain.doFilter(servletRequest, servletResponse);
            return;
        }

        response.sendRedirect(request.getContextPath() + "/login.jsp");
    }
}
