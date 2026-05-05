<%@ page import="util.FileUtil" %>
<%@ include file="header.jsp" %>
<%
String username = (String)session.getAttribute("username");
if(username==null) { response.sendRedirect("index.jsp"); return; }
%>
<h2>Progress Tracker</h2>
<form method="post">
<input type="text" name="exercise" placeholder="Exercise" required><br>
<input type="number" name="sets" placeholder="Sets" required><br>
<input type="number" name="reps" placeholder="Reps" required><br>
<input type="number" name="weight" placeholder="Weight (kg)" required><br>
<input type="date" name="date" required><br>
<input type="submit" value="Add">
</form>
<%
if("POST".equals(request.getMethod())) {
    try {
        String exercise = request.getParameter("exercise");
        int sets = Integer.parseInt(request.getParameter("sets"));
        int reps = Integer.parseInt(request.getParameter("reps"));
        int weight = Integer.parseInt(request.getParameter("weight"));
        String date = request.getParameter("date");
        FileUtil.appendDietProgress(username, exercise+","+sets+","+reps+","+weight+","+date, "progress");
%>
<p class="message">Added: <%=exercise%> <%=sets%>x<%=reps%> @ <%=weight%>kg</p>
<%
    } catch(Exception e) {
%>
<p class="error">Invalid input!</p>
<%
    }
}
String[] entries = FileUtil.getUserEntries(username, "progress");
%>
<h3>Progress History (<%=entries.length%> entries)</h3>
<table>
<tr><th>Exercise</th><th>Sets</th><th>Reps</th><th>Weight</th><th>Date</th></tr>
<% for(String line : entries) {
    String[] parts = line.split(",");
    if(parts.length>=6) {
%>
<tr><td><%=parts[1]%></td><td><%=parts[2]%></td><td><%=parts[3]%></td><td><%=parts[4]%></td><td><%=parts[5]%></td></tr>
<%
    }
} %>
</table>
<%@ include file="footer.jsp" %>
