-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.4.27-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             12.4.0.6659
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for elite_test
CREATE DATABASE IF NOT EXISTS `elite_test` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;
USE `elite_test`;

-- Dumping structure for table elite_test.crews
DROP TABLE IF EXISTS `crews`;
CREATE TABLE IF NOT EXISTS `crews` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `middle_name` varchar(100) DEFAULT NULL,
  `email` varchar(150) NOT NULL,
  `house_no` varchar(50) DEFAULT NULL,
  `education` varchar(255) NOT NULL,
  `street` varchar(50) NOT NULL,
  `barangay` varchar(50) NOT NULL,
  `city_municipality` varchar(50) NOT NULL,
  `province` varchar(50) NOT NULL,
  `zip_code` varchar(4) NOT NULL,
  `mobile_no` varchar(13) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `crews_email_unique` (`email`),
  UNIQUE KEY `crews_mobile_no_unique` (`mobile_no`)
) ENGINE=InnoDB AUTO_INCREMENT=108 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table elite_test.crews: ~104 rows (approximately)
INSERT INTO `crews` (`id`, `first_name`, `last_name`, `middle_name`, `email`, `house_no`, `education`, `street`, `barangay`, `city_municipality`, `province`, `zip_code`, `mobile_no`) VALUES
	(1, 'Phoebe', 'Jast', 'Welchs', 'rskiles@example.org', 'Quae voluptas.', 'Omnis veritatis tempora quod. Et nostrum et ut. Quo repudiandae quia quae corrupti architecto.', 'accusamus', 'provident', 'eum', 'et', '8800', '+632507002693'),
	(2, 'Amelie', 'Luettgen', 'Gerhold', 'albert81@example.com', 'Veritatis.', 'Itaque consequuntur neque dolor corrupti maxime et ipsa. Dolor provident qui in.', 'perferendis', 'ut', 'adipisci', 'dicta', '4415', '+631780041083'),
	(3, 'Junior', 'Kertzmann', 'Jacobi', 'cielo54@example.com', 'Et doloribus.', 'Mollitia at iusto non illum. Neque mollitia laudantium placeat aut.', 'sunt', 'temporibus', 'doloribus', 'occaecati', '0179', '+637628287143'),
	(5, 'Wellington', 'Feeney', 'Roob', 'sigurd45@example.com', 'Et porro.', 'Illum voluptate quis qui veniam sunt itaque. Est at esse omnis error accusantium necessitatibus.', 'porro', 'cum', 'rem', 'ut', '4862', '+636807967646'),
	(6, 'Raphael', 'Rohan', 'Boehm', 'nprohaska@example.org', 'Delectus quis.', 'Rerum rerum at numquam odit incidunt sit. Corporis veritatis sit hic veniam officia est mollitia.', 'minus', 'inventore', 'facilis', 'natus', '2046', '+630198468330'),
	(7, 'Norris', 'Walter', 'Bailey', 'legros.diego@example.org', 'Dolores et eos.', 'Excepturi a hic soluta aspernatur et. Sapiente quo ea facere fugit laboriosam delectus.', 'rem', 'unde', 'voluptas', 'molestiae', '8049', '+633909144752'),
	(8, 'Susanna', 'Welch', 'Gislason', 'else85@example.com', 'Voluptas et.', 'Ut deserunt quae inventore dolore laboriosam quam fugiat. Rem est et ipsam veritatis fugit sunt.', 'ad', 'neque', 'dignissimos', 'quas', '3688', '+635250985149'),
	(9, 'Maud', 'Cummerata', 'Brakus', 'treutel.jamarcus@example.com', 'Earum quod.', 'Aut consequatur nisi cumque quas. Nihil molestiae deleniti et consequatur et.', 'libero', 'quas', 'voluptatem', 'cupiditate', '7740', '+639716481040'),
	(10, 'Albertha', 'Schamberger', 'Wisoky', 'deckow.isac@example.com', 'Est ut eos.', 'Velit nam nesciunt accusamus corrupti. Consequatur dolor sint et voluptate autem.', 'nihil', 'porro', 'est', 'laudantium', '4067', '+637940067499'),
	(11, 'Eryn', 'Haley', 'Deckow', 'serena09@example.org', 'Ea quo ut et.', 'Aspernatur exercitationem voluptas beatae aut quae. Sit voluptatem eos ut tempora.', 'eos', 'voluptas', 'sed', 'aperiam', '1609', '+632058150595'),
	(12, 'Zoila', 'Kilback', 'Bode', 'selmer98@example.org', 'Dolorem.', 'Sapiente dolor sit ratione ipsam et. Doloremque veniam earum iusto quisquam nam.', 'minus', 'perspiciatis', 'excepturi', 'ut', '8337', '+630257257022'),
	(13, 'Chet', 'Buckridge', 'Feeney', 'cremin.roxanne@example.org', 'Consectetur.', 'Esse ut rerum soluta omnis itaque id. Dolorem explicabo placeat et laudantium ab qui.', 'et', 'dolorem', 'praesentium', 'error', '9769', '+630314789701'),
	(14, 'Rey', 'Rosenbaum', 'Boyer', 'orn.shane@example.org', 'Id eius totam.', 'Eum quos et accusamus sit. Iste vero perferendis earum voluptatem incidunt labore nobis beatae.', 'neque', 'et', 'sapiente', 'maiores', '3982', '+635059953840'),
	(15, 'Noemi', 'Robel', 'Carroll', 'kulas.evert@example.com', 'Porro voluptas.', 'Quas aut quisquam ipsa. Sequi sequi deleniti facere aut accusamus dolores ut.', 'consequatur', 'autem', 'velit', 'quas', '1119', '+634273916094'),
	(16, 'Jeffry', 'Reynolds', 'Jast', 'christopher72@example.com', 'Omnis voluptas.', 'Dolorem optio dolores nemo ex. Provident exercitationem cum officiis.', 'animi', 'a', 'illo', 'qui', '2413', '+631390710879'),
	(17, 'Angeline', 'Beatty', 'Grimes', 'abshire.yvonne@example.com', 'Id aut quia.', 'Optio nulla maxime rerum libero error. Aspernatur rerum eos ex cum aperiam officia.', 'eos', 'autem', 'ducimus', 'aut', '2449', '+634214490437'),
	(18, 'Violet', 'Waters', 'Bartoletti', 'brakus.nico@example.com', 'Possimus est.', 'Labore eaque iure aut earum cupiditate voluptas aut. Doloremque voluptatem fugit unde optio.', 'voluptates', 'deleniti', 'atque', 'voluptatem', '2684', '+631375383139'),
	(19, 'Mckayla', 'Kunde', 'Halvorson', 'brendan.brakus@example.net', 'Aut maxime rem.', 'Eos iure vitae consequatur. Minus ut quidem perferendis. Et dolorum dolore aut.', 'illo', 'eaque', 'consequatur', 'facere', '0358', '+635104708908'),
	(20, 'Imogene', 'Hoppe', 'Fisher', 'zelma.bechtelar@example.org', 'Doloribus.', 'Est rerum debitis provident iure sit quisquam. Qui laboriosam nihil eaque occaecati.', 'ut', 'enim', 'nemo', 'ipsam', '0345', '+630423511089'),
	(21, 'Alycia', 'Keebler', 'Schneider', 'mable34@example.org', 'Laboriosam.', 'Quasi enim numquam quis facere ut. Explicabo ut praesentium eum sit.', 'qui', 'ea', 'sed', 'quae', '5777', '+635287824030'),
	(22, 'Wilfredo', 'Lind', 'Schuster', 'judah.kautzer@example.com', 'Veritatis ut.', 'Animi in id nulla sint aut molestias consequatur. Laborum velit eum doloremque necessitatibus et.', 'sed', 'repellendus', 'enim', 'hic', '2927', '+633379510161'),
	(23, 'Ewell', 'Spinka', 'Casper', 'schaefer.carolina@example.com', 'Adipisci.', 'Est est commodi doloribus et recusandae. Non non unde qui itaque quam. Ut illo hic qui est.', 'est', 'quo', 'est', 'placeat', '6279', '+637845002783'),
	(24, 'Citlalli', 'Gutkowski', 'Bode', 'tvolkman@example.net', 'Debitis.', 'Aut nulla ex reiciendis laborum. Ea nostrum et natus et id. Necessitatibus et quis rerum aut illum.', 'illo', 'non', 'perferendis', 'dolor', '9017', '+639079005200'),
	(25, 'Mohammad', 'Nolan', 'Pacocha', 'dean07@example.net', 'Ut dolores.', 'Omnis beatae sed enim voluptas ipsam maxime. Consequuntur consequatur iste enim repudiandae.', 'occaecati', 'ab', 'odit', 'ipsa', '9090', '+639072374216'),
	(26, 'Christop', 'Denesik', 'Wintheiser', 'barrows.efren@example.net', 'Eum nihil ut.', 'Tempore aliquid tempora odit eum possimus saepe beatae. Et quia dolor pariatur.', 'doloribus', 'reprehenderit', 'sint', 'eaque', '0338', '+632368292017'),
	(27, 'Ashleigh', 'Muller', 'Wolf', 'kennedi.hammes@example.net', 'Esse.', 'Velit odit voluptate in rerum itaque. Nostrum neque est non iure enim.', 'dolorem', 'dolore', 'at', 'et', '7970', '+630071615661'),
	(28, 'Vernie', 'Senger', 'Hoeger', 'scarlett.kutch@example.com', 'Qui dolorum.', 'Dolor et qui autem. Fuga numquam vel voluptatem labore minus.', 'facilis', 'nihil', 'est', 'perferendis', '5774', '+631166938033'),
	(29, 'Era', 'Hills', 'Wunsch', 'jenkins.marley@example.com', 'Voluptatem sed.', 'Asperiores assumenda harum voluptatem et. Velit rerum porro molestiae.', 'perspiciatis', 'fuga', 'eos', 'dolores', '8978', '+630990949022'),
	(30, 'Shakira', 'Carter', 'Klein', 'lavonne.moore@example.net', 'Ut blanditiis.', 'Quae et et vero. Et quaerat tenetur sit quisquam autem.', 'facere', 'omnis', 'dolore', 'dolorum', '9528', '+630124786188'),
	(31, 'Romaine', 'O\'Hara', 'Stiedemann', 'imelda.jerde@example.org', 'Illum et eum.', 'Est quis quos culpa. Nobis placeat architecto nemo vitae.', 'perferendis', 'aspernatur', 'dolor', 'ipsam', '4174', '+631467622374'),
	(32, 'Silas', 'Swaniawski', 'Berge', 'fwhite@example.net', 'Sequi saepe ut.', 'Repudiandae fuga iste magni. Et voluptatem et praesentium.', 'deserunt', 'atque', 'libero', 'voluptatem', '8088', '+634508773788'),
	(33, 'Ollie', 'Sawayn', 'Streich', 'prippin@example.org', 'Ut aut.', 'A qui sunt quia. Voluptas dolores omnis autem ut. Fuga esse quod qui minima.', 'ut', 'quas', 'sit', 'eos', '1167', '+639308933873'),
	(34, 'Jalon', 'Lindgren', 'Roberts', 'jacobson.simeon@example.net', 'Earum repellat.', 'Quia aliquam a quis tempore. Adipisci quidem deserunt deleniti tempora.', 'voluptatem', 'culpa', 'non', 'quidem', '3397', '+630282848707'),
	(35, 'Fleta', 'Flatley', 'Huel', 'prince12@example.net', 'Reiciendis.', 'Voluptate fuga eveniet ut aut ut. Ratione est quia voluptatem.', 'voluptatum', 'possimus', 'libero', 'omnis', '8347', '+630284417147'),
	(36, 'Forest', 'Feil', 'Hahn', 'jeff32@example.net', 'Vel et.', 'Minus odit nostrum cum ut nemo omnis. Ratione vitae eos beatae. Hic dolor quia quia minima.', 'voluptatem', 'quae', 'occaecati', 'molestiae', '4491', '+639881614543'),
	(37, 'Dessie', 'Fritsch', 'Torphy', 'chelsey39@example.net', 'Sed doloribus.', 'Qui et ipsum modi. Et sit quidem velit consectetur quo aut omnis.', 'eum', 'voluptas', 'est', 'eos', '7874', '+631688998638'),
	(38, 'Jonathon', 'Gorczany', 'Wilkinson', 'gaylord.herman@example.net', 'Veniam.', 'Nihil eaque error atque ut sit. Deleniti eveniet incidunt atque qui. Dolorem id ipsa sit.', 'ut', 'neque', 'dolores', 'culpa', '0194', '+637159863044'),
	(39, 'Deangelo', 'Lang', 'Sanford', 'palma.hauck@example.com', 'Omnis eum et.', 'Eos beatae laborum alias similique. Ut alias officiis quo. Velit amet aut suscipit vel id ut.', 'quis', 'debitis', 'reiciendis', 'cum', '4293', '+630879157270'),
	(40, 'Kirstin', 'Funk', 'Kub', 'abigayle97@example.com', 'Tenetur ut aut.', 'Quod atque corrupti et et. Totam modi repudiandae dolore dolorem.', 'nemo', 'ad', 'consectetur', 'iste', '0920', '+633614068692'),
	(41, 'Shany', 'Rowe', 'Quigley', 'svonrueden@example.com', 'Itaque nihil.', 'Ea illum expedita dolor non. Est fuga non facere aperiam. Fugiat vel minima voluptatem.', 'temporibus', 'sint', 'quae', 'pariatur', '8101', '+633743007347'),
	(42, 'Danial', 'Barton', 'Hill', 'furman.stark@example.net', 'Veritatis.', 'Error quia incidunt sunt voluptatem. Aut a aspernatur corporis incidunt.', 'assumenda', 'ut', 'aliquam', 'necessitatibus', '1726', '+639923951038'),
	(43, 'Jodie', 'Schmitt', 'Lehner', 'robel.laurianne@example.com', 'Et aspernatur.', 'Sed qui aut ut fugiat unde adipisci sed. Et voluptas debitis et corporis accusantium.', 'autem', 'exercitationem', 'ipsam', 'magni', '2972', '+637912102302'),
	(44, 'Buford', 'Jerde', 'Ratke', 'omedhurst@example.net', 'Et ut animi.', 'Impedit excepturi veritatis minima ut repellat maxime. Saepe sunt reprehenderit saepe vel quia.', 'soluta', 'similique', 'ab', 'quia', '0493', '+632062841668'),
	(45, 'Flavie', 'Brekke', 'Corkery', 'lelia57@example.com', 'Odit.', 'Id rerum quo totam vel aliquid omnis vel. Quas omnis voluptatem illo sapiente.', 'alias', 'illo', 'recusandae', 'qui', '7068', '+630641777971'),
	(46, 'Laney', 'Block', 'Ledner', 'tobin58@example.org', 'A et.', 'Qui non aut facilis aspernatur id. Natus saepe voluptate labore et. Sit laborum iste sunt soluta.', 'saepe', 'consequatur', 'magnam', 'ut', '7769', '+632184034600'),
	(47, 'Alvah', 'Pfeffer', 'Simonis', 'deshaun.harris@example.com', 'Amet.', 'Doloribus ea deleniti perspiciatis non quaerat suscipit. Ut voluptatum rerum dolorum eum.', 'voluptatem', 'excepturi', 'sunt', 'dolorem', '5474', '+631759038208'),
	(48, 'Seth', 'Ruecker', 'Bechtelar', 'xjaskolski@example.com', 'Amet assumenda.', 'Illo ab molestiae ex sint. Omnis sunt dicta sint. Molestias dignissimos sunt sequi.', 'sequi', 'iusto', 'possimus', 'aut', '4005', '+636348513970'),
	(49, 'Demario', 'Gaylord', 'Bogan', 'edgardo.roberts@example.com', 'Natus.', 'Velit consequuntur laborum omnis. Ad totam et molestias illo. Sapiente reprehenderit sint sit ut.', 'enim', 'dolore', 'provident', 'ea', '6388', '+633222379318'),
	(50, 'Abe', 'Schuppe', 'Durgan', 'thad44@example.org', 'Dolorem.', 'Omnis quasi quia dolor alias optio et. Nam quia qui tempora modi voluptatum.', 'dolores', 'doloribus', 'amet', 'reprehenderit', '7920', '+631195340842'),
	(51, 'Jasmin', 'Greenholt', 'Welch', 'whodkiewicz@example.net', 'Libero hic.', 'Velit quos nemo dolorum aut animi. Voluptatum aliquid illum autem eum.', 'nobis', 'temporibus', 'qui', 'mollitia', '8210', '+631992323813'),
	(52, 'Peter', 'Turner', 'Nader', 'forrest32@example.net', 'Excepturi.', 'Aut facere est illum. Ut vero doloribus corporis quae. Tempore ipsa ut sed nostrum dicta atque.', 'voluptas', 'error', 'architecto', 'impedit', '1558', '+635249707180'),
	(53, 'Rusty', 'Lesch', 'Dickens', 'smitham.omari@example.com', 'Eaque et eos.', 'Cumque eum sed et tempore. Aut quia numquam facilis quia impedit. Autem error deleniti quia nihil.', 'quae', 'alias', 'est', 'deleniti', '8469', '+636762159624'),
	(54, 'Edna', 'McCullough', 'Gerlach', 'gaylord.desmond@example.net', 'Voluptate.', 'Non illo est et sapiente fugit est nulla. Perspiciatis rerum facilis consequatur.', 'magnam', 'tempore', 'ut', 'odio', '8529', '+631484769102'),
	(55, 'Tressa', 'Shanahan', 'Conroy', 'fisher.roman@example.org', 'Dolores.', 'Alias quia pariatur qui sunt aperiam sunt corporis suscipit. Quo perspiciatis consectetur ipsam.', 'expedita', 'voluptatem', 'voluptatibus', 'minus', '9481', '+635217070269'),
	(56, 'Daniela', 'Beatty', 'Stokes', 'mabelle80@example.org', 'Totam aut.', 'Est autem qui laborum qui aut. Sed est ab expedita.', 'rerum', 'qui', 'exercitationem', 'molestiae', '8848', '+636706298685'),
	(57, 'Ahmad', 'Dickinson', 'Stanton', 'pgrant@example.org', 'Aut dolores.', 'Non earum quas sequi eius autem quidem est deleniti. A ut aut magnam. Et accusamus nostrum dolores.', 'quasi', 'nisi', 'ex', 'dolor', '1842', '+634669022624'),
	(58, 'Kiarra', 'Kihn', 'Miller', 'kelly88@example.net', 'Magnam.', 'Unde ea sit id minima. Ex nobis sed sed sunt. Exercitationem amet sit alias est et deserunt.', 'laboriosam', 'nulla', 'eaque', 'sint', '0567', '+638441318393'),
	(59, 'Judson', 'Koelpin', 'Toy', 'jenkins.cyrus@example.com', 'Temporibus in.', 'Corrupti qui eos facere voluptatem consequuntur. Ab ipsum accusamus voluptatem et.', 'incidunt', 'rerum', 'facilis', 'illum', '9967', '+633048043008'),
	(60, 'Raul', 'Predovic', 'Hodkiewicz', 'alanna.turner@example.org', 'Officia.', 'Accusantium autem ipsum at aliquid. Libero ab dolor et cumque.', 'quibusdam', 'ullam', 'repellat', 'temporibus', '1908', '+634468159397'),
	(61, 'Cornelius', 'Baumbach', 'Volkman', 'kirstin.monahan@example.net', 'Cupiditate ut.', 'Commodi numquam ullam sequi iusto. Officiis magni voluptatem eligendi at beatae quia.', 'et', 'vero', 'facilis', 'quis', '7068', '+633552241743'),
	(62, 'Alek', 'Raynor', 'Murphy', 'hbode@example.net', 'Quidem eos.', 'Fugit nam repellendus dolores sunt vel. Nam culpa itaque qui enim et animi sit.', 'sit', 'ipsam', 'in', 'deserunt', '8176', '+633837497256'),
	(63, 'Jeff', 'Leffler', 'Mertz', 'uwitting@example.net', 'Ut dolores.', 'Quia eveniet unde accusantium quia odio quis est. Dolore sed excepturi nemo beatae aut consequatur.', 'fugit', 'et', 'quia', 'id', '6365', '+636658609054'),
	(64, 'Tate', 'Morissette', 'Leffler', 'milan67@example.org', 'Assumenda quia.', 'Aliquam assumenda dolores a dicta nobis. Id praesentium neque quo. Modi sunt animi officia maiores.', 'et', 'illum', 'accusantium', 'doloremque', '1903', '+636090132109'),
	(65, 'Mathias', 'Fadel', 'Schulist', 'walter.armando@example.org', 'Delectus non.', 'Minus et deleniti neque libero doloribus voluptates quis. Culpa et non et.', 'et', 'quia', 'voluptas', 'ea', '5615', '+632237225286'),
	(66, 'Lonie', 'Jacobs', 'Hane', 'madison13@example.com', 'Blanditiis.', 'Sit sed tempora velit. Et beatae architecto rerum eaque qui. Fuga eum impedit blanditiis.', 'qui', 'dolorum', 'in', 'ut', '3040', '+631085342618'),
	(67, 'Martina', 'O\'Conner', 'Block', 'xeffertz@example.net', 'Et fugit et.', 'Laborum molestiae esse adipisci fuga soluta. Et quisquam quo est. Et ab ratione magni non.', 'aspernatur', 'explicabo', 'sed', 'saepe', '2610', '+630835554417'),
	(68, 'Augusta', 'Schaefer', 'Huel', 'spencer93@example.net', 'Ipsa eum.', 'Odit totam est quas quia harum est. Sed aut quos quas.', 'quia', 'omnis', 'error', 'doloribus', '3333', '+631300792283'),
	(69, 'Rasheed', 'Gibson', 'Reilly', 'vvonrueden@example.com', 'Quia maxime.', 'Sed temporibus inventore quam sequi iure. Sequi odio non enim est. Cumque quia ab consequatur.', 'veritatis', 'hic', 'sit', 'delectus', '0075', '+635056291553'),
	(70, 'Carter', 'Wehner', 'Bahringer', 'heidi02@example.org', 'Sint eos ullam.', 'Impedit illum qui non. Quasi rerum corporis blanditiis id quia. Ut iste est culpa facilis.', 'accusamus', 'aperiam', 'nostrum', 'totam', '0001', '+634136844392'),
	(71, 'Caroline', 'Feest', 'Reichert', 'gmckenzie@example.com', 'Nam odit sed.', 'Rerum quis quam quaerat nobis velit. Velit laborum sunt veniam pariatur natus.', 'voluptatem', 'et', 'asperiores', 'distinctio', '2539', '+638051238162'),
	(72, 'Carson', 'Hill', 'Macejkovic', 'darwin38@example.org', 'Id sunt.', 'Quo aut ut est et aut. Possimus sunt sed consequatur placeat.', 'sint', 'ex', 'sed', 'quam', '3375', '+639388257809'),
	(73, 'Everett', 'Reynolds', 'O\'Hara', 'igislason@example.com', 'Repellendus.', 'In corporis inventore rerum. Error mollitia repellat ut hic ipsa nihil.', 'nulla', 'quidem', 'atque', 'laudantium', '2199', '+630096427510'),
	(74, 'Vidal', 'Emmerich', 'Skiles', 'mccullough.khalid@example.com', 'Et non culpa.', 'Fugit perferendis nesciunt quam expedita. Amet corporis sunt provident ut nulla eos officiis qui.', 'optio', 'quis', 'error', 'exercitationem', '6206', '+635788129830'),
	(75, 'Muhammad', 'Mraz', 'Koepp', 'sanford.cooper@example.org', 'Placeat et.', 'Inventore esse et labore assumenda qui soluta et. Assumenda quo quia aliquid ut eos nisi.', 'cupiditate', 'ex', 'animi', 'ducimus', '9098', '+636155052623'),
	(76, 'Roy', 'Quitzon', 'Bernier', 'dare.mireille@example.org', 'Voluptas.', 'Provident hic esse fugiat maiores sapiente amet. Fuga nostrum dolorem autem est impedit eos sint.', 'amet', 'nobis', 'dignissimos', 'saepe', '8695', '+635082192200'),
	(77, 'Daniela', 'Bruen', 'Schneider', 'janelle.lehner@example.net', 'Assumenda.', 'Modi nostrum vero perspiciatis. Sit qui deserunt consequuntur sit labore non qui.', 'est', 'illum', 'minima', 'eum', '2387', '+637404326513'),
	(78, 'Dorothy', 'Harber', 'Langosh', 'russell67@example.com', 'Officiis qui.', 'Corporis at et repellendus rerum. Ipsa sit eos dolorem. Ea quos quasi cumque tempora debitis.', 'pariatur', 'et', 'commodi', 'error', '8106', '+639356332722'),
	(79, 'Evan', 'Hettinger', 'Hyatt', 'kerluke.amir@example.com', 'Sit sed ad qui.', 'Dolorem inventore qui expedita eum itaque. Velit ut vel tempore illum. Sit fugiat nostrum quis qui.', 'tempora', 'a', 'suscipit', 'illum', '3560', '+637944865538'),
	(80, 'Cody', 'Rempel', 'Schowalter', 'otis06@example.com', 'Maxime culpa.', 'Dolorum dolor et cupiditate velit. Et et quo doloribus culpa maxime.', 'voluptatem', 'numquam', 'magni', 'dicta', '3511', '+636831402519'),
	(81, 'Jamarcus', 'Rolfson', 'O\'Kon', 'jglover@example.org', 'Exercitationem.', 'In et iusto quidem. Aut assumenda repudiandae veritatis accusamus sint.', 'ipsum', 'omnis', 'quia', 'aut', '8601', '+639630077739'),
	(82, 'Evans', 'Carter', 'Gislason', 'pjohnson@example.net', 'Quia quis.', 'Officia est alias fuga ab placeat. Illum corporis eum quibusdam. Incidunt quae beatae qui dolorem.', 'odit', 'dolor', 'cupiditate', 'deserunt', '3827', '+634257022302'),
	(83, 'Gerald', 'Schuster', 'Hagenes', 'kbuckridge@example.net', 'Aut earum ut.', 'Necessitatibus fugit unde sed accusamus. Laudantium sed quis facere incidunt vero nobis totam sit.', 'error', 'optio', 'maiores', 'quaerat', '5821', '+635948828361'),
	(84, 'Jarrod', 'Johnston', 'Schuppe', 'fjakubowski@example.net', 'Beatae.', 'Est soluta qui corporis dicta enim. Sint quis ea expedita non et. Eius distinctio qui enim et.', 'occaecati', 'tempora', 'soluta', 'et', '4137', '+638344626309'),
	(85, 'Christiana', 'Lemke', 'Cummings', 'jacobs.gabriel@example.net', 'Sint ipsum.', 'Et et ut maiores qui libero. Molestiae sequi in ipsa pariatur veritatis asperiores at.', 'ut', 'quia', 'odio', 'cumque', '8467', '+638372697205'),
	(86, 'Aurore', 'Marquardt', 'Padberg', 'verla.witting@example.com', 'Fuga excepturi.', 'Qui aspernatur sit voluptatem maiores. Est ea id ut eius. Iste inventore quia nihil.', 'dolores', 'autem', 'quae', 'aut', '8144', '+637109605721'),
	(87, 'Hortense', 'Christiansen', 'Stehr', 'xander25@example.com', 'At voluptatem.', 'Qui non est ducimus repudiandae. Doloribus hic ipsa dolorum nam nobis. Eos quam nam vel quo.', 'aperiam', 'eum', 'laboriosam', 'repellat', '0861', '+636125211395'),
	(88, 'Thalia', 'Kris', 'Mayer', 'bradly.zieme@example.org', 'Rerum quisquam.', 'Quas qui repudiandae sit voluptatem et qui. Quo tempore vero consequatur debitis culpa.', 'odit', 'earum', 'libero', 'placeat', '2462', '+638632965004'),
	(89, 'Guillermo', 'Bauch', 'Bruen', 'cristian22@example.com', 'Aut cumque sed.', 'Similique unde accusamus et excepturi. Sit est et placeat. Id et et libero iure.', 'provident', 'rem', 'voluptatum', 'voluptatem', '4491', '+632475723931'),
	(90, 'Keaton', 'Heidenreich', 'Russel', 'terrance.ledner@example.net', 'Ipsam.', 'Pariatur sunt facilis cumque sit. Dolore ut vel repellat. Consectetur amet neque ut magnam id.', 'qui', 'non', 'error', 'ipsam', '2729', '+637104504260'),
	(91, 'Alayna', 'Baumbach', 'Turner', 'damore.kavon@example.org', 'Cupiditate aut.', 'Ut similique nam tempora recusandae placeat minus accusantium. Maxime fuga molestias nihil nobis.', 'eos', 'debitis', 'iusto', 'veritatis', '2256', '+636106937542'),
	(92, 'Reba', 'Mertz', 'Torp', 'rogelio.watsica@example.net', 'Sunt.', 'Nulla quas et hic consequatur eos. Omnis earum explicabo rerum aperiam.', 'illo', 'et', 'dolor', 'maiores', '1413', '+638934418637'),
	(93, 'Cyril', 'Morissette', 'Howe', 'cordell.schulist@example.org', 'Voluptatem.', 'Quae at quia nihil facere nesciunt assumenda esse. Perferendis odio ut et qui.', 'ex', 'consequuntur', 'non', 'voluptatem', '5982', '+633137789498'),
	(94, 'Brenda', 'Fay', 'Feest', 'corrine62@example.org', 'Qui optio.', 'Eligendi cum impedit eum non natus. Et ut cum et placeat ea.', 'voluptate', 'et', 'ipsam', 'dolor', '7054', '+633133782648'),
	(95, 'Daisy', 'Bruen', 'Moen', 'pascale.ritchie@example.com', 'Rerum.', 'Vero et aut atque accusantium. Dolor quia quisquam aperiam vero reiciendis commodi.', 'est', 'libero', 'quia', 'excepturi', '2069', '+634668167571'),
	(96, 'Gay', 'Kautzer', 'Rosenbaum', 'bert12@example.net', 'Delectus.', 'Quae fugit sequi id iusto sunt atque saepe. Ullam impedit quia ut et.', 'qui', 'quisquam', 'commodi', 'quam', '8491', '+638842085611'),
	(97, 'Jolie', 'Brown', 'Hegmann', 'xschinner@example.org', 'Quisquam qui.', 'Veritatis et rem quo. Sit veritatis enim expedita molestiae architecto.', 'dignissimos', 'ipsam', 'consequatur', 'aspernatur', '0526', '+633618538362'),
	(98, 'Antonette', 'Kunze', 'Bednar', 'aryanna.volkman@example.net', 'Autem non.', 'Qui iste et id. Cupiditate optio non qui sed non voluptatum. Quibusdam inventore nobis voluptates.', 'esse', 'deleniti', 'veniam', 'autem', '8705', '+633172521393'),
	(99, 'Kailyn', 'Nolan', 'Walter', 'lockman.dora@example.org', 'Maiores libero.', 'Fuga quis labore voluptas cum quo et perspiciatis. Culpa quam delectus libero rerum.', 'dolorem', 'sit', 'suscipit', 'qui', '0234', '+634323710300'),
	(100, 'Leonor', 'Rau', 'Gutkowski', 'feest.arlene@example.com', 'Quo recusandae.', 'Voluptate aut voluptate eligendi. Amet eum qui alias delectus.', 'reprehenderit', 'est', 'nulla', 'in', '6329', '+634020652856'),
	(101, 'Sample', 'Sample', 'Sample', 'sample@gmail.com', '12312', 'I have no education', 'asdasdad', 'asdasdsa', 'asdasd', 'asdsada`', '3', '09162817048'),
	(103, 'Sample', 'Sample', 'Sample', 'sample1@gmail.com', '12312', 'I have no education', 'asdasdad', 'asdasdsa', 'asdasd', 'asdsada`', '1234', '09162817047'),
	(104, 'Homer', 'Sampsom', 'Shimmer', 'simmer@gmail.com', 'asdasd', 'I too don\'t have education', 'asdasd', 'asdasd', 'asdasd', 'asdasd', '2341', '9783475349579'),
	(105, 'Shimple', 'Shample', 'Yumple', 'lummer@gmail.com', 'asdasdasd', 'asdasdasdasdasdasdasdasd', 'asdasd', 'asdasd', 'asdasd', 'asdasd', '3422', '4895789239012'),
	(106, 'Hammer', 'Nismre', 'alsdasdasd', 'umer@gmail.com', 'asdasd', 'ajsiodjasoidja', 'asdasd', 'asdasd', 'asdasd', 'asdasd', '1231', '0912631723712'),
	(107, 'Hammer', 'Nismre', 'alsdasdasd', 'umeer@gmail.com', 'asdasd', 'ajsiodjasoidja', 'asdasd', 'asdasd', 'asdasd', 'asdasd', '1231', '0912631723711');

-- Dumping structure for table elite_test.documents
DROP TABLE IF EXISTS `documents`;
CREATE TABLE IF NOT EXISTS `documents` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `document_number` varchar(255) NOT NULL,
  `date_issued` date NOT NULL,
  `date_expiry` date NOT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  `crew_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `documents_crew_id` (`crew_id`),
  CONSTRAINT `documents_crew_id` FOREIGN KEY (`crew_id`) REFERENCES `crews` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table elite_test.documents: ~1 rows (approximately)
INSERT INTO `documents` (`id`, `code`, `name`, `document_number`, `date_issued`, `date_expiry`, `remarks`, `crew_id`, `created_at`, `updated_at`) VALUES
	(4, 'D0004', 'SDAsadawda', '123235433213', '2023-07-05', '2023-07-13', 'Right and Something', 1, NULL, NULL);

-- Dumping structure for table elite_test.failed_jobs
DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table elite_test.failed_jobs: ~0 rows (approximately)

-- Dumping structure for table elite_test.migrations
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table elite_test.migrations: ~6 rows (approximately)
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
	(1, '2014_10_12_000000_create_users_table', 1),
	(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
	(3, '2019_08_19_000000_create_failed_jobs_table', 1),
	(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
	(5, '2023_07_24_112212_create_crews_table', 1),
	(6, '2023_07_24_113047_create_documents_table', 1);

-- Dumping structure for table elite_test.password_reset_tokens
DROP TABLE IF EXISTS `password_reset_tokens`;
CREATE TABLE IF NOT EXISTS `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table elite_test.password_reset_tokens: ~0 rows (approximately)

-- Dumping structure for table elite_test.personal_access_tokens
DROP TABLE IF EXISTS `personal_access_tokens`;
CREATE TABLE IF NOT EXISTS `personal_access_tokens` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table elite_test.personal_access_tokens: ~0 rows (approximately)

-- Dumping structure for table elite_test.users
DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(10) NOT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_username_unique` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table elite_test.users: ~1 rows (approximately)
INSERT INTO `users` (`id`, `username`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
	(1, 'admin', '$2y$10$UXk3gsuNZnU.RVwrynqKUuRdTL2FkfVpom8Q9v4YT3QJz.SItJLhi', NULL, '2023-07-24 17:00:12', '2023-07-24 17:00:12');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
