<%@ page import="util.FileUtil" %>
<%@ include file="header.jsp" %>
<%
String username = (String)session.getAttribute("username");
if(username==null) { response.sendRedirect("index.jsp"); return; }
%>
<h2>Diet Tracker</h2>
<form method="post">
<input type="text" name="food" placeholder="Food" required>
<input type="number" name="calories" placeholder="Calories" required>
<input type="submit" value="Add">
</form>
<%
if("POST".equals(request.getMethod())) {
    try {
        String food = request.getParameter("food");
        int calories = Integer.parseInt(request.getParameter("calories"));
        FileUtil.appendDietProgress(username, food+","+calories, "diet");
%>
<p class="message">Added: <%=food%> (<%=calories%> cal)</p>
<%
    } catch(Exception e) {
%>
<p class="error">Invalid input!</p>
<%
    }
}
String[] entries = FileUtil.getUserEntries(username, "diet");
%>
<h3>Your Diet (<%=entries.length%> entries)</h3>
<table>
<tr><th>Food</th><th>Calories</th></tr>
<% for(String line : entries) {
    String[] parts = line.split(",");
    if(parts.length>=3) {
%>
<tr><td><%=parts[1]%></td><td><%=parts[2]%></td></tr>
<%
    }
} %>
</table>
<%@ include file="footer.jsp" %>
