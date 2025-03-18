<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Gestion des Films et Projet Bibliothèque</title>
</head>
<body>
    <h1>Exemple de connexion à MariaDB via JSP - Gestion des Films</h1>
    <%
        // Paramètres de connexion
        String url = "jdbc:mariadb://localhost:3306/films";
        String dbUser = "cnam";
        String dbPassword = "cnam";
        
        Connection conn = null;
        try {
            Class.forName("org.mariadb.jdbc.Driver");
            conn = DriverManager.getConnection(url, dbUser, dbPassword);
        } catch(Exception e) {
            out.println("Erreur de connexion : " + e.getMessage());
        }
    %>
    
    <!-- Exercice 1 : Les films entre 2000 et 2015 -->
    <h2>Exercice 1 : Les films entre 2000 et 2015</h2>
    <p>Extraire les films dont l'année est supérieure à 2000 et inférieure à 2015.</p>
    <%
        if(conn != null) {
            String sqlEx1 = "SELECT idFilm, titre, annee FROM Film WHERE annee > 2000 AND annee < 2015";
            try {
                PreparedStatement psEx1 = conn.prepareStatement(sqlEx1);
                ResultSet rsEx1 = psEx1.executeQuery();
                while(rsEx1.next()){
                    String idFilm = rsEx1.getString("idFilm");
                    String titre = rsEx1.getString("titre");
                    String annee = rsEx1.getString("annee");
                    out.println("id : " + idFilm + ", titre : " + titre + ", année : " + annee + "<br/>");
                }
                rsEx1.close();
                psEx1.close();
            } catch(SQLException ex) {
                out.println("Erreur lors de l'exécution de l'exercice 1 : " + ex.getMessage());
            }
        }
    %>
    
    <!-- Exercice 2 : Année de recherche -->
    <h2>Exercice 2 : Année de recherche</h2>
    <p>Entrez une année pour rechercher les films correspondants :</p>
    <form method="post">
        <input type="text" name="searchYear" placeholder="Année de recherche" />
        <input type="submit" value="Rechercher" />
    </form>
    <%
        String searchYear = request.getParameter("searchYear");
        if(searchYear != null && !searchYear.isEmpty() && conn != null) {
            String sqlEx2 = "SELECT idFilm, titre, annee FROM Film WHERE annee = ?";
            try {
                PreparedStatement psEx2 = conn.prepareStatement(sqlEx2);
                psEx2.setInt(1, Integer.parseInt(searchYear));
                ResultSet rsEx2 = psEx2.executeQuery();
                while(rsEx2.next()){
                    String idFilm = rsEx2.getString("idFilm");
                    String titre = rsEx2.getString("titre");
                    String annee = rsEx2.getString("annee");
                    out.println("id : " + idFilm + ", titre : " + titre + ", année : " + annee + "<br/>");
                }
                rsEx2.close();
                psEx2.close();
            } catch(SQLException ex) {
                out.println("Erreur lors de la recherche par année : " + ex.getMessage());
            }
        }
    %>
    
    <!-- Exercice 3 : Modification du titre du film -->
    <h2>Exercice 3 : Modification du titre du film</h2>
    <p>Modifier le titre d'un film sur la base de son ID :</p>
    <form method="post">
        <input type="text" name="filmId" placeholder="ID du film" />
        <input type="text" name="newTitle" placeholder="Nouveau titre" />
        <input type="submit" value="Modifier" />
    </form>
    <%
        String filmIdParam = request.getParameter("filmId");
        String newTitle = request.getParameter("newTitle");
        if(filmIdParam != null && !filmIdParam.isEmpty() && newTitle != null && !newTitle.isEmpty() && conn != null) {
            String sqlEx3 = "UPDATE Film SET titre = ? WHERE idFilm = ?";
            try {
                PreparedStatement psEx3 = conn.prepareStatement(sqlEx3);
                psEx3.setString(1, newTitle);
                psEx3.setInt(2, Integer.parseInt(filmIdParam));
                int updated = psEx3.executeUpdate();
                if(updated > 0) {
                    out.println("Film avec ID " + filmIdParam + " mis à jour avec le nouveau titre : " + newTitle + "<br/>");
                } else {
                    out.println("Aucun film trouvé avec l'ID " + filmIdParam + "<br/>");
                }
                psEx3.close();
            } catch(SQLException ex) {
                out.println("Erreur lors de la modification du film : " + ex.getMessage());
            }
        }
    %>
    
    <!-- Exercice 4 : Ajout d'un nouveau film -->
    <h2>Exercice 4 : Saisie d'un nouveau film</h2>
    <p>Créer un formulaire pour saisir un nouveau film dans la base de données :</p>
    <form method="post">
        <input type="text" name="newFilmTitle" placeholder="Titre du film" />
        <input type="text" name="newFilmYear" placeholder="Année du film" />
        <input type="submit" value="Ajouter le film" />
    </form>
    <%
        String newFilmTitle = request.getParameter("newFilmTitle");
        String newFilmYear = request.getParameter("newFilmYear");
        if(newFilmTitle != null && !newFilmTitle.isEmpty() && newFilmYear != null && !newFilmYear.isEmpty() && conn != null) {
            String sqlEx4 = "INSERT INTO Film (titre, annee) VALUES (?, ?)";
            try {
                PreparedStatement psEx4 = conn.prepareStatement(sqlEx4);
                psEx4.setString(1, newFilmTitle);
                psEx4.setInt(2, Integer.parseInt(newFilmYear));
                int inserted = psEx4.executeUpdate();
                if(inserted > 0) {
                    out.println("Nouveau film ajouté : " + newFilmTitle + " (" + newFilmYear + ")<br/>");
                } else {
                    out.println("Erreur lors de l'ajout du nouveau film.<br/>");
                }
                psEx4.close();
            } catch(SQLException ex) {
                out.println("Erreur lors de l'ajout du nouveau film : " + ex.getMessage());
            }
        }
    %>
    
    <%
        // Fermeture de la connexion si elle est ouverte
        if(conn != null) {
            try {
                conn.close();
            } catch(SQLException ex) {
                out.println("Erreur lors de la fermeture de la connexion : " + ex.getMessage());
            }
        }
    %>
    
    <hr>
    <h3>Projet Bibliothèque</h3>
    <p>
        Votre projet consiste à concevoir et développer une application de gestion de bibliothèque moderne qui simplifie le processus de prêt et de retour de livres. Les fonctionnalités attendues dans le cadre de ce projet sont les suivantes :
        <ul>
            <li>L’enregistrement et la suppression de livres.</li>
            <li>La recherche de livres disponibles.</li>
            <li>L'emprunt possible d'un livre par un utilisateur.</li>
            <li>La gestion des utilisateurs.</li>
            <li>La gestion des stocks.</li>
        </ul>
        Votre travail est de créer votre code afin de répondre aux besoins définis ci-dessus. L'application exploitera le langage JSP (JAVA) pour interagir avec la base de données MariaDB.
        L’application pourra être enrichie avec des fonctionnalités supplémentaires telles que des recommandations de livres, des notifications pour les retours en retard, ou encore des rapports statistiques sur l'utilisation des livres pour améliorer l'expérience utilisateur et la gestion de la bibliothèque.
    </p>
</body>
</html>
