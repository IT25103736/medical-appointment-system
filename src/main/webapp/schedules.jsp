<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="true" %>
<%@ include file="WEB-INF/jsp/auth.jspf" %>
<!DOCTYPE html><html><head><title>Schedule Management</title><script src="https://cdn.tailwindcss.com"></script></head>
<body class="bg-gray-100 min-h-screen"><%@ include file="WEB-INF/jsp/nav.jspf" %>
<main class="max-w-7xl mx-auto p-4 sm:p-6"><div class="bg-white p-6 rounded-xl shadow"><h1 class="text-2xl font-bold mb-4">Schedule Management</h1>
<div class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 xl:grid-cols-6 gap-2 mb-4"><input id="doctorName" placeholder="Doctor Name" class="border p-2 rounded"><input id="specialty" placeholder="Specialty" class="border p-2 rounded"><input id="scheduleDate" type="date" class="border p-2 rounded"><input id="startTime" type="time" class="border p-2 rounded"><input id="endTime" type="time" class="border p-2 rounded"><button onclick="saveRecord()" id="submitBtn" class="bg-blue-500 text-white rounded px-4 py-2">Add</button></div>
<div class="overflow-x-auto"><table class="w-full border text-sm min-w-[800px]"><thead class="bg-gray-200"><tr><th class="p-2">Doctor</th><th>Specialty</th><th>Date</th><th>Start</th><th>End</th><th>Actions</th></tr></thead><tbody id="tableBody"></tbody></table></div></div></main>
<script>
const API="<%= request.getContextPath() %>/schedules"; let editId=null; const q=id=>document.getElementById(id); const esc=v=>String(v||'').replaceAll("'","\\'");
function loadRecords(){fetch(API).then(r=>r.json()).then(data=>{tableBody.innerHTML=""; data.forEach(s=>tableBody.innerHTML+=`<tr class="border"><td class="p-2">${s.doctorName||''}</td><td>${s.specialty||''}</td><td>${s.scheduleDate||''}</td><td>${s.startTime||''}</td><td>${s.endTime||''}</td><td><button class="bg-yellow-400 px-2 rounded" onclick="editRecord(${s.id},'${esc(s.doctorName)}','${esc(s.specialty)}','${esc(s.scheduleDate)}','${esc(s.startTime)}','${esc(s.endTime)}')">Edit</button> <button class="bg-red-500 text-white px-2 rounded" onclick="deleteRecord(${s.id})">Delete</button></td></tr>`);});}
function saveRecord(){const data={id:editId||Date.now(),doctorName:q('doctorName').value.trim(),specialty:q('specialty').value.trim(),scheduleDate:q('scheduleDate').value,startTime:q('startTime').value,endTime:q('endTime').value}; if(!data.doctorName||!data.scheduleDate||!data.startTime||!data.endTime){alert("Required fields missing!");return;} fetch(editId?API+"/"+editId:API,{method:editId?"PUT":"POST",headers:{"Content-Type":"application/json"},body:JSON.stringify(data)}).then(()=>{alert(editId?"Schedule updated!":"Schedule added!");resetForm();loadRecords();});}
function editRecord(id,d,s,da,st,en){editId=id; q('doctorName').value=d; q('specialty').value=s; q('scheduleDate').value=da; q('startTime').value=st; q('endTime').value=en; submitBtn.innerText="Update";}
function deleteRecord(id){if(confirm("Delete or cancel this schedule?"))fetch(API+"/"+id,{method:"DELETE"}).then(loadRecords);}
function resetForm(){editId=null; ['doctorName','specialty','scheduleDate','startTime','endTime'].forEach(id=>q(id).value=''); submitBtn.innerText='Add';}
loadRecords();
</script></body></html>
