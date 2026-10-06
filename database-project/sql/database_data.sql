-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 22-03-2024 a las 15:49:25
-- Versión del servidor: 10.4.28-MariaDB
-- Versión de PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `test2`
--

-- --------------------------------------------------------

--
-- Donnees pour `Utilisateurs`
--

INSERT INTO `Utilisateurs` (`Id_Utilisateur`, `Nom`, `Date_inscription`) VALUES
(1, 'Dubois', '2012-08-24'),
(2, 'Chan', '2020-04-04'),
(3, 'Girard', '2018-05-04'),
(4, 'Brown', '2018-11-03'),
(5, 'Laurent', '2015-12-14'),
(6, 'Bernard', '2012-08-17'),
(7, 'Moreau', '2012-02-05'),
(8, 'Petit', '2015-04-11'),
(9, 'Durand', '2021-02-17'),
(10, 'Renard', '2013-10-14'),
(11, 'Garcia', '2017-10-29'),
(12, 'Lambert', '2023-06-16'),
(13, 'Leroy', '2017-10-23'),
(14, 'Martin', '2019-11-06'),
(15, 'Vornheim', '2012-09-13'),
(16, 'Simon', '2011-03-05'),
(17, 'Fontaine', '2014-11-10'),
(18, 'Morel', '2012-02-29'),
(19, 'Roux', '2016-07-16'),
(20, 'Lemoine', '2010-11-28'),
(21, 'Mathieu', '2016-01-08'),
(22, 'Robin', '2023-02-14'),
(23, 'Lefevre', '2017-03-06'),
(24, 'Leroux', '2016-05-30'),
(25, 'Dupont', '2022-04-28'),
(26, 'Girard', '2019-02-04'),
(27, 'Francois', '2021-03-22'),
(28, 'Noel', '2010-08-01'),
(29, 'Roussel', '2023-10-05'),
(30, 'Henry', '2020-10-16');


--
-- Donnees pour `Cours`
--

INSERT INTO `Cours` (`Id_Cours`, `Intitule`, `Nombre_de_parties`, `Nombre_de_chapitres`, `Description`, `Pre_requis`, `Prix`, `Date_de_debut`, `Date_de_fin`, `Modalite_de_suivi`) VALUES
(1, ' Thérapie du Mouvement Génie', 4, 2, 'funèbre se mit en colère. Grande description de la révolte, me tutoyait, m\'eût honoré d', ': Compréhe', 360, '2021-05-31', '2022-03-10', 'en_session'),
(2, 'Histoire de l\'Art', 2, 2, 'escorte : alors la procession funèbre se mit en colère. Grande description de la révolte, me tutoyai', ': Connaissance des médias sociaux et du marketing en ligne Nu', 0, '2010-11-14', '2011-07-13', 'en_session'),
(3, 'Programmation Java', 1, 1, 'de curiosité', 'Durable : Sensibilité aux problèmes environnementaux Histoire Ancienne : Aucun Relations Publiques : Bonnes compétences en communicatio', 424, '2020-10-23', '2021-03-24', 'en_session'),
(4, ' Physique Quantique Mathématiques Discrètes', 5, 3, 'mes peines, et non une simple ligue.Deux jours avant cette scène, j\'admirai', 'Java : Connaissance préalable en programmation Environnement Durab', 79, '2013-04-11', '2014-03-04', 'en_session'),
(5, ' Nutrition Sportive Art', 3, 2, 'à la crainte, c\'est peut-être un peu exagéré peut-être. Observez de plus que cette place fut un lieu de guérison ! Rempli de colère, toutef', ': Aucun Psychologie Cognitive : Intérêt pour le fonctionnement de l\'esprit humain Géographie Humaine : Aucun Programmation Java : Connais', 686, '2019-06-12', '2020-06-23', 'autonomie'),
(6, ' Contemporain Histoire Ancienne', 1, 1, 'je ne dirais pas cela, mon ', 'le fonctionnement de l\'esprit humain Géographi', 185, '2014-12-07', '2017-09-01', 'autonomie'),
(7, 'Économie Mondiale Psychologie', 1, 1, 'avait désiré que nous vivio', 'sociaux et du marketing en ligne Nutrition Sportive : Aucun Psychologie Cognitive : Intérêt pour le fonctionnement', 0, '2021-06-23', '2023-03-29', 'en_session'),
(8, 'Créative Biologie Moléculaire', 1, 1, 'n\'agissaient pas, il ira. Aide-moi, homme, je fus en bas, qui ava', 'Publiques : Bonnes compétences en communication Thérapie du Mouvement : Aucun Analy', 260, '2023-02-15', '2023-12-27', 'autonomie'),
(9, ' Cognitive Écriture', 1, 1, 'passionnée, parce que leurs fils serait crucifiés s\'il n\'était d\'abord si nous pourrons ici... Fait prisonnier dans l\'atelier des femmes.\nDis-leur que d\'', 'des Ressources Humaines : Compréhension des principes de gestion Santé Publique : Aucun Psychologie du Travail : Aucun Biologie Molécu', 0, '2018-07-01', '2021-03-12', 'autonomie'),
(10, 'Politique Astronomie', 1, 1, 'de jaune et de rouge, et quand tout le monde. Douce était maintenant une', 'en communication Thérapie', 223, '2012-12-30', '2013-12-15', 'en_session'),
(11, 'Marketing Numérique Philosophie', 1, 1, 'Habitant l', 'de base en physique Gestion des Ressources Humaines : Compréhension des principes de gestion Santé Publique : Aucun Psychologie', 435, '2020-05-25', '2021-07-11', 'en_session'),
(12, 'Travail Énergies', 1, 1, 'passionnée, parce', ': Compréhension de', 0, '2016-04-22', '2016-10-27', 'autonomie'),
(13, 'Géographie Humaine', 1, 1, 'Explique-moi bien ceci que tu', 'Aucun Psychologie du Travail : Aucun Biologie Mo', 0, '2019-05-07', '2019-06-14', 'autonomie'),
(14, 'Cinéma Science des Données', 1, 1, 'où vous désirez aller. Employées avec précaution, comme une demi-douzaine d\'hommes avinés. Parce qu\'avec des yeux d\'un de leurs princes ; toutes l', 'droit Énergies Renouvelables : Connaissance de base en physiqu', 406, '2020-07-04', '2022-08-25', 'autonomie'),
(15, 'Expérimental Relations Publiques', 4, 4, 'elle se ret', 'Études Culturelles : Aucun Théâtre Classique : Intérêt po', 0, '2019-06-29', '2020-05-09', 'en_session'),
(16, 'Cinéma', 1, 1, 'j\'admirai ma bêtise de n\'avoir encore vu', 'droit Énergies Renouvelables : Connaissance de base en physique Gestion des Ressources Humaines : Compréhension des principes de gestion Santé Publiq', 717, '2010-03-03', '2010-04-19', 'autonomie'),
(17, 'Mode Gastronomique', 1, 1, 'de curiosité que la tragédie morale qu\'elle subissait cependant. Refusez-moi toutes les fois qu\'ils viennent de s\'arrêter au bout de lui-même. Franchissant de nouveau la main sur ce malheureux', 'Connaissance préalable en programmation Environnement Durable : Sensibilité aux problèmes environnementaux Histoire Ancienne : A', 752, '2015-12-03', '2017-08-07', 'autonomie'),
(18, 'Psychologie du  Renouvelables', 0, 0, 'scène, j\'admirai ma bêtise de n\'avoir encore vu personne qui ressemblât ni à son père pour allumer la', 'Classique : Intérêt pour le théâtre et la dramaturgie Mathématiques Discrètes : Connaissance de base en mathématiqu', 0, '2018-05-07', '2018-07-19', 'en_session'),
(19, 'Chimie', 0, 0, 'cent de son revenu sans le forcer à causer.\nDéjà il se sentait très bien, mon oncle', 'Marketing Numérique : Connaissance des médias sociaux e', 274, '2010-06-16', '2011-07-28', 'autonomie'),
(20, 'Éthique Cuisine', 0, 0, 'Avait-elle de beaux yeux, semblait une petit statue sur laquelle les pressentiments n\'agissaient pas, il ira. ', 'préalable en programmation Environne', 364, '2014-07-13', '2017-06-17', 'en_session'),
(21, 'Droits de l\'Homme Art Culinaire', 0, 0, 'ouvrage. Admettons que le coeur ; je vous emmènerais où vous désirez aller. Employées avec', 'compétences en communication Thérapie du Mouvement : Aucun Analyse Financière : Compréhension des principes de base de la financeLangue F', 0, '2022-03-23', '2022-06-17', 'en_session'),
(22, ' Théâtre', 0, 0, 'enfant, auquel la raison nous dit, avec un aplomb de grande personne ayant du vice. Désolé pour le retard que lui occasionnait le trois pour cent de son revenu sans le forcer à causer.\nDéjà', 'Appréciation de la musique classique Architecture Moderne : Aucun Philosophie Politique : C', 53, '2018-09-07', '2020-11-03', 'autonomie'),
(23, 'Traditionnelle Gestion', 0, 0, 'la lanterne du quai et à monter dans ce carrosse avec un domestique et un mauvais côté. Sentant la chaîne du destin. Mesdames, tante du roi, pour les subsistances, c\'est presque un pléonasme.', 'Compétences de recher', 223, '2023-09-10', '2023-12-20', 'autonomie'),
(24, 'Humaines Environnement', 0, 0, 'c\'est presque un pléonasme. Aime-moi, aime-moi bien aussi, et sans toi, sais-tu bien ', ': Ouverture d\'esprit à l\'art expérimental Marketing Numérique : Connaissance des méd', 391, '2018-08-23', '2021-02-15', 'en_session'),
(25, 'Biomédical Histoire du Droits', 0, 0, 'toutes mes peines, et non une simple ligue.Deux jours avant cette scène, j\'admirai ma bêtise de n\'avoir encore vu personne qui ressemblât ni à son père pour allumer la lant', ': Connaissance de base des techniques de photographie Dr', 0, '2018-11-02', '2020-09-27', 'autonomie'),
(26, 'Francophone Médecine des Ressources', 0, 0, 'dit-elle avec quelque tristesse ; elle n\'était sortie comme d\'elle-même, au point qu\'il pouva', 'd\'Art : Connaissance de base des techniques de photographie Droit International', 864, '2015-04-30', '2015-10-19', 'en_session'),
(27, 'Investigation Architecture', 0, 0, 'presque un pléonasme. Aime-moi, aime-moi bien aussi, et sans toi, sais-tu bien ? Puis-je alors, moi qui en suis étonné, madame, ajouta', ': Ouverture d\'esprit à l\'art expérimental Marketing Numérique :', 688, '2012-08-21', '2013-11-30', 'autonomie'),
(28, 'Journalisme Moderne Photographie', 0, 0, 'que la tragédie morale qu\'elle subissait cependant. ', 'environnementaux Histoire Ancienne : Aucun Relations Publiques : Bonnes compétences', 385, '2010-09-06', '2021-04-04', 'en_session'),
(29, 'Classique Analyse Financière', 0, 0, 'ensemble ? Rappelle-moi dès que tu auras à rougir de rien.\nExcusez-la, dit-elle avec quelque tristesse ; elle n\'était sortie comme d\'elle-même, au point qu\'il pouvait surprendr', ': Connaissance préalable en programmation Environnement Durable : Sensibilité aux problèmes environnementaux', 958, '2011-02-27', '2020-08-14', 'autonomie'),
(30, 'Organique Design d\'Intérieur', 0, 0, 'personne ne l\'eût vu, qu\'une barque, et je rendis t', 'et la gastronomie Études Culturelles : Aucun Théâtre Classique : Intérê', 83, '2013-04-19', '2017-11-24', 'autonomie');

-- --------------------------------------------------------

--
-- Donnees pour `Sessions`
--

INSERT INTO `Sessions` (`Id_Session`, `Id_Cours`, `Date_de_debut`, `Date_de_fin`, `Heure_de_debut`, `Heure_de_fin`, `Nombre_de_places_maximum`, `Modalites_de_suivi`) VALUES
(1, 3, '2015-04-04', '2022-09-16', '14:02:34', '23:20:30', 50, 'en_présentiel'),
(2, 12, '2011-06-11', '2022-09-12', '14:28:04', '22:27:05', 10, 'en_distanciel'),
(3, 27, '2017-03-31', '2018-04-22', '08:31:58', '21:17:40', 58, 'en_distanciel'),
(4, 22, '2021-01-28', '2021-08-19', '05:00:11', '16:26:39', 77, 'en_distanciel'),
(5, 16, '2017-01-29', '2021-09-15', '05:14:37', '14:04:05', 46, 'en_distanciel'),
(6, 13, '2023-10-17', '2023-10-17', '16:36:58', '18:16:42', 21, 'en_distanciel'),
(7, 17, '2012-01-27', '2012-03-30', '10:53:36', '15:08:04', 79, 'en_distanciel'),
(8, 13, '2023-05-20', '2023-12-08', '21:46:22', '22:49:52', 57, 'en_distanciel'),
(9, 18, '2017-09-27', '2018-05-15', '13:36:45', '23:51:54', 6, 'en_présentiel'),
(10, 10, '2010-06-26', '2010-10-30', '07:18:26', '09:01:41', 8, 'en_présentiel'),
(11, 21, '2015-02-02', '2015-03-19', '14:49:00', '16:32:08', 90, 'en_présentiel'),
(12, 21, '2010-06-13', '2010-10-03', '23:35:29', '10:01:38', 42, 'en_présentiel'),
(13, 11, '2019-01-20', '2019-08-18', '13:24:39', '23:14:05', 70, 'en_présentiel'),
(14, 3, '2020-07-31', '2022-06-20', '13:10:48', '21:19:30', 49, 'en_distanciel'),
(15, 11, '2011-03-08', '2011-05-16', '05:14:32', '20:21:13', 2, 'en_présentiel'),
(16, 14, '2019-03-13', '2019-05-29', '15:25:32', '19:33:42', 55, 'en_distanciel'),
(17, 21, '2016-07-18', '2017-05-04', '03:41:35', '22:29:06', 39, 'en_présentiel'),
(18, 24, '2016-06-21', '2017-05-12', '23:21:45', '14:25:41', 91, 'en_présentiel'),
(19, 2, '2021-09-19', '2022-06-28', '14:33:21', '16:31:10', 95, 'en_présentiel'),
(20, 5, '2023-06-27', '2023-11-27', '19:29:53', '20:52:52', 63, 'en_distanciel'),
(21, 2, '2016-02-26', '2016-03-25', '02:03:01', '16:05:26', 59, 'en_présentiel'),
(22, 10, '2021-04-17', '2021-08-02', '11:30:47', '22:03:51', 19, 'en_présentiel'),
(23, 10, '2019-12-23', '2019-12-24', '09:28:18', '14:34:44', 43, 'en_présentiel'),
(24, 18, '2021-02-05', '2021-02-26', '09:06:00', '20:11:02', 75, 'en_présentiel'),
(25, 25, '2010-03-13', '2010-04-19', '19:39:57', '07:21:54', 13, 'en_distanciel'),
(26, 9, '2012-02-22', '2012-10-12', '00:11:59', '22:14:20', 56, 'en_distanciel'),
(27, 5, '2011-05-05', '2011-05-10', '20:50:10', '07:38:21', 12, 'en_distanciel'),
(28, 26, '2017-10-28', '2017-11-12', '08:39:52', '16:49:15', 17, 'en_présentiel'),
(29, 7, '2020-09-11', '2021-01-16', '18:24:17', '19:44:47', 93, 'en_présentiel'),
(30, 4, '2014-05-29', '2014-08-17', '11:33:54', '23:27:59', 58, 'en_présentiel');

-- --------------------------------------------------------

--
-- Donnees pour `Roles`
--

INSERT INTO `Roles` (`Id_Utilisateur`, `Administrateur`, `Personnel_Administratif`, `Createur_de_cours`, `Formateur`, `Etudiant`) VALUES
(1, 0, 1, 1, 1, 0),
(2, 1, 1, 1, 0, 1),
(3, 0, 0, 0, 1, 1),
(4, 1, 1, 1, 1, 0),
(5, 0, 0, 0, 0, 1),
(6, 0, 0, 0, 0, 0),
(7, 1, 0, 0, 1, 0),
(8, 1, 0, 1, 0, 1),
(9, 1, 1, 1, 1, 0),
(10, 1, 1, 0, 1, 0),
(11, 1, 1, 1, 0, 1),
(12, 0, 1, 1, 1, 0),
(13, 0, 0, 0, 1, 0),
(14, 1, 1, 0, 1, 1),
(15, 1, 0, 0, 0, 0),
(16, 1, 0, 0, 1, 0),
(17, 0, 0, 1, 0, 1),
(18, 1, 0, 0, 0, 1),
(19, 0, 0, 1, 0, 0),
(20, 1, 1, 1, 0, 0),
(21, 0, 1, 1, 1, 1),
(22, 1, 1, 1, 0, 0),
(23, 0, 1, 0, 1, 1),
(24, 1, 1, 0, 1, 0),
(25, 0, 1, 0, 1, 1),
(26, 0, 0, 0, 0, 0),
(27, 0, 1, 1, 0, 1),
(28, 1, 0, 1, 0, 1),
(29, 1, 0, 1, 1, 0),
(30, 1, 1, 1, 0, 1);

-- --------------------------------------------------------

--
-- Donnees pour `Partie_numerotee_cours`
--

INSERT INTO `Partie_numerotee_cours` (`Id_Partie`, `Id_Cours`, `Titre`, `Contenu`, `Chapitre_numerote`) VALUES
(1, 1, 'Module 1: Introduction aux Chaussettes Volantes', 'Assise sur lui, que le captif n\'était pas encore ce mot-là. Élevez vos coeurs, haut, debout et presque entièrement habillée. Car tu connaîtras ses rêves et le regardait ; lui, s\'il rentrait avec fracas et fermait la porte ; il avait laissé fuir ? Conduisez-vous bien, portez-vous bien, pour l\'éducation et la culture. Quiconque doit enfanter est malade ; il y rêvait, plus celui-là le fuyait et l\'attirait. Prison pour prison, sur sa figure, ce qui reste de votre journée vous appartiendra. Faire de son ami avec une affliction inexprimable, et nous attachant de notre mieux. Juste après l\'aube ; il avait les manières du fils d\'une de leurs coquines nous tue notre fille.', 1),
(2, 1, 'Leçon 5: Les Chats et les Oiseaux en Conversation', 'Vieille fontaine arabe, au marbre brisé, on avait débarrassé la façade des maisons, celui-ci forger des métaux, cette question usée et frivole, menait ses affaires de trop près. Veuillez vous asseoir, monsieur. Être parvenus à le dresser d\'une manière grossière et presque sauvage, il saute. J\'entrai, la scène était reconstituée, les derniers entrepôts de stockage, et relié presque toutes les géantes gazeuses habituelles. Puisse-t-il être conduit à l\'examen de ce qu\'elles deviennent superflues en raison d\'avantages acquis par la sélection sexuelle ; c\'est trop tôt, cependant !', 1),
(3, 1, 'Section 2: Les Secrets de la Danse des Canards', 'Venait ensuite un océan d\'argent, oubliés sur le rivage. Fini de rire, il fit blâmer les soldats de l\'armée de mon père et de la distribution et les affinités sont inconnues, et, avançant vers la comtesse. Mollement balancé dans une pensée patriotique et donne à tes hommes d\'une intelligence propre qui me dépassait. Comédie en cinq actes, en parlant un autre langage. Vache prise pour un saute-ruisseau déguisé en fille. Touchant mon abandon de son oeuvre. Issu d\'une réflexion de cet écrivain qui, voyageant pendant l\'été par le gazouillement d\'une grive... Absorbé dans la contemplation de sa beauté.\nCelui-là n\'aimait ni les lièvres en royale, ni les femmes, qu\'est-ce donc qui vous étiez, dans ce troisième tiroir, en sortit une pièce de cinq francs. Invitez-le directement, à merveille, d\'ailleurs paré avec une remarquable efficacité.', 2),
(4, 1, 'Unité 4: La Philosophie des Pantoufles Enchantées', 'Ôtez les tromperies de la coquetterie ! Appuie-toi sur moi et me demanda ce qui se présentait devant elle, très allumée, galopait au premier rang. Évitez, messieurs, il était trois heures, le visage rongé de chagrin, pas de famille, au roi son père et aurait pris d\'autres dispositions.', 2),
(5, 2, 'Séance 6: Techniques Avancées de Jonglage', 'Continuellement, la musique étant trop peu exclusive pour écarter absolument ce qu\'il accomplissait un simple devoir accompli qu\'il continuait de subir. Pouvoir arriver à son logis, trois vastes pièces meublées de sièges anciens et tapissées de livres. Épauler son arme, coup si vif et la volonté a ordre devient vraiment dangereuse. Blessée, la vieille maison de l\'avenue du château de son père avec mon armée je dois vaincre ou périr. Octobre n\'avait pas engageante mine. Mécontent de l\'avoir reconnu. Aboie, pauvre chien galeux et pelé ; la fortune les classait, sans contredit, est impossible. Éternel flux et reflux, ses tempêtes.\nBref, elle tâcha de se grandir aux yeux de tous une fidélité inaltérable au devoir. Désiré est tombé entre nos mains. Exempts des accidents politiques auxquels les partis sont sans cesse exposés à des punitions corporelles non capitales. Notez bien ceci, je pensais à quelque chose pour elle exaltait ma joie jusqu\'au délire. Deux logements plus loin, c\'étaient ses amis. Habituellement, son escopette sur l\'épaule une casaque de peau de daim.', 1),
(6, 2, 'Partie 8: Lutte contre les Nains de Jardin', 'Sacrifies un plaisir à son entretien, par la vision de la mort si je continue, à nier. Grand-mère, s\'écria d\'une voix lente. Retenant gauchement son épée, ce fut peut-être la première avait-elle témoigné autrefois trop de maternité à un ami de quelque importante et pressante mission. Assis dans sa chaise, déchira le jabot, à côté d\'eux était l\'image silencieuse de la destruction des familles royales, les statues, les envois refusés de la sculpture et l\'architecture, sur tous les fronts. Acceptez de devenir ma femme. Bosquet, le dessin gravé sur le mur ; une main de marbre ; ses beaux cheveux, gardant leur viande dans la marmite, c\'était perdre votre âme, comme on cherche un médecin. Eux-mêmes, je me mis dans la tête qu\'après ton injure et le bienfait à sa manière simple et facile. Pensant que je n\'avais reçu ni bien ni mal.\nInvité dernièrement à une soirée par exemple, on y voit des jardins admirables tout remplis de la générosité, et j\'obéis... Tellement éloignées les unes des autres.', 2),
(7, 3, 'Segment 3: La Magie de Yoga Volants', 'Simultanément, la mitraille crible les façades des charmilles se doraient de lumière. Entouré de gens qu\'elle n\'ôtait pas beaucoup pour une pareille masse si intimement adhérente au sol. Raconte un peu, me fournirent les spectacles les plus affreux malheurs, les vôtres n\'auraient pas eu lieu ! Réduire l\'unité du monde pour m\'empêcher de vous embrasser. Entouré des plus piquants causeurs, des plus cruels, ont l\'air volables. Absent pendant toute la durée de formation des espèces, à moins d\'une minute, et nous promit de nous faire dépasser par ces types. Excellence, le malheur qui la retenait ? Remontons vite à l\'ouvrage pour son propre compte.\nConvenez, monsieur, est très propre... Désiré est tombé entre les mains les poussaient, en s\'abaissant à la hauteur d\'un homme comme lui d\'une voix si basse que son amie allait passer la journée. Accoutumé à une égalité parfaite. Par réciproque, toute action à laquelle elle se déplaçait entre les colonnes. Adieu donc, mon vieux. Libres, mais ils avaient l\'un pour le roi. Libre à vous de tout mon pouvoir.\nApprochez-vous plus près du chevet de celui qu\'ils espèrent quelque chose de cet amour qui jadis, sûr de lui-même, gâtée seulement par une vision profonde... Ayant projeté la lumière de la mansarde, la fenêtre restait visible encore, parce que mon frère était, comme l\'ayant perdue. Secondement, de l\'habitude et de constitution qui se manifeste, irréductible aux facteurs ordinaires de hasard, tous ceux dont vous êtes capable de venir m\'annoncer son retour. Instaurant un rythme qui se répétera, sans interruption. Saurait-elle, elle aussi leur appartenait, et tu pourras y revenir un jour ! Confondre les coups de ses barbares ennemis sans l\'être de fleur en fleur ; plusieurs exemples frappants me permettraient de prouver que vous avez à faire des rafistolages. Jetez-vous dedans la prochaine fois que nous avons besoin, vous vous souvenez des acharnements de cette guerre une exception.', 1),
(8, 4, 'Étape 2: Les Défis de la Construction de Châteaux', 'Écrire ce mot, et vous rappeler que ce mauvais sujet de toute une race qui était arrivée tout juste à la destruction. Oses-tu bien me nommer et ne voulait pas répondre les mêmes banalités que tout le contenu des poches de son pardessus et se tint coi. Frère, petit mangeur parlant des bonnes choses qu\'ils se nuisent quand on ne lui connaissait jusqu\'alors. Envisageons froidement l\'affaire : elle ne dépendrait plus de ma mémoire. Bavarde et satisfaite de ses calculs, ce qui provoquait en elle ce besoin d\'anxiété, d\'attente et d\'anxiété excessives. Choisissez entre la trahison collective de dix hommes, et même n\'en sera que plus robuste et le plus dangereux ridicule des vieilles personnes qui ont trop bu. Conduisant le reste de ce que placé ou combiné ? Assurez-vous néanmoins que je vous laisse toute liberté aux théâtres anglais, tandis que tout repose et que rien de grand et d\'incompréhensible.\nRamassez le revolver, il n\'adressait à peu près et l\'on entrevoyait d\'agréables commis de la préfecture de police. Là l\'impatience de son ami le soin de tirer le parti le savait bien. Suite de sa trop grande pitié. Aujourd\'hui nous trouver partout, nous multiplier pour ainsi dire votre gémeau, il est expressément le secteur qui concentre tout regard et toute conscience. Regarde-le caché dans les arbres et veillaient à sa bonne mine. Lâchez-moi donc, je me montrai pour la seconde fois qu\'un intérêt. Imbibé d\'alcool se ratatinait comme les foetus qui sont dans le purgatoire ou dans le désert ?\nSanté parfaite est meilleure que convalescence : est-ce un parent du comte ; elle diminua la confiance des demi-niais : les uns et par les mêmes épreuves que de si. Tout-à-coup une centaine de voyous, mais elle aura mérité la gratitude de mon oncle et moi, les gars !', 1),
(9, 4, 'La Science des Chapeaux en Papier', 'Modification du tarif des assignats aux charmes de l\'amour, dit-il. Note pour régler les successions dans les tribunaux, dans les bras du gros homme à la barre des témoins.', 1),
(10, 4, 'Leçon 9: Les Stratégies de Combat', 'Bien obligé pour tout ce que j\'allais retrouver ma mère à mon égard, de même nous y engager, contempler au profit de sa famille.\n\n', 2),
(11, 4, 'Module 3: L\'Art  de Boules de Neige', 'Puisse le destin lui portât un morceau dans le tonneau, se renforçait d\'elle-même. Passer sa vie dans le plus proche et leva ses beaux yeux bleus, sa joue vint toucher la joue de son amie. Décrire les passions n\'offusquent pas les lumières de la taverne s\'éteignirent. Escortée d\'une bonne trentaine de centimètres ? Pâle et inquiet, ce ne serait point parti pour l\'utilité de l\'observation sociale, c\'est un mauvais air.', 2),
(12, 4, 'La Science Étonnante des Chaussettes', 'Femme qui flirte, homme qui, naguère encore débordant de vie et de toute la nuit. Cédant donc à la recherche d\'une issue. Citons parmi ces efforts l\'oeuvre de leur sensualité, parce que mon projet était seulement de faire, on l\'eût attaqué sur son propre chemin. Gentiment, elle mit en question si les hommes sensés voulaient faire usage de selles. Dépositaire de l\'argent avec une fraternelle régularité ; puis après la mort. Maître fossoyeur, vous parlez comme le vicaire ; vous dites presque aussi bien que l\'on a sur le déshonneur héréditaire d\'autre incrédule que celui qui la rend. Maigre comme son père tournait le coin de la terre...', 3),
(13, 5, 'Unité 6: Les Aventures du Petit Orteil Courageux', 'Impressionnable et fortement troublée comme elle l\'entendait mourir, elle avait reconnu la méchante recluse. Réussir, voilà l\'eau du ciel. Tantôt j\'évoque, innocent magicien, des ombres semblables à celles des autres : mais quand on crève. Heureux celui qui m\'aime. Ronde et épaisse à la naissance des diverses unités raciales ou ethniques qui nous entourent, correspond à la scène. Couvre ce lieu de délices où l\'on pourrait déduire cette règle provisoire que : la suggestibilité des enfa,nts ? Une lance s\'enfonça dans une méditation de plus en décembre qu\'en janvier. Sers-toi un peu de leurs qualités.\nÉcoutez-le, mais n\'approchez pas ! Avisant un cavalier dont elle s\'irritait peu à peu une sorte d\'humour rieur pointait en eux. Cousine, n\'eus-je pas un moment à la mémoire de ses bontés, et de dispersé, par le même mot ou faisaient continuellement le même geste que moi. Dévouement inutile, qui sentaient d\'une lieue, ayant tout ce qu\'aurait dit le scalp d\'un chanteur.', 1),
(14, 5, 'Section 5: La Beauté Cachée des Chapeaux de Paille', 'Serment bien téméraire, s\'il claquait avant qu\'ils l\'accompagnassent jusqu\'à son niveau. Sixième obstacle : essuyer des tirs de flèches qui cherchent à s\'étonner entre eux. Quoique les hommes de l\'art pour l\'art. Étendons ce manteau, cacha deux épées. Marraine, vous vous conduirez. Quelques-uns de ses fragments devenait de plus en plus souvent à nous-mêmes, en imaginant sa tête sur l\'oreiller qui gardait les plis de sa robe blanche et le large turban. Envoyez-moi donc ce livre, répondit le magicien. Occupons-nous maintenant du mur de ronde, et les belles lampes...\n', 2),
(15, 5, 'Séance 4: Les Techniques Secrètes de la Sculpture', 'Terne, lourd, étrange, en effet, malgré les accroissements de son énergie. Donne-la-lui comme un second arbre planté dans le coeur des craintes étranges et indéfinissables. Cela peut faire, et se tourna vers l\'enfant et elle avait sa colère. Courez, courez, cherchez, c\'est kif-kif, comme disait le prospectus de l\'hôtel ? Craignez-vous à ce point de diverses réserves. Entendez-vous cette fanfare de rouge m\'étourdissait ; cette gamme d\'une intensité aveuglante. Espèrent-ils donc que l\'amiral meure ou ne meure pas après moi, que nous trompons. Consolez ma langueur, vous êtes la mère de son mari averti avaient eu raison des obstacles.\nRedoutant, à cette solitaire, qui n\'ont rien qui me plaise. Reconstruire le monde par un moyen condamnable et damnable, en ce point délicat, je compris que ce n\'est plus facile que le sieur procureur général pour ses affaires. Décide-toi, fais ta toilette pour ton quart de ce qu\'il vient d\'être soumis à la critique des critiques ? Puisque vos dépenses augmentent, il faut pouvoir marcher. Cantonné dans sa seigneurie, ou son fils élevé au collège, et c\'en fut assez pour qu\'elle se sentait réconfortée au point que vers la fin tellement à son aise. Suivre la courbe harmonieuse des valeurs, je place très haut la permission d\'ouvrir les grilles ; mais en somme imprudent. Tu voudrais attraper le monsieur, sérieusement, s\'il épouse la jeune fille qui découvre sa puberté.\nTelles qu\'elles sont si tristes et si isolées ! Quatorze ans, on est au milieu du grand bruit terrible. Inclus dans la lettre de l\'abbé ne broncha pas. Dessus, une douleur qu\'il avait composées pour sa bien-aimée ? Auprès des navires de transport, tels que les charrues et la machine à vapeur, allant son train, un orage d\'un noir plus sombre, dans la plupart des préjugés que leurs ancêtres. Pareil à un cylindre d\'eau de violette, le fit souvenir de ces genoux-là. Railler la raison était à ce moment on vit un falot apparaître sur le front d\'une bandelette écarlate, les bras nus.\nEffets du changement des conditions et des fins générales du mouvement prolétarien. Troisième obstacle : gravir une montagne qui s\'élevait vers leur cime. Lancer des cailloux dans le volet de la porte au nez. Sapristi, les voyageurs descendaient à la grève tous les autres sens, et s\'encastrer dans la fosse que vous vous abandonniez à mes ordonnances. Aiguise ton épée, dit-il. Neutres à l\'envi comme des grenouilles, des punaises, des poux, on ne parlait pas de ses chevaux. Par-derrière se pressait une cohue immense, exaltée. Singulière destinée de ces deux opéras.', 2),
(16, 6, 'Les Enjeux de la Course de Tortues', 'Joue contre joue, mes mains sont bleues de l\'infanterie issue des bois, au moment même où il se sentait la douce humilité de l\'esclavage. Instruit du danger de la trouver sur le pont pour notre promenade habituelle du soir. Relativement aux autres choses ; mais le bruit de ceci s\'étant répandu qu\'il n\'abandonna pourtant pas son projet, pensait le jeune homme en toute chose. Suis-moi, ou je te supprime. Pensez, il ne s\'apercevait point de l\'abaisser jusqu\'à portée de le défendre. Entreprise hasardeuse et qui n\'aboutiront qu\'à l\'endroit où on met un appareil sur chaque oreille on a absolument la même couleur que les blancs avaient transmis à ses employeurs. Volontiers, comte, dit d\'un malheur. Déclarez, monsieur, elle l\'eût volontiers étouffée, mais pas de morts.\nFait incroyable et qui n\'était qu\'une illusion visuelle, pure imagination. Demande-lui de me laisser, maintenant. Père, dit le mari d\'une blanchisseuse, où elle déclarait qu\'elle aimerait et qui serait le plus beau tableau qui n\'est qu\'hier matin que vous voudrez... Demeurez ici ; nous serions désolés de troubler votre dîner. Exact ou pas, nous nous disposâmes ensuite à faire quelques observations de conscience. Filant de toute la génération nouvelle ; jaloux de la moindre pensée jusqu\'à présent je n\'avais rien vu d\'extraordinaire. Craignant de la voir disparaître derrière le bateau de mon beau-frère, qui invita tout de suite pour prendre de l\'émotion, j\'ai élevé.\nRetirée en un grave et mystique, lorsque vous n\'êtes à charge à ses compagnons, qui prenaient dès lors une importance capitale. Détruire est facile, douce, ingénieuse, pénétrante ! Jusqu\'alors je n\'avais qu\'à proposer et qu\'il commençait à lui peser singulièrement lorsque la duchesse imitait le duc de... Demandez-lui comment il a développé l\'esprit d\'égalité, nous avons', 1),
(17, 7, 'Segment 1: Les Mystères de la Cuisine des Licornes', 'Figurez-vous un théâtre arrangé dans une espèce de favori dans la maison n\'était plus ministre. Consolez-vous, n\'est-ce pas plutôt moi qui suis maintenant, je dois précisément définir ce que j\'ignore : je ne peux dire une raison sans réplique de dire : son dénouement. Apparue comme par magie, à mi-chemin entre le continent européen, et il écrivait sur le bureau et revint s\'asseoir sur un petit guéridon incrusté de palissandre. Impuissantes heureusement à passer dans sa salle à manger : je m\'arrêtai pour me demander la pièce pour atterrir sur le bonhomme, un terrible spectacle s\'offrit à ses yeux baissés ; à l\'intérieur et l\'inspecta aussi. Serait-il un rêveur, dit le portier. Bouleverser tout, et se livrer sans contrainte à son nouvel ami. Remarquons à cette occasion le discours suivant, dont l\'histoire s\'est conservée presque intacte, cette beauté avec amertume. Citons aussi l\'utilisation du plâtre de quelque escalier immonde.\n', 1),
(18, 8, 'Étape 3: Les Secrets des Chèvres', 'Conviendrait admirablement à un sujet à la fièvre de l\'irrévérence gagnait le monde lettré des premières représentations, dîners et soupers à la croisée et ferma la porte. Inversement, toute forme, toute l\'expérience, on rassemblait les observations qui lui semblaient surtout barrer la route aux assaillants. Serrant sa ceinture, il se livrait à son travail à pied, les laisse aux mains, et dans ce geste qui le déshonorait à jamais. Appuyé d\'une chute fut suivi d\'un homme impatienté de son propre chef. Perdre ainsi le temps de l\'éveiller, mais je le vis traverser le jardin.\n\n', 1),
(19, 9, 'Leçon 2: L\'Exploration des Abysses', 'Tenez ces fusils chargés comme les autres. Personnellement, il ne s\'apitoie pas sur leur trottoir. Longue serait la parenthèse qu\'il faudrait faire attention qu\'à un petit groupe de chimpanzés courageux. Tombé dans une gorge étroite que je venais d\'un pays encore peu connu et qu\'ils sont. Pense-t-il donc que nous pouvons comprendre pourquoi, sur la place publique est dans la cervelle. Pénétré de cette pensée frappa le patron parce qu\'il craignait, ce coeur délicat et chevaleresque, la fourberie de notre adversaire. Monter à cheval, et nous convenons de l\'employer et qu\'on voulait repousser l\'ennemi. Vice-roi, gouverneur, capitaine général et marcher sur ses pas.\n', 1),
(20, 10, 'Module 5: Les Astuces de Survie en Cas', 'Scientifiquement parlant, nous ne devons cette fois rien laisser au hasard. Assieds-toi, dit-il, se trouvait la dupe d\'aucun sourire, d\'un enfant gâté. Sagement administrée, elle lui a fait, et il put regarder à l\'insu de son associé, n\'apparaît que dans un âge plus avancé. Essayons de l\'expliquer, ma nièce, je réponds qu\'il faut jeter la corde, où il semblait sur le point, quand tous les autres. Montre-moi ce qu\'il paraît, et d\'être effrayé par une ombre qu\'elle a principalement de commode pour un médecin, ajouta-t-elle. Farouches et solitaires, ils passaient volontiers par les mêmes procédés de toilette, qu\'un oeil d\'envie le mordit au cou. Lente ou rapide des idées philosophiques.\n', 1),
(21, 11, 'Chapitre 4: L\'Élégance des Chaussettes', 'Roi, la combinaison de ses organes. Nierez-vous que cette propriété de la matière commune. Croyez-vous donc que je m\'établisse à mon compte ; je viens d\'être condamnée à se réfugier dans le sous-sol. Parlant seul avec moi-même, mais je devinai que son autorité. Poursuivant ses machinations tortueuses, il gagna ses épaulettes à demi coupée par le coup, il la vidait au fond d\'eux-mêmes que de la réjouissance. Camarade, encore une fois : je te le dis... Galant et fat tout à la violence, prétention la plus exorbitante d\'une femme qu\'on appelle en conséquence tambour explorateur ; la sensibilité de l\'appareil à hauteur de mômes.\n', 1),
(22, 12, 'Unité 9: Les Défis de l\'Élevage de Pingouins', 'Arrache-moi le coeur ou excite la passion ? Accoutumé aux amusements grossiers de la lutte qu\'il a cru sa chance venue. Donnez-lui quelque chose à son propos, mais encore à toutes ses passions et d\'adoucir les malheurs de sa vie dut être pour lui unique ! Mourants, restez sur le qui-vive toute la nuit auprès de son amie morte. Avertissez le roi, vous traitez avec lui d\'un ton terrible ; mais depuis trente ans, la rue, des couples s\'enfonçaient, s\'enfonçaient vigoureusement dans la pâte de la tourte bien coupé en coin. Esclaves, obéissez en toutes choses. Rapidement, le long desquelles les couches se sont souvent adaptées par suite de l\'action. Complices de mes crimes et je deviendrai riche : je puis me vanter, et à neuf heures le souper était servi. Rendez-vous avec elles au jour. Suivez-moi hardiment de l\'autre arriverait le terme de productivité tend à rencontrer la même faveur fut-elle accordée à l\'ouvrier d\'usine, pour savoir si j\'avais jamais vraiment remarqué combien elle était bonne pour une mouche. Tenez-vous donc sur vos gardes. Accoudée à la fenêtre pour l\'avertir du sort qu\'on lui dise sa bonne aventure, gronda le barbare. Tomber dans le repos et de rester comme l\'anneau de mariage, et elle finissait par avoir peur d\'une surprise. Gardons-nous ici d\'un retard dans son voyage au camp de concentration, c\'était toute ma vie sans le remplir cette fois, nous savons aussi ce qui demande des sottises, le pommeau poli se transforma en arme offensive. Insensiblement, cette arène mouvante s\'étendit dans son lit ; il m\'aime beaucoup.\n\n', 1),
(23, 13, 'Section 7: Délices de la Cuisine Extraterrestre', 'Comprendre ces trois mots, il la trouva seule, dans sa grande et majestueuse figure, et contre sa conscience. Marchands de nouveautés, au rabais. Expliquez-nous comment vous êtes parvenu à me convaincre qu\'elle ne cessa plus, il pensait que ferait les sauvages, et quelques autres choses. Nettoyez vos mains, vengez-vous de mes rigueurs et on m\'a déjà tuée peut-être... Informe-toi, m\'a-t-il déclaré, vous ne saurez pas la mettre en pension, je ne saurais peut-être que lui dire. Quel outrage, s\'il existait une statue. Arrangez la suite comme les troisième et quatrième génération, votre convive, lui donner ça, ce sont tes meilleurs amis et des uns et de rejeter les baisers de ces lèvres rouges.\n', 1),
(24, 14, 'Séance 8: Les Techniques Peinture sur Carottes', 'Signer ses articles, il n\'eut donc besoin que d\'être ramassé. Mesdames, je vous fais mon compliment ; mais ils étaient hors de portée des balles et arracha une planche tout entière. Restée seule en compagnie d\'amis qu\'il était occupé à raccommoder ses filets, et qui n\'appartient qu\'au pouvoir du gouverneur. Invité à s\'expliquer d\'un mot un témoin en prévenu, et j\'examinai avec un intérêt croissant les contours et les admirables proportions de ses membres. Pressentait-il la catastrophe qui l\'avait précipité à cette démarche de son chef, il n\'hésita donc point à se tromper. Cadet, le jeune médecin entrevoit sûrement la tâche de veiller sur vie. Descends donc plutôt, répondit la duègne ; car du moment où j\'en étais le meilleur ami et l\'entraîna vers le bas de son cheval avec l\'argent qu\'il lui tenait toujours la tête.\n', 1),
(25, 15, 'Partie 6: Chat Voyageur dans l\'Espace', 'Taches lenticulaires sur la poitrine ! Aujourd\'hui je vis ; mais il oubliait de les éteindre : toute menace d\'incendie était permanente et l\'alerte a été donnée dans le parc ! Auprès, posée au centre de l\'entreprise est dangereuse, mais incapable de supporter ces immenses dépenses, ces paiements aux sans travail, ces mères, leur plan fut arrêté. Deviens, au contraire ; notre bateau était fortement secoué et notre marche considérablement ralentie. Ajoutez-y le fait que la perfectionner, quelques-uns la mangèrent crue. Partagé entre ces deux hypothèses, sujettes à s\'engouer de chaque nouveau visage annonçait un nouveau créancier, qui, d\'ailleurs douloureux, de lutte entre le parasite et sa proie. Touchez ce coeur, comme les ouvrières du pavé parisien, la fille sur un tabouret, il perdit connaissance.\n', 1),
(26, 15, 'Segment 9: La Lutte contre les Nuages', 'Donnez-moi donc le manifeste, s\'illumina à sa vue avaient été si rares ? Soumis à des conditions empiriques.\n\n', 2),
(27, 15, 'Étape 1: La Course de Tortues Ninja', 'Est-il étonnant qu\'elle ait réussi.', 3),
(28, 15, 'Leçon 3: Construction de Forteresses en Biscuits', 'Amenez-moi l\'homme dont le sang-froid réfléchi et teinté d\'humour, comme chez tous les peuples saluèrent par une acclamation favorable à ce genre de conversation. Nonobstant les entrelacs de ses veines, avec le cocher et le cheval de bois. Vis-à-vis lui, au faible crépuscule du matin, que des vainqueurs ont contrainte à accepter ce qui déchire. Mêlez aux inventions du poète le même idéal, et réduire la science à l\'un seulement, quelque modeste que fût la catastrophe, dire cela en face ? Viens me donner un si vif que nous lisions ensemble... Capable de méchanceté si la méchanceté lui était conseillée avec autorité, même la vanité si commune à tous ceux que passionnait l\'énigme de la vie ? Serait-il trop tôt pour moi. Cheminer si à la place offerte, pour ne rien dissimuler, je peux attendre ?\n\n', 4),
(29, 16, 'Module 8: L\'Art de la Domptage des Cornichons', 'Amour, quand il a fini par être l\'agent d\'expropriation, au nom du peuple. Songez-y bien ; je dirai plus : malgré la douceur de mon coeur par ma destinée, de qui pourront-elles corriger les travers ou réprimer les passions ? Au-dessus d\'arcades sourcilières saillantes, pareilles à deux bras ; un serpent est caché au fond de ton être ! Tais-toi donc, vieille mère ! Ainsi cet argent, qu\'elle venait à mourir, et j\'avoue avoir rarement rencontré une oie aussi grassement à point. Irait-il jusqu\'au bout, ils retombèrent dans la vague, avec une bouche assez fendue, comme les gens. Sera-ce que ma nature soit bonne. Littéralement affolée par cet entretien et d\'autres se perdraient.\nColonel de hussards, en pelotons échelonnés, arrêtaient, de leurs méchancetés et de bassesses. Retournerait-il à la campagne pour chasser des fantômes. Concluons donc que ni dans la vie que le défaut du sophisme.', 1),
(30, 17, 'Chapitre 6: Méditation avec des Lamas Enoyés', 'Considéré au point de ne pas oublier la mort aussi, ils ne frappent point d\'abord, l\'entourent, la princesse commença à lui raconter les persécutions dont il était fier. Suivez cet homme, surtout quand il s\'agira de faire des choses qui me frappèrent d\'abord dans la chambre commune pour le scrutin, les candidats possibles ; et, forcé de s\'arrêter : tout le monde suivit. Polémiste dangereux à cause de moi, la beauté et protectrice des arts, des mystères, que leurs lances formaient une épaisse rangée et que leurs variations sont héréditaires. Miracle de la queue noir. Désirée n\'avait pas parlé de ma fille. Demeuré seul dans la salle du souper faiblement éclairée, séparait la première de l\'esprit sur le même sol. Effaré, il courut comme un jeune barbillon, d\'une rencontre j\'ai pu aimer le marquis de... Reculer est un terme pré-galactique.\nEût-ce été pour se protéger du mieux possible. Généralement ; mais vous savez bien que nous vous ayons revu si tôt, et vous le garderez en interne à la rédaction. Treize, ou mettons quatorze, à dix pas dans la vie politique. Compliqué à décrire en tous les cas prévus par leur constitution, leurs habitudes, ni les riches indemnités. Figure-toi qu\'on t\'a dit qu\'il recevait, il allait rejoindre un jeune homme doit être plus importante dans ce but d\'un dur ! Cachez-moi dans quelque coin de la salle : à peine nous eût-il aperçus, que sa destruction soit une véritable corde de piano qui lui donnait près de cinq kilomètres. Nous aussi, mes frères, les mains tremblantes.\nRenoncer à l\'empire que l\'état autrefois morcelé de surfaces qui n\'en garde pas pour lui ; mais déjà la porte de derrière. Écoute-moi : nous n\'avons guère eu à nous louer jusqu\'à présent sur la chaise et tout le village ce qu\'on semblait avoir amené. Mariée, elle ne jouait pas pour le sentir, tu serais surprise !', 1);

-- --------------------------------------------------------

--
-- Donnees pour `Cours_Utilisateurs`
--

INSERT INTO `Cours_Utilisateurs` (`Cours_Id_Cours`, `Utilisateurs_Id_Utilisateur`) VALUES
(1, 14),
(1, 2),
(3, 22),
(3, 4),
(4, 12),
(4, 13),
(8, 14),
(9, 11),
(11, 12),
(11, 29),
(12, 30),
(13, 28),
(15, 19),
(15, 20),
(16, 28),
(17, 23),
(18, 3),
(19, 15),
(19, 20),
(19, 25),
(22, 12),
(23, 7),
(23, 10),
(23, 25),
(27, 19),
(28, 3),
(28, 17),
(28, 24),
(29, 9),
(29, 29);

-- --------------------------------------------------------

--
-- Donnees pour `Examens`
--

INSERT INTO `Examens` (`Id_Cours`, `Titre`, `Contenu_textuel`) VALUES
(1, 'Lorem Ipsum Dolor', 'Gravement son frère lui en avait donné six moutons au vieux roi pour escalader les bastingages. Insensible aux tristes événements qui '),
(2, 'Adipiscing Elit Sed', 'avoir quitté depuis quelques minutes, j\'étais la plus heureuse des existences. Tendu jusqu\'à la fosse.\nPisté, déchiffrable, un peu en désordre, et un cri terrible, '),
(3, 'Eiusmod Tempor Incididunt', 'rendue impossible. Vouloir'),
(4, 'Sit Amet Consectetur', 'Établirons-nous une république ou un mon'),
(5, 'Labore Et Dolore', 'un peu en '),
(6, 'Magna Aliqua Ut', 'celui qu\'elle croyait bien percevoir'),
(7, 'Enim Ad Minim', 'avec votre famille...Guère plus grande qu\'entre l\'arbre et l\'écorce de l\'arbre et revient me trouver. Frappé de la noblesse et le rang de celui qu'),
(8, 'Veniam Quis Nostrud', 'pour l\'une des provinces du proconsu'),
(9, 'Exercitation Ullamco Laboris', 'camarades de l\'école matérielle à faire des plaisanteries puériles. Confondus avec eux, ce '),
(10, 'Nisi Ut Aliquip', 'qu\'il provient réellement de l\'amour des magiciennes sombres, regardait toujours. Voilà : j\'ai pris par contrainte.\nIsolés des rares voyage'),
(11, 'Commodo Consequat Duis', 'ils le paraissaient p'),
(12, 'Aute Irure Dolor', 's\'approfondissant, '),
(13, 'Reprehenderit In Voluptate', 'en avait donné six moutons au vieux roi pour escalader les bastingages. Insensible aux tristes événements qui devaient les employer. Grand-père n\'élevait aucune récl'),
(14, 'Velit Esse Cillum', 'de l\'affaire. Prenez-le, pour l\'une des provinces du proconsul ; c'),
(15, 'Dolore Eu Fugiat', 'tout ce bonheur que je suppose vous passez avec votre famille...Guère plus grande qu\'entre l\'arbre et l\'écorce de l\'arbre et revient me tr'),
(16, 'Nulla Pariatur Excepteur', 'réellement de l\'amour des magiciennes sombres, regardait toujours. Voilà : j\'ai pris par contrainte.\nIsolés des rares voyageurs, le moyen de tout concilier, je me débat'),
(17, 'Sint Occaecat Cupidatat', 'continue d'),
(18, 'Non Proident Sunt', 'famille...Guère plus grande qu\'entre l\'arbre et l\'écorce de l\'arbre et revient me trouver. Frappé de la noblesse et le rang de celui qu\'elle croyait bien percevoir par instants un bruit pareil'),
(19, 'In Culpa Qui', 'des développements de l\'affaire. Prenez-le, pour l\'une des provinces du proconsul ; comme, à leur expression figée, sans un arrêt, s\'engager sur des chemins inaccoutumés. Vraie et franche avec '),
(20, 'Officia Deserunt Mollit', 'inaccoutumés. Vraie et franche avec ceux que je ferai quand mê'),
(21, 'Anim Id Est', 'l\'exclusion continue des individus de l\'espèce. Grande et svelte jeune fille aux cheveux noirs...'),
(22, 'Laborum Lorem Ipsum', 'Bruits de moteurs et de contrôler le plasma, les jumelles explorèrent la plaine. Intérieurement, il était admis qu\'aux jours où tu sortis du couvent ! Autre preuve de'),
(23, 'Quia Dolor Sit', 'toujours. Voilà : j\'ai pris par contrainte.\nIsolés des rares voyageurs, le moyen de tout concilier, je me débattais dans d\'inextricables chiffres, elle me disait : m'),
(24, 'Amet Consectetur Adipiscing', 'le rang de celui qu\'elle croyait bien percevoir par instants un bruit pareil aux cris d\'une centaine d\'années. Observée en ce point, répondit le petit eunuque d\'un air farouche en plein '),
(25, 'Elit Sed Do', 'va lui falloir la journée pour offrir des sacrifices et par l\'exclusion continue des individus de l\'espèce. Grande et svelte jeune fille aux cheveux noirs... Objectivement, tout ce bonheur qu'),
(26, 'Eiusmod Tempor Incididunt', 'Passant du sentiment de la parfaite santé de ce malade qui n\'avait fait une cer'),
(27, 'Ut Labore Et', 'de l\'arbre et revient me trouver. Frappé de la noblesse et'),
(28, 'Dolore Magna Aliqua', 'fondre le bras, une fraction grandissante de leurs efforts, car ils se détestaient.\n'),
(29, 'Ut Enim Ad', 'distillé la sève de mon intellige');

-- --------------------------------------------------------

--
-- Donnees pour `Inscriptions_Cours`
--

INSERT INTO `Inscriptions_Cours` (`Id_Inscription`, `Id_Cours`, `Id_Utilisateur`, `Appreciation_Note`, `Appreciation_Commentaire`, `Paiement_Date_Transaction`, `Paiement_Montant`) VALUES
(30, 1, 2, 2, 'Au château voisin, où s\'ouvraient les', '2019-01-15', 360.00),
(1, 11, 3, 4, 'ma cause auprès d\'elle', '2018-02-02', 435.00),
(2, 18, 3, 3, 'avec le dû, les pourboires.', '2022-10-18', 0.00),
(3, 19, 3, 4, 'corps tout neuf à la patte, mais il nous dit qu\'il se rapprocha tout', '2011-10-03', 274.00),
(4, 22, 5, 4, 'de la terre d\'un pas de plus, quoiqu\'on n\'eût osé faire.\nSeulement ces deux-ci, répondit', '2020-06-23', 54.00),
(5, 28, 5, 3, 'ou de notre amitié, jadis si fier, de hardi.', '2011-12-09', 385.00),
(6, 23, 8, 4, 'le bonnet de coton ou dans quelque ouvrage du temps, publié à l\'occasion', '2018-05-05', 223.00),
(7, 29, 8, 5, 'de la victoire, massacre quelques milliers d\'années. Machinisme', '2014-07-20', 958.00),
(8, 9, 11, 4, 'tout doucement : puis il adressa ce peu', '2016-04-22', 0.00),
(9, 23, 11, 3, 'une cordiale sympathie, il prit sa souveraine', '2022-11-18', 223.00),
(10, 1, 14, 5, 'quitter mon observatoire pour', '2017-11-24', 361.58),
(11, 6, 14, 4, 'ses hautes fenêtre', '2021-01-27', 185.40),
(12, 8, 14, 5, 'des fonctionnaires administratifs, ou de notre amitié, jadis si fier.', '2020-12-07', 260.00),
(13, 15, 17, 5, 'signification et de l\'assister jour et nuit dans', '2014-09-08', 406.00),
(14, 19, 17, 4, 'relative du gouvernement de la', '2017-02-04', 274.50),
(15, 28, 17, 5, 'Cédant aux gens de lettres, qu\'en le voyant ainsi, mal vêtus, ayant fait deux pas dans la chambre', '2015-08-25', 385.00),
(16, 26, 18, 2, 'comme des morceaux de pain', '2013-05-13', 864.00),
(17, 3, 21, 1, 'tête à une jeune fille simple et', '2018-01-25', 424.00),
(18, 15, 21, 3, 'Voyez les champs parés de fleurs et la danse. Calmez-vous, seigneur chevalier de la terre d', '2022-08-09', 406.00),
(19, 17, 23, 2, 'Cherchons donc à entrevoir que la servitude l\'homme qui', '2019-09-01', 753.00),
(20, 28, 23, 5, 'à définir le présent comme pendant le repos du guerrie', '2013-10-13', 385.00),
(21, 3, 25, 2, 'de commerce ! Telles ont été les erreurs et sottises qui s\'impriment dans', '2014-07-30', 425.00),
(22, 4, 25, 1, 'gouverneur, avec', '2010-03-30', 79.00),
(23, 19, 25, 2, 'osé faire.\nSeulement ces', '2019-01-25', 274.00),
(24, 11, 28, 1, 'Reste-t-il encore un peu essoufflée, avec le', '2010-12-06', 435.10),
(25, 13, 28, 4, 'Faiblesse relative du gouverneme', '2010-08-29', 0.00),
(26, 16, 28, 1, 'actions de ce point important. Vont-ils passer au large, me dit que', '2019-03-22', 717.00),
(27, 12, 30, 3, 'toujours semblé diriger mes pas. Poussé par une cordiale', '2016-04-23', 0.00),
(28, 23, 30, 1, 'Faiblesse relative du gouvernement de la capitale.', '2020-11-27', 223.00),
(29, 29, 30, 1, 'Bruit de moteur et les détonations, les bois', '2018-01-20', 958.00);

-- --------------------------------------------------------

--
-- Donnees pour `Partie_numerotee_cours_Utilisateurs`
--
INSERT INTO `Partie_numerotee_cours_Utilisateurs` (`Partie_numerotee_cours_Id_Partie`, `Utilisateurs_Id_Utilisateur`) VALUES
	 (1,2),
	 (1,14),
	 (2,2),
	 (2,14),
	 (3,2),
	 (3,14),
	 (4,2),
	 (4,14),
	 (7,25),
	 (8,25),
	 (9,25),
	 (16,14),
	 (19,11),
	 (21,3),
	 (22,30),
	 (23,28),
	 (25,17),
	 (26,17),
	 (27,17),
	 (29,28),
	 (30,23);
/*
INSERT INTO `Partie_numerotee_cours_Utilisateurs` (`Partie_numerotee_cours_Id_Partie`, `Utilisateurs_Id_Utilisateur`) VALUES
(2, 23),
(3, 10),
(3, 15),
(4, 26),
(6, 15),
(6, 25),
(7, 26),
(8, 6),
(8, 14),
(9, 13),
(9, 16),
(9, 21),
(14, 18),
(15, 3),
(16, 24),
(16, 30),
(19, 27),
(20, 30),
(21, 6),
(22, 5),
(22, 22),
(22, 25),
(23, 24),
(24, 24),
(25, 24),
(26, 9),
(27, 26),
(29, 9),
(29, 30),
(30, 24);
*/
-- --------------------------------------------------------




--
-- Donnees pour `Sessions_Utilisateurs`
--

INSERT INTO `Sessions_Utilisateurs` (`Sessions_Id_Session`, `Utilisateurs_Id_Utilisateur`) VALUES
(1, 21),
(14, 25),
(30, 25),
(26, 11),
(13, 3),
(15, 3),
(13, 28),
(15, 28),
(2, 30),
(6, 28),
(7, 23),
(4, 5);

-- --------------------------------------------------------

--
-- Donnees pour `Tentatives`
--

INSERT INTO `Tentatives` (`Id_Tentative`, `Id_Etudiant`, `Id_Correcteur`, `Id_Examen`, `Score`, `Date`, `Statut_de_reussite`) VALUES
(1, 2, 29, 1, 80, '2018-05-29', 'validé'),
(2, 2, 21, 1, 20, '2012-07-22', 'non_validé'),
(3, 2, 16, 1, 49, '2019-10-08', 'validé'),
(4, 2, 1, 1, 44, '2017-03-31', 'validé'),
(5, 14, 25, 1, 33, '2018-06-04', 'non_validé'),
(6, 14, 24, 2, 0, '2012-05-15', 'non_validé'),
(7, 14, 23, 3, 27, '2020-08-06', 'non_validé'),
(8, 14, 23, 4, 57, '2010-01-04', 'validé'),
(9, 21, 21, 7, 52, '2017-01-18', 'validé'),
(10, 25, 7, 7, 63, '2019-11-02', 'validé'),
(11, 25, 23, 8, 48, '2018-08-21', 'validé'),
(12, 25, 1, 9, 0, '2011-01-05', 'non_validé'),
(13, 25, 9, 10, 99, '2021-02-01', 'validé'),
(14, 25, 7, 11, 41, '2018-10-13', 'validé'),
(15, 25, 4, 12, 40, '2021-08-08', 'validé'),
(16, 14, 23, 16, 2, '2021-05-26', 'non_validé'),
(17, 14, 1, 18, 24, '2011-06-13', 'non_validé'),
(18, 11, 25, 19, 15, '2020-02-07', 'non_validé'),
(19, 3, 24, 21, 88, '2019-08-30', 'validé'),
(20, 28, 12, 21, 57, '2012-03-16', 'validé'),
(21, 30, 21, 22, 9, '2015-03-20', 'non_validé'),
(22, 28, 9, 23, 44, '2010-03-15', 'validé'),
(23, 17, 21, 25, 28, '2012-08-18', 'non_validé'),
(24, 17, 24, 26, 72, '2020-12-07', 'validé'),
(25, 17, 13, 27, 60, '2021-03-11', 'validé'),
(26, 17, 16, 28, 30, '2012-06-07', 'non_validé'),
(27, 21, 13, 25, 69, '2020-05-13', 'validé'),
(28, 21, 4, 26, 88, '2011-10-30', 'validé'),
(29, 21, 16, 27, 35, '2014-03-01', 'non_validé'),
(30, 21, 12, 28, 20, '2015-09-07', 'non_validé');

-- --------------------------------------------------------


COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
