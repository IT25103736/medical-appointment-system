package com.medical.medical_appointment_system.controller;

import com.medical.medical_appointment_system.model.Feedback;
import com.medical.medical_appointment_system.service.FeedbackService;

public class FeedbackController extends AbstractCrudServlet<Feedback> {
    public FeedbackController() {
        super(new FeedbackService(), Feedback.class, "Feedback");
    }
}
