<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
<head>
    <title>Les chaines</title>
</head>
<body bgcolor="white">
    <h1>Exercices sur les chaines de caractères</h1>
    <form action="#" method="post">
        <p>Saisir une chaine (Du texte avec 6 caractères minimum) : 
            <input type="text" id="inputValeur" name="chaine">
        </p>
        <p><input type="submit" value="Afficher"></p>
    </form>
    
    <% 
       // Récupération de la chaîne saisie par l'utilisateur
       String chaine = request.getParameter("chaine"); 
       if (chaine != null && !chaine.isEmpty() && chaine.length() >= 6) {
    %>
    
    <!-- Affichage d'informations de base -->
    <p>La longueur de votre chaîne est de <%= chaine.length() %> caractères</p>
    <% char caractereExtrait = chaine.charAt(2); %>
    <p>Le 3ème caractère de votre chaîne est : <%= caractereExtrait %></p>
    <% String sousChaine = chaine.substring(2, 6); %>
    <p>Une sous-chaîne de votre texte : <%= sousChaine %></p>
    <% 
       char recherche = 'e'; 
       int position = chaine.indexOf(recherche); 
    %>
    <p>Votre premier "e" est en position : <%= position %></p>
    
    <!-- Exercice 1 : Compter le nombre de 'e' dans la chaîne -->
    <h2>Exercice 1 : Combien de 'e' dans notre chaine de caractères ?</h2>
    <%
       int countE = 0;
       for (int i = 0; i < chaine.length(); i++) {
           char c = chaine.charAt(i);
           if (Character.toLowerCase(c) == 'e') {
               countE++;
           }
       }
    %>
    <p>Le nombre de 'e' (ou 'E') dans la chaîne est : <%= countE %></p>
    
    <!-- Exercice 2 : Affichage vertical -->
    <h2>Exercice 2 : Affichage vertical</h2>
    <p>
    <% for (int i = 0; i < chaine.length(); i++) { %>
         <%= chaine.charAt(i) %><br/>
    <% } %>
    </p>
    
    <!-- Exercice 3 : Retour à la ligne sur chaque espace -->
    <h2>Exercice 3 : Retour à la ligne</h2>
    <%
       String[] words = chaine.split(" ");
    %>
    <p>
    <% for (int i = 0; i < words.length; i++) { %>
         <%= words[i] %><br/>
    <% } %>
    </p>
    
    <!-- Exercice 4 : Afficher une lettre sur deux -->
    <h2>Exercice 4 : Afficher une lettre sur deux</h2>
    <p>
    <%
       for (int i = 0; i < chaine.length(); i += 2) {
           out.print(chaine.charAt(i));
       }
    %>
    </p>
    
    <!-- Exercice 5 : La phrase en verlant (texte inversé) -->
    <h2>Exercice 5 : La phrase en verlant</h2>
    <%
       String reversed = "";
       for (int i = chaine.length() - 1; i >= 0; i--) {
           reversed += chaine.charAt(i);
       }
    %>
    <p><%= reversed %></p>
    
    <!-- Exercice 6 : Consonnes et voyelles -->
    <h2>Exercice 6 : Consonnes et voyelles</h2>
    <%
       int countVowels = 0;
       int countConsonants = 0;
       for (int i = 0; i < chaine.length(); i++) {
           char c = Character.toLowerCase(chaine.charAt(i));
           if (Character.isLetter(c)) {
               if (c == 'a' || c == 'e' || c == 'i' || c == 'o' || c == 'u' || c == 'y') {
                   countVowels++;
               } else {
                   countConsonants++;
               }
           }
       }
    %>
    <p>Nombre de voyelles : <%= countVowels %></p>
    <p>Nombre de consonnes : <%= countConsonants %></p>
    
    <% } else if (chaine != null && chaine.length() < 6) { %>
       <p>Veuillez saisir une chaîne avec au moins 6 caractères.</p>
    <% } %>
    
    <p><a href="index.html">Retour au sommaire</a></p>
</body>
</html>
