<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="true" %>
<%@ include file="WEB-INF/jsp/auth.jspf" %>
<!DOCTYPE html>
<html>
<head>
    <title>Patient Management</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-100 min-h-screen">
<%@ include file="WEB-INF/jsp/nav.jspf" %>
<main class="max-w-6xl mx-auto p-4 sm:p-6">
<div class="bg-white p-6 rounded-xl shadow">
    <h1 class="text-2xl font-bold mb-4">Patient Management</h1>
    <div class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-2 mb-4">
        <input id="name" placeholder="Name" class="border p-2 rounded">
        <input id="contact" placeholder="Contact" class="border p-2 rounded">
        <input id="address" placeholder="Address" class="border p-2 rounded">
        <button onclick="saveRecord()" id="submitBtn" class="bg-blue-500 text-white rounded px-4">Add</button>
    </div>
    <div class="overflow-x-auto">
    <table class="w-full border min-w-[700px]">
        <thead class="bg-gray-200"><tr><th class="p-2">Name</th><th>Contact</th><th>Address</th><th>Actions</th></tr></thead>
        <tbody id="tableBody"></tbody>
    </table>
    </div>
</div>
</main>
<script>
const API = "<%= request.getContextPath() %>/patients";
let editId = null;
const q = id => document.getElementById(id);
function esc(v){ return String(v || '').replaceAll("'", "\\'"); }
function loadRecords(){ fetch(API).then(r=>r.json()).then(displayRecords).catch(()=>alert("Error loading patients")); }
function displayRecords(data){
  q("tableBody").innerHTML = "";
  data.forEach(p => q("tableBody").innerHTML += `<tr class="border"><td class="p-2">${p.name||''}</td><td>${p.contact||''}</td><td>${p.address||''}</td><td><button onclick="editRecord(${p.id}, '${esc(p.name)}', '${esc(p.contact)}', '${esc(p.address)}')" class="bg-yellow-400 px-2 rounded">Edit</button> <button onclick="deleteRecord(${p.id})" class="bg-red-500 text-white px-2 rounded">Delete</button></td></tr>`);
}
function saveRecord(){
  const data = {id: editId || Date.now(), name: q("name").value.trim(), contact: q("contact").value.trim(), address: q("address").value.trim()};
  if(!data.name || !data.contact || !data.address){ alert("All fields are required!"); return; }
  fetch(editId ? API + "/" + editId : API, {method: editId ? "PUT" : "POST", headers: {"Content-Type":"application/json"}, body: JSON.stringify(data)})
    .then(()=>{ alert(editId ? "Patient updated successfully!" : "Patient added successfully!"); resetForm(); loadRecords(); }).catch(()=>alert("Save failed"));
}
function editRecord(id, n, c, a){ editId=id; q("name").value=n; q("contact").value=c; q("address").value=a; q("submitBtn").innerText="Update"; }
function deleteRecord(id){ if(confirm("Are you sure you want to delete this patient?")) fetch(API+"/"+id,{method:"DELETE"}).then(loadRecords); }
function resetForm(){ editId=null; q("name").value=""; q("contact").value=""; q("address").value=""; q("submitBtn").innerText="Add"; }
loadRecords();
</script>
</body>
</html>
