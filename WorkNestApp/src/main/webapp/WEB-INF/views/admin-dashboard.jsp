<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="_header.jsp"/>

<style>
  body {
    font-family: "Segoe UI", Tahoma, Geneva, Verdana, sans-serif;
    background: #f4f6f9;
    margin: 0;
    padding: 20px;
  }

  h2 {
    text-align: center;
    color: #333;
    margin-bottom: 2rem;
  }

  h3 {
    margin-top: 2rem;
    color: #444;
    border-left: 5px solid #007bff;
    padding-left: 10px;
  }

  /* Table Styling */
  table {
    width: 100%;
    border-collapse: collapse;
    margin-top: 1rem;
    background: #fff;
    border-radius: 8px;
    overflow: hidden;
    box-shadow: 0 4px 12px rgba(0, 0, 0, 0.08);
  }

  table th, table td {
    padding: 12px 15px;
    border-bottom: 1px solid #e0e0e0;
    text-align: left;
  }

  table th {
    background: #007bff;
    color: #fff;
    font-weight: 600;
    text-transform: uppercase;
    font-size: 13px;
  }

  table tr:hover {
    background: #f9f9f9;
  }

  /* Buttons */
  button, .btn, a {
    background: #007bff;
    color: #fff !important;
    border: none;
    padding: 8px 14px;
    border-radius: 6px;
    font-size: 14px;
    cursor: pointer;
    transition: background 0.3s ease, transform 0.2s ease;
    text-decoration: none;
    display: inline-block;
  }

  button:hover, .btn:hover, a:hover {
    background: #0056b3;
    transform: translateY(-2px);
  }

  /* Forms */
  form {
    margin-top: 1rem;
    background: #fff;
    padding: 1.5rem;
    border-radius: 10px;
    box-shadow: 0 4px 12px rgba(0, 0, 0, 0.08);
  }

  form label {
    display: block;
    margin: 0.8rem 0 0.3rem;
    font-weight: 600;
    color: #555;
  }

  form input, form textarea, form select {
    width: 100%;
    padding: 10px;
    border-radius: 6px;
    border: 1px solid #ccc;
    margin-bottom: 1rem;
    font-size: 14px;
    transition: border 0.3s ease, box-shadow 0.3s ease;
  }

  form input:focus, form textarea:focus, form select:focus {
    border-color: #007bff;
    outline: none;
    box-shadow: 0 0 5px rgba(0, 123, 255, 0.3);
  }

  form .row {
    display: flex;
    gap: 1rem;
  }

  form .row div {
    flex: 1;
  }

  /* Comments */
  td div {
    background: #f4f6f9;
    padding: 6px 10px;
    border-radius: 6px;
    margin-top: 6px;
  }

  td div strong {
    color: #333;
  }

  td div small {
    color: #777;
  }
</style>

<h2>Admin Dashboard</h2>

<h3>Users</h3>
<table>
  <thead>
    <tr>
      <th>ID</th>
      <th>Name</th>
      <th>Email</th>
      <th>Role</th>
      <th>Actions</th>
    </tr>
  </thead>
  <tbody>
    <c:forEach var="u" items="${users}">
      <tr>
        <td>${u.id}</td>
        <td>${u.name}</td>
        <td>${u.email}</td>
        <td>${u.role}</td>
        <td>
          <form method="post" action="<c:url value='/admin/users/delete'/>" style="display:inline;">
            <input type="hidden" name="userId" value="${u.id}"/>
            <button type="submit" onclick="return confirm('Delete this user?')">Delete</button>
          </form>
        </td>
      </tr>
    </c:forEach>
  </tbody>
</table>

<h3>Allocate Task</h3>
<form method="post" action="<c:url value='/admin/tasks/allocate'/>">
  <label>Title</label>
  <input name="title" required/>
  <label>Description</label>
  <textarea name="description"></textarea>
  <div class="row">
    <div>
      <label>Start Date</label>
      <input type="date" name="startDate"/>
    </div>
    <div>
      <label>Due Date</label>
      <input type="date" name="dueDate"/>
    </div>
  </div>
  <label>Assign To (User ID)</label>
  <input type="number" name="userId" required/>
  <button class="btn" type="submit">Allocate</button>
</form>

<h3>All Tasks</h3>
<table>
  <thead>
    <tr><th>ID</th><th>Title</th><th>Assignee</th><th>Status</th><th>Due</th><th>Comments</th></tr>
  </thead>
  <tbody>
    <c:forEach var="t" items="${tasks}">
      <tr>
        <td>${t.id}</td>
        <td>${t.title}</td>
        <td><c:out value='${t.user != null ? t.user.name : "Unassigned"}'/></td>
        <td>${t.status}</td>
        <td>${t.dueDate}</td>
        <td>
          <a href="<c:url value='/admin/tasks/edit?taskId=${t.id}'/>">Edit</a>
          <form method="post" action="<c:url value='/admin/tasks/delete'/>" style="display:inline;">
            <input type="hidden" name="taskId" value="${t.id}"/>
            <button type="submit" onclick="return confirm('Delete this task?')">Delete</button>
          </form>
          <c:forEach var="c" items="${taskComments[t.id]}">
            <div>
              <strong>${c.user.name}:</strong> ${c.content}
              <br/><small>${c.createdAt}</small>
            </div>
          </c:forEach>
        </td>
      </tr>
    </c:forEach>
  </tbody>
</table>

<jsp:include page="_footer.jsp"/>
