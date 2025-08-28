<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="_header.jsp"/>

<style>
  body {
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    background-color: #f8f9fa;
    margin: 0;
    padding: 0;
    display: flex;
    justify-content: center;
    align-items: center;
    min-height: 100vh;
  }

  .form-container {
    background: #fff;
    padding: 2rem;
    border-radius: 8px;
    box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
    max-width: 600px;
    width: 100%;
  }

  .form-title {
    text-align: center;
    color: #333;
    margin-bottom: 1.8rem;
    font-size: 24px;
    font-weight: 600;
  }

  .styled-form .row {
    display: flex;
    gap: 1rem;
    margin-bottom: 1rem;
  }

  .form-group {
    flex: 1;
    display: flex;
    flex-direction: column;
  }

  .form-group label {
    font-weight: 500;
    color: #444;
    margin-bottom: 0.4rem;
    font-size: 14px;
  }

  .form-group input,
  .form-group select {
    padding: 10px;
    border: 1px solid #ddd;
    border-radius: 4px;
    font-size: 14px;
    transition: border 0.3s ease;
  }

  .form-group input:focus,
  .form-group select:focus {
    border-color: #4a90e2;
    outline: none;
    box-shadow: 0 0 0 2px rgba(74, 144, 226, 0.2);
  }

  .btn {
    width: 100%;
    margin-top: 1rem;
    padding: 12px;
    background: #4a90e2;
    color: #fff;
    border: none;
    border-radius: 4px;
    font-size: 16px;
    cursor: pointer;
    font-weight: 500;
    transition: background 0.3s;
  }

  .btn:hover {
    background: #3a80d2;
  }
</style>

<div class="form-container">
    <h2 class="form-title">Register</h2>
    
    <form method="post" action="register" class="styled-form">
        
        <div class="row">
            <div class="form-group">
                <label for="name">Name</label>
                <input id="name" type="text" name="name" required/>
            </div>
            <div class="form-group">
                <label for="email">Email</label>
                <input id="email" type="email" name="email" required/>
            </div>
        </div>

        <div class="row">
            <div class="form-group">
                <label for="password">Password</label>
                <input id="password" type="password" name="password" required/>
            </div>
            <div class="form-group">
                <label for="role">Role</label>
                <select id="role" name="role">
                    <option value="USER">USER</option>
                    <option value="ADMIN">ADMIN</option>
                </select>
            </div>
        </div>

        <button class="btn" type="submit">Create Account</button>
    </form>
</div>

<jsp:include page="_footer.jsp"/>