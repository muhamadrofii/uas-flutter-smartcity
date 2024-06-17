-- MySQL dump 10.13  Distrib 8.0.30, for Win64 (x86_64)
--
-- Host: localhost    Database: bank_sampah
-- ------------------------------------------------------
-- Server version	8.0.30

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `crudsampah`
--

DROP TABLE IF EXISTS `crudsampah`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `crudsampah` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `nama` varchar(100) NOT NULL,
  `alamat` text NOT NULL,
  `jenis_sampah` varchar(50) NOT NULL,
  `berak_kg` float NOT NULL,
  `tanggal` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `email` varchar(255) NOT NULL,
  `latitude` decimal(10,8) NOT NULL,
  `longitude` decimal(11,8) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `crudsampah`
--

LOCK TABLES `crudsampah` WRITE;
/*!40000 ALTER TABLE `crudsampah` DISABLE KEYS */;
INSERT INTO `crudsampah` VALUES (5,'John Doe','Jl. Merdeka No. 10, Jakarta','Plastik',2.5,'2024-06-08 06:23:06','xample.com',0.00000000,0.00000000),(6,'Some Name','Some Address','Plastic',5.5,'2024-06-08 12:15:22','xample.com',-6.20000000,106.81666600),(7,'John Doe','Jl. Merdeka No. 10, Jakarta','Plastik',2.5,'2024-06-09 15:47:51','xample.com',-6.17511000,106.82715300),(8,'John Doe','Jl. Merdeka No. 10, Jakarta','Logam',2.5,'2024-06-09 15:56:31','xample.com',-6.17511000,106.82715300),(9,'John Doe','Jl. Merdeka No. 10, Jakarta','hina',2.5,'2024-06-09 15:57:54','xample.com',-6.17511000,106.82715300),(10,'Budi Santoso','Jl. Merdeka No. 123, Jakarta','Plastik',15,'2024-06-13 04:36:00','xample.com',-6.20880000,106.84560000),(11,'Budi Santoso','Jl. Merdeka No. 123, Jakarta','logam',15,'2024-06-13 04:55:23','xample.com',-6.20880000,106.84560000),(12,'Budi Santoso','Jl. Merdeka No. 123, Jakarta','logam',15,'2024-06-13 05:15:25','xample.com',-6.20880000,106.84560000),(13,'Budi Santoso','Jl. Merdeka No. 123, Jakarta','kayu',15,'2024-06-13 05:15:34','xample.com',-6.20880000,106.84560000),(14,'Budi Santoso','Jl. Merdeka No. 123, Jakarta','yuda',15,'2024-06-13 05:15:46','xample.com',-6.20880000,106.84560000),(15,'Budi Santoso','Jl. Merdeka No. 123, Jakarta','yuuii',16,'2024-06-13 05:28:01','xample.com',-6.20890000,109.33360000),(16,'Budi Santoso','Jl. Merdeka No. 123, Jakarta','yuuii',16,'2024-06-13 05:28:33','xample.com',-6.20890000,109.33360000),(17,'Budi Santoso','Jl. Merdeka No. 123, Jakarta','yuuii',165,'2024-06-13 05:29:07','xample.com',-6.20890000,109.33360000),(18,'Budi Santoso','Jl. Merdeka No. 123, Jakarta','satt',165,'2024-06-13 05:29:45','xample.com',-6.20890000,109.33360000),(19,'so','besuki','organik',200,'2024-06-13 07:04:02','xample.com',55.00000000,52.00000000),(20,'Budi Santoso','Jl. Merdeka No. 123, Jakarta','yuda',15,'2024-06-13 07:59:08','xample.com',-6.20880000,106.84560000),(21,'jordy','Jl. A. Yani','Besi',5,'2024-06-14 14:20:06','contoh@gmail.com',-7.17238000,111.66500000),(22,'jordy','Jl. A. Yani','besi',5,'2024-06-14 14:56:01','contoh@gmail.com',-7.17230000,111.63500000);
/*!40000 ALTER TABLE `crudsampah` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `edukasi`
--

DROP TABLE IF EXISTS `edukasi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `edukasi` (
  `id` int NOT NULL AUTO_INCREMENT,
  `judul` varchar(255) NOT NULL,
  `ringaksan` text NOT NULL,
  `sumber` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `edukasi`
--

LOCK TABLES `edukasi` WRITE;
/*!40000 ALTER TABLE `edukasi` DISABLE KEYS */;
INSERT INTO `edukasi` VALUES (1,'Pentingnya Daur Ulang Sampah','Artikel ini membahas mengapa daur ulang sampah sangat penting untuk lingkungan dan ekonomi.','https://www.menlhk.go.id/'),(2,'Cara Mengelola Sampah Rumah Tangga','Panduan praktis untuk mengelola sampah rumah tangga dengan benar, termasuk memilah sampah organik dan anorganik.','https://www.waste4change.com/blog/cara-mengelola-sampah-rumah-tangga-dengan-benar/'),(3,'Dampak Negatif Sampah Plastik','Menjelaskan dampak negatif sampah plastik terhadap lingkungan dan kesehatan manusia.','https://nationalgeographic.grid.id/read/132906174/dampak-negatif-sampah-plastik-bagi-lingkungan-dan-kesehatan'),(4,'Teknologi Pengolahan Sampah','Membahas teknologi terbaru dalam pengolahan sampah, termasuk insinerasi dan kompos.','https://teknologi.id/berita/teknologi-pengelolaan-sampah-terbaru-di-indonesia'),(5,'Edukasi Sampah untuk Anak-Anak','Program dan metode edukasi untuk mengajarkan anak-anak tentang pentingnya mengelola sampah sejak dini.','https://belajar.kemdikbud.go.id/'),(6,'Kebijakan Pengelolaan Sampah di Indonesia','Analisis kebijakan pemerintah Indonesia dalam mengelola sampah dan tantangan yang dihadapi.','https://www.menlhk.go.id/'),(7,'Kreativitas dari Sampah','Contoh dan inspirasi bagaimana sampah dapat diubah menjadi produk kreatif dan bernilai ekonomi.','https://beritagar.id/artikel/gaya-hidup/kreativitas-dari-sampah');
/*!40000 ALTER TABLE `edukasi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jadwal`
--

DROP TABLE IF EXISTS `jadwal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jadwal` (
  `id` int NOT NULL AUTO_INCREMENT,
  `jalan` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jadwal`
--

LOCK TABLES `jadwal` WRITE;
/*!40000 ALTER TABLE `jadwal` DISABLE KEYS */;
INSERT INTO `jadwal` VALUES (1,'Jl. A. Yani'),(2,'Jl. Gajah Mada'),(3,'Jl. Diponegoro'),(4,'Jl. Panglima Polim');
/*!40000 ALTER TABLE `jadwal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'user@example.com','$2a$10$UECagmoaAxsg1NmzYXzM5eNjBxTjLtVFInUYfJ3.PCEstg90jfalq'),(2,'coba@gmail.com','$2a$10$Nkgk67CUO0mOigU7misAAOzUefRPDdPGjEW7f72lK5eSA0JvLi2MC'),(3,'xample.com','$2a$10$jI6ebiXiCYgXtrOKBnRLcuQk2zqHPmJRmq1CuE5WE4PL4FzslWpPS'),(4,'contoh@gmail.com','$2a$10$nj3gPoi.U2uW4MSDHmefwuRomAh2PGOg6kS902tyP7eFVXDCygLge');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-06-15  0:07:37
