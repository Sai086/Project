<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="_header.jsp"/>

<style>
  body {
    font-family: "Segoe UI", Tahoma, Geneva, Verdana, sans-serif;
    background: #f7f9fc;
    margin: 0;
    padding: 20px;
    display: flex;
    justify-content: center;
    align-items: flex-start;
    min-height: 100vh;
  }

  h2 {
    text-align: center;
    margin-bottom: 1.5rem;
    color: #333;
  }

  form {
    background: #fff;
    padding: 2rem 2.5rem;
    border-radius: 12px;
    box-shadow: 0 6px 20px rgba(0, 0, 0, 0.12);
    max-width: 600px;
    width: 100%;
    animation: fadeIn 0.6s ease-in-out;
  }

  label {
    display: block;
    margin-top: 1rem;
    font-weight: 600;
    color: #444;
  }

  input, textarea, select {
    width: 100%;
    padding: 12px;
    margin-top: 0.4rem;
    border: 1px solid #ccc;
    border-radius: 8px;
    font-size: 14px;
    transition: border 0.3s ease, box-shadow 0.3s ease;
  }

  input:focus, textarea:focus, select:focus {
    border-color: #007bff;
    outline: none;
    box-shadow: 0 0 6px rgba(0, 123, 255, 0.3);
  }

  textarea {
    resize: vertical;
    min-height: 90px;
  }

  button {
    margin-top: 1.5rem;
    width: 100%;
    padding: 14px;
    background: linear-gradient(135deg, #007bff, #0056b3);
    color: #fff;
    border: none;
    border-radius: 8px;
    font-size: 16px;
    font-weight: bold;
    cursor: pointer;
    transition: transform 0.2s, background 0.3s;
  }

  button:hover {
    background: linear-gradient(135deg, #0056b3, #007bff);
    transform: translateY(-2px);
  }

  @keyframes fadeIn {
    from { opacity: 0; transform: translateY(-20px); }
    to { opacity: 1; transform: translateY(0); }
  }
</style>

<div>
  <h2>Edit Task</h2>
  <form method="post" action="<c:url value='/admin/tasks/edit'/>">
    <input type="hidden" name="id" value="${task.id}"/>
    
    <label>Title</label>
    <input name="title" value="${task.title}" required/>
    
    <label>Description</label>
    <textarea name="description">${task.description}</textarea>
    
    <label>Status</label>
    <select name="status">
      <option ${task.status=='PENDING'?'selected':''}>PENDING</option>
      <option ${task.status=='IN_PROGRESS'?'selected':''}>IN_PROGRESS</option>
      <option ${task.status=='COMPLETED'?'selected':''}>COMPLETED</option>
    </select>
    
    <label>Start Date</label>
    <input type="date" name="startDate" value="${task.startDate}"/>
    
    <label>Due Date</label>
    <input type="date" name="dueDate" value="${task.dueDate}"/>
    
    <label>Assign To</label>
    <select name="userId">
      <c:forEach var="u" items="${users}">
        <option value="${u.id}" ${task.user != null && task.user.id == u.id ? 'selected':''}>${u.name}</option>
      </c:forEach>
    </select>
    
    <button type="submit">Save Changes</button>
  </form>
</div>

<jsp:include page="_footer.jsp"/>
