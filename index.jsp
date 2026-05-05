<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Fit-Track Login</title>

<style>
    body {
        font-family: Arial, sans-serif;
        margin: 0;
        padding: 0;
        height: 100vh;
        display: flex;
        justify-content: center;
        align-items: center;
        background: #e9ecef;
        animation: bgslide 12s infinite linear;
        background-size: cover;
    }

    .login-container {
        background: rgba(255, 255, 255, 0.95);
        padding: 30px;
        border-radius: 10px;
        box-shadow: 0 0 15px rgba(0, 0, 0, 0.2);
        width: 350px;
        text-align: center;
    }

    h2 {
        margin-bottom: 20px;
        color: #333;
    }

    input[type="text"],
    input[type="password"] {
        width: 100%;
        padding: 10px;
        margin: 10px 0;
        border: 1px solid #ccc;
        border-radius: 5px;
        box-sizing: border-box;
    }

    input[type="submit"] {
        background: #28a745;
        color: white;
        padding: 10px 20px;
        border: none;
        border-radius: 5px;
        cursor: pointer;
        width: 100%;
        transition: background 0.3s ease;
    }

    input[type="submit"]:hover {
        background: #218838;
    }

    /* KEYFRAME FIXED */
    @keyframes bgslide {
        0%   { background-image: url('media/Gym1.jpg'); }
        33%  { background-image: url('media/Gym2.jpg'); }
        66%  { background-image: url('media/Gym3.jpg'); }
        100% { background-image: url('media/Gym4.jpg'); }
    }
</style>
</head>

<body>

<div class="login-container">
    <h2>Login</h2>

    <form method="post">
        <input type="text" name="username" placeholder="Username" required>
        <input type="password" name="password" placeholder="Password" required>
        <input type="submit" value="Login">
    </form>

    <%
        if ("POST".equals(request.getMethod())) {
            try {
                String username = request.getParameter("username");
                String password = request.getParameter("password");

                if (util.FileUtil.validateLogin(username, password)) {
                    session.setAttribute("username", username);
                    response.sendRedirect("home.jsp");
                    return;
                } else {
    %>
                    <p style="color: red;">Invalid username or password!</p>
    <%
                }
            } catch (Exception e) {
    %>
                <p style="color: red;">Error: <%= e.getMessage() %></p>
    <%
            }
        }
    %>

    <p><a href="register.jsp" style="color:#007bff;">Don't have an account? Register</a></p>
</div>

</body>
</html>
