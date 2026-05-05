<%@ include file="header.jsp" %>

<style>

    /* ✨ Light background image */
    body{
        margin:0;
        font-family:Arial, sans-serif;
        background: url("media/bmi.jpg") center/cover no-repeat fixed;
        background-color:#f5f5f5;
        position: relative;
    }

    body::before{
        content:"";
        position: fixed;
        inset:0;
        background:rgba(255,255,255,0.65);
        z-index:-1;
    }

    .container{
        max-width:900px;
        margin:40px auto;
        padding:20px;
        background:rgba(255,255,255,0.85);
        border-radius:15px;
        box-shadow:0 0 12px rgba(0,0,0,0.15);
    }

    h2{
        text-align:center;
        margin-bottom:20px;
    }

    .bmi-grid{
        display:flex;
        flex-wrap:wrap;
        gap:25px;
        align-items:flex-start;
        justify-content:center;
    }

    .bmi-form{
        flex:1 1 280px;
        background:#fff;
        padding:20px;
        border-radius:12px;
        box-shadow:0 0 10px rgba(0,0,0,0.1);
    }

    .bmi-form label{
        display:block;
        margin:10px 0 5px 0;
        font-size:15px;
        font-weight:bold;
    }

    .bmi-form input[type="number"]{
        width:100%;
        padding:8px;
        border-radius:6px;
        border:1px solid #aaa;
        box-sizing:border-box;
    }

    .bmi-form input[type="submit"]{
        width:100%;
        padding:10px;
        margin-top:15px;
        border:none;
        border-radius:25px;
        background:#007bff;
        color:#fff;
        font-size:15px;
        cursor:pointer;
    }

    .bmi-form input[type="submit"]:hover{
        background:#0056b3;
    }

    .bmi-info{
        flex:1 1 280px;
        background:#fff;
        padding:20px;
        border-radius:12px;
        box-shadow:0 0 10px rgba(0,0,0,0.1);
        font-size:14px;
        color:#444;
    }

    .bmi-range-list{
        margin-top:10px;
        padding-left:20px;
    }

    .bmi-range-list li{
        margin:4px 0;
    }

    .bmi-result{
        margin-top:20px;
        padding:12px;
        border-radius:8px;
        font-size:16px;
        font-weight:bold;
        text-align:center;
    }

    .bmi-result.under{background:#cce5ff;color:#004085;}
    .bmi-result.normal{background:#d4edda;color:#155724;}
    .bmi-result.over{background:#fff3cd;color:#856404;}
    .bmi-result.obese{background:#f8d7da;color:#721c24;}

</style>

</head>
<body>

<div class="container">
    <h2>FITTRACK - BMI CALCULATOR</h2>

    <div class="bmi-grid">

        <!-- BMI Form -->
        <div class="bmi-form">
            <form action="" method="post">
                <label for="weight">Enter Weight (kg):</label>
                <input type="number" name="weight" step="0.1" required>

                <label for="height">Enter Height (cm):</label>
                <input type="number" name="height" step="0.1" required>

                <input type="submit" value="Calculate BMI">
            </form>

            <% 
                String w = request.getParameter("weight");
                String h = request.getParameter("height");

                if(w != null && h != null){
                    try{
                        double weight = Double.parseDouble(w);
                        double height = Double.parseDouble(h) / 100; 
                        double bmi = weight / (height * height);

                        String category = "";
                        String css = "";

                        if(bmi < 18.5){ category="Underweight"; css="under"; }
                        else if(bmi < 24.9){ category="Normal"; css="normal"; }
                        else if(bmi < 29.9){ category="Overweight"; css="over"; }
                        else{ category="Obese"; css="obese"; }
            %>

            <div class="bmi-result <%= css %>">
                Your BMI: <%= String.format("%.2f", bmi) %> - <%= category %>
            </div>

            <% 
                    } catch(Exception e){
            %>
                <p style="color:red;">Invalid input!</p>
            <% 
                    }
                } 
            %>

        </div>

        <!-- Info Section -->
        <div class="bmi-info">
            <h3>About BMI</h3>
            <p>Body Mass Index (BMI) helps determine if your weight is healthy for your height.</p>

            <h4>BMI Categories:</h4>
            <ul class="bmi-range-list">
                <li><strong>&lt; 18.5:</strong> Underweight</li>
                <li><strong>18.5 - 24.9:</strong> Normal weight</li>
                <li><strong>25 - 29.9:</strong> Overweight</li>
                <li><strong>30 and above:</strong> Obese</li>
            </ul>
        </div>

    </div>
</div>
<%@ include file="footer.jsp" %>