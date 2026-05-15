<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="true" %>
<%@ include file="WEB-INF/jsp/auth.jspf" %>
<!DOCTYPE html><html><head><title>Feedback & Review Management</title><script src="https://cdn.tailwindcss.com"></script></head>
<body class="bg-gray-100 min-h-screen"><%@ include file="WEB-INF/jsp/nav.jspf" %>
<main class="max-w-6xl mx-auto p-4 sm:p-6"><div class="bg-white p-6 rounded-xl shadow"><h1 class="text-2xl font-bold mb-4">Feedback & Review Management</h1>
<div class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-5 gap-2 mb-4"><input id="patientName" placeholder="Patient Name" class="border p-2 rounded"><input id="rating" type="number" min="1" max="5" placeholder="Rating" class="border p-2 rounded"><input id="comment" placeholder="Comment" class="border p-2 rounded"><input id="reviewDate" type="date" class="border p-2 rounded"><button onclick="saveRecord()" id="submitBtn" class="bg-blue-500 text-white rounded px-4 py-2">Submit</button></div>
<div class="overflow-x-auto"><table class="w-full border min-w-[760px]"><thead class="bg-gray-200"><tr><th class="p-2">Patient</th><th>Rating</th><th>Comment</th><th>Date</th><th>Actions</th></tr></thead><tbody id="tableBody"></tbody></table></div></div></main>
<script>
const API="<%= request.getContextPath() %>/feedback"; let editId=null; const q=id=>document.getElementById(id); const esc=v=>String(v||'').replaceAll("'","\\'");
function loadRecords(){fetch(API).then(r=>r.json()).then(data=>{tableBody.innerHTML=""; data.forEach(f=>tableBody.innerHTML+=`<tr class="border"><td class="p-2">${f.patientName||''}</td><td>${f.rating||''}</td><td>${f.comment||''}</td><td>${f.reviewDate||''}</td><td><button class="bg-yellow-400 px-2 rounded" onclick="editRecord(${f.id},'${esc(f.patientName)}','${f.rating||''}','${esc(f.comment)}','${esc(f.reviewDate)}')">Edit</button> <button class="bg-red-500 text-white px-2 rounded" onclick="deleteRecord(${f.id})">Delete</button></td></tr>`);});}
function saveRecord(){const data={id:editId||Date.now(),patientName:q('patientName').value.trim(),rating:Number(q('rating').value),comment:q('comment').value.trim(),reviewDate:q('reviewDate').value}; if(!data.patientName||!data.rating||!data.comment){alert("Required fields missing!");return;} fetch(editId?API+"/"+editId:API,{method:editId?"PUT":"POST",headers:{"Content-Type":"application/json"},body:JSON.stringify(data)}).then(()=>{alert(editId?"Feedback updated!":"Feedback submitted!");resetForm();loadRecords();});}
function editRecord(id,p,r,c,d){editId=id; q('patientName').value=p; q('rating').value=r; q('comment').value=c; q('reviewDate').value=d; submitBtn.innerText="Update";}
function deleteRecord(id){if(confirm("Delete this feedback?"))fetch(API+"/"+id,{method:"DELETE"}).then(loadRecords);}
function resetForm(){editId=null; ['patientName','rating','comment','reviewDate'].forEach(id=>q(id).value=''); submitBtn.innerText='Submit';}
loadRecords();
</script></body></html>
