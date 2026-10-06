-- POUR CONSULTER LES REQUETES PERMETTANT DE TESTER LES DIFFERENTES CONTRAINTES, SE RENDRE LIGNE 536

-- ------------------------------------------------------- CONTRAINTES -------------------------------------------------------

-- Constrains pour projet_ginhoux_flores

-- Table Inscriptions_Cours

--  La note d’Appréciations des cours doit être entre 1 et 5
ALTER TABLE Inscriptions_Cours 
ADD CONSTRAINT encadrement_appreciation_note
CHECK (Appreciation_Note BETWEEN 1 AND 5);
-- Table Cours

-- L'intitulé d’un cours ne peut pas être vide
ALTER TABLE Cours
ADD CONSTRAINT check_intitule_not_empty
CHECK (Intitule IS NOT NULL AND Intitule != ''),
ADD CONSTRAINT check_intitule_length
CHECK (LENGTH(Intitule) <= 50);

-- L’attribut “Prix” de Cours doit être entre 0 et 1000
ALTER TABLE Cours
ADD CONSTRAINT check_prix
CHECK (Prix BETWEEN 0 AND 1000);

-- L’attribut “Modalité de suivi” de Cours ne peut valoir que “autonomie” ou “en_session”
ALTER TABLE Cours 
ADD CONSTRAINT check_modalite_suivi_values
CHECK (Modalite_de_suivi IN ('autonomie', 'en_session'));

-- L’attribut “Nombre de chapitres” est inférieur ou égal à “nombre de parties”
ALTER TABLE Cours 
ADD CONSTRAINT check_nb_chapitres
CHECK (Nombre_de_chapitres <= Nombre_de_parties);

-- La description d’un cours ne peut pas être vide
ALTER TABLE Cours  
ADD CONSTRAINT check_description_not_empty
CHECK (Description IS NOT NULL AND Description != ''),
ADD CONSTRAINT check_description_length
CHECK (LENGTH(Description) <= 1000);

-- Les pré-requis d’un cours ne peuvent pas être vides
ALTER TABLE Cours  
ADD CONSTRAINT check_prerequis_not_empty
CHECK (Pre_requis IS NOT NULL AND Pre_requis != ''),
ADD CONSTRAINT check_prerequis_length
CHECK (LENGTH(Pre_requis) <= 1000);

-- Table Examens

-- Le titre d’un examen ne peut pas être vide
ALTER TABLE Examens 
ADD CONSTRAINT check_titre_examen_not_empty
CHECK (Titre IS NOT NULL AND Titre != ''),
ADD CONSTRAINT check_titre_examen_length
CHECK (LENGTH(Titre) <= 30);

-- Le contenu textuel d’un examen ne peut pas être vide
ALTER TABLE Examens 
ADD CONSTRAINT check_contenu_textuel_not_empty
CHECK (Contenu_textuel IS NOT NULL AND Contenu_textuel != '');

-- Table Partie_numerotee_cours

-- Le titre d’une partie ne peut pas être vide
ALTER TABLE Partie_numerotee_cours  
ADD CONSTRAINT check_titre_de_partie_not_empty
CHECK (Titre IS NOT NULL AND Titre != ''),
ADD CONSTRAINT check_titre_length
CHECK (LENGTH(Titre) <= 70);

-- Le contenu d’une partie ne peut pas être vide
ALTER TABLE Partie_numerotee_cours  
ADD CONSTRAINT check_contenu_not_empty
CHECK (Contenu IS NOT NULL AND Contenu != '');
      
-- Le nombre de place maximum d'une session est de 100
ALTER TABLE Sessions
ADD CONSTRAINT check_places_maximum_session
CHECK (Nombre_de_places_maximum <= 100);

-- L’attribut “Modalites_de_suivi” de Sessions ne peut valoir que “en_présentiel” ou “en_distanciel”
ALTER TABLE Sessions
ADD CONSTRAINT check_modalite_suivi_sessions
CHECK (Modalites_de_suivi IN ('en_présentiel', 'en_distanciel'));

-- Table Tentatives

-- Le score obtenu à une tentative est une valeur comprise entre 0 et 100
ALTER TABLE Tentatives  
ADD CONSTRAINT score_obtenu
CHECK (Score BETWEEN 0 AND 100);

-- L’attribut Statut de réussite de Tentatives peut valoir “validé” ou “non_validé”
ALTER TABLE Tentatives
ADD CONSTRAINT check_tentatives_statut_reussite
CHECK (Statut_de_reussite IN ('validé', 'non_validé'));


-- Le Statut de réussite d’une tentative sera en “réussi” si le score obtenu à la tentative est supérieur au score minimum de validation de l’examen
ALTER TABLE Tentatives 
ADD CONSTRAINT check_statut_reussite_valide_nonvalide
CHECK (Statut_de_reussite = CASE WHEN Score >= 40 THEN 'validé' END);

-- ------------------------------------------------------- TRIGGERS -------------------------------------------------------

-- Ne peuvent faire de tentative que les étudiants inscrits au cours associé à l'examen
DELIMITER $$

CREATE TRIGGER check_tentatives_utilisateur_autorise
BEFORE INSERT ON Tentatives
FOR EACH ROW
BEGIN
    DECLARE is_associated INT;
    
    -- Vérifie si l'association entre Id_Etudiant et Id_Examen existe
    SELECT COUNT(*)
    INTO is_associated
    FROM Utilisateurs u
    JOIN inscriptions_cours ic ON u.Id_Utilisateur = ic.Id_Utilisateur
    JOIN partie_numerotee_cours pc ON ic.Id_Cours = pc.Id_Cours
    JOIN examens e ON pc.Id_Partie = e.Id_Cours
    WHERE u.Id_Utilisateur = NEW.Id_Etudiant
    AND e.Id_Cours = NEW.Id_Examen;

    -- Si l'association n'existe pas, annuler l'insertion
    IF is_associated = 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'L''étudiant n''est pas inscrit au cours correspondant à cet examen.';
    END IF;
END$$

DELIMITER ;

-- Un cours ne peut être créé que par les utilisateurs ayant le rôle administrateur, formateur ou créateur de cours
DELIMITER //

CREATE TRIGGER check_roles_trigger
BEFORE INSERT ON Cours_Utilisateurs
FOR EACH ROW
BEGIN
    DECLARE admin_flag BOOLEAN;
    DECLARE creator_flag BOOLEAN;
    DECLARE trainer_flag BOOLEAN;

    -- Vérifier si l'utilisateur est administrateur
    SELECT Administrateur INTO admin_flag
    FROM Roles
    WHERE Id_Utilisateur = NEW.Utilisateurs_Id_Utilisateur;

    -- Vérifier si l'utilisateur est créateur de cours
    SELECT Createur_de_cours INTO creator_flag
    FROM Roles
    WHERE Id_Utilisateur = NEW.Utilisateurs_Id_Utilisateur;

    -- Vérifier si l'utilisateur est formateur
    SELECT Formateur INTO trainer_flag
    FROM Roles
    WHERE Id_Utilisateur = NEW.Utilisateurs_Id_Utilisateur;

    -- Si aucun des rôles n'est vrai, lever une erreur
    IF NOT (admin_flag OR creator_flag OR trainer_flag) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'L''utilisateur n''est pas administrateur, créateur de cours ou formateur.';
    END IF;
END//

DELIMITER ;

-- Un étudiant ne peut pas s’inscrire à une session si la session est déjà complète.

DELIMITER //
CREATE TRIGGER before_insert_session_utilisateur
BEFORE INSERT ON sessions_utilisateurs FOR EACH ROW
BEGIN
    DECLARE current_capacity INT;
    DECLARE max_capacity INT;
    
    SELECT COUNT(*) INTO current_capacity
    FROM sessions_utilisateurs
    WHERE Sessions_Id_Session = NEW.Sessions_Id_Session;
    
    SELECT Nombre_de_places_maximum INTO max_capacity
    FROM sessions
    WHERE Id_Session = NEW.Sessions_Id_Session;
    
    IF current_capacity >= max_capacity THEN
        SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'Impossible de s\'inscrire. La session est déjà complète.';
    END IF;
END //
DELIMITER ;

-- Un étudiant ne peut pas s’inscrire à une session s’il n’a pas le droit d’accéder au cours.
DELIMITER //

CREATE TRIGGER check_course_access_trigger
BEFORE INSERT ON Sessions_Utilisateurs
FOR EACH ROW
BEGIN
    DECLARE access_count INT;

    -- Vérifier si l'étudiant a le droit d'accéder au cours associé à la session
    SELECT COUNT(*) INTO access_count
    FROM Inscriptions_Cours ic
    JOIN Sessions s ON ic.Id_Cours = s.Id_Cours
    WHERE ic.Id_Utilisateur = NEW.Utilisateurs_Id_Utilisateur
    AND s.Id_Session = NEW.Sessions_Id_Session;

    -- Si l'étudiant n'a pas accès au cours, lever une erreur
    IF access_count = 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'L\'étudiant n\'a pas le droit d\'accéder à ce cours.';
    END IF;
END;
//

DELIMITER ;

-- Un étudiant ne peut pas s’inscrire à une session s’il est déjà inscrit à une autre session au même moment.
DELIMITER //

CREATE TRIGGER check_session_overlap_trigger
BEFORE INSERT ON Sessions_Utilisateurs
FOR EACH ROW
BEGIN
    DECLARE overlap_count INT;

    -- Obtenir les informations de la session pour la nouvelle entrée
    DECLARE session_start_date Date;
    DECLARE session_end_date Date;
    DECLARE session_start_time Time;
    DECLARE session_end_time Time;

    SELECT Date_de_debut, Date_de_fin, Heure_de_debut, Heure_de_fin
    INTO session_start_date, session_end_date, session_start_time, session_end_time
    FROM Sessions
    WHERE Id_Session = NEW.Sessions_Id_Session;

    -- Compter le nombre de sessions auxquelles l'utilisateur est déjà inscrit et qui se chevauchent avec la nouvelle session
    SELECT COUNT(*) INTO overlap_count
    FROM Sessions s
    JOIN Sessions_Utilisateurs su ON su.Sessions_Id_Session = s.Id_Session
    WHERE su.Utilisateurs_Id_Utilisateur = NEW.Utilisateurs_Id_Utilisateur
    AND s.Id_Session != NEW.Sessions_Id_Session
    AND NOT(s.Date_de_fin < session_start_date OR session_end_date < s.Date_de_debut OR 
   	(session_end_date = s.Date_de_debut and session_end_time < s.Heure_de_debut) or
  	(session_start_date = s.Date_de_fin and session_start_time > s.Heure_de_fin));

    -- Si une session se chevauche, lever une erreur
    IF overlap_count > 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'L utilisateur est déjà inscrit à une session qui se chevauche dans le temps.';
    END IF;
END;
//

DELIMITER ;

-- L’attribut “Nombre de parties” est égal au nombre de parties numérotées correspondantes.
DELIMITER //

CREATE TRIGGER update_nombre_parties_trigger
AFTER INSERT ON Partie_numerotee_cours
FOR EACH ROW
BEGIN
    DECLARE total_parts INT;
    
    -- Compter le nombre de parties pour ce cours
    SELECT COUNT(*) INTO total_parts
    FROM Partie_numerotee_cours
    WHERE Id_Cours = NEW.Id_Cours;

    -- Mettre à jour le Nombre_de_parties dans la table Cours
    UPDATE Cours
    SET Nombre_de_parties = total_parts
    WHERE Id_Cours = NEW.Id_Cours;
END;
//

CREATE TRIGGER delete_partie_numerotee_trigger
AFTER DELETE ON Partie_numerotee_cours
FOR EACH ROW
BEGIN
    DECLARE total_parts INT;
    
    -- Compter le nombre de parties pour ce cours
    SELECT COUNT(*) INTO total_parts
    FROM Partie_numerotee_cours
    WHERE Id_Cours = OLD.Id_Cours;

    -- Mettre à jour le Nombre_de_parties dans la table Cours
    UPDATE Cours
    SET Nombre_de_parties = total_parts
    WHERE Id_Cours = OLD.Id_Cours;
END;
//

CREATE TRIGGER update_partie_numerotee_trigger
AFTER UPDATE ON Partie_numerotee_cours
FOR EACH ROW
BEGIN
    DECLARE total_parts INT;
    
    -- Compter le nombre de parties pour ce cours
    SELECT COUNT(*) INTO total_parts
    FROM Partie_numerotee_cours
    WHERE Id_Cours = NEW.Id_Cours;

    -- Mettre à jour le Nombre_de_parties dans la table Cours
    UPDATE Cours
    SET Nombre_de_parties = total_parts
    WHERE Id_Cours = NEW.Id_Cours;
END;
//

DELIMITER ;


-- L’attribut “Nombre de chapitre” est égal au nombre de chapitres différents qu'on peut trouver dans Partie_numerotee_cours.
DELIMITER //

CREATE TRIGGER update_nombre_chapitres_trigger
AFTER INSERT ON Partie_numerotee_cours
FOR EACH ROW
BEGIN
    DECLARE total_chapters INT;
    
    -- Compter le nombre de chapitres distincts pour ce cours
    SELECT COUNT(DISTINCT Chapitre_numerote) INTO total_chapters
    FROM Partie_numerotee_cours
    WHERE Id_Cours = NEW.Id_Cours;

    -- Mettre à jour le Nombre_de_chapitres dans la table Cours
    UPDATE Cours
    SET Nombre_de_chapitres = total_chapters
    WHERE Id_Cours = NEW.Id_Cours;
END;
//

CREATE TRIGGER delete_partie_numerotee_chapitre_trigger
AFTER DELETE ON Partie_numerotee_cours
FOR EACH ROW
BEGIN
    DECLARE total_chapters INT;
    
    -- Compter le nombre de chapitres distincts pour ce cours
    SELECT COUNT(DISTINCT Chapitre_numerote) INTO total_chapters
    FROM Partie_numerotee_cours
    WHERE Id_Cours = OLD.Id_Cours;

    -- Mettre à jour le Nombre_de_chapitres dans la table Cours
    UPDATE Cours
    SET Nombre_de_chapitres = total_chapters
    WHERE Id_Cours = OLD.Id_Cours;
END;
//

CREATE TRIGGER update_partie_numerotee_chapitre_trigger
AFTER UPDATE ON Partie_numerotee_cours
FOR EACH ROW
BEGIN
    DECLARE total_chapters INT;
    
    -- Compter le nombre de chapitres distincts pour ce cours
    SELECT COUNT(DISTINCT Chapitre_numerote) INTO total_chapters
    FROM Partie_numerotee_cours
    WHERE Id_Cours = NEW.Id_Cours;

    -- Mettre à jour le Nombre_de_chapitres dans la table Cours
    UPDATE Cours
    SET Nombre_de_chapitres = total_chapters
    WHERE Id_Cours = NEW.Id_Cours;
END;
//

DELIMITER ;

-- Seuls les étudiants peuvent s'inscrire à un cours

DELIMITER //

CREATE TRIGGER check_etudiant_role
BEFORE INSERT ON Inscriptions_Cours
FOR EACH ROW
BEGIN
    DECLARE etudiant_count INT;

    SELECT COUNT(*) INTO etudiant_count
    FROM Roles
    WHERE Id_Utilisateur = NEW.Id_Utilisateur AND Etudiant = TRUE;

    IF etudiant_count = 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'L\'utilisateur n\'est pas un étudiant';
    END IF;
END//

DELIMITER ;

-- ------------------------------------------------------- PROCEDURES -------------------------------------------------------

-- Procédure de correction de toutes les tentatives

DELIMITER //

	CREATE PROCEDURE Correction()
	BEGIN
	UPDATE tentatives t1
	JOIN (
	    SELECT Id_Examen, Id_Etudiant
	    FROM tentatives
	    WHERE Statut_de_reussite = 'validé'
	    GROUP BY Id_Examen, Id_Etudiant
	) t2 ON t1.Id_Examen = t2.Id_Examen
	and  t1.Id_Etudiant = t2.Id_Etudiant
	SET t1.Statut_de_reussite = 'validé' ;
	end//

DELIMITER ;

-- Procédure de suppression d'un cours

DELIMITER //

CREATE PROCEDURE SupprimerCours(
    IN p_Id_Utilisateur INT,
    IN p_Id_Cours INT
)
BEGIN
    DECLARE isAdmin INT;
    DECLARE isEnrolled INT;
    
    -- Vérifier si l'utilisateur est un administrateur
    SELECT COUNT(*) INTO isAdmin
    FROM Roles
    WHERE Id_Utilisateur = p_Id_Utilisateur AND Administrateur = TRUE;
    
    -- Vérifier si l'utilisateur est inscrit au cours
    SELECT COUNT(*) INTO isEnrolled
    FROM Cours_Utilisateurs
    WHERE Utilisateurs_Id_Utilisateur = p_Id_Utilisateur AND Cours_Id_Cours = p_Id_Cours;
    
    -- Supprimer le cours si l'utilisateur est un administrateur ou inscrit au cours
    IF isAdmin > 0 OR isEnrolled > 0 THEN
        DELETE FROM Cours WHERE Id_Cours = p_Id_Cours;
        SELECT 'Le cours a été supprimé.' AS Message;
       
    -- Avertir que l'utilisateur n'a pas les droits
    else
        SELECT 'L''utilisateur n''est pas autorisé à supprimer ce cours.' AS Message;
    END IF;
END//

DELIMITER ;

-- Procédure d'édition d'un cours

DELIMITER //

CREATE PROCEDURE ModifierCours(
    IN p_Id_Utilisateur INT,
    IN p_Id_Cours INT,
    IN p_Intitule VARCHAR(255),
    IN p_Description TEXT,
    IN p_Pre_requis TEXT,
    IN p_Prix DECIMAL(10,2),
    IN p_Date_de_debut DATE,
    IN p_Date_de_fin DATE,
    IN p_Modalite_de_suivi VARCHAR(255)
)
BEGIN
    DECLARE isAdmin INT;
    DECLARE isEnrolled INT;
    
    -- Vérifier si l'utilisateur est un administrateur
    SELECT COUNT(*) INTO isAdmin
    FROM Roles
    WHERE Id_Utilisateur = p_Id_Utilisateur AND Administrateur = TRUE;
    
    -- Vérifier si l'utilisateur est inscrit au cours
    SELECT COUNT(*) INTO isEnrolled
    FROM Cours_Utilisateurs
    WHERE Utilisateurs_Id_Utilisateur = p_Id_Utilisateur AND Cours_Id_Cours = p_Id_Cours;
    
    -- Modifier le cours si l'utilisateur est un administrateur ou inscrit au cours
    IF isAdmin > 0 OR isEnrolled > 0 THEN
        UPDATE Cours 
        SET Intitule = p_Intitule,
            Description = p_Description,
            Pre_requis = p_Pre_requis,
            Prix = p_Prix,
            Date_de_debut = p_Date_de_debut,
            Date_de_fin = p_Date_de_fin,
            Modalite_de_suivi = p_Modalite_de_suivi
        WHERE Id_Cours = p_Id_Cours;
        SELECT 'Le cours a été modifié.' AS Message;
    ELSE
        SELECT 'L''utilisateur n''est pas autorisé à modifier ce cours.' AS Message;
    END IF;
END//

DELIMITER ;

-- REQUETES PERMETTANT DE TESTER LES DIFFERENTES CONTRAINTES, TRIGGERS ET PROCEDURES

-- ------------------------------------------------------- PROCEDURES -------------------------------------------------------

-- PROCEDURE CORRECTION
-- L'exécution du script suivant montre que l'étudiant 2 n'a pas validé la tentative 2, mais a bien validé d'autres tentatives

select Id_Tentative, Id_Etudiant, Id_Examen, Score, Statut_de_reussite
from tentatives t 
where Id_Etudiant = 2
and Id_Examen  = 1;

-- L'exécution du script suivant montre la validation de la tentative 2 par la procédure Correction

call Correction();

select Id_Tentative, Id_Etudiant, Id_Examen, Score, Statut_de_reussite
from tentatives t 
where Id_Etudiant = 2
and Id_Examen  = 1;

-- PROCEDURE SUPPRESSION D'UN COURS

-- L'exécution du script suivant montre que la suppression du cours 1 est interdite à l'utilisateur 1

call SupprimerCours(1,1);

-- L'exécution du script suivant montre que la suppression du cours 18 est autorisée à l'utilisateur 3, en tant que lié au cours 

call SupprimerCours(3,18);

select Id_Cours
from cours;

-- PROCEDURE EDITION D'UN COURS

-- L'exécution du script suivant montre la modification du cours 1 par un utilisateur administrateur

select *
from cours
where Id_Cours = 1;

call ModifierCours(
2 ,
1 , 
'Nouvel intitulé', 
'Nouvelle description', 
'Nouveaux pré-requis', 
100 , 
'2024-01-01', 
'2024-01-02', 
'autonomie') ;

select *
from cours
where Id_Cours = 1;

-- ------------------------------------------------------- CONTRAINTES -------------------------------------------------------

-- TEST DE CONTRAINTE : La note d’Appréciations des cours doit être entre 1 et 5

INSERT INTO `Inscriptions_Cours` (`Id_Inscription`, `Id_Cours`, `Id_Utilisateur`, `Appreciation_Note`, `Appreciation_Commentaire`, `Paiement_Date_Transaction`, `Paiement_Montant`) VALUES
(31, 1, 2, 6, 'Au château voisin, où s\'ouvraient les', '2019-01-15', 360.00);

-- TEST DE CONTRAINTE : L'intitulé d’un cours ne peut pas être vide

INSERT INTO `Cours` (`Id_Cours`, `Intitule`, `Nombre_de_parties`, `Nombre_de_chapitres`, `Description`, `Pre_requis`, `Prix`, `Date_de_debut`, `Date_de_fin`, `Modalite_de_suivi`) VALUES
(31, '', 4, 2, 'funèbre se mit en colère. Grande description de la révolte, me tutoyait, m\'eût honoré d', ': Compréhe', 360, '2021-05-31', '2022-03-10', 'en_session');

-- TEST DE CONTRAINTE : L’attribut “Prix” de Cours doit être entre 0 et 1000

INSERT INTO `Cours` (`Id_Cours`, `Intitule`, `Nombre_de_parties`, `Nombre_de_chapitres`, `Description`, `Pre_requis`, `Prix`, `Date_de_debut`, `Date_de_fin`, `Modalite_de_suivi`) VALUES
(31, 'Intitulé', 4, 2, 'funèbre se mit en colère. Grande description de la révolte, me tutoyait, m\'eût honoré d', ': Compréhe', 1001, '2021-05-31', '2022-03-10', 'en_session');

-- TEST DE CONTRAINTE : L’attribut “Modalité de suivi” de Cours ne peut valoir que “autonomie” ou “en_session”

INSERT INTO `Cours` (`Id_Cours`, `Intitule`, `Nombre_de_parties`, `Nombre_de_chapitres`, `Description`, `Pre_requis`, `Prix`, `Date_de_debut`, `Date_de_fin`, `Modalite_de_suivi`) VALUES
(31, 'Intitulé', 4, 2, 'funèbre se mit en colère. Grande description de la révolte, me tutoyait, m\'eût honoré d', ': Compréhe', 500, '2021-05-31', '2022-03-10', 'test');

-- TEST DE CONTRAINTE : La description d’un cours ne peut pas être vide

INSERT INTO `Cours` (`Id_Cours`, `Intitule`, `Nombre_de_parties`, `Nombre_de_chapitres`, `Description`, `Pre_requis`, `Prix`, `Date_de_debut`, `Date_de_fin`, `Modalite_de_suivi`) VALUES
(31, 'Intitulé', 4, 2, '', ': Compréhe', 500, '2021-05-31', '2022-03-10', 'en_session');

-- TEST DE CONTRAINTE : Les pré-requis d’un cours ne peuvent pas être vides

INSERT INTO `Cours` (`Id_Cours`, `Intitule`, `Nombre_de_parties`, `Nombre_de_chapitres`, `Description`, `Pre_requis`, `Prix`, `Date_de_debut`, `Date_de_fin`, `Modalite_de_suivi`) VALUES
(31, 'Intitulé', 4, 2, 'funèbre', '', 500, '2021-05-31', '2022-03-10', 'en_session');

-- TEST DE CONTRAINTE : Le titre d’un examen ne peut pas être vide

INSERT INTO `Examens` (`Id_Cours`, `Titre`, `Contenu_textuel`) VALUES
(30, '', 'Gravement son frère lui en avait donné six moutons au vieux roi pour escalader les bastingages. Insensible aux tristes événements qui ');

-- TEST DE CONTRAINTE : Le contenu textuel d’un examen ne peut pas être vide

INSERT INTO `Examens` (`Id_Cours`, `Titre`, `Contenu_textuel`) VALUES
(30, 'test', '');

-- TEST DE CONTRAINTE : Le titre d’une partie ne peut pas être vide

INSERT INTO `Partie_numerotee_cours` (`Id_Partie`, `Id_Cours`, `Titre`, `Contenu`, `Chapitre_numerote`) VALUES
(31, 1, '', 'Assise sur lui, que le captif n\'était pas encore ce mot-là. Élevez vos coeurs, haut, debout et presque entièrement habillée. Car tu connaîtras ses rêves et le regardait ; lui, s\'il rentrait avec fracas et fermait la porte ; il avait laissé fuir ? Conduisez-vous bien, portez-vous bien, pour l\'éducation et la culture. Quiconque doit enfanter est malade ; il y rêvait, plus celui-là le fuyait et l\'attirait. Prison pour prison, sur sa figure, ce qui reste de votre journée vous appartiendra. Faire de son ami avec une affliction inexprimable, et nous attachant de notre mieux. Juste après l\'aube ; il avait les manières du fils d\'une de leurs coquines nous tue notre fille.', 1);

-- TEST DE CONTRAINTE : Le contenu d’une partie ne peut pas être vide

INSERT INTO `Partie_numerotee_cours` (`Id_Partie`, `Id_Cours`, `Titre`, `Contenu`, `Chapitre_numerote`) VALUES
(31, 1, 'test', '', 1);

-- TEST DE CONTRAINTE : Le nombre de place maximum d'une session est de 100

INSERT INTO `Sessions` (`Id_Session`, `Id_Cours`, `Date_de_debut`, `Date_de_fin`, `Heure_de_debut`, `Heure_de_fin`, `Nombre_de_places_maximum`, `Modalites_de_suivi`) VALUES
(31, 3, '2015-04-04', '2022-09-16', '14:02:34', '23:20:30', 101, 'en_présentiel');

-- TEST DE CONTRAINTE : L’attribut “Modalites_de_suivi” de Sessions ne peut valoir que “en_présentiel” ou “en_distanciel”

INSERT INTO `Sessions` (`Id_Session`, `Id_Cours`, `Date_de_debut`, `Date_de_fin`, `Heure_de_debut`, `Heure_de_fin`, `Nombre_de_places_maximum`, `Modalites_de_suivi`) VALUES
(31, 3, '2015-04-04', '2022-09-16', '14:02:34', '23:20:30', 50, 'test');

-- TEST DE CONTRAINTE : Le score obtenu à une tentative est une valeur comprise entre 0 et 100

INSERT INTO `Tentatives` (`Id_Tentative`, `Id_Etudiant`, `Id_Correcteur`, `Id_Examen`, `Score`, `Date`, `Statut_de_reussite`) VALUES
(31, 2, 29, 1, 101, '2018-05-29', 'validé');

-- TEST DE CONTRAINTE : L’attribut Statut de réussite de Tentatives peut valoir “validé” ou “non_validé”

INSERT INTO `Tentatives` (`Id_Tentative`, `Id_Etudiant`, `Id_Correcteur`, `Id_Examen`, `Score`, `Date`, `Statut_de_reussite`) VALUES
(31, 2, 29, 1, 90, '2018-05-29', 'test');

-- ------------------------------------------------------- TRIGGERS -------------------------------------------------------

-- TEST DE TRIGGER : Ne peuvent faire de tentative que les étudiants inscrits au cours associé à l'examen

INSERT INTO `Tentatives` (`Id_Tentative`, `Id_Etudiant`, `Id_Correcteur`, `Id_Examen`, `Score`, `Date`, `Statut_de_reussite`) VALUES
(31, 1, 29, 1, 90, '2018-05-29', 'validé');

-- TEST DE TRIGGER : Un cours ne peut être créé que par les utilisateurs ayant le rôle administrateur, formateur ou créateur de cours

INSERT INTO `Cours_Utilisateurs` (`Cours_Id_Cours`, `Utilisateurs_Id_Utilisateur`) VALUES
(1, 5);

-- TEST DE TRIGGER : Un étudiant ne peut pas s’inscrire à une session si la session est déjà complète.

-- On inscrit d'abord l'étudiant au cours
INSERT INTO `Inscriptions_Cours` (`Id_Inscription`, `Id_Cours`, `Id_Utilisateur`, `Appreciation_Note`, `Appreciation_Commentaire`, `Paiement_Date_Transaction`, `Paiement_Montant`) VALUES
(31, 11, 2, 4, 'ma cause auprès d\'elle', '2018-02-02', 435.00);
-- On essaie de l'inscrire à la session déjà complète
INSERT INTO `Sessions_Utilisateurs` (`Sessions_Id_Session`, `Utilisateurs_Id_Utilisateur`) VALUES
(15, 2);

-- TEST DE TRIGGER : Un étudiant ne peut pas s’inscrire à une session s’il n’a pas le droit d’accéder au cours.

INSERT INTO `Sessions_Utilisateurs` (`Sessions_Id_Session`, `Utilisateurs_Id_Utilisateur`) VALUES
(1, 2);

-- TEST DE TRIGGER : Un étudiant ne peut pas s’inscrire à une session s’il est déjà inscrit à une autre session au même moment.

INSERT INTO `Sessions_Utilisateurs` (`Sessions_Id_Session`, `Utilisateurs_Id_Utilisateur`) VALUES
(1, 25);

-- Preuve du chevauchement

select Id_Session, Date_de_debut, Heure_de_debut, Date_de_fin, Heure_de_fin 
FROM sessions s
JOIN sessions_utilisateurs su on su.Sessions_Id_Session  = s.Id_Session 
where su.Utilisateurs_id_utilisateur = 25
union
select '1 : Session conflictuelle', Date_de_debut, Heure_de_debut, Date_de_fin, Heure_de_fin 
FROM sessions s
where Id_Session = 1;

-- TEST DE TRIGGER : L’attribut “Nombre de parties” est égal au nombre de parties numérotées correspondantes.

-- On constate que le Cours 1 a 4 parties
select Id_Cours, Nombre_de_parties
from Cours
where Id_Cours = 1;
-- On lui ajoute une partie
INSERT INTO `Partie_numerotee_cours` (`Id_Partie`, `Id_Cours`, `Titre`, `Contenu`, `Chapitre_numerote`) VALUES
(31, 1, 'Test titre', 'Test Contenu', 1);
-- On constate que le Cours 1 a maintenant 5 parties
select Id_Cours, Nombre_de_parties
from Cours
where Id_Cours = 1;

-- TEST DE TRIGGER : L’attribut “Nombre de chapitre” est égal au nombre de chapitres différents qu'on peut trouver dans Partie_numerotee_cours.

-- On constate que le Cours 1 a 2 chapitres
select Id_Cours, Nombre_de_chapitres 
from Cours
where Id_Cours = 1;
-- On constate que les différentes valeurs de "Chapitre_numerote" sont 1 et 2
select distinct Chapitre_numerote 
from Partie_numerotee_cours
where Id_Cours = 1;
-- On lui ajoute une partie avec une valeur de "Chapitre_numerote" de 3
INSERT INTO `Partie_numerotee_cours` (`Id_Partie`, `Id_Cours`, `Titre`, `Contenu`, `Chapitre_numerote`) VALUES
(32, 1, 'Test titre', 'Test Contenu', 3);
-- On constate que les différentes valeurs de "Chapitre_numerote" sont maintenant de 1, 2 et 3
select distinct Chapitre_numerote 
from Partie_numerotee_cours
where Id_Cours = 1;
-- On constate que le Cours 1 a maintenant 3 chapitres
select Id_Cours, Nombre_de_chapitres
from Cours
where Id_Cours = 1;

-- TEST DE TRIGGER : Seuls les étudiants peuvent s'inscrire à un cours

INSERT INTO `Inscriptions_Cours` (`Id_Inscription`, `Id_Cours`, `Id_Utilisateur`, `Appreciation_Note`, `Appreciation_Commentaire`, `Paiement_Date_Transaction`, `Paiement_Montant`) VALUES
(30, 1, 1, 2, 'Au château voisin, où s\'ouvraient les', '2019-01-15', 360.00);