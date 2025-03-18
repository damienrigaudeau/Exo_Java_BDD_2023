<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
<head>
    <title>Les tableaux</title>
</head>
<body bgcolor="white">
    <h1>Exercices sur les tableaux</h1>
    <form action="#" method="post">
        <p>
            Saisir au minimum 3 chiffres à la suite, exemple : 6 78 15 
            <input type="text" id="inputValeur" name="chaine">
        </p>
        <p><input type="submit" value="Afficher"></p>
    </form>
    
    <% 
       String chaine = request.getParameter("chaine"); 
       if (chaine != null && !chaine.isEmpty()) { 
           // Découpage de la chaîne sur un ou plusieurs espaces
           String[] tableauDeChiffres = chaine.split("\\s+");
    %>
    <p>
        Le tableau contient <%= tableauDeChiffres.length %> valeurs<br/>
        Chiffre 1 : <%= Integer.parseInt(tableauDeChiffres[0]) %><br/>
        Chiffre 2 : <%= Integer.parseInt(tableauDeChiffres[1]) %><br/>
        Chiffre 3 : <%= Integer.parseInt(tableauDeChiffres[2]) %>
    </p>
    <%
           // Conversion du tableau de String en tableau d'entiers
           int[] numbers = new int[tableauDeChiffres.length];
           for (int i = 0; i < tableauDeChiffres.length; i++) {
               numbers[i] = Integer.parseInt(tableauDeChiffres[i]);
           }
    %>
    
    <!-- Exercice 1 : Le carré de la première valeur -->
    <h2>Exercice 1 : Le carré de la première valeur</h2>
    <p>
    <%
         if (numbers.length > 0) {
             int square = numbers[0] * numbers[0];
             out.println("Le carré de " + numbers[0] + " est : " + square);
         } else {
             out.println("Pas de valeur saisie.");
         }
    %>
    </p>
    
    <!-- Exercice 2 : La somme des 2 premières valeurs -->
    <h2>Exercice 2 : La somme des 2 premières valeurs</h2>
    <p>
    <%
         if (numbers.length >= 2) {
             int somme = numbers[0] + numbers[1];
             out.println("La somme de " + numbers[0] + " et " + numbers[1] + " est : " + somme);
         } else {
             out.println("Il faut au moins 2 valeurs pour effectuer la somme.");
         }
    %>
    </p>
    
    <!-- Exercice 3 : La somme de toutes les valeurs -->
    <h2>Exercice 3 : La somme de toutes les valeurs</h2>
    <p>
    <%
         int sommeTotale = 0;
         for (int i = 0; i < numbers.length; i++) {
             sommeTotale += numbers[i];
         }
         out.println("La somme de toutes les valeurs est : " + sommeTotale);
    %>
    </p>
    
    <!-- Exercice 4 : La valeur maximum -->
    <h2>Exercice 4 : La valeur maximum</h2>
    <p>
    <%
         int max = numbers[0];
         for (int i = 1; i < numbers.length; i++) {
             if (numbers[i] > max) {
                 max = numbers[i];
             }
         }
         out.println("La valeur maximale est : " + max);
    %>
    </p>
    
    <!-- Exercice 5 : La valeur minimale -->
    <h2>Exercice 5 : La valeur minimale</h2>
    <p>
    <%
         int min = numbers[0];
         for (int i = 1; i < numbers.length; i++) {
             if (numbers[i] < min) {
                 min = numbers[i];
             }
         }
         out.println("La valeur minimale est : " + min);
    %>
    </p>
    
    <!-- Exercice 6 : La valeur la plus proche de 0 -->
    <h2>Exercice 6 : La valeur la plus proche de 0</h2>
    <p>
    <%
         int closest = numbers[0];
         for (int i = 1; i < numbers.length; i++) {
             if (Math.abs(numbers[i]) < Math.abs(closest)) {
                 closest = numbers[i];
             }
         }
         out.println("La valeur la plus proche de 0 est : " + closest);
    %>
    </p>
    
    <!-- Exercice 7 : La valeur la plus proche de 0 (2° version) -->
    <h2>Exercice 7 : La valeur la plus proche de 0 (2° version)</h2>
    <p>
    <%
         int closest2 = numbers[0];
         for (int i = 1; i < numbers.length; i++) {
             int current = numbers[i];
             // Si la valeur absolue de current est inférieure à celle de closest2, on met à jour
             if (Math.abs(current) < Math.abs(closest2)) {
                 closest2 = current;
             } 
             // En cas d'égalité, si current est positif, on le privilégie
             else if (Math.abs(current) == Math.abs(closest2) && current > closest2) {
                 closest2 = current;
             }
         }
         out.println("La valeur la plus proche de 0 (version 2) est : " + closest2);
    %>
    </p>
    
    <% } %>
    <p><a href="index.html">Retour au sommaire</a></p>
</body>
</html>
