<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="_header.jsp"/>

<style>
  body {
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    background-color: #f5f5f5;
    margin: 0;
    padding: 0;
    display: flex;
    justify-content: center;
    align-items: center;
    min-height: 100vh;
  }

  .auth-container {
    background: #fff;
    padding: 2rem;
    border-radius: 8px;
    box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
    max-width: 400px;
    width: 100%;
  }

  .auth-container h2 {
    text-align: center;
    color: #333;
    margin-bottom: 1.5rem;
    font-weight: 600;
  }

  .auth-container label {
    display: block;
    margin-top: 1rem;
    color: #555;
    font-size: 14px;
  }

  .auth-container input {
    width: 100%;
    padding: 10px;
    margin-top: 0.3rem;
    border: 1px solid #ddd;
    border-radius: 4px;
    font-size: 14px;
    box-sizing: border-box;
  }

  .auth-container input:focus {
    border-color: #4a90e2;
    outline: none;
    box-shadow: 0 0 0 2px rgba(74, 144, 226, 0.2);
  }

  .auth-container .btn {
    width: 100%;
    margin-top: 1.5rem;
    padding: 10px;
    background: #4a90e2;
    color: #fff;
    border: none;
    border-radius: 4px;
    font-size: 16px;
    cursor: pointer;
  }

  .auth-container .btn:hover {
    background: #3a80d2;
  }

  .auth-container p {
    text-align: center;
    margin-top: 1.5rem;
    color: #666;
    font-size: 14px;
  }

  .auth-container a {
    color: #4a90e2;
    text-decoration: none;
  }

  .auth-container a:hover {
    text-decoration: underline;
  }

  .alert {
    background: #ffe6e6;
    color: #d00;
    padding: 10px;
    border-radius: 4px;
    margin-bottom: 1rem;
    font-size: 14px;
    border-left: 3px solid #d00;
  }
</style>

<div class="auth-container">
  <h2>Login</h2>
  <c:if test="${not empty error}"><div class="alert">${error}</div></c:if>
  <form method="post" action="login">
    <label>Email</label>
    <input type="email" name="email" required/>
    <label>Password</label>
    <input type="password" name="password" required/>
    <button class="btn" type="submit">Login</button>
  </form>
  <p>Don't have an account? <a href="<c:url value='/register'/>">Register</a></p>
</div>

<jsp:include page="_footer.jsp"/>