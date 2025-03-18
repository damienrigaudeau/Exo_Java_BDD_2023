<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
<head>
    <title>Boucles</title>
</head>
<body bgcolor="white">
    <h1>Exercices sur les boucles</h1>
    <form action="#" method="post">
        <label for="inputValeur">Saisir le nombre d'étoiles : </label>
        <input type="text" id="inputValeur" name="valeur">
        <input type="submit" value="Afficher">
    </form>

    <%-- Récupération de la valeur saisie par l'utilisateur --%>
    <% 
       String valeur = request.getParameter("valeur");
       if (valeur != null && !valeur.isEmpty()) { 
           int cpt = Integer.parseInt(valeur); 
    %>

    <%-- Affichage d'une ligne d'étoiles pour vérification --%>
    <p>
    <% for (int i = 1; i <= cpt; i++) { %>
         <%= "*" %>
    <% } %>
    </p>

    <!-- Exercice 1 : Le carré d'étoiles -->
    <h2>Exercice 1 : Le carré d'étoiles</h2>
    <p>
    <% for (int i = 1; i <= cpt; i++) { 
           for (int j = 1; j <= cpt; j++) { %>
               <%= "*" %>
    <%     } %>
           <br/>
    <% } %>
    </p>

    <!-- Exercice 2 : Triangle rectangle gauche -->
    <h2>Exercice 2 : Triangle rectangle gauche</h2>
    <p>
    <% for (int i = 1; i <= cpt; i++) { 
           for (int j = 1; j <= i; j++) { %>
               <%= "*" %>
    <%     } %>
           <br/>
    <% } %>
    </p>

    <!-- Exercice 3 : Triangle rectangle inversé -->
    <h2>Exercice 3 : Triangle rectangle inversé</h2>
    <p>
    <% for (int i = cpt; i >= 1; i--) { 
           for (int j = 1; j <= i; j++) { %>
               <%= "*" %>
    <%     } %>
           <br/>
    <% } %>
    </p>

    <!-- Exercice 4 : Triangle rectangle aligné à droite (double espaces) -->
    <h2>Exercice 4 : Triangle rectangle 2</h2>
    <p>
    <% for (int i = 1; i <= cpt; i++) { 
           // Afficher (cpt-i)*2 espaces
           for (int s = 1; s <= (cpt - i) * 2; s++) { %>
               <%= "&nbsp;" %>
    <%     } 
           // Afficher i étoiles
           for (int j = 1; j <= i; j++) { %>
               <%= "*" %>
    <%     } %>
           <br/>
    <% } %>
    </p>

    <!-- Exercice 5 : Triangle rectangle aligné à droite (simple espaces) -->
    <h2>Exercice 5 : Triangle isocele</h2>
    <p>
    <% for (int i = 1; i <= cpt; i++) { 
           // Afficher (cpt-i) espaces
           for (int s = 1; s <= (cpt - i); s++) { %>
               <%= "&nbsp;" %>
    <%     } 
           // Afficher i étoiles
           for (int j = 1; j <= i; j++) { %>
               <%= "*" %>
    <%     } %>
           <br/>
    <% } %>
    </p>

    <!-- Exercice 6 : Le demi losange -->
    <h2>Exercice 6 : Le demi losange</h2>
    <p>
    <%-- Partie supérieure du losange (1 à cpt) --%>
    <% for (int i = 1; i <= cpt; i++) { 
           for (int s = 1; s <= (cpt - i) * 2; s++) { %>
               <%= "&nbsp;" %>
    <%     } 
           for (int j = 1; j <= i; j++) { %>
               <%= "*" %>
    <%     } %>
           <br/>
    <% } %>
    
    <%-- Partie inférieure du losange (de cpt à 1) --%>
    <% for (int i = cpt; i >= 1; i--) { 
           for (int s = 1; s <= (cpt - i) * 2; s++) { %>
               <%= "&nbsp;" %>
    <%     } 
           for (int j = 1; j <= i; j++) { %>
               <%= "*" %>
    <%     } %>
           <br/>
    <% } %>
    </p>

    <!-- Exercice 7 : La table de multiplication -->
    <h2>Exercice 7 : La table de multiplication</h2>
    <p>
    <% for (int i = 1; i <= cpt; i++) { %>
         <%= cpt + " x " + i + " = " + (cpt * i) %><br/>
    <% } %>
    </p>

    <% } %>
    <p><a href="index.html">Retour au sommaire</a></p>
</body>
</html>
