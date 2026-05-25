<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="true" %>
<%@ include file="WEB-INF/jsp/auth.jspf" %>
<!DOCTYPE html><html><head><title>Doctor Management</title><script src="https://cdn.tailwindcss.com"></script></head>
<body class="bg-gray-100 min-h-screen"><%@ include file="WEB-INF/jsp/nav.jspf" %>
<main class="max-w-6xl mx-auto p-4 sm:p-6"><div class="bg-white p-6 rounded-xl shadow"><h1 class="text-2xl font-bold mb-4">Doctor Management</h1>
<div class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-5 gap-2 mb-4"><input id="name" placeholder="Doctor Name" class="border p-2 rounded"><input id="specialization" placeholder="Specialization" class="border p-2 rounded"><input id="contact" placeholder="Contact" class="border p-2 rounded"><input id="room" placeholder="Room" class="border p-2 rounded"><button onclick="saveRecord()" id="submitBtn" class="bg-blue-500 text-white rounded px-4 py-2">Create</button></div>
<div class="overflow-x-auto"><table class="w-full border min-w-[760px]"><thead class="bg-gray-200"><tr><th class="p-2">Name</th><th>Specialization</th><th>Contact</th><th>Room</th><th>Actions</th></tr></thead><tbody id="tableBody"></tbody></table></div></div></main>
<script>
const API="<%= request.getContextPath() %>/doctors"; let editId=null; const q=id=>document.getElementById(id); const esc=v=>String(v||'').replaceAll("'","\\'");
function loadRecords(){fetch(API).then(r=>r.json()).then(data=>{tableBody.innerHTML=""; data.forEach(d=>tableBody.innerHTML+=`<tr class="border"><td class="p-2">${d.name||''}</td><td>${d.specialization||''}</td><td>${d.contact||''}</td><td>${d.room||''}</td><td><button class="bg-yellow-400 px-2 rounded" onclick="editRecord(${d.id},'${esc(d.name)}','${esc(d.specialization)}','${esc(d.contact)}','${esc(d.room)}')">Edit</button> <button class="bg-red-500 text-white px-2 rounded" onclick="deleteRecord(${d.id})">Delete</button></td></tr>`);});}
function saveRecord(){const data={id:editId||Date.now(),name:q('name').value.trim(),specialization:q('specialization').value.trim(),contact:q('contact').value.trim(),room:q('room').value.trim()}; if(!data.name||!data.specialization){alert("Required fields missing!");return;} fetch(editId?API+"/"+editId:API,{method:editId?"PUT":"POST",headers:{"Content-Type":"application/json"},body:JSON.stringify(data)}).then(()=>{alert(editId?"Doctor updated!":"Doctor created!");resetForm();loadRecords();});}
function editRecord(id,n,s,c,r){editId=id; q('name').value=n; q('specialization').value=s; q('contact').value=c; q('room').value=r; submitBtn.innerText="Update";}
function deleteRecord(id){if(confirm("Delete this doctor?"))fetch(API+"/"+id,{method:"DELETE"}).then(loadRecords);}
function resetForm(){editId=null; ['name','specialization','contact','room'].forEach(id=>q(id).value=''); submitBtn.innerText='Create';}
loadRecords();
</script></body></html>
