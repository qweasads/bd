CREATE DATABASE  IF NOT EXISTS `mydb` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `mydb`;
-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: mydb
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
-- Table structure for table `addresses`
--

DROP TABLE IF EXISTS `addresses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `addresses` (
  `id` int NOT NULL AUTO_INCREMENT,
  `city` varchar(250) NOT NULL,
  `street` varchar(250) NOT NULL,
  `build` varchar(32) NOT NULL,
  `customer_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_address_customers_idx` (`customer_id`),
  CONSTRAINT `fk_address_customers` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `addresses`
--

LOCK TABLES `addresses` WRITE;
/*!40000 ALTER TABLE `addresses` DISABLE KEYS */;
INSERT INTO `addresses` VALUES (1,'Москва','ул. Тверская','10',1),(2,'Санкт-Петербург','пр. Невский','20',2),(3,'Екатеринбург','ул. Ленина','30',3),(4,'Новосибирск','ул. Кирова','40',4),(5,'Краснодар','ул. Пушкина','50',5),(6,'Москва','Ленинградский проспект','10',1),(7,'Санкт-Петербург','Невский проспект','25',2),(8,'Екатеринбург','Пушкинская улица','5',3);
/*!40000 ALTER TABLE `addresses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customers` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(250) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `contact` varchar(250) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--
SET @customers_count = 0;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `customers_counter` BEFORE INSERT ON `customers` FOR EACH ROW SET @customers_count := @customers_count + 1 */;;
DELIMITER ;
LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` VALUES (1,'Иванов Иван Иванович','79363065438','tohandheithelw2@web.de'),(2,'Смирнова Мария Петровна','79585233785','kioknowbikothal6u@web.de'),(3,'Петров Александр Александрович','79027106534','hiaprotkomies52@web.de'),(4,'Сидорова Екатерина Дмитриевна','79026617058','riopuhachitu3u@web.de'),(5,'Лебедев Дмитрий Алексеевич','79363337237','dumbleahincros6d@web.de'),(6,'Иванов Петр Сергеевич','79366337297','enlepitonai4@web.de'),(7,'Смирнова Елена Викторовна','79368337221','olossugidaig4@web.de'),(8,'Козлов Андрей Михайлович','79363937254','soldigekiodj2@web.de'),(9,'Харченко Сергей Александрович','79182171897','raportpeier8k@web.de'),(10,'Казанцев Олег Александрович','79182287542','zanatoshiol5i@web.de'),(11,'Назаренко Владислав Петрович','38050769623','carbatchzemefaid0@web.de'),(12,'Порох Павел Александрович','79056073478','crosenmuravioz3@web.de');
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `goods`
--

DROP TABLE IF EXISTS `goods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `goods` (
  `id` int NOT NULL,
  `name` varchar(100) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `optprice` decimal(10,2) NOT NULL,
  `info` text NOT NULL,
  `amount` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `goods`
--

LOCK TABLES `goods` WRITE;
/*!40000 ALTER TABLE `goods` DISABLE KEYS */;
INSERT INTO `goods` VALUES (1,'Ноутбук HP Pavilion',45000.00,42000.00,'Ноутбук с процессором Intel Core i5 и ОЗУ 8 ГБ',10),(2,'Смартфон Samsung Galaxy S21',79900.00,74900.00,'Смартфон с AMOLED-экраном и камерой 108 Мп',15),(3,'Кофеварка DeLonghi Dedica',9990.00,8990.00,'Компактная кофеварка для настоящего эспрессо',20),(4,'Планшет Apple iPad Pro',69900.00,64900.00,'Планшет с процессором M1 и Liquid Retina дисплеем',12),(5,'Умные часы Huawei Watch GT 2',18990.00,16990.00,'Спортивные умные часы с долгим временем автономной работы',8),(6,'Холодильник Bosch X100',47600.00,46000.00,'Холодильник с энергопотреблением класса A+++',10),(7,'Стиральная машина Samsung S2000',70000.00,65000.00,'Стиральная машина с загрузкой до 7 кг',15),(8,'Пылесос Dyson V10',35000.00,33000.00,'Беспроводной пылесос с технологией циклона',20);
/*!40000 ALTER TABLE `goods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_details`
--

DROP TABLE IF EXISTS `order_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_details` (
  `amount` int NOT NULL,
  `order_id` int NOT NULL,
  `good_id` int NOT NULL,
  PRIMARY KEY (`order_id`,`good_id`),
  KEY `fk_order_detalis_goods1_idx` (`good_id`),
  CONSTRAINT `fk_order_detalis_goods1` FOREIGN KEY (`good_id`) REFERENCES `goods` (`id`),
  CONSTRAINT `fk_order_detalis_orders1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_details`
--

LOCK TABLES `order_details` WRITE;
/*!40000 ALTER TABLE `order_details` DISABLE KEYS */;
INSERT INTO `order_details` VALUES (2,1,1),(1,2,3),(3,3,2),(2,4,4),(1,5,5),(4,6,4),(2,7,3),(11,8,2);
/*!40000 ALTER TABLE `order_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `id` int NOT NULL,
  `date_time` datetime NOT NULL,
  `discount` float NOT NULL,
  `customer_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_orders_customers1_idx` (`customer_id`),
  CONSTRAINT `fk_orders_customers1` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,'2024-01-30 10:15:00',0,1),(2,'2024-05-28 14:30:00',0,2),(3,'2024-05-29 16:45:00',0,3),(4,'2024-05-27 11:30:00',0,4),(5,'2024-05-31 09:00:00',0,5),(6,'2024-05-28 12:00:00',0,1),(7,'2024-05-29 15:30:00',0,2),(8,'2024-05-30 10:45:00',0,3);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `orders_with_total_price`
--

DROP TABLE IF EXISTS `orders_with_total_price`;
/*!50001 DROP VIEW IF EXISTS `orders_with_total_price`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `orders_with_total_price` AS SELECT 
 1 AS `id`,
 1 AS `customer_id`,
 1 AS `date_time`,
 1 AS `total_price`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping events for database 'mydb'
--

--
-- Dumping routines for database 'mydb'
--
/*!50003 DROP FUNCTION IF EXISTS `calculate_order_total` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `calculate_order_total`(order_id INT) RETURNS int
    DETERMINISTIC
BEGIN
    DECLARE total_amount INT;

    SELECT SUM(IF(od.amount >= 10, g.optprice, g.price) * od.amount)
    INTO total_amount
    FROM order_details od
    JOIN goods g ON od.good_id = g.id
    WHERE od.order_id = order_id;

    RETURN total_amount;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `add_customer` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `add_customer`(new_name VARCHAR(250), new_phone VARCHAR(20), new_contact VARCHAR(250))
BEGIN
    DECLARE new_customer_id INT;
    
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
    END;
    
    START TRANSACTION;
    
    INSERT INTO customers (name, phone, contact)
    VALUES (new_name, new_phone, new_contact);
    
    SET new_customer_id = LAST_INSERT_ID();
    
    COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_last_month_revenue` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_last_month_revenue`()
BEGIN
  SELECT
    SUM(order_details.amount * goods.price) AS last_month_revenue
  FROM
    orders
  LEFT JOIN
    order_details ON order_details.order_id = orders.id
  LEFT JOIN 
    goods ON goods.id = order_details.good_id
  WHERE
    orders.date_time >= DATE_SUB(NOW(), INTERVAL 1 MONTH);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `orders_with_total_price`
--

/*!50001 DROP VIEW IF EXISTS `orders_with_total_price`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `orders_with_total_price` AS select `orders`.`id` AS `id`,`orders`.`customer_id` AS `customer_id`,`orders`.`date_time` AS `date_time`,sum((`order_details`.`amount` * if((`order_details`.`amount` >= 10),`goods`.`optprice`,`goods`.`price`))) AS `total_price` from ((`orders` left join `order_details` on((`order_details`.`order_id` = `orders`.`id`))) left join `goods` on((`goods`.`id` = `order_details`.`good_id`))) group by `orders`.`id` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-05-31  2:33:34