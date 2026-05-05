<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- HEADER CSS -->
<style>
    body {
        margin: 0;
        padding: 0;
        font-family: Arial, sans-serif;
    }

    header {
        background: #343a40;
        color: #fff;
        padding: 15px 20px;
        display: flex;
        align-items: center;
        width: 100%;
        box-sizing: border-box;
    }

    /* Logo + Title container */
    .logo-section {
        display: flex;
        align-items: center;
        gap: 12px;
    }

    .logo {
        width: 42px;
        height: 42px;
        border-radius: 50%; /* remove if not needed */
        object-fit: cover;
    }

    header h1 {
        margin: 0;
        font-size: 26px;
        letter-spacing: 1px;
    }

    nav {
        margin-left: auto;
        display: flex;
        align-items: center;
        gap: 18px;
    }

    nav a {
        color: #fff;
        text-decoration: none;
        font-size: 16px;
        transition: 0.3s;
    }

    nav a:hover {
        color: orange;
    }
</style>

<!-- HEADER UI -->
<header>
    <div class="logo-section">
        <img src="media/barbell.png" alt="FitTrack Logo" class="logo">
        <h1>Fit-Track</h1>
    </div>

    <nav>

       <%
Object userObj = session.getAttribute("username");
if (userObj != null) {
%>
<a href="home.jsp">Home</a><a href="bmi.jsp">BMI</a><a href="workout.jsp">Workout</a>
<a href="diet.jsp">Diet</a><a href="progress.jsp">Progress</a><a href="index.jsp">Logout</a>
<%
} else {
%>
<a href="index.jsp">Login</a><a href="register.jsp">Register</a>
<%
}
%>
    </nav>
</header>
