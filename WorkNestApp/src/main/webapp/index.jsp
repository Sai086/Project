<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="/WEB-INF/views/_header.jsp"/>
<style>
  .welcome-container {
    max-width: 700px;
    margin: 60px auto;
    text-align: center;
    padding: 40px;
    background: #fff;
    border-radius: 12px;
    box-shadow: 0 6px 18px rgba(0,0,0,0.1);
  }

  .welcome-container h1 {
    font-size: 2rem;
    color: #28a745;
    margin-bottom: 15px;
  }

  .welcome-container p {
    font-size: 1rem;
    color: #555;
    margin-bottom: 30px;
    line-height: 1.6;
  }

  .btn-group {
    display: flex;
    justify-content: center;
    gap: 20px;
  }

  .btn-link {
    display: inline-block;
    padding: 12px 24px;
    font-size: 1rem;
    border-radius: 8px;
    text-decoration: none;
    font-weight: 500;
    transition: 0.3s;
  }

  .btn-login {
    background: #28a745;
    color: #fff;
  }
  .btn-login:hover {
    background: #218838;
  }

  .btn-register {
    background: #007bff;
    color: #fff;
  }
  .btn-register:hover {
    background: #0069d9;
  }
</style>

<div class="welcome-container">
  <h1>Welcome to Worknest</h1>
  <p>
    <!-- Replace this text with your project description -->
    Worknest is a simple and efficient Task Management System that helps users organize, 
    track, and complete their work with ease.
  </p>

  <div class="btn-group">
    <a href="<c:url value='/login'/>" class="btn-link btn-login">Login</a>
    <a href="<c:url value='/register'/>" class="btn-link btn-register">Register</a>
  </div>
</div>

<jsp:include page="/WEB-INF/views/_footer.jsp"/>