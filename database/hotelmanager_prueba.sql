-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 15-11-2019 a las 06:57:23
-- Versión del servidor: 10.3.16-MariaDB
-- Versión de PHP: 7.2.20

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `hotelmanager_prueba`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `dias`
--

CREATE TABLE `dias` (
  `idDia` int(11) NOT NULL,
  `nombre` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(3) UNSIGNED NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `dias`
--

INSERT INTO `dias` (`idDia`, `nombre`, `status`) VALUES
(1, 'Lunes', 1),
(2, 'Martes', 1),
(3, 'Miercoles', 1),
(4, 'Jueves', 1),
(5, 'Viernes', 1),
(6, 'Sabado', 1),
(7, 'Domingo', 1),
(8, 'All Days', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `dias_idioma`
--

CREATE TABLE `dias_idioma` (
  `idDiaIdioma` int(11) UNSIGNED NOT NULL,
  `idDia` int(11) NOT NULL,
  `nombre` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `idioma` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `dias_idioma`
--

INSERT INTO `dias_idioma` (`idDiaIdioma`, `idDia`, `nombre`, `idioma`) VALUES
(1, 1, 'lunes', 'es'),
(2, 1, 'monday', 'en'),
(3, 2, 'martes', 'es'),
(4, 2, 'tuesday', 'en'),
(5, 3, 'miercoles', 'es'),
(6, 3, 'wednesday', 'en'),
(7, 4, 'jueves', 'es'),
(8, 4, 'thursday', 'en'),
(9, 5, 'viernes', 'es'),
(10, 5, 'friday', 'en'),
(11, 6, 'sabado', 'es'),
(12, 6, 'saturday', 'en'),
(13, 7, 'domingo', 'es'),
(14, 7, 'sunday', 'en'),
(15, 8, 'Todos Los Dias', 'es'),
(16, 8, 'All Days', 'en');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `hoteles`
--

CREATE TABLE `hoteles` (
  `idHotel` int(11) NOT NULL,
  `googleid` varchar(255) DEFAULT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `text` text DEFAULT NULL,
  `direccion` varchar(255) DEFAULT NULL,
  `telefono` varchar(50) DEFAULT NULL,
  `lat` varchar(11) DEFAULT NULL,
  `lng` varchar(11) DEFAULT NULL,
  `logo` varchar(255) DEFAULT NULL COMMENT 'Logo del hotel',
  `img` varchar(255) DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `estatus` int(11) DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `hoteles`
--

INSERT INTO `hoteles` (`idHotel`, `googleid`, `nombre`, `text`, `direccion`, `telefono`, `lat`, `lng`, `logo`, `img`, `slug`, `estatus`, `created_at`, `updated_at`) VALUES
(1, 'ChIJG5YGwKSHTo8RADnxmsLcNvI', 'Azul Beach Resort Riviera Maya', 'The experience at Azul Beach Resort Riviera Maya, by Karisma begins the moment you arrive, with a champagne toast check in for adults, Karisma’s signature aromatherapy and pillow menu to choose from and Nickelodeon smoothies for kids. With only 148 deluxe rooms and suites, this beachfront oasis caters to families and couples who desire a refined yet more intimate experience. Everything is just a short stroll or stroller ride away, from the half-mile white-sand beach to the five restaurants, swim-up bars, Azulitos by Nickelodeon Kids Club and Vassa Spa.', 'direccion XXX', '01111111', '20.9045415', '-86.8476315', NULL, 'http://www.apiazulrivieramaya.muchomil.com/azulrivieramaya/public/images/resorts/azul_beach.jpg', 'AzulBeachResortRivieraMayac4ca4238a0b923820dcc509a6f75849b', 1, NULL, '2017-05-03 14:52:20'),
(2, 'ChIJL7KKFCyVb4YRJW_WDXpHkAE', 'Azul Beach Resort The Fives Playa del Carmen', 'Whoever said youth is wasted on the young has never experienced Azul Beach Resort The Fives Playa del Carmen, by Karisma. Because for tots, teens, couples, groups, honeymooners and even brides-to-be, this Gourmet Inclusive® playground will bring out the playful side in everyone. At the same time, Azul Beach Resort The Fives Playa del Carmen’ luxury accommodations and impeccable service will satisfy the most discriminating adult tastes.', 'direccion XXX', '100010101', '20.664892', '-87.034587', NULL, 'http://www.apiazulrivieramaya.muchomil.com/azulrivieramaya/public/images/resorts/the-fives-azul.jpg', 'AzulBeachResortTheFivesPlayadelCarmenc81e728d9d4c2f636f067f89cc14862c', 1, NULL, '2017-05-03 14:52:20'),
(6, 'ChIJ4XqmCTaGTo8R5nO3nFlzZYU', 'Azul Beach Resort Sensatori Mexico', 'With 435 Jacuzzi® Suites, gourmet cuisine and world-class Vassa Spa, Azul Beach Resort Sensatori Mexico offers the Karisma Gourmet Inclusive® Experience on a grand scale.\nYet as expansive as this multi-generational Caribbean resort is, every guest is treated like royalty. You see, the Azul Sensatori staff has mastered the art of attending to and even anticipating your every wish – even when your greatest desire is to be left alone.', 'direccion XXX', '3213232', '20.897237', '-86.856276', NULL, 'http://www.apiazulrivieramaya.muchomil.com/azulrivieramaya/public/images/resorts/sensa-mexico.jpg', 'AzulBeachResortSensatoriMexico', 1, NULL, NULL),
(7, 'ChIJaymvEJkN2Y4RcKFz1fzq1S0', 'Azul Beach Resort Sensatori Jamaica', 'Situated on a coveted stretch of Negril’s world-famous Seven Mile beach, Azul Beach Resort Sensatori Jamaica is a pristine paradise where couples, families, friends and colleagues can reconnect beneath brilliant blue skies and tropical sunshine.', 'direccion XXX', '3213213', '18.3282857', '-78.3365655', NULL, 'http://www.apiazulrivieramaya.muchomil.com/azulrivieramaya/public/images/resorts/azul-sensa-jamaica.jpg', 'sensatori-punta-canac81e728d9d4c2f636f067f89cc14862c', 1, NULL, NULL),
(8, 'ChIJj4hYeixiTo8RLqXWRmYnlQ0', 'El Dorado Royale Resort', 'El Dorado Royale, by Karisma, is an adults-only paradise where everything is designed to help you slow down, relax, and savor every moment of your vacation.\nYou’ll find world-class restaurants, renowned chefs, personal concierges and bars that pour from the top shelf. We harvest vegetables from our own 76,000 square-foot hydroponic greenhouse. We offer fitness classes, dance lessons and wine tastings. Twice a month, we host a culinary series featuring visiting chefs from around the world.', 'Carretera Cancún - Tulum: KM 45\r\nRiviera Maya, Quintana Roo\r\nPlaya del Carmen, QROO,\r\nMéxico C.P. 77710', '351351', '20.786974', '-86.939357', NULL, 'http://www.apiazulrivieramaya.muchomil.com/azulrivieramaya/public/images/resorts/dorado-royale.jpg', 'DoradoRoyaleResort', 1, NULL, NULL),
(9, 'ChIJGXUTeixiTo8RC1VIHfnkPtY', 'El Dorado Casitas Royale', 'El Dorado Casitas Royale, by Karisma is a private enclave dedicated to providing an even higher level of luxury and personal attention. You’re free to enjoy all of the dazzling amenities, restaurants and activities of neighboring El Dorado Royale and Generations Riviera Maya, but guests of Casitas Royale gain exclusive access to their own private pools and swim-up bars, a host of concierge services, aromatherapy and pillow menus and so much more.', 'Carretera Cancún - Tulum Km. 45, 77710 Tulum, QROO, México', '011.52 (998) 872-8030', '20.786974', '-86.939357', NULL, 'http://www.apiazulrivieramaya.muchomil.com/azulrivieramaya/public/images/resorts/dorado-casitas.jpg', 'ElDoradoCasitasRoyale', 1, NULL, NULL),
(10, 'ChIJLa_P4ChDTo8RiCAz9YEVsgI', 'El Dorado Maroma', 'Travel Channel named Maroma Beach one of the 10 best beaches in the world. El Dorado Maroma sits right in the heart of it. The beach will seduce you. But it’s the entire experience at El Dorado Maroma that will make you fall in love.', 'Carretera Cancún – Tulum, Km 55.3\r\nPlaya del Carmen, Quintana Roo\r\nMéxico C.P. 77710', '011.52 (984) 206-3477', '20.723342', '-86.978286', NULL, 'http://www.apiazulrivieramaya.muchomil.com/azulrivieramaya/public/images/resorts/dorado-maroma.jpg', 'ElDoradoMaromaHighlights', 1, NULL, NULL),
(11, 'ChIJJZdoCRhDTo8RTzB3S8D916Y', 'El Dorado Seaside Suites', 'Two distinct experiences in beachside luxury, all within one award-winning resort – this is the AAA Four Diamond El Dorado Seaside Suites. This stunning, adults-only paradise located on Kantenah Bay is divided into two distinct sections, Palms and Infinity, each offering a unique experience in Mexican hospitality.', 'Carr. Cancún - Tulum 95, Puerto Aventuras, Q.R.', '01 984 875 1910', '20.4544906', '-87.2719886', NULL, 'http://www.apiazulrivieramaya.muchomil.com/azulrivieramaya/public/images/resorts/dorado-seaside.jpg', 'ElDoradoSeasideSuitesHighlights', 1, NULL, NULL),
(12, 'ChIJ2egAEEj6ShMRS55J7TKYTrM', 'Sensimar Makarska', 'This season, get spoiled in unspoiled nature. SENSIMAR Makarska is a gorgeous, intimate hotel catering to adults who wish to unwind in a dazzling, natural setting. The carefully remodeled hotel was specially designed in order to ensure a peaceful vibe. Enthusiastic and attentive staff, hushed colors, tasteful décor and fragrant pine forests will instantly help you find your happy place in Igrane. Our single aim is to make your vacation in SENSIMAR Makarska an exceptional experience. We guarantee you will feel right at home no matter if you choose a striking sea view room or a sensuous swim up suite. Take a dip to cool down in one of the outdoor pools just to warm up for the exquisite food served in our contemporary restaurants fit for connoisseurs. Also, there is a FKK beach located just 5 minutes walking distance from hotel.', 'IGRANE 320, 21329, Igrane, Croatia', '021 604 222', '43.194386', '17.137391', NULL, 'http://www.apiazulrivieramaya.muchomil.com/azulrivieramaya/public/images/resorts/Sensimar-Makarska.jpg', 'TUI-Sensimar-Makarska', 1, NULL, NULL),
(13, 'ChIJY6tE0sX7ShMRrmn05X18lFU', 'Sensimar Adriatic Beach Resort', 'Don’t just have a holiday. Have a love affair. The moment you set foot in Croatia the passionate, dedicated team of our beachfront hotel will ensure you are every bit relaxed as you are entertained. SENSIMAR Adriatic Beach Resort is a place where understated elegance combines with luxurious amenities and services. Newly remodeled contemporary rooms offer stunning sea views of the crystal clear Adriatic.', 'Croatia, D8 87, 21329, Živogošće, Croatia', NULL, '43.1846487', '17.1629911', NULL, 'http://www.apiazulrivieramaya.muchomil.com/azulrivieramaya/public/images/resorts/Sensimar-Adriatic-Beach.jpg', 'SENSIMAR-Adriatic-Beach-Resort', 1, NULL, NULL),
(14, 'ChIJhSm4VN2KSxMRTJ4GKBqpP7Y', 'Sensimar Kalamota Island Resort', 'At SENSIMAR Kalamota Island Resort guests are courted with nature, assisted by surroundings that provide a full experience of a well-deserved holiday. The property and professional staff are intertwined to stimulate all senses, pastimes and leisure pursuits. The resort is located on a beach that extends to the little village and port, offering seclusion and ample space for the guests that wish to retain their peace. SENSIMAR Kalamota Island Resort is perfect for adults who choose to be pampered in nature. Active relaxation in intimate surroundings is what awaits the guests.', 'Donje Celo bb, 20221, Koločep, Croatia', '020 312 150', '42.676857', '18.004191', NULL, 'http://www.apiazulrivieramaya.muchomil.com/azulrivieramaya/public/images/resorts/SENSIMAR-Kalamota.jpg', 'SENSIMAR-Kalamota-Island-Resort', 1, NULL, NULL),
(15, 'ChIJd4_RDQ0rTI8RT1EOi_DW_rU', 'Generations Riviera Maya', 'Welcome to the quintessential family resort – the All Suite, All Butler, All Gourmet Generations Riviera Maya. Here, you will discover everything from Gourmet Inclusive® à la carte cuisine to infinity pool balcony suites and attentive butler service.', 'Carretera Cancún Tulum Km. 45, Rivera Maya, 77710 Cancun, Q.R., Mexico', '+52 998 872 8030', '20.7937035', '-86.9317348', NULL, 'http://www.apiazulrivieramaya.muchomil.com/azulrivieramaya/public/images/resorts/generations-rivieramaya.jpg', 'Generations-Riviera-Maya', 1, NULL, NULL),
(16, 'ChIJN2SoLKvDqI4RDJ18ZN26ojs', 'Azul Beach Resort Sensatori Punta Cana', 'A blissful retreat is made up of many pieces. A serene setting, delectable meals, reliable service, and exciting activities. But what if there’s a place that took all of those pieces, and added a sense of unmistakable distinctiveness? Settings wouldn’t just be serene, they would be indescribably breathtaking. Meals wouldn’t just be delectable, they would be an adventure in mastered culinary arts. Service wouldn’t just be reliable, it would be impeccable. And activities wouldn’t just be exciting, they would be downright thrilling. Perfection lies in the details, and there’s no detail left unnoticed at Sensatori Resort Punta Cana.', 'Punta Cana 23000, Dominican Republic', '(809) 833-4560', '18.8014396', '-68.5724537', NULL, 'http://www.apiazulrivieramaya.muchomil.com/azulrivieramaya/public/images/resorts/azul-seansatori-puntacana.jpg', 'Sensatori-Punta-Cana', 1, NULL, NULL),
(17, 'ChIJb2LqCHUv9o4RofQ3ESTy4_s', 'Allure Chocolat', 'Located in the heart of Cartagena, Colombia historic old town surrounded by the colonial city wall. Our classical façade hides an interior of a noble and sophisticated architecture featuring modern accommodations. The waterfront hotel boasts a rooftop infinity pool with truly spectacular city views.', 'Calle del Arsenal, Calle 24 # 8B-58, Cartagena', '+1 866-527-4762', '10.4202381', '-75.5482792', NULL, 'http://www.apiazulrivieramaya.muchomil.com/azulrivieramaya/public/images/resorts/allure-chocolat.jpg', 'Allure-Chocolat', 1, NULL, NULL),
(18, 'ChIJBXHDprd6WkcRNBOxTGMMg1s', 'Allure Caramel', 'Allure Caramel Hotel by Karisma, a boutique art gallery hotel displays the original and reproduction pieces of art that marked the art scene through the first decades of 20th Century in the region, taking you through the history of both the region, and Europe. Located in Dorcol, the oldest part of Belgrade, in a beautiful villa built in 1920\'s. Allure Caramel Hotel is a unique combination of elegance, art and comfort that will make your stay unforgettable. Walking through its premises we travel back in time and imagine extravagant galas and feasts held here which were considered one of the main gathering places for the crème of the Belgrade social circles at that time.', '11000, Venizelosova 31, Beograd, Serbia', '011 3349572', '44.819754', '20.474119', NULL, 'http://www.apiazulrivieramaya.muchomil.com/azulrivieramaya/public/images/resorts/allure-caramel.jpg', 'Allure-Caramel', 1, NULL, NULL),
(19, 'ChIJNwAma5Ml9o4RBcbPhnB2N18', 'Allure Bonbon', 'Calle del Arsenal, Calle 24 # 10-32, Cartagena, Getsemaní, Colombia', 'Calle del Arsenal, Calle 24 # 10-32, Cartagena, Getsemaní, Colombia', '(866) 527-4762', '10.418785', '-75.54687', NULL, 'http://www.apiazulrivieramaya.muchomil.com/azulrivieramaya/public/images/resorts/allure-bonbon.jpg', 'Allure-Bonbon', 1, NULL, NULL),
(20, 'ChIJBeR02iRDTo8R5A3M-SD2mVQ', 'Hidden Beach Resort', 'Luxurious, yet simple. Distinguished, yet welcoming. Welcome to Hidden Beach, the only 5 Star, adults-only nudist resort in Mexico. With 43 beachfront suites only one hour and a half south of the Cancun Airport, Hidden Beach is a gem waiting to be discovered. We’ve designed the most sumptuous Gourmet Inclusive® resort with a blend of unmatched signature services, allowing you to release your stresses, and relax in blissful confidence.', 'Carretera Cancún - Tulum Km 95, Kantenah, 77710 Solidaridad, Q.R., Mexico', '01 984 875 1910', '20.4539735', '-87.2726962', NULL, 'http://www.apiazulrivieramaya.muchomil.com/azulrivieramaya/public/images/resorts/Hidden-Beach-Resort.jpg', 'Hidden+Beach+Resort', 1, NULL, NULL),
(21, 'ChIJG5YGwKSHTo8RADnxmsLcNvI', 'Palafitos at El Dorado Maroma', 'Surrounded by the turquoise waters of the Maroma Beach, these 30 elegant suites offer breathtaking ocean views in a luxurious and magnificent décor. All suites offer a private infinity pool and an oversized deck with lounge chairs where you can delight your soul while watching the sunrise or by having a stunning sunset experience.\n', 'Carr. Fed. Tulum Km.55.3, Centro Playa del Carmen, Q.Roo, México C.P. 77710', '+52(984) 206.34.77', '20.6477267', '-87.0682282', NULL, 'http://www.apipalafitos.muchomil.com/public/images/resorts/palafitos.png', 'Palafitos+at+El+Dorado+Maroma', 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `hoteles_idioma`
--

CREATE TABLE `hoteles_idioma` (
  `idHoteleIdioma` int(11) NOT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `text` text DEFAULT NULL,
  `idHotel` int(11) DEFAULT NULL,
  `idioma` varchar(10) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `hoteles_idioma`
--

INSERT INTO `hoteles_idioma` (`idHoteleIdioma`, `nombre`, `text`, `idHotel`, `idioma`, `created_at`, `updated_at`) VALUES
(1, 'Azul Beach Resort Riviera Maya', 'La experiencia en Azul Beach Resort Riviera Maya, \r\nby Karisma comienza desde el momento en que usted llega,\r\ncon un champán de bienvenida para los adultos durante el check-in, aromaterapia exclusiva de Karisma y opciones de almohadas, además de licuados de Nickelodeon para los niños.\r\nEste oasis frente a la playa, que solo cuenta con 148\r\nhabitaciones de lujo y suites, alberga a familias y parejas\r\nque desean una experiencia refinada y más íntima.  \r\nTodo está a solo un corto paseo o en carritos, desde la playa de arena blanca de media milla hasta los cinco restaurantes, los bares en la piscina, Azulitos by Nickelodeon Kids Club y Vassa Spa.', 1, 'es', NULL, NULL),
(2, 'Azul Beach Resort Riviera Maya', 'The experience at Azul Beach Resort Riviera Maya, by Karisma begins the moment you arrive, with a champagne toast check in for adults, Karisma’s signature aromatherapy and pillow menu to choose from and Nickelodeon smoothies for kids. With only 148 deluxe rooms and suites, this beachfront oasis caters to families and couples who desire a refined yet more intimate experience. Everything is just a short stroll or stroller ride away, from the half-mile white-sand beach to the five restaurants, swim-up bars, Azulitos by Nickelodeon Kids Club and Vassa Spa.', 1, 'en', NULL, NULL),
(3, 'Azul Beach Resort The Fives Playa del Carmen', 'Quien dijo la juventud se desperdicia en los jovenes nunca conoció Azul Beach Resort The Fives Playa del Carmen, by Karisma. Porque esta área recreativa Gourmet Inclusive® sacará el lado divertido de todos: niños, adolescentes, parejas, grupos, recien casados y hasta futuras novias.\r\nAl mismo tiempo, las habitaciones de lujo y el servicio impecable de Azul Beach Resort The Fives Playa del Carmen satisfarán hasta los gustos de los adultos más exigentes.\r\n', 2, 'es', NULL, NULL),
(4, 'Azul Beach Resort The Fives Playa del Carmen', 'Whoever said youth is wasted on the young has never experienced Azul Beach Resort The Fives Playa del Carmen, by Karisma. Because for tots, teens, couples, groups, honeymooners and even brides-to-be, this Gourmet Inclusive® playground will bring out the playful side in everyone. At the same time, Azul Beach Resort The Fives Playa del Carmen’ luxury accommodations and impeccable service will satisfy the most discriminating adult tastes.', 2, 'en', NULL, NULL),
(5, 'Azul Beach Resort Sensatori Mexico', 'Azul Sensatori tiene 435 Jacuzzi® Suites, cocina gourmet y el Vassa Spa de primera clase y ofrece la experiencia Karisma Gourmet Inclusive® a gran escala.\r\nSi bien este resort caribeno multigeneracional es grande, cada huésped recibe un tratamiento de realeza. El personal de Azul Sensatori es experto en el arte de la atención y hasta anticipa cada uno de sus deseos, aún cuando su mayor deseo sea estar solo.', 6, 'es', NULL, NULL),
(6, 'Azul Beach Resort Sensatori Mexico', 'With 435 Jacuzzi® Suites, gourmet cuisine and world-class Vassa Spa, Azul Beach Resort Sensatori Mexico offers the Karisma Gourmet Inclusive® Experience on a grand scale.\nYet as expansive as this multi-generational Caribbean resort is, every guest is treated like royalty. You see, the Azul Sensatori staff has mastered the art of attending to and even anticipating your every wish – even when your greatest desire is to be left alone.', 6, 'en', NULL, NULL),
(7, 'Azul Beach Resort Sensatori Jamaica', 'Azul Sensatori Jamaica, ubicado en una franja codiciada de la Playa de Siete Millas mundialmente famosa de Negril, es un paraíso prístino donde parejas, familias, amigos y colegas pueden reconectarse bajo el cielo azul brillante y el sol tropical.', 7, 'es', NULL, NULL),
(8, 'Azul Beach Resort Sensatori Jamaica', 'Situated on a coveted stretch of Negril’s world-famous Seven Mile beach, Azul Beach Resort Sensatori Jamaica is a pristine paradise where couples, families, friends and colleagues can reconnect beneath brilliant blue skies and tropical sunshine.', 7, 'en', NULL, NULL),
(9, 'El Dorado Royale Resort', 'El Dorado Royale, by Karisma, es un paraíso para adultos donde todo está diseñado para ayudarlo a tranquilzarse, relajarse y disfrutar de cada momento de sus vaciones.\r\nEncontrara restaurantes de primer nivel, reconocidos chefs, concierges personales y bares que sirvan marcas de primera calidad. Cosechamos vegetales de nuestro propio invernadero hidropónico de 76,000 pies cuadrados.\r\nOfrecemos clases de acondicionamiento físico, lecciones de baile y degustacion de vinos.\r\nDos veces al mes, organizamos una serie culinaria con chefs visitantes de todo el mundo.', 8, 'es', NULL, NULL),
(10, 'El Dorado Royale Resort', 'El Dorado Royale, by Karisma, is an adults-only paradise where everything is designed to help you slow down, relax, and savor every moment of your vacation.\nYou’ll find world-class restaurants, renowned chefs, personal concierges and bars that pour from the top shelf. We harvest vegetables from our own 76,000 square-foot hydroponic greenhouse. We offer fitness classes, dance lessons and wine tastings. Twice a month, we host a culinary series featuring visiting chefs from around the world.', 8, 'en', NULL, NULL),
(11, 'El Dorado Casitas Royale', 'El Dorado Casitas Royale by Karisma es un espacio privado dedicado a ofrecer un mayor nivel de lujo y atención personal. Tiene la libertad de disfrutar de todos los servicios, los restaurantes y las actividades espectaculares de nuestros vecinos El Dorado Royale y Generations Riviera Maya, pero los huespedes de Casitas Royale además tienen acceso exclusivo a sus propias piscinas privadas y bares Swim-Up, una gama de servicios de concierge, opciones de almohadas y aromaterapia y muchísimo más.', 9, 'es', NULL, NULL),
(12, 'El Dorado Casitas Royale', 'El Dorado Casitas Royale, by Karisma is a private enclave dedicated to providing an even higher level of luxury and personal attention. You’re free to enjoy all of the dazzling amenities, restaurants and activities of neighboring El Dorado Royale and Generations Riviera Maya, but guests of Casitas Royale gain exclusive access to their own private pools and swim-up bars, a host of concierge services, aromatherapy and pillow menus and so much more.', 9, 'en', NULL, NULL),
(13, 'El Dorado Maroma', 'Travel Channel reconoció a playa Maroma como una de las mejores 10 playas del mundo. El Dorado Maroma se encuentra justo en el centro. La playa lo seducirá. Pero la experiencia completa de El Dorado Maroma es lo que hará que se enamore.', 10, 'es', NULL, NULL),
(14, 'El Dorado Maroma', 'Travel Channel named Maroma Beach one of the 10 best beaches in the world. El Dorado Maroma sits right in the heart of it. The beach will seduce you. But it’s the entire experience at El Dorado Maroma that will make you fall in love.', 10, 'en', NULL, NULL),
(15, 'El Dorado Seaside Suites', 'Dos experiencias bien singulares en el lujo junto a la playa, todo dentro del galardonado resort, estas son las  suites de El Dorado Seaside Suites con el premio AAA Four Diamond. Este increíble paraíso solo para adultos en Kantenah Bay está dividido en dos partes diferentes, Palms y Infinity, donde cada una ofrece una experiencia única de la industria hotelera mexicana.', 11, 'es', NULL, NULL),
(16, 'El Dorado Seaside Suites', 'Two distinct experiences in beachside luxury, all within one award-winning resort – this is the AAA Four Diamond El Dorado Seaside Suites. This stunning, adults-only paradise located on Kantenah Bay is divided into two distinct sections, Palms and Infinity, each offering a unique experience in Mexican hospitality.', 11, 'en', NULL, NULL),
(17, 'Sensimar Makarska', 'Esta temporada, déjate mimar por la naturaleza virgen. SENSIMAR Makarska es un magnífico e íntimo hotel para adultos que desean relajarse en un entorno deslumbrante y natural. El hotel, cuidadosamente remodelado, fue especialmente diseñado para garantizar un ambiente tranquilo. Personal entusiasta y atento, colores silenciosos, decoración de buen gusto y fragantes bosques de pinos le ayudarán instantáneamente a encontrar su lugar feliz en Igrane. Nuestro único objetivo es hacer de sus vacaciones en SENSIMAR Makarska una experiencia excepcional. Le garantizamos que se sentirá como en casa sin importar si elige una habitación con vista al mar o una suite sensual. Tómese un chapuzón para refrescarse en una de las piscinas al aire libre para calentarse y disfrutar de la exquisita comida que se sirve en nuestros restaurantes contemporáneos aptos para conocedores. Además, hay una playa FKK situada a sólo 5 minutos a pie del hotel.', 12, 'es', NULL, NULL),
(18, 'Sensimar Makarska', 'This season, get spoiled in unspoiled nature. SENSIMAR Makarska is a gorgeous, intimate hotel catering to adults who wish to unwind in a dazzling, natural setting. The carefully remodeled hotel was specially designed in order to ensure a peaceful vibe. Enthusiastic and attentive staff, hushed colors, tasteful décor and fragrant pine forests will instantly help you find your happy place in Igrane. Our single aim is to make your vacation in SENSIMAR Makarska an exceptional experience. We guarantee you will feel right at home no matter if you choose a striking sea view room or a sensuous swim up suite. Take a dip to cool down in one of the outdoor pools just to warm up for the exquisite food served in our contemporary restaurants fit for connoisseurs. Also, there is a FKK beach located just 5 minutes walking distance from hotel.', 12, 'en', NULL, NULL),
(19, 'Sensimar Adriatic Beach Resort', 'No solo unas vacaciones. Tenga una historia de amor. En el momento en que ponga un pie en Croacia, el apasionado y dedicado equipo de nuestro hotel frente a la playa le asegurará que estará lo más relajado posible mientras esté entretenido. SENSIMAR Adriatic Beach Resort es un lugar donde la elegancia discreta se combina con lujosas comodidades y servicios. Las habitaciones contemporáneas recién remodeladas ofrecen impresionantes vistas al mar Adriático.', 13, 'es', NULL, NULL),
(20, 'Sensimar Adriatic Beach Resort', 'Don’t just have a holiday. Have a love affair. The moment you set foot in Croatia the passionate, dedicated team of our beachfront hotel will ensure you are every bit relaxed as you are entertained. SENSIMAR Adriatic Beach Resort is a place where understated elegance combines with luxurious amenities and services. Newly remodeled contemporary rooms offer stunning sea views of the crystal clear Adriatic.', 13, 'en', NULL, NULL),
(21, 'Sensimar Kalamota Island Resort', 'En SENSIMAR Kalamota Island Resort los huéspedes son cortejados por la naturaleza, asistidos por un entorno que les proporciona una experiencia completa de unas merecidas vacaciones. La propiedad y el personal profesional están entrelazados para estimular todos los sentidos, pasatiempos y actividades de ocio. El complejo está situado en una playa que se extiende hasta el pequeño pueblo y el puerto, ofreciendo aislamiento y amplio espacio para los huéspedes que deseen mantener su paz. SENSIMAR Kalamota Island Resort es perfecto para adultos que eligen ser mimados en la naturaleza. La relajación activa en un entorno íntimo es lo que espera a los huéspedes.', 14, 'es', NULL, NULL),
(22, 'Sensimar Kalamota Island Resort', 'At SENSIMAR Kalamota Island Resort guests are courted with nature, assisted by surroundings that provide a full experience of a well-deserved holiday. The property and professional staff are intertwined to stimulate all senses, pastimes and leisure pursuits. The resort is located on a beach that extends to the little village and port, offering seclusion and ample space for the guests that wish to retain their peace. SENSIMAR Kalamota Island Resort is perfect for adults who choose to be pampered in nature. Active relaxation in intimate surroundings is what awaits the guests.', 14, 'en', NULL, NULL),
(23, 'Generations Riviera Maya', 'Bienvenido a Generations Riviera Maya, el gran resort familiar para disfrutar de las mejores suites con servicio de mayordomo y una excepcional experiencia gourmet. Aquí, descubrirá desde cocina a la carta Gourmet Inclusive® hasta suites con balcón y piscina infinity y un cordial servicio de mayordomo.', 15, 'es', NULL, NULL),
(24, 'Generations Riviera Maya', 'Welcome to the quintessential family resort – the All Suite, All Butler, All Gourmet Generations Riviera Maya. Here, you will discover everything from Gourmet Inclusive® à la carte cuisine to infinity pool balcony suites and attentive butler service.', 15, 'en', NULL, NULL),
(25, 'Azul Beach Resort Sensatori Punta Cana', 'Un retiro maravilloso se compone de muchas piezas. Un ambiente sereno, comidas deliciosas, servicio confiable y actividades emocionantes. ¿Pero qué tal si hay un lugar que tomó todas esas piezas, y agregó un sentido de inconfundible distinción? Los ajustes no sólo serían serenos, sino que serían indescriptiblemente impresionantes. Las comidas no sólo serían deliciosas, sino que serían una aventura en las artes culinarias dominadas. El servicio no sólo sería confiable, sino impecable. Y las actividades no sólo serían emocionantes, sino francamente emocionantes. La perfección está en los detalles, y no hay detalle que pase desapercibido en Sensatori Resort Punta Cana.', 16, 'es', NULL, NULL),
(26, 'Azul Beach Resort Sensatori Punta Cana', 'A blissful retreat is made up of many pieces. A serene setting, delectable meals, reliable service, and exciting activities. But what if there’s a place that took all of those pieces, and added a sense of unmistakable distinctiveness? Settings wouldn’t just be serene, they would be indescribably breathtaking. Meals wouldn’t just be delectable, they would be an adventure in mastered culinary arts. Service wouldn’t just be reliable, it would be impeccable. And activities wouldn’t just be exciting, they would be downright thrilling. Perfection lies in the details, and there’s no detail left unnoticed at Sensatori Resort Punta Cana.', 16, 'en', NULL, NULL),
(27, 'Allure Chocolat', 'Está ubicado en el corazón de Cartagena, el histórico casco antiguo de Colombia rodeado por el muro de la ciudad colonial. Nuestra fachada clásica oculta un interior de arquitectura noble y sofisticada que cuenta con habitaciones modernas. Este hotel frente al mar tiene una piscina infinity en la terraza con vistas a la ciudad realmente espectaculares.', 17, 'es', NULL, NULL),
(28, 'Allure Chocolat', 'Located in the heart of Cartagena, Colombia historic old town surrounded by the colonial city wall. Our classical façade hides an interior of a noble and sophisticated architecture featuring modern accommodations. The waterfront hotel boasts a rooftop infinity pool with truly spectacular city views.', 17, 'en', NULL, NULL),
(29, 'Allure Caramel', 'Allure Caramel Hotel by Karisma, un hotel boutique con galería de arte, exhibe obras de arte originales y réplicas que dejaron su impronta en la escena artística durante las primeras décadas del siglo XX en la región, para ayudarle a recorrer la historia del lugar y de Europa. Ubicado en Dorcol, el sector más antiguo de Belgrado, en un hermoso chalet construido en la década de 1920. Allure Caramel Hotel es una combinación única de elegancia, arte y comodidad que hará que su estadía sea inolvidable. Al caminar por sus instalaciones viajamos en el tiempo e imaginamos las extravagantes galas y festines que tuvieron lugar allí, uno de los principales lugares de reunión para los círculos sociales más altos de Belgrado en ese momento.', 18, 'es', NULL, NULL),
(30, 'Allure Caramel', 'Allure Caramel Hotel by Karisma, a boutique art gallery hotel displays the original and reproduction pieces of art that marked the art scene through the first decades of 20th Century in the region, taking you through the history of both the region, and Europe. Located in Dorcol, the oldest part of Belgrade, in a beautiful villa built in 1920\'s. Allure Caramel Hotel is a unique combination of elegance, art and comfort that will make your stay unforgettable. Walking through its premises we travel back in time and imagine extravagant galas and feasts held here which were considered one of the main gathering places for the crème of the Belgrade social circles at that time.', 18, 'en', NULL, NULL),
(31, 'Allure Bonbon', 'Calle del Arsenal, Calle 24 # 10-32, Cartagena, Getsemaní, Colombia', 19, 'es', NULL, NULL),
(32, 'Allure Bonbon', 'Calle del Arsenal, Calle 24 # 10-32, Cartagena, Getsemaní, Colombia', 19, 'en', NULL, NULL),
(33, 'Hidden Beach Resort', 'Lujoso, pero simple. Distinguido, pero acogedor. Bienvenido a Hidden Beach, el único resort nudista 5 estrellas para adultos en México. Con 43 suites frente a la playa a solo una hora y media al sur del aeropuerto de Cancún, Hidden Beach es una joya a la espera de ser descubierta. Hemos diseñado el resort Gourmet Inclusive® más suntuoso con una combinación de servicios unicos, que le permite liberar su estrés y relajarse en una feliz confianza.', 20, 'es', NULL, NULL),
(34, 'Hidden Beach Resort', 'Luxurious, yet simple. Distinguished, yet welcoming. Welcome to Hidden Beach, the only 5 Star, adults-only nudist resort in Mexico. With 43 beachfront suites only one hour and a half south of the Cancun Airport, Hidden Beach is a gem waiting to be discovered. We’ve designed the most sumptuous Gourmet Inclusive® resort with a blend of unmatched signature services, allowing you to release your stresses, and relax in blissful confidence.', 20, 'en', NULL, NULL),
(35, 'Palafitos at El Dorado Maroma', 'Rodeadas por las aguas turquesas de la playa de Maroma, estas 30 elegantes suites ofrecen impresionantes vistas al mar en una lujosa y magnífica decoración. Todas las suites ofrecen una piscina de borde infinito privada y una terraza de gran tamaño con sillones donde podrá deleitar su alma mientras contempla el amanecer o disfrutar de una impresionante experiencia al atardecer.', 21, 'es', NULL, NULL),
(36, 'Palafitos at El Dorado Maroma', 'Surrounded by the turquoise waters of the Maroma Beach, these 30 elegant suites offer breathtaking ocean views in a luxurious and magnificent décor. All suites offer a private infinity pool and an oversized deck with lounge chairs where you can delight your soul while watching the sunrise or by having a stunning sunset experience.\n', 21, 'en', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `hotel_caracteristicas`
--

CREATE TABLE `hotel_caracteristicas` (
  `idHotelCaracteristicas` int(11) NOT NULL,
  `num` int(11) DEFAULT NULL,
  `title` varchar(20) DEFAULT NULL,
  `class` varchar(20) DEFAULT NULL,
  `import` varchar(100) DEFAULT NULL,
  `idHotel` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `hotel_caracteristicas`
--

INSERT INTO `hotel_caracteristicas` (`idHotelCaracteristicas`, `num`, `title`, `class`, `import`, `idHotel`, `created_at`, `updated_at`) VALUES
(1, 148, 'Suites', 'w30', 'CuartosPage', 1, NULL, NULL),
(2, 5, 'Pools', 'w30', NULL, 1, NULL, NULL),
(3, 5, 'Restaurants', 'w30', NULL, 1, NULL, NULL),
(4, 4, 'Bars', 'w50', NULL, 1, NULL, NULL),
(5, 1, 'Spa', 'w50', NULL, 1, NULL, NULL),
(6, 571, 'Suites', 'w30', NULL, 2, NULL, NULL),
(7, 6, 'Pools', 'w30', NULL, 2, NULL, NULL),
(8, 9, 'Restaurants', 'w30', NULL, 2, NULL, NULL),
(9, 10, 'Bars', 'w50', NULL, 2, NULL, NULL),
(10, 1, 'Spa', 'w50', NULL, 2, NULL, NULL),
(11, 435, 'Suites', 'w30', NULL, 6, NULL, NULL),
(12, 6, 'Pools', 'w30', NULL, 6, NULL, NULL),
(13, 8, 'Restaurants', 'w30', NULL, 6, NULL, NULL),
(14, 8, 'Bars', 'w50', NULL, 6, NULL, NULL),
(15, 1, 'Spa', 'w50', NULL, 6, NULL, NULL),
(16, 285, 'Suites', 'w30', NULL, 7, NULL, NULL),
(17, 7, 'Pools', 'w30', NULL, 7, NULL, NULL),
(18, 9, 'Restaurants', 'w30', NULL, 7, NULL, NULL),
(19, 9, 'Bars', 'w50', NULL, 7, NULL, NULL),
(20, 1, 'Spa', 'w50', NULL, 7, NULL, NULL),
(21, 478, 'Suites', 'w30', NULL, 8, NULL, NULL),
(22, 6, 'Pools', 'w30', NULL, 8, NULL, NULL),
(23, 15, 'Restaurants', 'w30', NULL, 8, NULL, NULL),
(24, 9, 'Bars', 'w50', NULL, 8, NULL, NULL),
(25, 2, 'Spas', 'w50', NULL, 8, NULL, NULL),
(26, 205, 'Suites', 'w30', NULL, 9, NULL, NULL),
(27, 14, 'Pools', 'w30', NULL, 9, NULL, NULL),
(28, 15, 'Restaurats', 'w30', NULL, 9, NULL, NULL),
(29, 17, 'Bars', 'w50', NULL, 9, NULL, NULL),
(30, 2, 'Spas', 'w50', NULL, 9, NULL, NULL),
(31, 157, 'Suites', 'w30', NULL, 10, NULL, NULL),
(32, 3, 'Pools', 'w30', NULL, 10, NULL, NULL),
(33, 7, 'Restaurants', 'w30', NULL, 10, NULL, NULL),
(34, 5, 'Bars', 'w50', NULL, 10, NULL, NULL),
(35, 2, 'Spas', 'w50', NULL, 10, NULL, NULL),
(36, 574, 'Suites', 'w30', NULL, 11, NULL, NULL),
(37, 10, 'Restaurants', 'w30', NULL, 11, NULL, NULL),
(38, 10, 'Bars', 'w30', NULL, 11, NULL, NULL),
(39, 5, 'Pools', 'w50', NULL, 11, NULL, NULL),
(40, 1, 'Spas', 'w50', NULL, 11, NULL, NULL),
(41, 179, 'Rooms', 'w30', NULL, 12, NULL, NULL),
(42, 2, 'Pools', 'w30', NULL, 12, NULL, NULL),
(43, 2, 'Restaurants', 'w30', NULL, 12, NULL, NULL),
(44, 3, 'Bars', 'w50', NULL, 12, NULL, NULL),
(45, 0, 'Spas', 'w50', NULL, 12, NULL, NULL),
(46, 266, 'Rooms', 'w30', NULL, 13, NULL, NULL),
(47, 1, 'Pools', 'w30', NULL, 13, NULL, NULL),
(48, 3, 'Restaurants', 'w30', NULL, 13, NULL, NULL),
(49, 3, 'Bars', 'w50', NULL, 13, NULL, NULL),
(50, 0, 'Spas', 'w50', NULL, 13, NULL, NULL),
(51, 144, 'Rooms', 'w30', NULL, 14, NULL, NULL),
(52, 1, 'Pools', 'w30', NULL, 14, NULL, NULL),
(53, 3, 'Restaurants', 'w30', NULL, 14, NULL, NULL),
(54, 3, 'Bars', 'w50', NULL, 14, NULL, NULL),
(55, 0, 'Spas', 'w50', NULL, 14, NULL, NULL),
(56, 162, 'Suites', 'w30', NULL, 15, NULL, NULL),
(57, 2, 'Swimming Pools', 'w30', NULL, 15, NULL, NULL),
(58, 5, 'Restaurants', 'w30', NULL, 15, NULL, NULL),
(59, 3, 'Bars', 'w50', NULL, 15, NULL, NULL),
(60, 1, 'Spa', 'w50', NULL, 15, NULL, NULL),
(61, 252, 'Suites', 'w30', NULL, 16, NULL, NULL),
(62, 2, 'Pools', 'w30', NULL, 16, NULL, NULL),
(63, 7, 'Restaurants', 'w30', NULL, 16, NULL, NULL),
(64, 6, 'Bars', 'w50', NULL, 16, NULL, NULL),
(65, 1, 'Spas', 'w50', NULL, 16, NULL, NULL),
(66, 34, 'Rooms', 'w30', NULL, 17, NULL, NULL),
(67, 1, 'Pools', 'w30', NULL, 17, NULL, NULL),
(68, 1, 'Restaurants', 'w30', NULL, 17, NULL, NULL),
(69, 1, 'Bars', 'w50', NULL, 17, NULL, NULL),
(70, 0, 'Spas', 'w50', NULL, 17, NULL, NULL),
(71, 17, 'Rooms', 'w30', NULL, 18, NULL, NULL),
(72, 1, 'Restaurants', 'w30', NULL, 18, NULL, NULL),
(73, 1, 'Bars', 'w30', NULL, 18, NULL, NULL),
(74, 14, 'Rooms', 'w30', NULL, 19, NULL, NULL),
(75, 1, 'Pools', 'w30', NULL, 19, NULL, NULL),
(76, 1, 'Restaurants', 'w30', NULL, 19, NULL, NULL),
(77, 2, 'Bars', 'w50', NULL, 19, NULL, NULL),
(78, 0, 'Spas', 'w50', NULL, 19, NULL, NULL),
(79, 43, 'Suites', 'w30', NULL, 20, NULL, NULL),
(80, 1, 'Pools', 'w30', NULL, 20, NULL, NULL),
(81, 2, 'Bars', 'w30', NULL, 20, NULL, NULL),
(82, 1, 'Restaurants', 'w50', NULL, 20, NULL, NULL),
(83, 0, 'Spas', 'w50', NULL, 20, NULL, NULL),
(84, 30, 'Suites', 'w30', NULL, 21, NULL, NULL),
(85, 0, 'Pools', 'w30', NULL, 21, NULL, NULL),
(86, 4, 'Bars', 'w30', NULL, 21, NULL, NULL),
(87, 7, 'Restaurants', 'w50', NULL, 21, NULL, NULL),
(88, 1, 'Spa', 'w50', NULL, 21, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `hotel_caracteristicas_idioma`
--

CREATE TABLE `hotel_caracteristicas_idioma` (
  `idHotelCaracIdioma` int(11) NOT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `idHotelCaracteristicas` int(11) DEFAULT NULL,
  `idioma` varchar(10) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `hotel_fotos`
--

CREATE TABLE `hotel_fotos` (
  `idHotelFotos` int(11) NOT NULL,
  `idHotel` int(11) DEFAULT NULL,
  `img` varchar(255) DEFAULT NULL,
  `orden` int(11) DEFAULT NULL,
  `estatus` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `hotel_fotos`
--

INSERT INTO `hotel_fotos` (`idHotelFotos`, `idHotel`, `img`, `orden`, `estatus`, `created_at`, `updated_at`) VALUES
(1, 1, 'azul-beach/riviera-maya/AZB Beach A.jpg', 1, 1, NULL, NULL),
(2, 1, 'azul-beach/riviera-maya/AZB Beach B.jpg', 2, 1, NULL, NULL),
(3, 1, 'azul-beach/riviera-maya/AZB Family Suite 911 Room View.jpg', 3, 1, NULL, NULL),
(4, 1, 'azul-beach/riviera-maya/AZB Family Swim Up Suite 1106 Room View.jpg', 4, 1, NULL, NULL),
(5, 1, 'azul-beach/riviera-maya/AZB Lobby A.jpg', 5, 1, NULL, NULL),
(6, 1, 'azul-beach/riviera-maya/AZB Lobby B.jpg', 6, 1, NULL, NULL),
(7, 1, 'azul-beach/riviera-maya/AZB Lobby C.jpg', 7, 1, NULL, NULL),
(8, 1, 'azul-beach/riviera-maya/AZB Lobby D.jpg', 8, 1, NULL, NULL),
(9, 1, 'azul-beach/riviera-maya/AZB Lobby E.jpg', 9, 1, NULL, NULL),
(10, 1, 'azul-beach/riviera-maya/AZB Lobby VERT.jpg', 10, 1, NULL, NULL),
(11, 1, 'azul-beach/riviera-maya/AZB Pool.jpg', 11, 1, NULL, NULL),
(12, 1, 'azul-beach/riviera-maya/AZB Royal Swim Up Suite 802 Room View.jpg', 12, 1, NULL, NULL),
(13, 2, 'azul-beach/the-fives-playadelcarmen/ABRTF_Wedding.jpg', 1, 1, NULL, NULL),
(14, 2, 'azul-beach/the-fives-playadelcarmen/AZF Candlelight Dinner A.jpg', NULL, 1, NULL, NULL),
(15, 2, 'azul-beach/the-fives-playadelcarmen/AZF Essence Pool View 1513-1 Room View.jpg', NULL, 1, NULL, NULL),
(16, 2, 'azul-beach/the-fives-playadelcarmen/AZF Essence Section Pool A.jpg', NULL, 1, NULL, NULL),
(17, 2, 'azul-beach/the-fives-playadelcarmen/AZF Essence Suite Garden Room View.jpg', NULL, 1, NULL, NULL),
(18, 2, 'azul-beach/the-fives-playadelcarmen/AZF Essence Swim Up Suite 1502-1 Room View.jpg', NULL, 1, NULL, NULL),
(19, 2, 'azul-beach/the-fives-playadelcarmen/AZF Infinity Pool Couple Wide A.jpg', NULL, 1, NULL, NULL),
(20, 2, 'azul-beach/the-fives-playadelcarmen/AZF One Bedroom Pool Walkout 803 Room View.jpg', NULL, 1, NULL, NULL),
(21, 2, 'azul-beach/the-fives-playadelcarmen/AZF Plaza A.jpg', NULL, 1, NULL, NULL),
(22, 2, 'azul-beach/the-fives-playadelcarmen/AZF Plaza B.jpg', NULL, 1, NULL, NULL),
(23, 2, 'azul-beach/the-fives-playadelcarmen/AZF Plaza C.jpg', NULL, 1, NULL, NULL),
(24, 2, 'azul-beach/the-fives-playadelcarmen/AZF Plaza VERT A.jpg', NULL, 1, NULL, NULL),
(25, 2, 'azul-beach/the-fives-playadelcarmen/AZF Plaza VERT B.jpg', NULL, 1, NULL, NULL),
(26, 2, 'azul-beach/the-fives-playadelcarmen/AZF Second Floor Pool View 412 Room View.jpg', NULL, 1, NULL, NULL),
(27, 6, 'azul-beach/sensarori-mexico/AZS Adults Only Pool View.jpg', NULL, 1, NULL, NULL),
(28, 6, 'azul-beach/sensarori-mexico/AZS Lobby.jpg', NULL, 1, NULL, NULL),
(29, 6, 'azul-beach/sensarori-mexico/AZS Lux Jacuzzi Swim Up Suite 3117 Room View.jpg', NULL, 1, NULL, NULL),
(30, 6, 'azul-beach/sensarori-mexico/AZS Royal Suite 1318 Room View.jpg', NULL, 1, NULL, NULL),
(31, 6, 'azul-beach/sensarori-mexico/AZS Spa Hydrotherapy Pools.jpg', NULL, 1, NULL, NULL),
(32, 7, 'azul-beach/sensatori-jamaica/AZSJ Beach.jpg', NULL, 1, NULL, NULL),
(33, 7, 'azul-beach/sensatori-jamaica/AZSJ Pool.jpg', NULL, 1, NULL, NULL),
(34, 7, 'azul-beach/sensatori-jamaica/AzulBeachNegril_Drone1.jpg', NULL, 1, NULL, NULL),
(35, 7, 'azul-beach/sensatori-jamaica/AzulBeachNegril_Drone2.jpg', NULL, 1, NULL, NULL),
(36, 7, 'azul-beach/sensatori-jamaica/AzulBeachNegril_Drone3.jpg', NULL, 1, NULL, NULL),
(37, 7, 'azul-beach/sensatori-jamaica/AzulBeachNegril_Drone4.jpg', NULL, 1, NULL, NULL),
(38, 7, 'azul-beach/sensatori-jamaica/AzulBeachNegril_Drone5.jpg', NULL, 1, NULL, NULL),
(39, 7, 'azul-beach/sensatori-jamaica/AzulBeachNegril_Exterior 1.jpg', NULL, 1, NULL, NULL),
(40, 7, 'azul-beach/sensatori-jamaica/AzulBeachNegril_Exterior Restaurant Tower.jpg', NULL, 1, NULL, NULL),
(41, 7, 'azul-beach/sensatori-jamaica/AzulBeachNegril_Swimup Bar.jpg', NULL, 1, NULL, NULL),
(42, 16, 'azul-beach/sensatori-puntacana/Aerial Overview_NRPC1.jpg', NULL, 1, NULL, NULL),
(43, 16, 'azul-beach/sensatori-puntacana/Aerial Overview_NRPC2.jpg', NULL, 1, NULL, NULL),
(44, 16, 'azul-beach/sensatori-puntacana/Aerial Overview_NRPC3.jpg', NULL, 1, NULL, NULL),
(45, 16, 'azul-beach/sensatori-puntacana/Aerial Overview_NRPC4.jpg', NULL, 1, NULL, NULL),
(46, 16, 'azul-beach/sensatori-puntacana/Aerial Overview_Sports Hub_SRPC.jpg', NULL, 1, NULL, NULL),
(47, 16, 'azul-beach/sensatori-puntacana/Gourmet Inclusive Village_night_SRPC.jpg', NULL, 1, NULL, NULL),
(48, 16, 'azul-beach/sensatori-puntacana/Gourmet Inclusive Village_SRPC.jpg', NULL, 1, NULL, NULL),
(49, 16, 'azul-beach/sensatori-puntacana/Infinity Pool_SRPC1.jpg', NULL, 1, NULL, NULL),
(50, 16, 'azul-beach/sensatori-puntacana/Infinity Pool_SRPC11.jpg', NULL, 1, NULL, NULL),
(51, 16, 'azul-beach/sensatori-puntacana/Infinity Pool_SRPC2.jpg', NULL, 1, NULL, NULL),
(52, 16, 'azul-beach/sensatori-puntacana/Infinity Pool_SRPC3.jpg', NULL, 1, NULL, NULL),
(53, 16, 'azul-beach/sensatori-puntacana/Infinity Pool_SRPC4.jpg', NULL, 1, NULL, NULL),
(54, 16, 'azul-beach/sensatori-puntacana/Infinity pool_SRPC_5.jpg', NULL, 1, NULL, NULL),
(55, 16, 'azul-beach/sensatori-puntacana/Infinity pool_SRPC_6.jpg', NULL, 1, NULL, NULL),
(56, 8, 'el-dorado/royale-resort/EDR Beach Beds A.jpg', NULL, 1, NULL, NULL),
(57, 8, 'el-dorado/royale-resort/EDR Candlelight Dinner.jpg', NULL, 1, NULL, NULL),
(58, 8, 'el-dorado/royale-resort/EDR Fuentes Pool.jpg', NULL, 1, NULL, NULL),
(59, 8, 'el-dorado/royale-resort/EDR Jojo_s Pier A.jpg', NULL, 1, NULL, NULL),
(60, 8, 'el-dorado/royale-resort/EDR Jojo_s Pier B.jpg', NULL, 1, NULL, NULL),
(61, 8, 'el-dorado/royale-resort/EDR Jojo_s Pier C.jpg', NULL, 1, NULL, NULL),
(62, 8, 'el-dorado/royale-resort/EDR Jojo_s Pier E.jpg', NULL, 1, NULL, NULL),
(63, 8, 'el-dorado/royale-resort/EDR Lobby View.jpg', NULL, 1, NULL, NULL),
(64, 8, 'el-dorado/royale-resort/EDR_La Isla pool_RT.jpg', NULL, 1, NULL, NULL),
(65, 8, 'el-dorado/royale-resort/EDR_Overview_RT.jpg', NULL, 1, NULL, NULL),
(66, 9, 'el-dorado/casitas-royale/SEN Guacamayas A.jpg', NULL, 1, NULL, NULL),
(67, 9, 'el-dorado/casitas-royale/SEN Sandwicherie A.jpg', NULL, 1, NULL, NULL),
(68, 10, 'el-dorado/maroma-highlights/EDM Kiyoko.jpg', NULL, 1, NULL, NULL),
(69, 10, 'el-dorado/maroma-highlights/EDM Lima Limon.jpg', NULL, 1, NULL, NULL),
(70, 10, 'el-dorado/maroma-highlights/EDM Papitos Interior.jpg', NULL, 1, NULL, NULL),
(71, 10, 'el-dorado/maroma-highlights/EDM Papitos Patio.jpg', NULL, 1, NULL, NULL),
(72, 10, 'el-dorado/maroma-highlights/EDM_Caribbean Grill.jpg', NULL, 1, NULL, NULL),
(73, 10, 'el-dorado/maroma-highlights/EDM_Mio Swimup Bar.jpg', NULL, 1, NULL, NULL),
(74, 10, 'el-dorado/maroma-highlights/EDM_Sabores Restaurant.jpg', NULL, 1, NULL, NULL),
(75, 11, 'el-dorado/seaside-suites/EDSS Aerial A.jpg', NULL, 1, NULL, NULL),
(76, 11, 'el-dorado/seaside-suites/EDSS Picadilly Circus.jpg', NULL, 1, NULL, NULL),
(77, 11, 'el-dorado/seaside-suites/EDSS Pier C.jpg', NULL, 1, NULL, NULL),
(78, 11, 'el-dorado/seaside-suites/EDSS Pier D.jpg', NULL, 1, NULL, NULL),
(79, 11, 'el-dorado/seaside-suites/EDSS Pool A.jpg', NULL, 1, NULL, NULL),
(80, 11, 'el-dorado/seaside-suites/EDSS Resort Aerial.jpg', NULL, 1, NULL, NULL),
(81, 11, 'el-dorado/seaside-suites/EDSS-Resort-Aerial.jpg', NULL, 1, NULL, NULL),
(82, 12, 'sensimar/makarska/sm-1.jpg', NULL, 1, NULL, NULL),
(83, 12, 'sensimar/makarska/sm-2.jpg', NULL, 1, NULL, NULL),
(84, 12, 'sensimar/makarska/sm-3.jpg', NULL, 1, NULL, NULL),
(85, 12, 'sensimar/makarska/sm-4.jpg', NULL, 1, NULL, NULL),
(86, 12, 'sensimar/makarska/sm-5.jpg', NULL, 1, NULL, NULL),
(87, 12, 'sensimar/makarska/sm-6.jpg', NULL, 1, NULL, NULL),
(88, 12, 'sensimar/makarska/sm-7.jpg', NULL, 1, NULL, NULL),
(89, 12, 'sensimar/makarska/sm-8.jpg', NULL, 1, NULL, NULL),
(90, 13, 'sensimar/adriatic-beach-resort/sabr-1.jpg', NULL, 1, NULL, NULL),
(91, 13, 'sensimar/adriatic-beach-resort/sabr-2.jpg', NULL, 1, NULL, NULL),
(92, 13, 'sensimar/adriatic-beach-resort/sabr-4.jpg', NULL, 1, NULL, NULL),
(93, 13, 'sensimar/adriatic-beach-resort/sabr-5.jpg', NULL, 1, NULL, NULL),
(94, 13, 'sensimar/adriatic-beach-resort/sabr-6.jpg', NULL, 1, NULL, NULL),
(95, 13, 'sensimar/adriatic-beach-resort/sabr-7.jpg', NULL, 1, NULL, NULL),
(96, 13, 'sensimar/adriatic-beach-resort/sabr-8.jpg', NULL, 1, NULL, NULL),
(97, 13, 'sensimar/adriatic-beach-resort/sabr-9.jpg', NULL, 1, NULL, NULL),
(98, 13, 'sensimar/adriatic-beach-resort/sabr-10.jpg', NULL, 1, NULL, NULL),
(99, 13, 'sensimar/adriatic-beach-resort/sabr-11.jpg', NULL, 1, NULL, NULL),
(100, 13, 'sensimar/adriatic-beach-resort/sabr-12.jpg', NULL, 1, NULL, NULL),
(101, 14, 'sensimar/kalamota-island-resort/skir-1.jpg', NULL, 1, NULL, NULL),
(102, 14, 'sensimar/kalamota-island-resort/skir-2.jpg', NULL, 1, NULL, NULL),
(103, 14, 'sensimar/kalamota-island-resort/skir-3.jpg', NULL, 1, NULL, NULL),
(104, 14, 'sensimar/kalamota-island-resort/skir-4.jpg', NULL, 1, NULL, NULL),
(105, 14, 'sensimar/kalamota-island-resort/skir-5.jpg', NULL, 1, NULL, NULL),
(106, 14, 'sensimar/kalamota-island-resort/skir-6.jpg', NULL, 1, NULL, NULL),
(107, 14, 'sensimar/kalamota-island-resort/skir-8.jpg', NULL, 1, NULL, NULL),
(108, 14, 'sensimar/kalamota-island-resort/skir-9.jpg', NULL, 1, NULL, NULL),
(109, 14, 'sensimar/kalamota-island-resort/skir-10.jpg', NULL, 1, NULL, NULL),
(110, 15, 'generations/riviera-maya/gallery01.jpg', NULL, 1, NULL, NULL),
(111, 15, 'generations/riviera-maya/gallery02.jpg', NULL, 1, NULL, NULL),
(112, 15, 'generations/riviera-maya/gallery03.jpg', NULL, 1, NULL, NULL),
(113, 15, 'generations/riviera-maya/gallery04.jpg', NULL, 1, NULL, NULL),
(114, 15, 'generations/riviera-maya/gallery05.jpg', NULL, 1, NULL, NULL),
(115, 15, 'generations/riviera-maya/gallery06.jpg', NULL, 1, NULL, NULL),
(116, 15, 'generations/riviera-maya/gallery07.jpg', NULL, 1, NULL, NULL),
(117, 15, 'generations/riviera-maya/gallery08.jpg', NULL, 1, NULL, NULL),
(118, 17, 'allure/chocolat/gallery01.jpg', NULL, 1, NULL, NULL),
(119, 17, 'allure/chocolat/gallery03.jpg', NULL, 1, NULL, NULL),
(120, 17, 'allure/chocolat/gallery06.jpg', NULL, 1, NULL, NULL),
(121, 17, 'allure/chocolat/gallery08.jpg', NULL, 1, NULL, NULL),
(122, 18, 'allure/caramel/gallery01.jpg', NULL, 1, NULL, NULL),
(123, 18, 'allure/caramel/gallery02.jpg', NULL, 1, NULL, NULL),
(124, 18, 'allure/caramel/gallery03.jpg', NULL, 1, NULL, NULL),
(125, 18, 'allure/caramel/gallery04.jpg', NULL, 1, NULL, NULL),
(126, 18, 'allure/caramel/gallery05.jpg', NULL, 1, NULL, NULL),
(127, 18, 'allure/caramel/gallery06.jpg', NULL, 1, NULL, NULL),
(128, 18, 'allure/caramel/gallery07.jpg', NULL, 1, NULL, NULL),
(129, 18, 'allure/caramel/gallery08.jpg', NULL, 1, NULL, NULL),
(130, 19, 'allure/bonbon/gallery01.jpg', NULL, 1, NULL, NULL),
(131, 19, 'allure/bonbon/gallery02.jpg', NULL, 1, NULL, NULL),
(132, 19, 'allure/bonbon/gallery03.jpg', NULL, 1, NULL, NULL),
(133, 19, 'allure/bonbon/gallery04.jpg', NULL, 1, NULL, NULL),
(134, 19, 'allure/bonbon/gallery05.jpg', NULL, 1, NULL, NULL),
(135, 19, 'allure/bonbon/gallery06.jpg', NULL, 1, NULL, NULL),
(136, 19, 'allure/bonbon/gallery07.jpg', NULL, 1, NULL, NULL),
(137, 19, 'allure/bonbon/gallery08.jpg', NULL, 1, NULL, NULL),
(138, 20, 'hidden-beach/beach-resort/HB Aerial A.jpg', NULL, 1, NULL, NULL),
(139, 20, 'hidden-beach/beach-resort/HB Aerial B.jpg', NULL, 1, NULL, NULL),
(140, 20, 'hidden-beach/beach-resort/HB Couple Beach Bed B.jpg', NULL, 1, NULL, NULL),
(141, 20, 'hidden-beach/beach-resort/HB Couple on Bridge A.jpg', NULL, 1, NULL, NULL),
(142, 20, 'hidden-beach/beach-resort/HB Day of the Dead party C.jpg', NULL, 1, NULL, NULL),
(143, 20, 'hidden-beach/beach-resort/HB Day of the Dead Party E.jpg', NULL, 1, NULL, NULL),
(144, 20, 'hidden-beach/beach-resort/HB Day of the Dead Party F.jpg', NULL, 1, NULL, NULL),
(145, 20, 'hidden-beach/beach-resort/HB Dome Room A.jpg', NULL, 1, NULL, NULL),
(146, 20, 'hidden-beach/beach-resort/HB Presidential Beachfront Villa Bedroom.jpg', NULL, 1, NULL, NULL),
(147, 20, 'hidden-beach/beach-resort/HB Presidential Beachfront Villa Living Room.jpg', NULL, 1, NULL, NULL),
(148, 20, 'hidden-beach/beach-resort/HB Presidential Beachfront Villa Restroom.jpg', NULL, 1, NULL, NULL),
(149, 20, 'hidden-beach/beach-resort/HB Swim Up Bar A.jpg', NULL, 1, NULL, NULL),
(150, 20, 'hidden-beach/beach-resort/HB Swim Up Suite A.jpg', NULL, 1, NULL, NULL),
(151, 20, 'hidden-beach/beach-resort/HB Swim Up Suite A.jpg', NULL, 1, NULL, NULL),
(152, 21, 'palafitos/imagen1.png', NULL, 1, NULL, NULL),
(154, 21, 'palafitos/palafitos1.jpeg', NULL, 1, NULL, NULL),
(155, 21, 'palafitos/palafitos2.jpeg', NULL, 1, NULL, NULL),
(156, 21, 'palafitos/palafitos-section1.jpg', NULL, 1, NULL, NULL),
(157, 21, 'palafitos/palafitos-section2.jpg', NULL, 1, NULL, NULL),
(158, 21, 'palafitos/splash2.jpg', NULL, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `idiomas`
--

CREATE TABLE `idiomas` (
  `idIdioma` int(11) NOT NULL,
  `codigo` varchar(10) DEFAULT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `to_dia` varchar(50) DEFAULT NULL,
  `estatus` int(11) DEFAULT NULL,
  `created_at` varchar(255) DEFAULT NULL,
  `updated_at` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `idiomas`
--

INSERT INTO `idiomas` (`idIdioma`, `codigo`, `nombre`, `to_dia`, `estatus`, `created_at`, `updated_at`) VALUES
(1, 'es', 'Español', 'a', 1, NULL, NULL),
(2, 'de', 'Alemán', 'bis', 2, NULL, NULL),
(3, 'en', 'Inglés', 'to', 1, NULL, NULL),
(4, 'fr', 'Francés', 'au', 2, NULL, NULL),
(5, 'it', 'Italiano', 'al', 2, NULL, NULL),
(6, 'sr', 'Serbio', NULL, 2, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `paises`
--

CREATE TABLE `paises` (
  `idPais` int(11) NOT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `estatus` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `paises`
--

INSERT INTO `paises` (`idPais`, `nombre`, `estatus`, `created_at`, `updated_at`) VALUES
(1, 'México', 1, NULL, NULL),
(2, 'Italy', 1, NULL, NULL),
(3, 'France', 1, NULL, NULL),
(4, 'Spain', 1, NULL, NULL),
(5, 'USA', 1, NULL, NULL),
(6, 'Australia', 1, NULL, NULL),
(7, 'Argentina', 1, NULL, NULL),
(8, 'New Zealand', 1, NULL, NULL),
(9, 'Chile', 1, NULL, NULL),
(10, 'Australia & South Africa', 1, NULL, NULL),
(11, NULL, NULL, NULL, NULL),
(12, 'Germany', 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `permissions`
--

CREATE TABLE `permissions` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `display_name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `heredado` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `display_name`, `description`, `heredado`, `created_at`, `updated_at`) VALUES
(1, 'index', 'index', NULL, 0, NULL, NULL),
(2, 'checkin_list', 'Lista de checkins', NULL, 1, NULL, NULL),
(3, 'request_list', 'Lista de solicitudes', NULL, 1, NULL, NULL),
(4, 'actividad_list', 'Lista de actividades', NULL, 1, NULL, NULL),
(5, 'actividad_new', 'Nueva actividad', NULL, 1, NULL, NULL),
(6, 'actividad_update', 'Actualizar actividad', NULL, 1, NULL, NULL),
(7, 'actividad_delete', 'Eliminar actividad', NULL, 1, NULL, NULL),
(8, 'itinerario_list', 'Lista de itinerario', NULL, 1, NULL, NULL),
(9, 'itinerario_new', 'Nuevo itinerario', NULL, 1, NULL, NULL),
(10, 'itinerario_delete', 'Eliminar itinerario', NULL, 1, NULL, NULL),
(11, 'platillo_list', 'Lista de platillos', NULL, 1, NULL, NULL),
(12, 'platillo_new', 'Nuevo platillo', NULL, 1, NULL, NULL),
(13, 'platillo_update', 'Actualizar platillo', NULL, 1, NULL, NULL),
(14, 'platillo_delete', 'Eliminar platillo', NULL, 1, NULL, NULL),
(15, 'menu_list', 'Lista de menus', NULL, 1, NULL, NULL),
(16, 'menu_new', 'Crear menu', NULL, 1, NULL, NULL),
(17, 'menu_update', 'Actualizar menu', NULL, 1, NULL, NULL),
(18, 'menu_delete', 'Eliminar menu', NULL, 1, NULL, NULL),
(19, 'restaurante_list', 'Lista de restaurantes', NULL, 1, NULL, NULL),
(20, 'restaurante_new', 'Nuevo restaurante', NULL, 1, NULL, NULL),
(21, 'restaurante_update', 'Actualizar restaurante', NULL, 1, NULL, NULL),
(22, 'restaurante_delete', 'Eliminar restaurante', NULL, 1, NULL, NULL),
(23, 'spa_list', 'Lista de SPA´s', NULL, 1, NULL, NULL),
(24, 'spa_new', 'Crear SPA', NULL, 1, NULL, NULL),
(25, 'spa_update', 'Actualizar SPA', NULL, 1, NULL, NULL),
(26, 'spa_delete', 'Eliminar SPA', NULL, 1, NULL, NULL),
(27, 'hoteles_list', 'Lista de hoteles', NULL, 1, NULL, NULL),
(28, 'hoteles_new', 'Crear hotel', NULL, 1, NULL, NULL),
(29, 'hoteles_update', 'Actualizar hotel', NULL, 1, NULL, NULL),
(30, 'hoteles_delete', 'Eliminar hotel', NULL, 1, NULL, NULL),
(31, 'lobby_list', 'Lista de lobby´s', NULL, 1, NULL, NULL),
(32, 'lobby_new', 'Nuevo lobby', NULL, 1, NULL, NULL),
(33, 'lobby_update', 'Actualizar lobby', NULL, 1, NULL, NULL),
(34, 'lobby_delete', 'Eliminar lobby', NULL, 1, NULL, NULL),
(35, 'usuario_list', 'Lista de usuarios', NULL, 1, NULL, NULL),
(36, 'usuario_new', 'Crear usuario', NULL, 1, NULL, NULL),
(37, 'usuario_update', 'Actualizar usuario', NULL, 1, NULL, NULL),
(38, 'usuario_delete', 'Eliminar usuario', NULL, 1, NULL, NULL),
(39, 'promo_list', 'Lista de promos', NULL, 1, NULL, NULL),
(40, 'promo_new', 'Crear promo', NULL, 1, NULL, NULL),
(41, 'promo_update', 'Actualizar Promo', NULL, 1, NULL, NULL),
(42, 'vip_users_list', 'Lista de usuarios VIP', NULL, 1, NULL, NULL),
(43, 'new_vipusers', 'Nuevos usuarios VIP', NULL, 1, NULL, NULL),
(44, 'precheckin_list', 'Lista de Precheckins', NULL, 1, NULL, NULL),
(45, 'precheckin_new', 'Nuevo Precheckin', NULL, 1, NULL, NULL),
(46, 'precheckin_update', 'Actualizar Precheckin', NULL, 1, NULL, NULL),
(47, 'precheckin_delete', 'Eliminar un precheckin', NULL, 1, NULL, NULL),
(48, 'new_admin_user', 'Crear usuarios Admin e Invitado VIP', NULL, 1, NULL, NULL),
(49, 'vino_list', 'Lista de vinos', NULL, NULL, NULL, NULL),
(50, 'ventasvinos', 'Lista de ventas', NULL, NULL, NULL, NULL),
(51, 'servicios', 'Lista de servicios', NULL, NULL, NULL, NULL),
(52, 'habitaciones', 'Lista de habitaciones', NULL, NULL, NULL, NULL),
(53, 'precheckin', 'Lista de prechekin', NULL, NULL, NULL, NULL),
(54, 'roomservices', 'Lista de servicios de habitación', NULL, NULL, NULL, NULL),
(55, 'eventosculinarios', 'Lista de eventos culinarios', NULL, NULL, NULL, NULL),
(56, 'cenas', 'Lisat de cenas', NULL, NULL, NULL, NULL),
(57, 'promotions', 'Lista de promociones', NULL, NULL, NULL, NULL),
(58, 'promovalida', 'Lista de promociones a validar', NULL, NULL, NULL, NULL),
(61, 'starbuks_list', 'Lista', NULL, NULL, NULL, NULL),
(62, 'starbuks_new', 'Nuevo', NULL, NULL, NULL, NULL),
(63, 'starbucks_update', 'Update', NULL, NULL, NULL, NULL),
(64, 'starbuks_delete', 'Delete', NULL, NULL, NULL, NULL),
(65, 'car_list', 'Lista car', NULL, NULL, NULL, NULL),
(66, 'car_new', 'Nuevo car', NULL, NULL, NULL, NULL),
(67, 'car_update', 'Actualizar car', NULL, NULL, NULL, NULL),
(68, 'car_delete', 'Eliminar car', NULL, NULL, NULL, NULL),
(69, 'guestservice_list', 'Lista de guest service', NULL, NULL, NULL, NULL),
(70, 'guestservice_create', 'crear de guest service', NULL, NULL, NULL, NULL),
(71, 'guestservice_update', 'Update de guest service', NULL, NULL, NULL, NULL),
(72, 'guestservice_delete', 'Delete guest service', NULL, NULL, NULL, NULL),
(73, 'ayb_list', 'Lista Alimentos y Bebidas', NULL, NULL, NULL, NULL),
(74, 'ourrecomendation_list', 'Lista Our Recomendation', NULL, NULL, NULL, NULL),
(75, 'promo_approval', 'Aprobar nuevas promos', NULL, NULL, NULL, NULL),
(76, 'tours_list', 'Tours List', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `permission_role`
--

CREATE TABLE `permission_role` (
  `permission_id` int(10) UNSIGNED NOT NULL,
  `role_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `permission_role`
--

INSERT INTO `permission_role` (`permission_id`, `role_id`) VALUES
(1, 1),
(1, 2),
(1, 3),
(1, 4),
(1, 5),
(1, 6),
(1, 7),
(1, 8),
(1, 9),
(1, 10),
(1, 11),
(2, 1),
(2, 2),
(2, 5),
(2, 10),
(3, 1),
(3, 2),
(3, 5),
(3, 10),
(4, 2),
(4, 10),
(5, 2),
(5, 10),
(6, 2),
(6, 10),
(7, 2),
(7, 10),
(8, 2),
(8, 10),
(9, 2),
(9, 10),
(10, 2),
(10, 10),
(11, 2),
(11, 4),
(11, 10),
(12, 2),
(12, 4),
(12, 10),
(13, 2),
(13, 4),
(13, 10),
(14, 2),
(14, 4),
(14, 10),
(15, 2),
(15, 4),
(15, 10),
(16, 2),
(16, 4),
(16, 10),
(17, 2),
(17, 4),
(17, 10),
(18, 2),
(18, 4),
(18, 10),
(19, 2),
(19, 4),
(19, 10),
(20, 2),
(20, 4),
(20, 10),
(21, 2),
(21, 4),
(21, 10),
(22, 2),
(22, 4),
(22, 10),
(23, 2),
(23, 3),
(23, 8),
(23, 10),
(24, 2),
(24, 3),
(24, 8),
(24, 10),
(25, 2),
(25, 3),
(25, 8),
(25, 10),
(26, 2),
(26, 3),
(26, 8),
(26, 10),
(27, 2),
(27, 5),
(27, 10),
(28, 2),
(28, 5),
(28, 10),
(29, 2),
(29, 5),
(29, 10),
(30, 2),
(30, 5),
(30, 10),
(31, 2),
(31, 5),
(31, 10),
(32, 2),
(32, 5),
(32, 10),
(33, 2),
(33, 5),
(33, 10),
(34, 2),
(34, 5),
(34, 10),
(35, 2),
(35, 10),
(36, 2),
(36, 10),
(37, 2),
(37, 10),
(38, 2),
(38, 10),
(39, 2),
(39, 3),
(39, 4),
(39, 7),
(39, 10),
(39, 17),
(40, 2),
(40, 3),
(40, 4),
(40, 7),
(40, 10),
(40, 17),
(41, 2),
(41, 3),
(41, 4),
(41, 7),
(41, 10),
(41, 17),
(42, 2),
(42, 10),
(43, 2),
(43, 10),
(44, 1),
(45, 1),
(46, 1),
(47, 1),
(48, 2),
(49, 2),
(49, 4),
(50, 2),
(50, 4),
(51, 2),
(52, 2),
(53, 1),
(53, 2),
(53, 12),
(54, 2),
(55, 2),
(56, 2),
(57, 2),
(57, 17),
(58, 2),
(61, 2),
(62, 2),
(63, 2),
(64, 2),
(65, 2),
(66, 2),
(67, 2),
(68, 2),
(69, 2),
(70, 2),
(71, 2),
(72, 2),
(73, 2),
(74, 2),
(75, 2),
(76, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

CREATE TABLE `roles` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `display_name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `roles`
--

INSERT INTO `roles` (`id`, `name`, `display_name`, `description`, `created_at`, `updated_at`) VALUES
(1, 'Concierge', 'Concierge', NULL, NULL, NULL),
(2, 'Admin', 'Admin', NULL, NULL, NULL),
(3, 'Vendedor SPA', 'Vendedor SPA', NULL, NULL, NULL),
(4, 'Gerente A&B', 'Gerente A&B', NULL, NULL, NULL),
(5, 'Recepción', 'Recepción', NULL, NULL, NULL),
(6, 'Vendedor Tours', 'Vendedor Tours', NULL, NULL, NULL),
(7, 'Exotic', 'Exotic', NULL, NULL, NULL),
(8, 'Gerente SPA', 'Gerente SPA', NULL, NULL, NULL),
(9, 'Mayordomo', 'Mayordomo', NULL, NULL, NULL),
(10, 'Chief Village', 'Chief Village', NULL, NULL, NULL),
(11, 'Invitado VIP', 'Invitado VIP', NULL, NULL, NULL),
(12, 'Mayordomo Extra', 'Mayordomo Extra', NULL, NULL, NULL),
(13, 'Oculta datos', 'Oculta datos', NULL, NULL, NULL),
(15, 'Le Chique', 'Le Chique', NULL, NULL, NULL),
(17, 'encargado_promos', 'Encargado Promos', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `role_user`
--

CREATE TABLE `role_user` (
  `user_id` int(10) UNSIGNED NOT NULL,
  `role_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `role_user`
--

INSERT INTO `role_user` (`user_id`, `role_id`) VALUES
(1, 13),
(2, 1),
(2, 2),
(2, 10),
(2, 11),
(2, 12),
(3, 2),
(3, 10),
(4, 1),
(4, 2),
(4, 10),
(4, 12),
(9, 2),
(11, 9),
(12, 9),
(13, 9),
(14, 9),
(15, 9),
(16, 9),
(17, 9),
(18, 11),
(19, 11),
(20, 11),
(21, 11),
(22, 11),
(23, 11),
(24, 11),
(25, 11),
(26, 11),
(27, 11),
(28, 11),
(29, 11),
(30, 11),
(37, 9),
(38, 9),
(40, 1),
(40, 2),
(40, 11),
(40, 12),
(41, 2),
(41, 9),
(41, 11),
(42, 11),
(43, 11),
(44, 11),
(45, 11),
(46, 7),
(47, 17),
(48, 17),
(49, 17),
(50, 9),
(51, 11),
(52, 11),
(53, 11),
(54, 11),
(55, 11),
(56, 7),
(56, 11);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `isVip` int(11) DEFAULT 0,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `img` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `linkVerifica` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `verificado` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `linkRecupera` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `solRecupera` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fechaRecupera` datetime DEFAULT NULL,
  `usr_baja` int(11) DEFAULT NULL,
  `estatus` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `user`, `password`, `isVip`, `remember_token`, `img`, `linkVerifica`, `verificado`, `linkRecupera`, `solRecupera`, `fechaRecupera`, `usr_baja`, `estatus`, `created_at`, `updated_at`) VALUES
(1, 'Guest Butler', 'butler@gmail.com', 'butler1', 'eyJpdiI6IlpiZzgwOWlDQ1hJZWdPbHU1U2tsV1E9PSIsInZhbHVlIjoiT3hZWUlWcWl1U3ZsZnNmZmxcLytzcFE9PSIsIm1hYyI6IjJmMDhkMmEyNjc1OWMyYzE3YzlmYWIzY2VlZjYwYTU2ODliNjQ5YTE5OTU2Njg0OWM1M2Y2ZTNkYzc2ODU2YzAifQ=', 0, 'SmtnfraEQsf3mh50d3ubJq8znzciiJ1naTjNNgTXe1T2WeMRfixIkAMcwwW7', 'default_user.png', '1', '1', NULL, '0', NULL, NULL, 0, NULL, '2019-06-27 17:05:34'),
(41, 'Visitor', 'visitor@gmail.com', 'visitor', 'eyJpdiI6InFJM05hc1wvSGM1SHpCeWNSM3FHdmpBPT0iLCJ2YWx1ZSI6IkhmbjFYazNVRVhKXC9XMWlxVU1rSW53PT0iLCJtYWMiOiJmOTIwNmVhYzQxMzU0OGMxOTg1NGI4MjljNzMwYzdjMzY1OTRhMmE0MmUwMmFmODMwMWYwNjAwMTE2NGJhYTIwIn0=', 1, NULL, 'default_user.png', '1', '1', NULL, '0', NULL, NULL, 1, '2018-12-22 14:51:49', '2018-12-22 15:04:59');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `dias`
--
ALTER TABLE `dias`
  ADD PRIMARY KEY (`idDia`);

--
-- Indices de la tabla `dias_idioma`
--
ALTER TABLE `dias_idioma`
  ADD PRIMARY KEY (`idDiaIdioma`);

--
-- Indices de la tabla `hoteles`
--
ALTER TABLE `hoteles`
  ADD PRIMARY KEY (`idHotel`);

--
-- Indices de la tabla `hoteles_idioma`
--
ALTER TABLE `hoteles_idioma`
  ADD PRIMARY KEY (`idHoteleIdioma`);

--
-- Indices de la tabla `hotel_caracteristicas`
--
ALTER TABLE `hotel_caracteristicas`
  ADD PRIMARY KEY (`idHotelCaracteristicas`);

--
-- Indices de la tabla `hotel_caracteristicas_idioma`
--
ALTER TABLE `hotel_caracteristicas_idioma`
  ADD PRIMARY KEY (`idHotelCaracIdioma`);

--
-- Indices de la tabla `hotel_fotos`
--
ALTER TABLE `hotel_fotos`
  ADD PRIMARY KEY (`idHotelFotos`);

--
-- Indices de la tabla `idiomas`
--
ALTER TABLE `idiomas`
  ADD PRIMARY KEY (`idIdioma`);

--
-- Indices de la tabla `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `paises`
--
ALTER TABLE `paises`
  ADD PRIMARY KEY (`idPais`);

--
-- Indices de la tabla `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `permissions_name_unique` (`name`);

--
-- Indices de la tabla `permission_role`
--
ALTER TABLE `permission_role`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `permission_role_role_id_foreign` (`role_id`);

--
-- Indices de la tabla `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_unique` (`name`);

--
-- Indices de la tabla `role_user`
--
ALTER TABLE `role_user`
  ADD PRIMARY KEY (`user_id`,`role_id`),
  ADD KEY `role_user_role_id_foreign` (`role_id`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_user_unique` (`user`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `dias`
--
ALTER TABLE `dias`
  MODIFY `idDia` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `dias_idioma`
--
ALTER TABLE `dias_idioma`
  MODIFY `idDiaIdioma` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT de la tabla `hoteles`
--
ALTER TABLE `hoteles`
  MODIFY `idHotel` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT de la tabla `hoteles_idioma`
--
ALTER TABLE `hoteles_idioma`
  MODIFY `idHoteleIdioma` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT de la tabla `hotel_caracteristicas`
--
ALTER TABLE `hotel_caracteristicas`
  MODIFY `idHotelCaracteristicas` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=89;

--
-- AUTO_INCREMENT de la tabla `hotel_caracteristicas_idioma`
--
ALTER TABLE `hotel_caracteristicas_idioma`
  MODIFY `idHotelCaracIdioma` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `hotel_fotos`
--
ALTER TABLE `hotel_fotos`
  MODIFY `idHotelFotos` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=159;

--
-- AUTO_INCREMENT de la tabla `idiomas`
--
ALTER TABLE `idiomas`
  MODIFY `idIdioma` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `paises`
--
ALTER TABLE `paises`
  MODIFY `idPais` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=77;

--
-- AUTO_INCREMENT de la tabla `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `permission_role`
--
ALTER TABLE `permission_role`
  ADD CONSTRAINT `permission_role_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `permission_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `role_user`
--
ALTER TABLE `role_user`
  ADD CONSTRAINT `role_user_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `role_user_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
