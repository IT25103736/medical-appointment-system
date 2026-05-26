<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
    <style>
        body { font-family: 'Inter', sans-serif; }
    </style>
</head>
<body class="bg-slate-50 min-h-screen flex items-center justify-center p-4 text-slate-800 antialiased">

<div class="w-full max-w-md bg-white rounded-2xl border border-slate-100 shadow-xl overflow-hidden">

    <!-- Branding Accent Banner -->
    <div class="p-6 bg-gradient-to-r from-slate-900 via-green-950 to-slate-900 text-white text-center">
        <h1 class="text-xl font-bold tracking-tight sm:text-2xl">Medical Appointment</h1>
        <p class="text-indigo-300 text-xs mt-1 font-medium uppercase tracking-wider">Scheduling System Access Portal</p>
    </div>

    <div class="p-6 sm:p-8 space-y-6">

        <!-- Server Error Notification -->
        <% if (request.getAttribute("error") != null) { %>
            <div class="bg-rose-50 border border-rose-100 text-rose-700 text-sm px-4 py-3 rounded-xl flex items-start gap-2.5">
                <span class="text-base font-bold select-none leading-none mt-0.5">⚠️</span>
                <div><%= request.getAttribute("error") %></div>
            </div>
        <% } %>

        <!-- Login Form -->
        <form action="<%= request.getContextPath() %>/login" method="post" class="space-y-4">
            <div>
                <label class="block text-xs font-semibold uppercase tracking-wider text-slate-500 mb-1.5">User Identity</label>
                <input name="username" placeholder="Enter your username" class="bg-white border border-slate-200 px-3 py-3 rounded-xl text-sm w-full focus:outline-none focus:ring-2 focus:ring-indigo-500/20 focus:border-indigo-500 transition-all placeholder:text-slate-400" required>
            </div>

            <div>
                <label class="block text-xs font-semibold uppercase tracking-wider text-slate-500 mb-1.5">Security Credentials</label>
                <input name="password" type="password" placeholder="••••••••" class="bg-white border border-slate-200 px-3 py-3 rounded-xl text-sm w-full focus:outline-none focus:ring-2 focus:ring-indigo-500/20 focus:border-indigo-500 transition-all placeholder:text-slate-300 tracking-widest" required>
            </div>

            <button class="bg-indigo-600 hover:bg-indigo-700 text-white rounded-xl w-full py-3 text-sm font-semibold shadow-sm transition-all mt-2">
                Sign In to Account
            </button>
        </form>

        <!-- Development Environment Notice Block -->
        <div class="border-t border-slate-100 pt-4">
            <div class="bg-slate-50 border border-slate-200/60 rounded-xl p-3 text-center">
                <p class="text-[11px] font-semibold text-slate-400 uppercase tracking-wider mb-1"> Debug Credentials</p>
                <code class="text-xs text-slate-600 font-mono bg-white px-2 py-1 rounded border border-slate-100 shadow-2xs">
                    username: <span class="text-indigo-600 font-semibold">admin</span> &nbsp;|&nbsp; password: <span class="text-indigo-600 font-semibold">admin123</span>
                </code>
            </div>
        </div>

    </div>
</div>

</body>
</html>