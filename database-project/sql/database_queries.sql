-- 1. Afficher les cours par ordre de popularité:
-- a) Par nombre d’utilisateurs inscrits:

SELECT C.Id_Cours, C.Intitule, COUNT(CU.Utilisateurs_Id_Utilisateur) AS Nombre_Utilisateurs_Inscrits
FROM Cours C
JOIN Cours_Utilisateurs CU ON C.Id_Cours = CU.Cours_Id_Cours
GROUP BY C.Id_Cours
ORDER BY Nombre_Utilisateurs_Inscrits DESC;


-- b) Par meilleurs évaluation (notes sur 5 données par les utilisateurs d’un cours)
SELECT 
    C.Id_Cours, 
    C.Intitule AS Titre_Cours, 
    AVG(IC.Appreciation_Note) AS Moyenne_Notes,
    COUNT(IC.Appreciation_Note) AS Nombre_Evaluations
FROM 
    Cours C
JOIN 
    Inscriptions_Cours IC ON C.Id_Cours = IC.Id_Cours
WHERE 
    IC.Appreciation_Note IS NOT NULL
GROUP BY 
    C.Id_Cours, 
    C.Intitule
ORDER BY 
    Moyenne_Notes DESC;
    

-- 2. Pour un cours donné, afficher la liste des utilisateurs:
-- a) Qui ont terminé le cours (toutes les parties ont été marquées comme validées): A VERIFIE

SELECT cu.Utilisateurs_Id_Utilisateur, u.Nom
FROM Cours_Utilisateurs cu
JOIN Utilisateurs u ON cu.Utilisateurs_Id_Utilisateur = u.Id_Utilisateur
WHERE cu.Cours_Id_Cours = 1 AND
    NOT EXISTS (
        SELECT 1
        FROM Partie_numerotee_cours p
        JOIN Examens e ON p.Id_Cours = e.Id_Cours
        WHERE p.Id_Cours = cu.Cours_Id_Cours AND
              NOT EXISTS (
                  SELECT 1
                  FROM Tentatives t
                  WHERE t.Id_Examen = e.Id_Cours AND
                        t.Id_Etudiant = cu.Utilisateurs_Id_Utilisateur AND
                        t.Statut_de_reussite = 'validé'
              )
    );   

-- b) Qui ont tenté au moins une fois tous los examens del cours:
SELECT cu.Utilisateurs_Id_Utilisateur, u.Nom
FROM Cours_Utilisateurs cu
JOIN Utilisateurs u ON cu.Utilisateurs_Id_Utilisateur = u.Id_Utilisateur
WHERE cu.Cours_Id_Cours = 1 AND
    NOT EXISTS (
        SELECT 1
        FROM Examens e
        WHERE e.Id_Cours = cu.Cours_Id_Cours AND
              NOT EXISTS (
                  SELECT 1
                  FROM Tentatives t
                  WHERE t.Id_Examen = e.Id_Cours AND
                        t.Id_Etudiant = cu.Utilisateurs_Id_Utilisateur
              )
    );
    
    
-- c) Qui ont validés le cours (réussi tous les examens): 
SELECT DISTINCT U.Id_Utilisateur, U.Nom
FROM Utilisateurs U
WHERE NOT EXISTS (
    SELECT *
    FROM Examens E
    WHERE E.Id_Cours = 1
    AND NOT EXISTS (
        SELECT *
        FROM Tentatives T
        WHERE T.Id_Examen = E.Id_Cours
        AND T.Id_Etudiant = U.Id_Utilisateur
        AND T.Statut_de_reussite = 'validé'
    )
);


-- 3.- Afficher la liste des utilisateurs par ordre de dépenses (les utilisateurs qui ont dépensé le plus d’argent en achetant des cours payants. On doit voir le montant dépensé dans le résultat de la requête)
SELECT 
    U.Id_Utilisateur,
    U.Nom, 
    SUM(IC.Paiement_Montant) AS Montant_Depense
FROM 
    Utilisateurs U
INNER JOIN 
    Inscriptions_Cours IC ON U.Id_Utilisateur = IC.Id_Utilisateur
WHERE 
    IC.Paiement_Montant  > 0 -- seulement cours payants
GROUP BY 
    U.Id_Utilisateur, 
    U.Nom
ORDER BY 
    Montant_Depense DESC;
    
    
    
-- 4. Afficher les parties d’un cours, ordonnées par chapitres et ordre dans les chapitres
SELECT 
    PNC.Id_Partie,
    PNC.Titre AS Titre_Partie,
    PNC.Chapitre_numerote AS Numero_Chapitre,
    ROW_NUMBER() OVER(PARTITION BY PNC.Chapitre_numerote ORDER BY PNC.Id_Partie) AS Ordre_dans_le_Chapitre
FROM 
    Partie_numerotee_cours PNC
WHERE 
    PNC.Id_Cours = 4
ORDER BY 
    PNC.Chapitre_numerote, Ordre_dans_le_Chapitre;



-- 5. Afficher tous les cours ainsi que les créateurs de cours et formateurs qui y sont rattachés:
SELECT u.Nom, 
       CASE
	       WHEN r.Formateur = 1 THEN 'Formateur'
           WHEN r.Createur_de_cours = 1 THEN 'Createur de cours'
       END AS Role,
       c.Intitule 
FROM Cours c 
JOIN Cours_Utilisateurs cu ON c.Id_Cours = cu.Cours_Id_Cours
JOIN Utilisateurs u ON cu.Utilisateurs_Id_Utilisateur = u.Id_Utilisateur
JOIN Roles r ON u.Id_Utilisateur = r.Id_Utilisateur;



-- 6. Pour un utilisateur donné, afficher les cours auxquels il est inscrit, ainsi que son pourcentage de progression de chaque cours:

SELECT IC.Id_Cours, C.Intitule,
  (SELECT COUNT(PCU.Partie_numerotee_cours_Id_Partie)
   FROM Partie_numerotee_cours_Utilisateurs PCU
   JOIN Partie_numerotee_cours P ON PCU.Partie_numerotee_cours_Id_Partie = P.Id_Partie
   WHERE P.Id_Cours = IC.Id_Cours AND PCU.Utilisateurs_Id_Utilisateur = IC.Id_Utilisateur) / COUNT(P.Id_Partie) * 100 AS Pourcentage_Progression
FROM Inscriptions_Cours IC
JOIN Cours C ON IC.Id_Cours = C.Id_Cours
LEFT JOIN Partie_numerotee_cours P ON C.Id_Cours = P.Id_Cours
WHERE IC.Id_Utilisateur = 25
GROUP BY IC.Id_Cours, C.Intitule;
