<%@ page import="java.util.*, mypackage.Task" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Liste des tâches</title>
</head>
<body>
    <h2>Mes Tâches</h2>
    <%
        HttpSession session = request.getSession();
        ArrayList<Task> tasks = (ArrayList<Task>) session.getAttribute("tasks");

        if (tasks == null || tasks.isEmpty()) {
    %>
        <p>Aucune tâche ajoutée pour l’instant.</p>
    <%
        } else {
            for (Task t : tasks) {
    %>
        <div style="border:1px solid #ccc; padding:10px; margin-bottom:10px;">
            <strong><%= t.getTitle() %></strong><br>
            <em><%= t.getDescription() %></em>
        </div>
    <%
            }
        }
    %>
    <br>
    <a href="index.jsp">Ajouter une nouvelle tâche</a>
</body>
</html>
