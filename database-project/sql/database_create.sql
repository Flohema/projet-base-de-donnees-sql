-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2024-04-05 01:13:16.991

-- tables
-- Table: Cours
CREATE TABLE Cours (
    Id_Cours int  NOT NULL COMMENT 'PK
Identifiant unique du cours.',
    Intitule nchar(50)  NOT NULL COMMENT 'Titre du cours, utilisé pour l''''identifier.',
    Nombre_de_parties int  NOT NULL COMMENT 'Nombre de parties composant le cours.',
    Nombre_de_chapitres int  NOT NULL COMMENT 'Nombre de chapitres dans le cours.',
    Description longtext  NOT NULL COMMENT 'Description du cours, fournissant des détails sur son contenu et ses objectifs.',
    Pre_requis nchar(150)  NULL COMMENT 'Prérequis nécessaires pour suivre le cours.',
    Prix int  NOT NULL COMMENT 'Prix du cours, s''''il est applicable.',
    Date_de_debut date  NULL COMMENT 'Date de début du cours, si elle est définie.',
    Date_de_fin date  NULL COMMENT 'Date de fin du cours, si elle est définie.',
    Modalite_de_suivi nchar(16)  NOT NULL COMMENT 'Modalité de suivi du cours, pouvant être en autonomie, en direct en présentiel ou en direct à distance.',
    CONSTRAINT Cours_pk PRIMARY KEY (Id_Cours)
) COMMENT 'Cours identifié par son Intitulé.';

-- Table: Cours_Utilisateurs
CREATE TABLE Cours_Utilisateurs (
    Cours_Id_Cours int  NOT NULL COMMENT 'PK
Identifiant unique du cours.',
    Utilisateurs_Id_Utilisateur int  NOT NULL COMMENT 'PK
 Identifiant unique de l''''utilisateur.',
    CONSTRAINT Cours_Utilisateurs_pk PRIMARY KEY (Cours_Id_Cours,Utilisateurs_Id_Utilisateur)
);

-- Table: Examens
CREATE TABLE Examens (
    Id_Cours int  NOT NULL,
    Titre nchar(30)  NOT NULL COMMENT 'Titre de l''''examen.',
    Contenu_textuel longtext  NOT NULL COMMENT 'Contenu textuel de l''''examen.',
    CONSTRAINT Examens_pk PRIMARY KEY (Id_Cours)
) COMMENT 'Examen portant sur certaines parties d''''un cours, identifié par son titre.';

-- Table: Inscriptions_Cours
CREATE TABLE Inscriptions_Cours (
    Id_Inscription int  NOT NULL,
    Id_Cours int  NULL COMMENT 'PK
Identifiant unique du cours.',
    Id_Utilisateur int  NULL COMMENT 'PK
 Identifiant unique de l''''utilisateur.',
    Appreciation_Note int  NULL COMMENT 'Note attribuée par l''''étudiant au cours, généralement sur une échelle de 1 à 5.',
    Appreciation_Commentaire nchar(100)  NULL COMMENT 'Commentaire optionnel fourni par l''''étudiant sur le cours.',
    Paiement_Date_Transaction date  NOT NULL COMMENT 'Date de paiement ',
    Paiement_Montant decimal(6,2)  NOT NULL COMMENT 'Montant de transaction ',
    CONSTRAINT Inscriptions_Cours_pk PRIMARY KEY (Id_Inscription)
);

-- Table: Partie_numerotee_cours
CREATE TABLE Partie_numerotee_cours (
    Id_Partie int  NOT NULL COMMENT 'PK
Identifiant unique de la partie du cours.',
    Id_Cours int  NULL COMMENT 'PK
Identifiant unique du cours.',
    Titre nchar(70)  NOT NULL COMMENT 'Titre de la partie.',
    Contenu longtext  NOT NULL COMMENT 'Contenu de la partie, généralement sous format texte.',
    Chapitre_numerote int  NULL COMMENT 'Numéro du chapitre auquel la partie est associée.',
    CONSTRAINT Partie_numerotee_cours_pk PRIMARY KEY (Id_Partie)
) COMMENT 'Partie unique d''''un cours associée à un examen, identifié par son Id_Partie.';

-- Table: Partie_numerotee_cours_Utilisateurs
CREATE TABLE Partie_numerotee_cours_Utilisateurs (
    Partie_numerotee_cours_Id_Partie int  NOT NULL COMMENT 'PK
Identifiant unique de la partie du cours.',
    Utilisateurs_Id_Utilisateur int  NOT NULL COMMENT 'PK
 Identifiant unique de l''''utilisateur.',
    CONSTRAINT Partie_numerotee_cours_Utilisateurs_pk PRIMARY KEY (Partie_numerotee_cours_Id_Partie,Utilisateurs_Id_Utilisateur)
);

-- Table: Roles
CREATE TABLE Roles (
    Id_Utilisateur int  NOT NULL COMMENT 'PK
 Identifiant unique de l''''utilisateur.',
    Administrateur boolean  NOT NULL COMMENT 'Indique si l''''utilisateur a le rôle d''''administrateur.',
    Personnel_Administratif boolean  NOT NULL COMMENT 'Indique si l''''utilisateur a le rôle de personnel administratif.',
    Createur_de_cours boolean  NOT NULL COMMENT 'Indique si l''''utilisateur a le rôle de créateur de cours.',
    Formateur boolean  NOT NULL COMMENT 'Indique si l''''utilisateur a le rôle de formateur.',
    Etudiant boolean  NOT NULL COMMENT 'Indique si l''''utilisateur a le rôle d''''étudiant.',
    CONSTRAINT Roles_pk PRIMARY KEY (Id_Utilisateur)
) COMMENT 'Roles possibles des utilisateurs';

-- Table: Sessions
CREATE TABLE Sessions (
    Id_Session int  NOT NULL COMMENT 'PK
Identifiant unique de la session.',
    Id_Cours int  NULL COMMENT 'PK
Identifiant unique du cours.',
    Date_de_debut date  NOT NULL COMMENT 'Date de début de la session.',
    Date_de_fin date  NOT NULL COMMENT 'Date de fin de la session.',
    Heure_de_debut time  NOT NULL COMMENT 'Heure de début de la session.',
    Heure_de_fin time  NOT NULL COMMENT 'Heure de fin de la session.',
    Nombre_de_places_maximum int  NOT NULL COMMENT 'Nombre maximum de places disponibles pour la session.',
    Modalites_de_suivi nchar(16)  NOT NULL COMMENT 'Modalités de suivi de la session, qui peuvent être en autonomie, en direct en présentiel ou en direct à distance.',
    CONSTRAINT Sessions_pk PRIMARY KEY (Id_Session)
) COMMENT 'Session de cours (en autonomie, en direct présentiel ou en direct distanciel)';

-- Table: Sessions_Utilisateurs
CREATE TABLE Sessions_Utilisateurs (
    Sessions_Id_Session int  NOT NULL COMMENT 'PK
Identifiant unique de la session.',
    Utilisateurs_Id_Utilisateur int  NOT NULL COMMENT 'PK
 Identifiant unique de l''''utilisateur.',
    CONSTRAINT Sessions_Utilisateurs_pk PRIMARY KEY (Sessions_Id_Session,Utilisateurs_Id_Utilisateur)
);

-- Table: Tentatives
CREATE TABLE Tentatives (
    Id_Tentative int  NOT NULL COMMENT 'PK
Identifiant unique de la tentative.',
    Id_Etudiant int  NULL COMMENT 'PK
 Identifiant unique de l''''utilisateur.',
    Id_Correcteur int  NULL COMMENT 'PK
 Identifiant unique de l''''utilisateur.',
    Id_Examen int  NULL,
    Score int  NOT NULL COMMENT 'Score obtenu lors de la tentative.',
    Date date  NOT NULL COMMENT 'Date à laquelle la tentative a eu lieu.
',
    Statut_de_reussite nchar(11)  NOT NULL COMMENT 'Statut de réussite de la tentative (par exemple, réussi ou échoué).',
    CONSTRAINT Tentatives_pk PRIMARY KEY (Id_Tentative)
) COMMENT 'Correspond à une tentative de passage d''''un examen par un étudiant.';

-- Table: Utilisateurs
CREATE TABLE Utilisateurs (
    Id_Utilisateur int  NOT NULL COMMENT 'PK
 Identifiant unique de l''''utilisateur.',
    Nom nchar(30)  NOT NULL COMMENT ' Nom de l''''utilisateur.',
    Date_inscription date  NOT NULL COMMENT ' Date d''''inscription de l''''utilisateur sur la plateforme.',
    CONSTRAINT Utilisateurs_pk PRIMARY KEY (Id_Utilisateur)
) COMMENT 'Correspond à l''''ensemble des utilisateurs hors étudiants, identifiés par leur Id_Utilisateur.';

-- foreign keys
-- Reference: Cours_Utilisateurs_Cours (table: Cours_Utilisateurs)
ALTER TABLE Cours_Utilisateurs ADD CONSTRAINT Cours_Utilisateurs_Cours FOREIGN KEY Cours_Utilisateurs_Cours (Cours_Id_Cours)
    REFERENCES Cours (Id_Cours)
    ON DELETE CASCADE
    ON UPDATE CASCADE;

-- Reference: Cours_Utilisateurs_Utilisateurs (table: Cours_Utilisateurs)
ALTER TABLE Cours_Utilisateurs ADD CONSTRAINT Cours_Utilisateurs_Utilisateurs FOREIGN KEY Cours_Utilisateurs_Utilisateurs (Utilisateurs_Id_Utilisateur)
    REFERENCES Utilisateurs (Id_Utilisateur)
    ON DELETE CASCADE
    ON UPDATE CASCADE;

-- Reference: Est_attribue_a (table: Inscriptions_Cours)
ALTER TABLE Inscriptions_Cours ADD CONSTRAINT Est_attribue_a FOREIGN KEY Est_attribue_a (Id_Cours)
    REFERENCES Cours (Id_Cours)
    ON DELETE SET NULL
    ON UPDATE CASCADE;

-- Reference: Partie_numerotee_cours_Utilisateurs_Partie_numerotee_cours (table: Partie_numerotee_cours_Utilisateurs)
ALTER TABLE Partie_numerotee_cours_Utilisateurs ADD CONSTRAINT Partie_numerotee_cours_Utilisateurs_Partie_numerotee_cours FOREIGN KEY Partie_numerotee_cours_Utilisateurs_Partie_numerotee_cours (Partie_numerotee_cours_Id_Partie)
    REFERENCES Partie_numerotee_cours (Id_Partie)
    ON DELETE CASCADE
    ON UPDATE CASCADE;

-- Reference: Partie_numerotee_cours_Utilisateurs_Utilisateurs (table: Partie_numerotee_cours_Utilisateurs)
ALTER TABLE Partie_numerotee_cours_Utilisateurs ADD CONSTRAINT Partie_numerotee_cours_Utilisateurs_Utilisateurs FOREIGN KEY Partie_numerotee_cours_Utilisateurs_Utilisateurs (Utilisateurs_Id_Utilisateur)
    REFERENCES Utilisateurs (Id_Utilisateur)
    ON DELETE CASCADE
    ON UPDATE CASCADE;

-- Reference: Sessions_Utilisateurs_Sessions (table: Sessions_Utilisateurs)
ALTER TABLE Sessions_Utilisateurs ADD CONSTRAINT Sessions_Utilisateurs_Sessions FOREIGN KEY Sessions_Utilisateurs_Sessions (Sessions_Id_Session)
    REFERENCES Sessions (Id_Session)
    ON DELETE CASCADE
    ON UPDATE CASCADE;

-- Reference: Sessions_Utilisateurs_Utilisateurs (table: Sessions_Utilisateurs)
ALTER TABLE Sessions_Utilisateurs ADD CONSTRAINT Sessions_Utilisateurs_Utilisateurs FOREIGN KEY Sessions_Utilisateurs_Utilisateurs (Utilisateurs_Id_Utilisateur)
    REFERENCES Utilisateurs (Id_Utilisateur)
    ON DELETE CASCADE
    ON UPDATE CASCADE;

-- Reference: corrige (table: Tentatives)
ALTER TABLE Tentatives ADD CONSTRAINT corrige FOREIGN KEY corrige (Id_Etudiant)
    REFERENCES Utilisateurs (Id_Utilisateur)
    ON DELETE SET NULL
    ON UPDATE CASCADE;

-- Reference: donne_une (table: Inscriptions_Cours)
ALTER TABLE Inscriptions_Cours ADD CONSTRAINT donne_une FOREIGN KEY donne_une (Id_Utilisateur)
    REFERENCES Utilisateurs (Id_Utilisateur)
    ON DELETE SET NULL
    ON UPDATE CASCADE;

-- Reference: essai_de_valider (table: Tentatives)
ALTER TABLE Tentatives ADD CONSTRAINT essai_de_valider FOREIGN KEY essai_de_valider (Id_Examen)
    REFERENCES Examens (Id_Cours)
    ON DELETE SET NULL
    ON UPDATE CASCADE;

-- Reference: fait_partie_de (table: Partie_numerotee_cours)
ALTER TABLE Partie_numerotee_cours ADD CONSTRAINT fait_partie_de FOREIGN KEY fait_partie_de (Id_Cours)
    REFERENCES Cours (Id_Cours)
    ON DELETE SET NULL
    ON UPDATE CASCADE;

-- Reference: porte_sur (table: Examens)
ALTER TABLE Examens ADD CONSTRAINT porte_sur FOREIGN KEY porte_sur (Id_Cours)
    REFERENCES Partie_numerotee_cours (Id_Partie)
    ON DELETE CASCADE
    ON UPDATE CASCADE;

-- Reference: possede (table: Roles)
ALTER TABLE Roles ADD CONSTRAINT possede FOREIGN KEY possede (Id_Utilisateur)
    REFERENCES Utilisateurs (Id_Utilisateur)
    ON DELETE CASCADE
    ON UPDATE CASCADE;

-- Reference: realise_une (table: Tentatives)
ALTER TABLE Tentatives ADD CONSTRAINT realise_une FOREIGN KEY realise_une (Id_Etudiant)
    REFERENCES Utilisateurs (Id_Utilisateur)
    ON DELETE SET NULL
    ON UPDATE CASCADE;

-- Reference: travaille_sur (table: Sessions)
ALTER TABLE Sessions ADD CONSTRAINT travaille_sur FOREIGN KEY travaille_sur (Id_Cours)
    REFERENCES Cours (Id_Cours)
    ON DELETE CASCADE
    ON UPDATE CASCADE;

-- End of file.

