<%@ page import="model.*" %>
<%@ include file="header.jsp" %>

<style>
    .workout-container {
        max-width: 950px;
        margin: 20px auto;
        background: rgba(255,255,255,0.95);
        padding: 25px;
        border-radius: 12px;
        box-shadow: 0 4px 12px rgba(0,0,0,0.15);
        animation: fadeIn 0.7s ease-in-out;
    }

    @keyframes fadeIn {
        from { opacity: 0; transform: translateY(20px); }
        to { opacity: 1; transform: translateY(0); }
    }

    h2 {
        text-align: center;
        color: #ff9800;
    }

    form {
        text-align: center;
        margin-bottom: 25px;
    }

    select, input[type="submit"] {
        padding: 10px 15px;
        border-radius: 8px;
        border: 1px solid #ccc;
        font-size: 16px;
        margin-top: 10px;
    }

    input[type="submit"] {
        background: #ff9800;
        color: #fff;
        border: none;
        cursor: pointer;
        transition: 0.3s;
    }

    input[type="submit"]:hover {
        background: #e68600;
    }

    .exercise-images {
        display: grid;
        grid-template-columns: repeat(auto-fit, minmax(180px, 1fr));
        gap: 15px;
        margin-top: 20px;
    }

    .exercise-card {
        background: #fff;
        padding: 10px;
        border-radius: 10px;
        text-align: center;
        box-shadow: 0 0 8px rgba(0,0,0,0.1);
        transition: 0.3s;
    }

    .exercise-card:hover {
        transform: translateY(-5px);
        box-shadow: 0 4px 15px rgba(0,0,0,0.2);
    }

    .exercise-card img {
        width: 100%;
        height: 140px;
        object-fit: cover;
        border-radius: 8px;
    }

    table {
        width: 100%;
        margin-top: 25px;
        border-collapse: collapse;
    }

    table th, table td {
        border: 1px solid #ddd;
        padding: 12px;
    }

    table th {
        background: #ff9800;
        color: white;
    }

    table tr:nth-child(even) {
        background: #f5f5f5;
    }
</style>

<div class="workout-container">
    <h2>Workout Plans</h2>

    <form method="post">
        <select name="level">
            <option value="beginner">Beginner</option>
            <option value="intermediate">Intermediate</option>
            <option value="advanced">Advanced</option>
        </select>
        <br>
        <input type="submit" value="Get Plan">
    </form>

<%
if ("POST".equals(request.getMethod())) {
    String level = request.getParameter("level");
    WorkoutPlan plan = null;

    if ("beginner".equals(level)) plan = new BeginnerWorkoutPlan();
    else if ("intermediate".equals(level)) plan = new IntermediateWorkoutPlan();
    else plan = new AdvancedWorkoutPlan();
%>

    <h3 style="color:#ff9800;"><%= plan.getLevel() %> Workout Plan</h3>
    <p><%= plan.getDescription() %></p>

    <!-- Workout Images Section -->
    <h3>Exercise Previews</h3>
    <div class="exercise-images">
        <div class="exercise-card">
            <img src="media/pushup.jpg" alt="">
            <p>Push Ups</p>
        </div>
        <div class="exercise-card">
            <img src="media/squat.jpg" alt="">
            <p>Squats</p>
        </div>
        <div class="exercise-card">
            <img src="media/plank.jpg" alt="">
            <p>Plank</p>
        </div>
        <div class="exercise-card">
            <img src="media/jumping-jacks.jpg" alt="">
            <p>Jumping Jacks</p>
        </div>
    </div>

    <!-- 7 Day Plan Table -->
    <h3 style="margin-top:30px;">7-Day Structured Plan</h3>
    <table>
        <tr>
            <th>Day</th>
            <th>Workout</th>
        </tr>
        <tr><td>Day 1</td><td>Full Body Warmup + Strength Training</td></tr>
        <tr><td>Day 2</td><td>Upper Body (Chest + Shoulders + Arms)</td></tr>
        <tr><td>Day 3</td><td>Lower Body (Legs + Glutes)</td></tr>
        <tr><td>Day 4</td><td>Core Workout (Abs + Planks)</td></tr>
        <tr><td>Day 5</td><td>Cardio + HIIT</td></tr>
        <tr><td>Day 6</td><td>Mixed Strength + Endurance</td></tr>
        <tr><td>Day 7</td><td>Rest / Light Stretching</td></tr>
    </table>

    <!-- Download Plan -->
    <p style="margin-top:25px;">
        <a href="<%= plan.getLevel() %>.txt" download style="color:#ff9800;font-weight:bold;">
            Download Full Workout Plan
        </a>
    </p>

<%
}
%>

</div>

<%@ include file="footer.jsp" %>
