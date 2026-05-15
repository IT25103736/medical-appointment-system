<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="true" %>
<%@ include file="WEB-INF/jsp/auth.jspf" %>
<!DOCTYPE html>
<html>
<head><title>Appointment Management</title><script src="https://cdn.tailwindcss.com"></script></head>
<body class="bg-gray-100 min-h-screen">
<%@ include file="WEB-INF/jsp/nav.jspf" %>
<main class="max-w-7xl mx-auto p-4 sm:p-6"><div class="bg-white p-6 rounded-xl shadow">
<h1 class="text-2xl font-bold mb-4">Appointment Management</h1>
<div class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 xl:grid-cols-7 gap-2 mb-4">
    <input id="patientName" placeholder="Patient Name" class="border p-2 rounded">
    <input id="doctorName" placeholder="Doctor Name" class="border p-2 rounded">
    <input id="appointmentDate" type="date" class="border p-2 rounded">
    <input id="appointmentTime" type="time" class="border p-2 rounded">
    <select id="urgency" class="border p-2 rounded"><option>Low</option><option>Medium</option><option>High</option><option>Critical</option></select>
    <input id="reason" placeholder="Reason" class="border p-2 rounded">
    <button onclick="saveRecord()" id="submitBtn" class="bg-blue-500 text-white rounded px-4">Book</button>
</div>
<div class="overflow-x-auto"><table class="w-full border text-sm min-w-[900px]"><thead class="bg-gray-200"><tr><th class="p-2">Patient</th><th>Doctor</th><th>Date</th><th>Time</th><th>Urgency</th><th>Reason</th><th>Actions</th></tr></thead><tbody id="tableBody"></tbody></table></div>
</div></main>
<script>
const API="<%= request.getContextPath() %>/appointments"; let editId=null; const q=id=>document.getElementById(id); const esc=v=>String(v||'').replaceAll("'","\\'");
function loadRecords(){fetch(API).then(r=>r.json()).then(displayRecords);}
function displayRecords(data){tableBody.innerHTML=""; data.forEach(a=>tableBody.innerHTML+=`<tr class="border"><td class="p-2">${a.patientName||''}</td><td>${a.doctorName||''}</td><td>${a.appointmentDate||''}</td><td>${a.appointmentTime||''}</td><td>${a.urgency||''}</td><td>${a.reason||''}</td><td><button class="bg-yellow-400 px-2 rounded" onclick="editRecord(${a.id},'${esc(a.patientName)}','${esc(a.doctorName)}','${esc(a.appointmentDate)}','${esc(a.appointmentTime)}','${esc(a.urgency)}','${esc(a.reason)}')">Edit</button> <button class="bg-red-500 text-white px-2 rounded" onclick="deleteRecord(${a.id})">Cancel</button></td></tr>`);}
function saveRecord(){const data={id:editId||Date.now(),patientName:q('patientName').value.trim(),doctorName:q('doctorName').value.trim(),appointmentDate:q('appointmentDate').value,appointmentTime:q('appointmentTime').value,urgency:q('urgency').value,reason:q('reason').value.trim()}; if(!data.patientName||!data.doctorName||!data.appointmentDate||!data.appointmentTime){alert("Required fields missing!");return;} fetch(editId?API+"/"+editId:API,{method:editId?"PUT":"POST",headers:{"Content-Type":"application/json"},body:JSON.stringify(data)}).then(()=>{alert(editId?"Appointment updated!":"Appointment booked!");resetForm();loadRecords();});}
function editRecord(id,p,d,da,t,u,r){editId=id; q('patientName').value=p; q('doctorName').value=d; q('appointmentDate').value=da; q('appointmentTime').value=t; q('urgency').value=u; q('reason').value=r; submitBtn.innerText="Update";}
function deleteRecord(id){if(confirm("Cancel or remove this appointment?"))fetch(API+"/"+id,{method:"DELETE"}).then(loadRecords);}
function resetForm(){editId=null; ['patientName','doctorName','appointmentDate','appointmentTime','reason'].forEach(id=>q(id).value=''); q('urgency').value='Low'; submitBtn.innerText='Book';}
loadRecords();
</script></body></html>
