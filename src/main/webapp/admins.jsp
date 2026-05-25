<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="true" %>
<%@ include file="WEB-INF/jsp/auth.jspf" %>
<!DOCTYPE html><html><head><title>Admin Management</title><script src="https://cdn.tailwindcss.com"></script></head>
<body class="bg-gray-100 min-h-screen"><%@ include file="WEB-INF/jsp/nav.jspf" %>
<main class="max-w-6xl mx-auto p-4 sm:p-6"><div class="bg-white p-6 rounded-xl shadow"><h1 class="text-2xl font-bold mb-4">Admin Management</h1>
<div class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-5 gap-2 mb-4"><input id="username" placeholder="Username" class="border p-2 rounded"><input id="fullName" placeholder="Full Name" class="border p-2 rounded"><input id="email" type="email" placeholder="Email" class="border p-2 rounded"><input id="role" placeholder="Role" class="border p-2 rounded"><button onclick="saveRecord()" id="submitBtn" class="bg-blue-500 text-white rounded px-4 py-2">Register</button></div>
<div class="overflow-x-auto"><table class="w-full border min-w-[760px]"><thead class="bg-gray-200"><tr><th class="p-2">Username</th><th>Full Name</th><th>Email</th><th>Role</th><th>Actions</th></tr></thead><tbody id="tableBody"></tbody></table></div></div></main>
<script>
const API="<%= request.getContextPath() %>/admins"; let editId=null; const q=id=>document.getElementById(id); const esc=v=>String(v||'').replaceAll("'","\\'");
function loadRecords(){fetch(API).then(r=>r.json()).then(data=>{tableBody.innerHTML=""; data.forEach(a=>tableBody.innerHTML+=`<tr class="border"><td class="p-2">${a.username||''}</td><td>${a.fullName||''}</td><td>${a.email||''}</td><td>${a.role||''}</td><td><button class="bg-yellow-400 px-2 rounded" onclick="editRecord(${a.id},'${esc(a.username)}','${esc(a.fullName)}','${esc(a.email)}','${esc(a.role)}')">Edit</button> <button class="bg-red-500 text-white px-2 rounded" onclick="deleteRecord(${a.id})">Remove</button></td></tr>`);});}
function saveRecord(){const data={id:editId||Date.now(),username:q('username').value.trim(),fullName:q('fullName').value.trim(),email:q('email').value.trim(),role:q('role').value.trim()}; if(!data.username||!data.fullName||!data.email){alert("Required fields missing!");return;} fetch(editId?API+"/"+editId:API,{method:editId?"PUT":"POST",headers:{"Content-Type":"application/json"},body:JSON.stringify(data)}).then(()=>{alert(editId?"Admin updated!":"Admin registered!");resetForm();loadRecords();});}
function editRecord(id,u,f,e,r){editId=id; q('username').value=u; q('fullName').value=f; q('email').value=e; q('role').value=r; submitBtn.innerText="Update";}
function deleteRecord(id){if(confirm("Remove this admin account?"))fetch(API+"/"+id,{method:"DELETE"}).then(loadRecords);}
function resetForm(){editId=null; ['username','fullName','email','role'].forEach(id=>q(id).value=''); submitBtn.innerText='Register';}
loadRecords();
</script></body></html>
