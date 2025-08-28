<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style>
  body {
    margin: 0;
    font-family: "Segoe UI", Tahoma, Geneva, Verdana, sans-serif;
    background: #f5f7fb;
  }

  .container {
    width: 100%;
  }

  nav {
    background: #343a40;
    padding: 12px 20px;
    display: flex;
    justify-content: flex-start;
    align-items: center;
    color: #fff;
    font-size: 15px;
  }

  nav a {
    color: #f8f9fa;
    text-decoration: none;
    margin: 0 10px;
    padding: 6px 10px;
    border-radius: 6px;
    transition: background 0.3s ease, color 0.3s ease;
    font-weight: 500;
  }

  nav a:hover {
    background: #28a745;
    color: #fff;
  }

  nav span {
    font-weight: 600;
    margin-right: 15px;
    color: #ffc107;
  }

  hr {
    margin: 0;
    border: none;
    border-top: 2px solid #28a745;
  }
</style>

<div class="container">
  <nav>
    <c:choose>
      <c:when test="${not empty sessionScope.user}">
        <span>Hello, ${sessionScope.user.name} (${sessionScope.user.role})</span>
        <c:if test="${sessionScope.user.role == 'ADMIN'}">
          | <a href="<c:url value='/admin/dashboard'/>">Admin Dashboard</a>
        </c:if>
        | <a href="<c:url value='/user/tasks'/>">My Tasks</a>
        | <a href="<c:url value='/logout'/>">Logout</a>
      </c:when>
      <c:otherwise>
        <a href="<c:url value='/login'/>">Login</a> | <a href="<c:url value='/register'/>">Register</a>
      </c:otherwise>
    </c:choose>
  </nav>
  <hr/>
</div>
