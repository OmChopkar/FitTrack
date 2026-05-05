<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Fit-Track Register</title>
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
            animation: bgslide 6s infinite linear;
        }

        .register-container {
            background: rgba(255, 255, 255, 0.95);
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.2);
            width: 400px;
            text-align: center;
        }

        h2 {
            margin-bottom: 20px;
            color: #333;
        }

        input {
            width: 100%;
            padding: 10px;
            margin: 10px 0;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-sizing: border-box;
        }

        input[type="submit"] {
            background: #007bff;
            color: white;
            border: none;
            cursor: pointer;
        }

        input[type="submit"]:hover {
            background: #0056b3;
        }

        @keyframes bgslide {
            0%   { background-image: url('media/Gym6.jpg'); }
            33%  { background-image: url('media/Gym7.jpg'); }
            66%  { background-image: url('media/Gym10.jpg'); }
            100% { background-image: url('media/Gym11.jpg'); }
        }
    </style>
</head>
<body>
    <div class="register-container">
        <h2>Register</h2>
        <form method="post">
            <input type="text" name="name" placeholder="Full Name" required>
            <input type="email" name="email" placeholder="Email" required>
            <input type="text" name="username" placeholder="Username" required>
            <input type="password" name="password" placeholder="Password" required>
            <input type="submit" value="Register">
        </form>

        <%
            if ("POST".equals(request.getMethod())) {
                try {
                    String name = request.getParameter("name");
                    String email = request.getParameter("email");
                    String username = request.getParameter("username");
                    String password = request.getParameter("password");

                    if (util.FileUtil.userExists(username)) {
        %>
                        <p style="color:red;">USER ALREADY EXISTS</p>
        <%
                    } else {
                        model.User user = new model.User(name, email, username, password);
                        util.FileUtil.saveUser(user.toFileString());
        %>
                        <p style="color:green;">
                            Registration successful! <a href="index.jsp">Login now</a>
                        </p>
        <%
                    }
                } catch (Exception e) {
        %>
                    <p style="color:red;">Error: <%= e.getMessage() %></p>
        <%
                }
            }
        %>

        <p>
            <a href="index.jsp" style="color:#007bff;">Already registered? Login</a>
        </p>
    </div>
</body>
</html>
