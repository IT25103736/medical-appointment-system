<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Login</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-100 min-h-screen flex items-center justify-center p-4">
<div class="bg-white w-full max-w-md p-6 sm:p-8 rounded-xl shadow">
    <h1 class="text-xl sm:text-2xl font-bold text-center mb-2">Medical Appointment</h1>
    <p class="text-center text-gray-500 mb-6">Scheduling System Login</p>
    <% if (request.getAttribute("error") != null) { %>
        <div class="bg-red-100 text-red-700 p-3 rounded mb-4"><%= request.getAttribute("error") %></div>
    <% } %>
    <form action="<%= request.getContextPath() %>/login" method="post" class="space-y-4">
        <input name="username" placeholder="Username" class="border p-3 rounded w-full" required>
        <input name="password" type="password" placeholder="Password" class="border p-3 rounded w-full" required>
        <button class="bg-blue-600 text-white rounded w-full py-3 font-semibold">Login</button>
    </form>
    <p class="text-xs text-gray-500 mt-4 text-center">Username: admin | Password: admin123</p>
</div>
</body>
</html>
