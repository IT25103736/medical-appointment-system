<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="WEB-INF/jsp/auth.jspf" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Medical Appointments Dashboard</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
    <style>
        body { font-family: 'Inter', sans-serif; }
    </style>
</head>
<body class="bg-slate-50 min-h-screen text-slate-800 antialiased">
<%@ include file="WEB-INF/jsp/nav.jspf" %>

<main class="max-w-7xl mx-auto p-4 sm:p-6 lg:p-8">
    <!-- Welcome / Header Banner -->
    <div class="relative overflow-hidden bg-gradient-to-r from-green-900 via-slate-900 to-blue-900 p-6 sm:p-8 rounded-2xl shadow-sm mb-8 text-white">
        <div class="absolute right-0 top-0 -mt-4 -mr-4 w-32 h-32 bg-blue-500 opacity-10 rounded-full blur-xl"></div>
        <div class="absolute left-1/3 bottom-0 -mb-8 w-48 h-48 bg-indigo-500 opacity-10 rounded-full blur-2xl"></div>

        <div class="relative z-10 max-w-2xl">

            <h1 class="text-2xl sm:text-3xl font-bold tracking-tight mb-2">Medicare Appointment Scheduler</h1>
            <p class="text-slate-300 text-sm sm:text-base leading-relaxed">
                The administration portal for medical personnel, scheduling optimization, and patient care coordination.
            </p>
        </div>
    </div>

    <!-- Management Modules Grid -->
    <div class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-6">

        <!-- Patient Management -->
        <a class="group bg-white p-6 rounded-2xl border border-slate-100 shadow-sm hover:shadow-md hover:border-indigo-100 transition-all duration-200 flex flex-col justify-between" href="patients.jsp">
            <div>
                <div class="w-12 h-12 rounded-xl bg-blue-50 text-blue-600 flex items-center justify-center mb-4 group-hover:bg-blue-600 group-hover:text-white transition-colors duration-200">
                    <svg class="w-6 h-6" fill="none" stroke="currentColor" stroke-width="2" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" d="M17 20h5v-2a3 3 0 00-5.356-1.857M17 20H7m10 0v-2c0-.656-.126-1.283-.356-1.857M7 20H2v-2a3 3 0 015.356-1.857M7 20v-2c0-.656.126-1.283.356-1.857m0 0a5.002 5.002 0 019.288 0M15 7a3 3 0 11-6 0 3 3 0 016 0zm6 3a2 2 0 11-4 0 2 2 0 014 0zM7 10a2 2 0 11-4 0 2 2 0 014 0z"/></svg>
                </div>
                <h2 class="font-semibold text-slate-900 text-lg group-hover:text-indigo-600 transition-colors duration-200">Patient Management</h2>
                <p class="text-slate-500 text-sm mt-1.5 leading-relaxed">Add, view, update comprehensive patient demographic records.</p>
            </div>
            <div class="mt-4 pt-4 border-t border-slate-50 flex items-center text-xs font-medium text-indigo-600 group-hover:translate-x-1 transition-transform duration-200">
                Open Directory &rarr;
            </div>
        </a>

        <!-- Appointment Management -->
        <a class="group bg-white p-6 rounded-2xl border border-slate-100 shadow-sm hover:shadow-md hover:border-indigo-100 transition-all duration-200 flex flex-col justify-between" href="appointments.jsp">
            <div>
                <div class="w-12 h-12 rounded-xl bg-emerald-50 text-emerald-600 flex items-center justify-center mb-4 group-hover:bg-emerald-600 group-hover:text-white transition-colors duration-200">
                    <svg class="w-6 h-6" fill="none" stroke="currentColor" stroke-width="2" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" d="M8 7V3m8 4V3m-9 8h10M5 21h14a2 2 0 002-2V7a2 2 0 00-2-2H5a2 2 0 00-2 2v12a2 2 0 002 2z"/></svg>
                </div>
                <h2 class="font-semibold text-slate-900 text-lg group-hover:text-indigo-600 transition-colors duration-200">Appointment Management</h2>
                <p class="text-slate-500 text-sm mt-1.5 leading-relaxed">Book, coordinate, modify, and manage real-time patient visitations and cancellations.</p>
            </div>
            <div class="mt-4 pt-4 border-t border-slate-50 flex items-center text-xs font-medium text-indigo-600 group-hover:translate-x-1 transition-transform duration-200">
                Access Calendar &rarr;
            </div>
        </a>

        <!-- Schedule Management -->
        <a class="group bg-white p-6 rounded-2xl border border-slate-100 shadow-sm hover:shadow-md hover:border-indigo-100 transition-all duration-200 flex flex-col justify-between" href="schedules.jsp">
            <div>
                <div class="w-12 h-12 rounded-xl bg-amber-50 text-amber-600 flex items-center justify-center mb-4 group-hover:bg-amber-600 group-hover:text-white transition-colors duration-200">
                    <svg class="w-6 h-6" fill="none" stroke="currentColor" stroke-width="2" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" d="M12 8v4l3 3m6-3a9 9 0 11-18 0 9 9 0 0118 0z"/></svg>
                </div>
                <h2 class="font-semibold text-slate-900 text-lg group-hover:text-indigo-600 transition-colors duration-200">Schedule Management</h2>
                <p class="text-slate-500 text-sm mt-1.5 leading-relaxed">Configure and monitor practitioner availability parameters by shifting dates and precise timelines.</p>
            </div>
            <div class="mt-4 pt-4 border-t border-slate-50 flex items-center text-xs font-medium text-indigo-600 group-hover:translate-x-1 transition-transform duration-200">
                Configure Rosters &rarr;
            </div>
        </a>

        <!-- Doctor Management -->
        <a class="group bg-white p-6 rounded-2xl border border-slate-100 shadow-sm hover:shadow-md hover:border-indigo-100 transition-all duration-200 flex flex-col justify-between" href="doctors.jsp">
            <div>
                <div class="w-12 h-12 rounded-xl bg-indigo-50 text-indigo-600 flex items-center justify-center mb-4 group-hover:bg-indigo-600 group-hover:text-white transition-colors duration-200">
                    <svg class="w-6 h-6" fill="none" stroke="currentColor" stroke-width="2" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" d="M19.428 15.428a2 2 0 00-1.022-.547l-2.387-.477a6 6 0 00-3.86.517l-.318.158a6 6 0 01-3.86.517L6.05 15.21a2 2 0 00-1.806.547M8 4h8l-1 1v5.172a2 2 0 00.586 1.414l5 5c1.26 1.26.367 3.414-1.415 3.414H4.828c-1.782 0-2.674-2.154-1.414-3.414l5-5A2 2 0 009 10.172V5L8 4z"/></svg>
                </div>
                <h2 class="font-semibold text-slate-900 text-lg group-hover:text-indigo-600 transition-colors duration-200">Doctor Management</h2>
                <p class="text-slate-500 text-sm mt-1.5 leading-relaxed">Onboard medical practitioners, manage department assignments, and edit credentials.</p>
            </div>
            <div class="mt-4 pt-4 border-t border-slate-50 flex items-center text-xs font-medium text-indigo-600 group-hover:translate-x-1 transition-transform duration-200">
                Manage Staff &rarr;
            </div>
        </a>

        <!-- Feedback & Review Management -->
        <a class="group bg-white p-6 rounded-2xl border border-slate-100 shadow-sm hover:shadow-md hover:border-indigo-100 transition-all duration-200 flex flex-col justify-between" href="feedback.jsp">
            <div>
                <div class="w-12 h-12 rounded-xl bg-purple-50 text-purple-600 flex items-center justify-center mb-4 group-hover:bg-purple-600 group-hover:text-white transition-colors duration-200">
                    <svg class="w-6 h-6" fill="none" stroke="currentColor" stroke-width="2" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" d="M11.049 2.927c.3-.921 1.603-.921 1.902 0l1.519 4.674a1 1 0 00.95.69h4.915c.969 0 1.371 1.24.588 1.81l-3.976 2.888a1 1 0 00-.363 1.118l1.518 4.674c.3.922-.755 1.688-1.538 1.118l-3.976-2.888a1 1 0 00-1.176 0l-3.976 2.888c-.783.57-1.838-.197-1.538-1.118l1.518-4.674a1 1 0 00-.363-1.118l-3.976-2.888c-.784-.57-.38-1.81.588-1.81h4.914a1 1 0 00.951-.69l1.519-4.674z"/></svg>
                </div>
                <h2 class="font-semibold text-slate-900 text-lg group-hover:text-indigo-600 transition-colors duration-200">Feedback & Reviews</h2>
                <p class="text-slate-500 text-sm mt-1.5 leading-relaxed">Audit patient care experiences, track satisfaction data trends, and evaluate reviews.</p>
            </div>
            <div class="mt-4 pt-4 border-t border-slate-50 flex items-center text-xs font-medium text-indigo-600 group-hover:translate-x-1 transition-transform duration-200">
                View Feedback &rarr;
            </div>
        </a>

        <!-- Admin Management -->
        <a class="group bg-white p-6 rounded-2xl border border-slate-100 shadow-sm hover:shadow-md hover:border-indigo-100 transition-all duration-200 flex flex-col justify-between" href="admins.jsp">
            <div>
                <div class="w-12 h-12 rounded-xl bg-rose-50 text-rose-600 flex items-center justify-center mb-4 group-hover:bg-rose-600 group-hover:text-white transition-colors duration-200">
                    <svg class="w-6 h-6" fill="none" stroke="currentColor" stroke-width="2" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" d="M9 12l2 2 4-4m5.618-4.016A11.955 11.955 0 0112 2.944a11.955 11.955 0 01-8.618 3.04A12.02 12.02 0 003 9c0 5.591 3.824 10.29 9 11.622 5.176-1.332 9-6.03 9-11.622 0-1.042-.133-2.052-.382-3.016z"/></svg>
                </div>
                <h2 class="font-semibold text-slate-900 text-lg group-hover:text-indigo-600 transition-colors duration-200">Admin Management</h2>
                <p class="text-slate-500 text-sm mt-1.5 leading-relaxed">Assign roles, adjust workspace configurations, and audit administrative permissions.</p>
            </div>
            <div class="mt-4 pt-4 border-t border-slate-50 flex items-center text-xs font-medium text-indigo-600 group-hover:translate-x-1 transition-transform duration-200">
                Security & Users &rarr;
            </div>
        </a>

    </div>
</main>
</body>
</html>