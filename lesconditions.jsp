<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
<head>
    <title>Les conditions</title>
</head>
<body bgcolor="white">
    <h1>Exercices sur les conditions</h1>
    <form action="#" method="post">
        <p>Saisir la valeur 1 (A pour l'exercice 1 et le nombre à tester pour pair/impair) : 
            <input type="text" id="inputValeur1" name="valeur1"></p>
        <p>Saisir la valeur 2 (B pour l'exercice 1) : 
            <input type="text" id="inputValeur2" name="valeur2"></p>
        <p>Saisir la valeur 3 (C pour l'exercice 1) : 
            <input type="text" id="inputValeur3" name="valeur3"></p>
        <input type="submit" value="Afficher">
    </form>

    <%-- Récupération des valeurs saisies --%>
    <%
        String val1 = request.getParameter("valeur1");
        String val2 = request.getParameter("valeur2");
        String val3 = request.getParameter("valeur3");
        if(val1 != null && val2 != null && val3 != null &&
           !val1.isEmpty() && !val2.isEmpty() && !val3.isEmpty()) {
            int intVal1 = Integer.parseInt(val1);
            int intVal2 = Integer.parseInt(val2);
            int intVal3 = Integer.parseInt(val3);
    %>

    <!-- Comparaison initiale entre Valeur 1 et Valeur 2 -->
    <h2>Comparaison entre Valeur 1 et Valeur 2</h2>
    <% if (intVal1 > intVal2) { %>
        <p>Valeur 1 (<%= intVal1 %>) est supérieure à Valeur 2 (<%= intVal2 %>).</p>
    <% } else if (intVal1 < intVal2) { %>
        <p>Valeur 1 (<%= intVal1 %>) est inférieure à Valeur 2 (<%= intVal2 %>).</p>
    <% } else { %>
        <p>Valeur 1 (<%= intVal1 %>) est égale à Valeur 2 (<%= intVal2 %>).</p>
    <% } %>

    <!-- Exercice 1 : Comparaison 1 -->
    <h2>Exercice 1 : Comparaison 1</h2>
    <p>
        A = <%= intVal1 %><br/>
        B = <%= intVal2 %><br/>
        C = <%= intVal3 %><br/>
    </p>
    <% 
        // On vérifie si C est compris entre A et B, quelque soit l'ordre de A et B
        if ((intVal3 >= intVal1 && intVal3 <= intVal2) || (intVal3 >= intVal2 && intVal3 <= intVal1)) { 
    %>
        <p>Oui, C est compris entre A et B.</p>
    <% } else { %>
        <p>Non, C n'est pas compris entre A et B.</p>
    <% } %>

    <!-- Exercice 2 : Pair ou Impair ? -->
    <h2>Exercice 2 : Pair ou Impair ?</h2>
    <p>On vérifie si la valeur 1 (<%= intVal1 %>) est paire ou impaire.</p>
    <% if (intVal1 % 2 == 0) { %>
        <p>La valeur <%= intVal1 %> est paire.</p>
    <% } else { %>
        <p>La valeur <%= intVal1 %> est impaire.</p>
    <% } %>

    <% } %>
    <p><a href="index.html">Retour au sommaire</a></p>
</body>
</html>
