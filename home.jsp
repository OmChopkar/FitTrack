<%@ include file="header.jsp" %>

<style>
    body {
        position: relative;
    }

    /* background image with low opacity */
    body::before {
        content: "";
        position: fixed;
        inset: 0;
        background: url("media/dashboard.jpg") center/cover no-repeat;
        opacity: 0.25;
        z-index: -1;
    }

    .hero {
        display: flex;
        align-items: center;
        justify-content: space-between;
        gap: 20px;
    }

    .hero-text {
        max-width: 55%;
    }

    .hero-title {
        font-size: 28px;
        margin-bottom: 10px;
    }

    .hero-sub {
        font-size: 16px;
        color: #555;
        line-height: 1.5;
    }

    .hero-extra {
        margin-top: 10px;
        font-size: 14px;
        color: #555;
    }

    .hero-img {
        max-width: 40%;
    }

    .hero-img img {
        width: 100%;
        border-radius: 10px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
        object-fit: cover;
    }

    .stats {
        display: flex;
        flex-wrap: wrap;
        gap: 15px;
        margin-top: 25px;
    }

    .stat-card {
        flex: 1 1 150px;
        min-width: 150px;
        background: #f8f9fa;
        border-radius: 10px;
        padding: 15px;
        box-shadow: 0 0 8px rgba(0, 0, 0, 0.08);
        text-align: center;
    }

    .stat-number {
        font-size: 22px;
        font-weight: bold;
        color: #007bff;
    }

    .stat-label {
        font-size: 13px;
        color: #666;
    }

    .quick-links {
        margin-top: 25px;
    }

    .quick-links h3 {
        margin-bottom: 10px;
    }

    .quick-links a {
        display: inline-block;
        margin: 5px 10px 5px 0;
        padding: 8px 14px;
        border-radius: 20px;
        background: #007bff;
        color: #fff;
        text-decoration: none;
        font-size: 13px;
    }

    .quick-links a:hover {
        background: #0056b3;
    }

    .info-section {
        margin-top: 30px;
        background: #ffffffd9;
        border-radius: 10px;
        padding: 15px 18px;
        box-shadow: 0 0 8px rgba(0, 0, 0, 0.05);
        font-size: 14px;
        color: #555;
        line-height: 1.6;
    }

    .info-section h3 {
        margin-top: 0;
        margin-bottom: 8px;
    }

    .info-columns {
        display: flex;
        flex-wrap: wrap;
        gap: 15px;
        margin-top: 10px;
    }

    .info-col {
        flex: 1 1 220px;
    }

    /* testimonials */
    .testimonials {
        margin-top: 30px;
    }

    .testimonials h3 {
        margin-bottom: 10px;
    }

    .testimonial-slider {
        position: relative;
        overflow: hidden;
        border-radius: 10px;
        background: #ffffffd9;
        box-shadow: 0 0 8px rgba(0, 0, 0, 0.08);
        padding: 15px 18px;
        min-height: 150px;
    }

    .testimonial-card {
        display: none;
    }

    .testimonial-card.active {
        display: flex;
        gap: 12px;
        align-items: flex-start;
    }

    .testimonial-avatar {
        flex: 0 0 48px;
    }

    .testimonial-avatar img {
        width: 48px;
        height: 48px;
        border-radius: 50%;
        object-fit: cover;
        box-shadow: 0 0 5px rgba(0, 0, 0, 0.2);
    }

    .testimonial-content {
        flex: 1;
    }

    .testimonial-text {
        font-size: 14px;
        color: #555;
        margin-bottom: 8px;
    }

    .testimonial-user {
        font-weight: bold;
        font-size: 13px;
    }

    .testimonial-role {
        font-size: 12px;
        color: #777;
    }

    .testimonial-controls {
        margin-top: 10px;
        text-align: right;
    }

    .testimonial-controls button {
        padding: 4px 10px;
        margin-left: 5px;
        border-radius: 15px;
        border: none;
        background: #007bff;
        color: #fff;
        cursor: pointer;
        font-size: 12px;
    }

    .testimonial-controls button:hover {
        background: #0056b3;
    }

    /* feedback form */
    .feedback-form {
        margin-top: 18px;
        background: #f8f9fa;
        border-radius: 10px;
        padding: 12px 15px;
        box-shadow: 0 0 6px rgba(0, 0, 0, 0.05);
    }

    .feedback-form label {
        display: block;
        font-size: 13px;
        margin-top: 5px;
    }

    .feedback-form input,
    .feedback-form textarea {
        width: 100%;
        padding: 6px 8px;
        margin-top: 3px;
        border-radius: 5px;
        border: 1px solid #ccc;
        box-sizing: border-box;
        font-size: 13px;
    }

    .feedback-form textarea {
        resize: vertical;
        min-height: 60px;
    }

    .feedback-form button {
        margin-top: 8px;
        padding: 7px 14px;
        background: #28a745;
        color: #fff;
        border: none;
        border-radius: 20px;
        cursor: pointer;
        font-size: 13px;
    }

    .feedback-form button:hover {
        background: #218838;
    }
</style>


<%
    String username = (String) session.getAttribute("username");
    if (username == null) {
        response.sendRedirect("index.jsp");
        return;
    }
%>

<div class="hero">
    <div class="hero-text">
        <h2 class="hero-title">Welcome, <%= username %>!</h2>

        <p class="hero-sub">
            Fit-Track gives you a simple, file-based dashboard to manage your entire fitness routine in one place.
            Track your BMI, follow structured workout plans, monitor daily meals, and log every training session
            so you never lose your progress.
        </p>

        <p class="hero-extra">
            Use this home page as your control center: jump quickly to key tools, review your activity,
            and stay consistent with small improvements every day.
        </p>

        <div class="quick-links">
            <h3>Start tracking now</h3>
            <a href="bmi.jsp">Check BMI</a>
            <a href="workout.jsp">View Workouts</a>
            <a href="diet.jsp">Log Diet</a>
            <a href="progress.jsp">Update Progress</a>
        </div>
    </div>

    <div class="hero-img">
        <img src="media/dashboard.jpg" alt="Fitness dashboard">
    </div>
</div>


<!-- STATS SECTION -->
<div class="stats">
    <div class="stat-card"><div class="stat-number">1,250+</div><div class="stat-label">Total workouts logged</div></div>
    <div class="stat-card"><div class="stat-number">780+</div><div class="stat-label">Diet entries recorded</div></div>
    <div class="stat-card"><div class="stat-number">320+</div><div class="stat-label">Active users this month</div></div>
    <div class="stat-card"><div class="stat-number">4.8</div><div class="stat-label">Average user satisfaction</div></div>
    <div class="stat-card"><div class="stat-number">1.4</div><div class="stat-label">Avg. workouts per day</div></div>
    <div class="stat-card"><div class="stat-number">2100</div><div class="stat-label">Avg. calories logged / day</div></div>
</div>


<!-- INFO SECTION -->
<div class="info-section">
    <h3>How to use your Fit-Track dashboard</h3>

    <div class="info-columns">
        <div class="info-col">
            <strong>BMI & health snapshot</strong><br>
            Start with the BMI page to understand your current status, then re-check weekly to see how
            your training and diet impact your score.
        </div>

        <div class="info-col">
            <strong>Structured workout log</strong><br>
            Choose a plan that matches your level, follow the suggested schedule,
            and record your sets, reps, and weights after every session.
        </div>

        <div class="info-col">
            <strong>Daily nutrition awareness</strong><br>
            Use the diet tracker to quickly log meals and calories so you can stay on target.
        </div>
    </div>

    <p style="margin-top:12px;">
        Over time, these logs build a clear story of your fitness journey. Use them during reviews
        with your trainer or simply to motivate yourself by looking back at how far you’ve come.
    </p>
</div>


<!-- TESTIMONIALS -->
<div class="testimonials">
    <h3>What our users say</h3>

    <div class="testimonial-slider" id="testimonialSlider">

        <div class="testimonial-card active">
            <div class="testimonial-avatar">
                <img src="media/user1.jpg" alt="User 1">
            </div>
            <div class="testimonial-content">
                <p class="testimonial-text">
                    "Fit-Track keeps all my workouts and diet logs in one place. I finally understand what actually works."
                </p>
                <p class="testimonial-user">Tanmay, 21</p>
                <p class="testimonial-role">College student, beginner lifter</p>
            </div>
        </div>

        <div class="testimonial-card">
            <div class="testimonial-avatar">
                <img src="media/user2.jpg" alt="User 2">
            </div>
            <div class="testimonial-content">
                <p class="testimonial-text">
                    "The progress tracker is perfect for my mini-project feels like a real fitness app."
                </p>
                <p class="testimonial-user">Om, 20</p>
                <p class="testimonial-role">CS student, project builder</p>
            </div>
        </div>

        <div class="testimonial-card">
            <div class="testimonial-avatar">
                <img src="media/user3.jpg" alt="User 3">
            </div>
            <div class="testimonial-content">
                <p class="testimonial-text">
                    "I love how quickly I can log sets and meals. It keeps me consistent."
                </p>
                <p class="testimonial-user">Dewanshu, 23</p>
                <p class="testimonial-role">Working professional</p>
            </div>
        </div>

        <div class="testimonial-controls">
            <button type="button" onclick="prevTestimonial()">Prev</button>
            <button type="button" onclick="nextTestimonial()">Next</button>
        </div>

    </div>


    <!-- FEEDBACK FORM -->
    <div class="feedback-form">
        <h4>Share your experience</h4>

        <form onsubmit="return addFeedback();">
            <label for="fbName">Name</label>
            <input type="text" id="fbName" required>

            <label for="fbRole">Role / Level (optional)</label>
            <input type="text" id="fbRole" placeholder="e.g., Student, Beginner, Trainer">

            <label for="fbText">Your feedback</label>
            <textarea id="fbText" required placeholder="Write a short review..."></textarea>

            <button type="submit">Submit feedback</button>
        </form>

        <p id="fbMessage"
           style="font-size:12px;color:#28a745;margin-top:4px;display:none;">
            Thank you! Your feedback has been added below.
        </p>
    </div>
</div>


<!-- SCRIPT -->
<script>
    let currentTestimonial = 0;

    function showTestimonial(index) {
        const cards = document.querySelectorAll("#testimonialSlider .testimonial-card");
        if (cards.length === 0) return;

        currentTestimonial = (index + cards.length) % cards.length;

        cards.forEach((c, i) =>
            c.classList.toggle("active", i === currentTestimonial)
        );
    }

    function nextTestimonial() {
        showTestimonial(currentTestimonial + 1);
    }

    function prevTestimonial() {
        showTestimonial(currentTestimonial - 1);
    }

    setInterval(nextTestimonial, 6000);

    function addFeedback() {
        const name = document.getElementById("fbName").value.trim() || "Anonymous";
        const role = document.getElementById("fbRole").value.trim();
        const text = document.getElementById("fbText").value.trim();
        if (!text) return false;

        const slider = document.getElementById("testimonialSlider");

        const card = document.createElement("div");
        card.className = "testimonial-card";
        card.innerHTML = `
            <div class="testimonial-avatar">
                <img src="media/default-user.jpg" alt="User">
            </div>
            <div class="testimonial-content">
                <p class="testimonial-text">"${text}"</p>
                <p class="testimonial-user">${name}</p>
                <p class="testimonial-role">${role || "Fit-Track user"}</p>
            </div>
        `;

        slider.insertBefore(card, slider.querySelector(".testimonial-controls"));

        document.getElementById("fbName").value = "";
        document.getElementById("fbRole").value = "";
        document.getElementById("fbText").value = "";

        document.getElementById("fbMessage").style.display = "block";

        const cards = document.querySelectorAll("#testimonialSlider .testimonial-card");
        showTestimonial(cards.length - 1);

        return false;
    }
</script>

<%@ include file="footer.jsp" %>
