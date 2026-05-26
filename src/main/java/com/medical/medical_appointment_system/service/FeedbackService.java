package com.medical.medical_appointment_system.service;

import com.medical.medical_appointment_system.model.Feedback;
import com.medical.medical_appointment_system.util.FileHandler;

import java.util.List;

public class FeedbackService extends CrudService<Feedback> {
    public FeedbackService() {
        super("feedback.txt", new FeedbackMapper());
    }

    private static class FeedbackMapper implements EntityMapper<Feedback> {
        public Feedback fromLine(String line) {
            List<String> p = FileHandler.split(line);
            if (p.size() < 5) {
                return null;
            }
            return new Feedback(Long.parseLong(p.get(0)), p.get(1), Integer.parseInt(p.get(2)), p.get(3), p.get(4));
        }

        public String toLine(Feedback feedback) {
            return feedback.getId() + "|" + FileHandler.escape(feedback.getPatientName()) + "|" +
                    feedback.getRating() + "|" + FileHandler.escape(feedback.getComment()) + "|" +
                    FileHandler.escape(feedback.getReviewDate());
        }
    }
}
