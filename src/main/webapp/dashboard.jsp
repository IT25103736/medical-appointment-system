<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="WEB-INF/jsp/auth.jspf" %>
<!DOCTYPE html>
<html>
<head>
    <title>Dashboard</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-100 min-h-screen">
<%@ include file="WEB-INF/jsp/nav.jspf" %>
<main class="max-w-7xl mx-auto p-4 sm:p-6">
    <div class="bg-white p-6 rounded-xl shadow mb-6">
        <h1 class="text-2xl font-bold mb-2">Dashboard</h1>
        <p class="text-gray-600">Manage all medical appointment scheduling modules from one place.</p>
    </div>
    <div class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-4">
        <a class="bg-white p-6 rounded-xl shadow hover:shadow-md" href="patients.jsp"><h2 class="font-bold text-lg">Patient Management</h2><p class="text-gray-500">Add, view, update, and delete patient details.</p></a>
        <a class="bg-white p-6 rounded-xl shadow hover:shadow-md" href="appointments.jsp"><h2 class="font-bold text-lg">Appointment Management</h2><p class="text-gray-500">Book, view, update, and cancel appointments.</p></a>
        <a class="bg-white p-6 rounded-xl shadow hover:shadow-md" href="schedules.jsp"><h2 class="font-bold text-lg">Schedule Management</h2><p class="text-gray-500">Maintain doctor schedules by date and time.</p></a>
        <a class="bg-white p-6 rounded-xl shadow hover:shadow-md" href="doctors.jsp"><h2 class="font-bold text-lg">Doctor Management</h2><p class="text-gray-500">Create, view, update, and delete doctors.</p></a>
        <a class="bg-white p-6 rounded-xl shadow hover:shadow-md" href="feedback.jsp"><h2 class="font-bold text-lg">Feedback & Review Management</h2><p class="text-gray-500">Submit, view, update, and delete feedbacks.</p></a>
        <a class="bg-white p-6 rounded-xl shadow hover:shadow-md" href="admins.jsp"><h2 class="font-bold text-lg">Admin Management</h2><p class="text-gray-500">Register, view, update, and remove admins.</p></a>
    </div>
</main>
</body>
</html>
