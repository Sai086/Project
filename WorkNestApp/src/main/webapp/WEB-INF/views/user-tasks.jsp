<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="_header.jsp"/>

<style>
  body {
    font-family: "Segoe UI", Tahoma, Geneva, Verdana, sans-serif;
    background: #f5f7fb;
    margin: 0;
    padding: 20px;
  }

  h2 {
    text-align: center;
    color: #333;
    margin-bottom: 1.5rem;
  }

  /* Table Styling */
  table {
    width: 100%;
    border-collapse: collapse;
    margin-top: 1rem;
    background: #fff;
    border-radius: 10px;
    overflow: hidden;
    box-shadow: 0 6px 18px rgba(0, 0, 0, 0.1);
  }

  table th, table td {
    padding: 12px 15px;
    border-bottom: 1px solid #e0e0e0;
    text-align: center;
  }

  table th {
    background: #28a745;
    color: #fff;
    font-weight: 600;
    text-transform: uppercase;
    font-size: 13px;
  }

  table tr:hover {
    background: #f9f9f9;
  }

  /* Buttons */
  .btn {
    background: #28a745;
    color: #fff;
    border: none;
    padding: 8px 14px;
    border-radius: 6px;
    font-size: 13px;
    font-weight: 600;
    cursor: pointer;
    transition: background 0.3s ease, transform 0.2s ease;
    margin-left: 6px;
  }

  .btn:hover {
    background: #218838;
    transform: translateY(-2px);
  }

  /* Inputs */
  select, input[type="text"], input[name="content"] {
    padding: 8px 10px;
    border: 1px solid #ccc;
    border-radius: 6px;
    font-size: 13px;
    margin: 4px 0;
    transition: border 0.3s ease, box-shadow 0.3s ease;
  }

  select:focus, input:focus {
    border-color: #28a745;
    outline: none;
    box-shadow: 0 0 6px rgba(40, 167, 69, 0.3);
  }

  /* Forms inline layout */
  form {
    display: inline-block;
    margin: 4px;
  }
</style>

<h2>My Tasks</h2>
<table>
  <thead>
    <tr><th>ID</th><th>Title</th><th>Status</th><th>Due</th><th>Action</th></tr>
  </thead>
  <tbody>
    <c:forEach var="t" items="${tasks}">
      <tr>
        <td>${t.id}</td>
        <td>${t.title}</td>
        <td>${t.status}</td>
        <td>${t.dueDate}</td>
        <td>
          <form method="post" action="<c:url value='/user/tasks/status'/>">
            <input type="hidden" name="taskId" value="${t.id}"/>
            <select name="status">
              <option value="PENDING" ${t.status=='PENDING'?'selected':''}>Pending</option>
              <option value="IN_PROGRESS" ${t.status=='IN_PROGRESS'?'selected':''}>In Progress</option>
              <option value="COMPLETED" ${t.status=='COMPLETED'?'selected':''}>Completed</option>
              <option value="DELAYED" ${t.status=='DELAYED'?'selected':''}>Delayed</option>
            </select>
            <button class="btn" type="submit">Update</button>
          </form>
          <form method="post" action="<c:url value='/user/tasks/comment'/>">
            <input type="hidden" name="taskId" value="${t.id}"/>
            <input name="content" placeholder="Add comment"/>
            <button class="btn" type="submit">Comment</button>
          </form>
        </td>
      </tr>
    </c:forEach>
  </tbody>
</table>

<jsp:include page="_footer.jsp"/>
