<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Ajouter une tâche</title>
</head>
<body>
    <h2>Ajouter une nouvelle tâche</h2>
    <form action="addTask" method="post">
        <label for="title">Titre :</label><br>
        <input type="text" name="title" id="title" required><br><br>

        <label for="description">Description :</label><br>
        <textarea name="description" id="description" required></textarea><br><br>

        <input type="submit" value="Ajouter">
    </form>
    <br>
    <a href="tasks.jsp">Voir mes tâches</a>
</body>
</html>
