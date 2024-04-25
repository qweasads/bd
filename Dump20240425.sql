-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: sells1
-- ------------------------------------------------------
-- Server version	8.0.36

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `address`
--

DROP TABLE IF EXISTS `address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `address` (
  `a_id` int NOT NULL AUTO_INCREMENT,
  `a_city` varchar(250) NOT NULL,
  `a_street` varchar(250) NOT NULL,
  `a_build` int NOT NULL,
  PRIMARY KEY (`a_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `address`
--

LOCK TABLES `address` WRITE;
/*!40000 ALTER TABLE `address` DISABLE KEYS */;
INSERT INTO `address` VALUES (1,'Москва','Волгоградский пр-т ',42),(2,'Москва','Чагинская ',4),(3,'Москва','Красноворотский проезд ',3),(4,'Москва','пр-д Энтузиастов ',19),(5,'Гудермес','Малиновая ',47);
/*!40000 ALTER TABLE `address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customers` (
  `c_id` int NOT NULL AUTO_INCREMENT,
  `c_name` varchar(250) NOT NULL,
  `c_address_id` int NOT NULL,
  `c_phone` varchar(20) NOT NULL,
  `c_contact` varchar(250) NOT NULL,
  PRIMARY KEY (`c_id`),
  KEY `c_address_id` (`c_address_id`),
  CONSTRAINT `customers_ibfk_1` FOREIGN KEY (`c_address_id`) REFERENCES `address` (`a_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` VALUES (1,'ООО \"МЕДПЛАНТ\"',1,'+7 (986) 877-01-75','Дарова Ульяна Тарасовна'),(2,'ASP-group',2,'+7 (986) 877-01-74','Соболь Горислава Виталиевна'),(3,'ООО \"КРИСТАЛЛ ТРЕЙД\"',3,'+7 (906) 370-21-36','Зеленов Сократ Владимирович'),(4,'ООО «Русэлектрокаб»',4,'+7 (927) 364-39-44','Сафарова Муза Борисовна'),(5,'ИП Миланова МГ',5,'+7 (948) 586-97-45','Пономарёв Пимен Вячеславович');
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `documents`
--

DROP TABLE IF EXISTS `documents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `documents` (
  `d_id` int NOT NULL AUTO_INCREMENT,
  `d_date` date DEFAULT (curdate()),
  `d_discount` double DEFAULT NULL,
  `d_customer_ID` int NOT NULL,
  PRIMARY KEY (`d_id`),
  KEY `d_customer_ID` (`d_customer_ID`),
  CONSTRAINT `documents_ibfk_1` FOREIGN KEY (`d_customer_ID`) REFERENCES `customers` (`c_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `documents`
--

LOCK TABLES `documents` WRITE;
/*!40000 ALTER TABLE `documents` DISABLE KEYS */;
INSERT INTO `documents` VALUES (1,'2023-12-20',NULL,1),(2,'2023-12-20',NULL,2),(3,'2023-12-21',NULL,1),(4,'2024-04-25',NULL,3),(5,'2024-04-25',NULL,4),(6,'2024-04-25',NULL,5);
/*!40000 ALTER TABLE `documents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `documents_goods`
--

DROP TABLE IF EXISTS `documents_goods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `documents_goods` (
  `d_id` int NOT NULL,
  `g_id` int NOT NULL,
  `g_count` int NOT NULL,
  PRIMARY KEY (`d_id`,`g_id`),
  KEY `g_id` (`g_id`),
  CONSTRAINT `documents_goods_ibfk_1` FOREIGN KEY (`d_id`) REFERENCES `documents` (`d_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `documents_goods_ibfk_2` FOREIGN KEY (`g_id`) REFERENCES `goods` (`g_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `documents_goods`
--

LOCK TABLES `documents_goods` WRITE;
/*!40000 ALTER TABLE `documents_goods` DISABLE KEYS */;
INSERT INTO `documents_goods` VALUES (1,1,100),(1,2,50),(2,3,1),(3,1,20),(3,2,20),(4,4,50),(4,5,50),(5,3,1),(6,1,1),(6,2,1),(6,3,1),(6,4,1),(6,5,1);
/*!40000 ALTER TABLE `documents_goods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `goods`
--

DROP TABLE IF EXISTS `goods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `goods` (
  `g_id` int NOT NULL AUTO_INCREMENT,
  `g_name` varchar(100) NOT NULL,
  `g_price` decimal(10,2) NOT NULL,
  `g_oPrice` decimal(10,2) NOT NULL,
  `g_info` text NOT NULL,
  `g_count` int NOT NULL,
  PRIMARY KEY (`g_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `goods`
--

LOCK TABLES `goods` WRITE;
/*!40000 ALTER TABLE `goods` DISABLE KEYS */;
INSERT INTO `goods` VALUES (1,'LED телевизор 32\" Hi VHIX-32H181MSY',8899.00,5300.00,'LED-телевизор 32\" Hi VHIX-32H181MSY с оптимальной диагональю поддерживает разрешение HD-Ready. Это позволяет наслаждаться качественным и детализированным изображением. Модель имеет тонкие рамки, что обеспечивает широкий угол обзора. Встроенный тюнер принимает цифровые сигналы распространенных форматов и обеспечивает эффективное шумоподавление. Матовое покрытие экрана позволяет смотреть программы при ярком освещении. Воспроизводить видеоконтент с различных носителей информации можно благодаря наличию портов USB и HDMI. Модель разработана на базе операционной системы Яндекс.ТВ, что позволяет управлять устройством посредством голосовых команд.',500),(2,'Ultra HD (4K) LED телевизор 55\" Grundig 55 GFU 7800B',53999.00,32000.00,'Ultra HD (4K) LED-телевизор 55\" Grundig 55 GFU 7800B имеет тонкую рамку и широкий угол обзора. Благодаря этому смотреть фильмы и передачи можно с разного ракурса без риска появления искажений. LED-подсветка обеспечивает оптимальный уровень яркости и контрастности изображения. Технология масштабирования повышает детализацию. Система цифрового шумоподавления обеспечивает качественное изображение даже при слабом сигнале вещания. Встроенные динамики позволяют полностью погрузиться в происходящее на экране.',1000),(3,'Антенна Denn DAA235',1999.00,1200.00,'Антенна DENN DAA235 подходит для установки в комнате. Модель способна принимать сигнал телестанций в диапазонах аналогового вещания UHF и VHF, в которых происходит трансляция наиболее популярных каналов в России. Настроив антенну, можно смотреть любимые передачи на «Первом», «СТС», «Пятнице» и «Рен-ТВ». Устройство также поддерживает стандарт цифрового вещания DVB-T и радио DAB с высокой помехозащищенностью в зоне уверенного приема.',1000),(4,'Смарт-часы Samsung Galaxy Watch4 40mm розовое золото (SM-R860N)',13999.00,11000.00,'	Геомагнитный (цифровой компас), Пульсоксиметр (уровня кислорода в крови), Пульсометр (сердечного ритма), Атмосферного давления (барометрический высотомер), Акселерометр, Шагомер, Датчик движения, Тонометр (артериального давления), Гироскоп',1000),(5,'Смарт-часы Samsung Galaxy Watch 4 46mm Black (SM-R890N)',19999.00,16000.00,'Смарт-часы Samsung Galaxy Watch4 46mm Black (SM-R890N) оптимальны для отслеживания физической активности и сердечного ритма во время тренировок. Модель можно использовать для мониторинга параметров сна и отдыха. Устройство удобно для подсчета калорий, пройденного расстояния. Для этого в конструкции есть специальные датчики. Для отслеживания местоположения можно применять функцию спутниковой навигации ГЛОНАСС. Super AMOLED-дисплей обеспечивает качественное отображение данных и настроек при любом освещении. Для регулирования параметров работы достаточно легкого прикосновения к соответствующему значку на экране.',1000);
/*!40000 ALTER TABLE `goods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'sells1'
--

--
-- Dumping routines for database 'sells1'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-04-25 13:23:18
