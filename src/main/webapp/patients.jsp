<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="true" %>
<%@ include file="WEB-INF/jsp/auth.jspf" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Patient Management</title>
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

<main class="max-w-6xl mx-auto p-4 sm:p-6 lg:p-8">
    <div class="bg-white rounded-2xl border border-slate-100 shadow-sm overflow-hidden">

        <!-- Header Banner Section -->
        <div class="p-6 bg-gradient-to-r from-slate-900 via-green-950 to-slate-900 border-b border-slate-200 text-white flex flex-col sm:flex-row sm:items-center sm:justify-between gap-4">
            <div>
                <h1 class="text-xl font-bold tracking-tight">Patient Information Directory</h1>
                <p class="text-slate-400 text-xs mt-0.5">Maintain, record, and update clinical demographic profiles.</p>
            </div>
        </div>

        <!-- Form Section -->
        <div class="p-6 bg-slate-50/60 border-b border-slate-100">
            <h2 class="text-xs font-semibold uppercase tracking-wider text-slate-400 mb-3">Add / Modify Patient Record</h2>
            <div class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-3">
                <input id="name" placeholder="Full Name"
                    class="bg-white border border-slate-200 px-3 py-2.5 rounded-xl text-sm focus:outline-none focus:ring-2 focus:ring-indigo-500/20 focus:border-indigo-500 transition-all placeholder:text-slate-400">
                <div class="flex flex-col gap-1">
                    <input id="contact" placeholder="Contact Number" maxlength="10"
                        class="bg-white border border-slate-200 px-3 py-2.5 rounded-xl text-sm focus:outline-none focus:ring-2 focus:ring-indigo-500/20 focus:border-indigo-500 transition-all placeholder:text-slate-400">
                    <span id="contactError" class="text-rose-500 text-xs hidden">Must be exactly 10 digits.</span>
                </div>
                <input id="address" placeholder="Residential Address"
                    class="bg-white border border-slate-200 px-3 py-2.5 rounded-xl text-sm focus:outline-none focus:ring-2 focus:ring-indigo-500/20 focus:border-indigo-500 transition-all placeholder:text-slate-400">
                <button onclick="saveRecord()" id="submitBtn"
                    class="bg-indigo-600 hover:bg-indigo-700 text-white font-medium rounded-xl text-sm px-4 py-2.5 shadow-sm transition-all flex items-center justify-center gap-1">
                    Add Record
                </button>
            </div>
        </div>

        <!-- Table View Section -->
        <div class="p-0">
            <div class="overflow-x-auto">
                <table class="w-full text-left border-collapse min-w-[700px]">
                    <thead>
                        <tr class="bg-slate-50 border-b border-slate-100">
                            <th class="p-4 text-xs font-semibold uppercase tracking-wider text-slate-500">Name</th>
                            <th class="p-4 text-xs font-semibold uppercase tracking-wider text-slate-500">Contact</th>
                            <th class="p-4 text-xs font-semibold uppercase tracking-wider text-slate-500">Address</th>
                            <th class="p-4 text-xs font-semibold uppercase tracking-wider text-slate-500 text-right pr-6">Actions</th>
                        </tr>
                    </thead>
                    <tbody id="tableBody" class="divide-y divide-slate-100 bg-white">
                        <!-- Dynamic Records Rendered Here -->
                    </tbody>
                </table>
            </div>
        </div>

    </div>
</main>

<script>
const API = "<%= request.getContextPath() %>/patients";
let editId = null;
const q = id => document.getElementById(id);
function esc(v){ return String(v || '').replaceAll("'", "\\'"); }

function loadRecords(){
    fetch(API).then(r => r.json()).then(displayRecords).catch(() => alert("Error loading patients"));
}

function displayRecords(data){
    q("tableBody").innerHTML = "";
    data.forEach(p => {
        q("tableBody").innerHTML += `
        <tr class="hover:bg-slate-50/80 transition-colors group">
            <td class="p-4 text-sm font-medium text-slate-900">${p.name || ''}</td>
            <td class="p-4 text-sm text-slate-600">${p.contact || ''}</td>
            <td class="p-4 text-sm text-slate-500">${p.address || ''}</td>
            <td class="p-4 text-sm text-right pr-6">
                <div class="inline-flex gap-1.5">
                    <button onclick="editRecord(${p.id}, '${esc(p.name)}', '${esc(p.contact)}', '${esc(p.address)}')"
                        class="bg-slate-100 hover:bg-indigo-50 text-slate-700 hover:text-indigo-600 font-medium text-xs px-3 py-1.5 rounded-lg transition-colors">
                        Edit
                    </button>
                    <button onclick="deleteRecord(${p.id})"
                        class="bg-slate-100 hover:bg-rose-50 text-slate-600 hover:text-rose-600 font-medium text-xs px-3 py-1.5 rounded-lg transition-colors">
                        Delete
                    </button>
                </div>
            </td>
        </tr>`;
    });
}

function validateContact(value) {
    return /^\d{10}$/.test(value);
}

function saveRecord(){
    const data = {
        id: editId || Date.now(),
        name: q("name").value.trim(),
        contact: q("contact").value.trim(),
        address: q("address").value.trim()
    };

    if(!data.name || !data.contact || !data.address){
        alert("All fields are required!");
        return;
    }

    if(!validateContact(data.contact)){
        q("contact").classList.add("border-rose-400", "focus:border-rose-400");
        q("contactError").classList.remove("hidden");
        q("contact").focus();
        return;
    }

    // clear error if valid
    q("contact").classList.remove("border-rose-400", "focus:border-rose-400");
    q("contactError").classList.add("hidden");

    fetch(editId ? API + "/" + editId : API, {
        method: editId ? "PUT" : "POST",
        headers: {"Content-Type": "application/json"},
        body: JSON.stringify(data)
    })
    .then(() => {
        alert(editId ? "Patient updated successfully!" : "Patient added successfully!");
        resetForm();
        loadRecords();
    })
    .catch(() => alert("Save failed"));
}

function editRecord(id, n, c, a){
    editId = id;
    q("name").value = n;
    q("contact").value = c;
    q("address").value = a;
    q("submitBtn").innerText = "Update Record";
    q("submitBtn").classList.remove('bg-indigo-600', 'hover:bg-indigo-700');
    q("submitBtn").classList.add('bg-blue-600', 'hover:bg-blue-700');
    q("name").focus();
}

function deleteRecord(id){
    if(confirm("Are you sure you want to delete this patient?"))
        fetch(API + "/" + id, {method: "DELETE"}).then(loadRecords);
}

function resetForm(){
    editId = null;
    q("name").value = "";
    q("contact").value = "";
    q("address").value = "";
    q("contactError").classList.add("hidden");
    q("contact").classList.remove("border-rose-400", "focus:border-rose-400");
    q("submitBtn").innerText = "Add Record";
    q("submitBtn").classList.remove('bg-blue-600', 'hover:bg-blue-700');
    q("submitBtn").classList.add('bg-indigo-600', 'hover:bg-indigo-700');
}

// live validation as user types
q("contact").addEventListener("input", function(){
    if(this.value.length > 0 && !validateContact(this.value)){
        this.classList.add("border-rose-400");
        q("contactError").classList.remove("hidden");
    } else {
        this.classList.remove("border-rose-400");
        q("contactError").classList.add("hidden");
    }
});

loadRecords();
</script>
</body>
</html>
