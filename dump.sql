-- MariaDB dump 10.19  Distrib 10.4.28-MariaDB, for osx10.10 (x86_64)
--
-- Host: localhost    Database: chatbot_db
-- ------------------------------------------------------
-- Server version	10.4.28-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `backoffice_admins`
--

DROP TABLE IF EXISTS `backoffice_admins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `backoffice_admins` (
  `id` char(36) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `backoffice_admins`
--

LOCK TABLES `backoffice_admins` WRITE;
/*!40000 ALTER TABLE `backoffice_admins` DISABLE KEYS */;
INSERT INTO `backoffice_admins` VALUES ('1ebe1030-cb7f-11f0-8b64-5a0d05a37ed3','admin@backoffice.local','$2b$10$RPTKfcz50IMrkRjZu2iTDu9JCMDMHuVpkeni2rWp1ylMrmsiEPnoy','2025-11-27 10:52:08','2025-11-27 10:57:23');
/*!40000 ALTER TABLE `backoffice_admins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `conversations`
--

DROP TABLE IF EXISTS `conversations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `conversations` (
  `id` char(36) NOT NULL,
  `userId` char(36) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `channel` varchar(100) DEFAULT NULL,
  `createdAt` datetime(6) NOT NULL DEFAULT current_timestamp(6),
  `updatedAt` datetime(6) NOT NULL DEFAULT current_timestamp(6) ON UPDATE current_timestamp(6),
  PRIMARY KEY (`id`),
  KEY `fk_conversations_user` (`userId`),
  CONSTRAINT `fk_conversations_user` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `conversations`
--

LOCK TABLES `conversations` WRITE;
/*!40000 ALTER TABLE `conversations` DISABLE KEYS */;
INSERT INTO `conversations` VALUES ('48fd54e7-7fac-43a6-8bbe-2fca9b65d27b',NULL,'Soporte facturación','widget-web','2025-11-21 18:01:28.940784','2025-11-21 18:01:28.000000'),('a3101552-2a36-4bdd-9797-ddaf28d230b4','fa8d3bd8-c8c8-4922-b8c5-fe8b45e56ce8','Nueva conversación','widget-web','2025-11-21 23:02:12.237922','2025-11-21 23:02:12.237922'),('c16c5566-86c7-40e0-9693-c977e72e79eb',NULL,'Soporte facturación','widget-web','2025-11-21 18:02:17.414509','2025-11-21 18:02:17.000000'),('d48e9ebc-f92d-4a31-9760-92b5332ab37f','fa8d3bd8-c8c8-4922-b8c5-fe8b45e56ce8','Nueva conversación','widget-web','2025-11-22 16:31:20.600771','2025-11-22 16:31:20.600771'),('d598692d-fe94-4edb-b2bd-1ccf65b6c7f1','fa8d3bd8-c8c8-4922-b8c5-fe8b45e56ce8','Soporte facturación','widget-web','2025-11-21 22:12:45.515087','2025-11-21 22:12:45.515087'),('daca3ec7-43c4-46bb-bdde-2d6a7bd17304','fa8d3bd8-c8c8-4922-b8c5-fe8b45e56ce8','Nueva conversación','widget-web','2025-11-21 23:12:26.355189','2025-11-21 23:12:26.355189');
/*!40000 ALTER TABLE `conversations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `messages`
--

DROP TABLE IF EXISTS `messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `messages` (
  `id` char(36) NOT NULL,
  `conversationId` char(36) NOT NULL,
  `role` enum('user','assistant') NOT NULL,
  `content` text NOT NULL,
  `createdAt` datetime(6) NOT NULL DEFAULT current_timestamp(6),
  PRIMARY KEY (`id`),
  KEY `idx_messages_conversation` (`conversationId`),
  CONSTRAINT `fk_messages_conversation` FOREIGN KEY (`conversationId`) REFERENCES `conversations` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `messages`
--

LOCK TABLES `messages` WRITE;
/*!40000 ALTER TABLE `messages` DISABLE KEYS */;
INSERT INTO `messages` VALUES ('077a97ce-5c3b-40c5-a884-4d8052c0567e','d48e9ebc-f92d-4a31-9760-92b5332ab37f','assistant','Hola, ¿cuál es tu pregunta?','2025-11-22 16:31:21.279681'),('09304959-3df5-4550-9b28-e65fba906654','d598692d-fe94-4edb-b2bd-1ccf65b6c7f1','user','sigamos','2025-11-22 00:53:54.013625'),('09fcc9bb-a127-402c-a04d-10165a8a05fd','d598692d-fe94-4edb-b2bd-1ccf65b6c7f1','assistant','No puedo identificar a la persona en la imagen.','2025-11-22 18:01:42.645553'),('0ed7edaa-d67f-4414-8589-7e16bda1d3a1','d598692d-fe94-4edb-b2bd-1ccf65b6c7f1','user','hablemos e algo','2025-11-22 00:32:56.879699'),('12d2015e-a2ef-45e3-a167-4174698e23f4','d598692d-fe94-4edb-b2bd-1ccf65b6c7f1','assistant','No puedo ver imágenes.','2025-11-22 17:34:39.689646'),('15b7d057-5090-4932-b6a7-ee8ef2c28af7','d598692d-fe94-4edb-b2bd-1ccf65b6c7f1','assistant','No puedo leer archivos PDF directamente. Puedes copiar el texto aquí y te ayudaré con eso.','2025-11-22 17:15:11.766984'),('16193cc6-1bb4-44c4-b7d5-0ca0d93679a0','d598692d-fe94-4edb-b2bd-1ccf65b6c7f1','user','sobre que puedes hablar?','2025-11-22 00:31:27.085712'),('16f4efa1-8244-4692-93a4-1a1adaab1249','d598692d-fe94-4edb-b2bd-1ccf65b6c7f1','assistant','No tengo información sobre el juego actual. ¿Te gustaría saber sobre algún juego específico?','2025-11-22 00:26:26.179207'),('1920b42a-e2fd-40d7-967c-a33744afc021','d598692d-fe94-4edb-b2bd-1ccf65b6c7f1','user','hola','2025-11-22 16:42:08.894020'),('1afa0b5a-c721-46dc-8bcf-c83dacd2d254','daca3ec7-43c4-46bb-bdde-2d6a7bd17304','user','que pasa','2025-11-21 23:12:26.362879'),('1b0c2a5c-e1d9-4a00-9d7f-9b17f1103768','d598692d-fe94-4edb-b2bd-1ccf65b6c7f1','assistant','¡Hola! ¿En qué puedo ayudarte?','2025-11-22 16:42:09.841844'),('1bf3a124-ce70-4336-903f-fb718cc5ea02','d598692d-fe94-4edb-b2bd-1ccf65b6c7f1','user','lee el contenido del pdf','2025-11-22 17:09:41.850113'),('20a10fe0-c784-4db2-88ad-4db83b6205d0','d598692d-fe94-4edb-b2bd-1ccf65b6c7f1','user','SIGAMOS','2025-11-22 00:22:14.095501'),('20a5258f-a84b-441f-80ba-3564ea33ee8c','d598692d-fe94-4edb-b2bd-1ccf65b6c7f1','user','analiza','2025-11-22 16:28:21.819007'),('2e237595-1f17-4b4e-b21d-eaa28180f20a','d598692d-fe94-4edb-b2bd-1ccf65b6c7f1','user','Resume el contenido del PDF adjunto','2025-11-22 17:11:25.282352'),('2ecfd6c5-f6f9-46c4-912c-6a02651dbd43','d598692d-fe94-4edb-b2bd-1ccf65b6c7f1','user','dime que tokens supne este mensaje','2025-11-22 15:21:24.531777'),('30ff2dd4-b04d-4209-8a1e-de1e83b87783','d598692d-fe94-4edb-b2bd-1ccf65b6c7f1','assistant','¡Hola! ¿En qué puedo ayudarte?','2025-11-22 00:19:05.788332'),('34a1e848-898e-42d4-8eee-2b82392fe1b9','a3101552-2a36-4bdd-9797-ddaf28d230b4','user','hola amigo','2025-11-21 23:02:12.265646'),('3912610f-136a-4961-be56-dcbddcd5d8c3','d598692d-fe94-4edb-b2bd-1ccf65b6c7f1','assistant','Lo siento, no puedo acceder a archivos adjuntos.','2025-11-22 17:11:26.947702'),('3b5ba0b5-d499-47c6-befd-46108384a5b7','d598692d-fe94-4edb-b2bd-1ccf65b6c7f1','assistant','No puedo analizar el mensaje sin que lo proporciones. Por favor, envíalo.','2025-11-22 15:21:25.397539'),('43aa50bd-29c2-47d0-a617-949d731733ea','d598692d-fe94-4edb-b2bd-1ccf65b6c7f1','user','hola','2025-11-22 00:19:05.006589'),('44c7e71c-7f69-431a-9c6e-c9d8a15a5408','d598692d-fe94-4edb-b2bd-1ccf65b6c7f1','assistant','¡Hola! ¿En qué puedo ayudarte?','2025-11-22 15:03:26.343459'),('45dff3c9-c758-4f5a-a176-d9684f5b68ea','d598692d-fe94-4edb-b2bd-1ccf65b6c7f1','assistant','No puedo leer archivos PDF directamente. Puedes copiar el texto aquí y te ayudaré con eso.','2025-11-22 17:18:50.485173'),('48687744-8796-444b-aea6-1d988be8b59b','d598692d-fe94-4edb-b2bd-1ccf65b6c7f1','user','lee el contenido del pdf','2025-11-22 17:15:09.777930'),('4d2adc67-3e3f-4a21-a68c-24fe22c75cf4','d598692d-fe94-4edb-b2bd-1ccf65b6c7f1','assistant','¿A qué te refieres específicamente?','2025-11-22 00:26:05.219321'),('4db1af47-4164-4ed0-8b84-f2d5b4946855','d598692d-fe94-4edb-b2bd-1ccf65b6c7f1','user','analiza','2025-11-22 16:05:08.506157'),('4e2f96bc-3b03-4674-9b09-532601a2761e','d598692d-fe94-4edb-b2bd-1ccf65b6c7f1','assistant','No puedo leer archivos PDF. Pero puedo ayudarte con preguntas o resúmenes si me das el texto.','2025-11-22 17:07:31.885548'),('4f35c0c8-dd8e-46ea-9ff6-9d79edb0c2b0','d598692d-fe94-4edb-b2bd-1ccf65b6c7f1','assistant','Claro, ¿en qué puedo ayudarte?','2025-11-22 00:22:15.280694'),('5214b08c-0127-4b4d-a58f-f476aa2aa409','d598692d-fe94-4edb-b2bd-1ccf65b6c7f1','assistant','No puedo analizar archivos directamente. Por favor, proporciona detalles o preguntas específicas sobre el contenido.','2025-11-22 16:41:31.335455'),('5a3cf49f-02e1-46d5-8d96-2e941dae9344','d598692d-fe94-4edb-b2bd-1ccf65b6c7f1','user','puedes ver el pdf adjunto?','2025-11-22 16:28:53.634289'),('5b4fc4a6-ff05-4293-8969-b05c9aa90fb1','d598692d-fe94-4edb-b2bd-1ccf65b6c7f1','assistant','¡Buenas! ¿En qué puedo ayudarte?','2025-11-22 14:34:55.134431'),('5d376738-b9f9-49db-ac94-0702d047d150','d598692d-fe94-4edb-b2bd-1ccf65b6c7f1','user','analiza ese archivo','2025-11-22 16:41:30.525906'),('5eef9600-db7a-48c3-91f0-dd916c44c907','d598692d-fe94-4edb-b2bd-1ccf65b6c7f1','assistant','No puedo ver archivos adjuntos. ¿Cómo puedo ayudarte con el contenido del PDF?','2025-11-22 16:28:34.444462'),('5f0b7a29-e65f-4401-b4d4-b057b3e5f31b','d598692d-fe94-4edb-b2bd-1ccf65b6c7f1','user','que hay en esa imagen?','2025-11-22 17:34:38.567431'),('67a85b4a-ae13-431b-9783-7491a704955f','d598692d-fe94-4edb-b2bd-1ccf65b6c7f1','assistant','¡Hola! ¿En qué puedo ayudarte?','2025-11-22 00:19:58.679178'),('68a5ca2f-0f97-4949-9ecc-39db7102c1fa','d598692d-fe94-4edb-b2bd-1ccf65b6c7f1','assistant','No tengo juegos. Soy un asistente de IA.','2025-11-22 00:31:02.923164'),('69ddc599-6e64-4465-9272-91d1571a0150','d598692d-fe94-4edb-b2bd-1ccf65b6c7f1','user','no hay juego','2025-11-22 00:28:46.561896'),('6bb00850-4ab3-4810-b4a9-7436d1f0a53f','d598692d-fe94-4edb-b2bd-1ccf65b6c7f1','user','buenas','2025-11-22 14:34:52.379867'),('6f018b98-1433-449b-b82b-26ecf278e832','d598692d-fe94-4edb-b2bd-1ccf65b6c7f1','assistant','No puedo leer el contenido del PDF directamente. Puedes describirlo o hacer preguntas específicas sobre él.','2025-11-22 16:42:49.135382'),('6f8de6e0-acf5-4826-b576-e566a67683bf','d598692d-fe94-4edb-b2bd-1ccf65b6c7f1','user','lee el contenido del pdf','2025-11-22 17:18:49.039772'),('73724587-1ea5-4891-801c-36e09ff5291c','d598692d-fe94-4edb-b2bd-1ccf65b6c7f1','assistant','Por favor, proporciona más detalles sobre lo que necesitas analizar.','2025-11-22 16:28:23.127262'),('7e9af411-5f7c-47c2-9482-41d73cf54c6e','d598692d-fe94-4edb-b2bd-1ccf65b6c7f1','assistant','Claro, ¿sobre qué tema te gustaría hablar?','2025-11-22 00:19:29.200596'),('80f55472-4b8b-4fc1-a9b3-7fab69475d0a','d598692d-fe94-4edb-b2bd-1ccf65b6c7f1','user','lee esa imagen','2025-11-22 18:01:39.660185'),('84bccaa0-bebf-4a7b-806f-6ff53e25e850','d598692d-fe94-4edb-b2bd-1ccf65b6c7f1','user','a que de momento jugamos','2025-11-22 00:26:25.219916'),('8507e7c4-972b-460e-9606-314bcf578317','d598692d-fe94-4edb-b2bd-1ccf65b6c7f1','user','hola','2025-11-22 00:19:57.990564'),('8af7fd18-042e-41f9-837f-577337a87b5d','d598692d-fe94-4edb-b2bd-1ccf65b6c7f1','user','lee el contenido del pdf y dime que hay','2025-11-22 16:42:47.343905'),('8d17fb96-0200-45f7-9c19-40f7a81ddc66','daca3ec7-43c4-46bb-bdde-2d6a7bd17304','assistant','¿En qué puedo ayudarte?','2025-11-21 23:12:27.456609'),('8e86cf27-a6ee-49b0-9ee0-6e0acbb176db','d598692d-fe94-4edb-b2bd-1ccf65b6c7f1','assistant','No puedo leer archivos PDF directamente. Puedes copiar el texto aquí y te ayudaré con eso.','2025-11-22 17:09:43.125175'),('910938f7-0dce-409b-ba8a-3aaee3ea691f','d598692d-fe94-4edb-b2bd-1ccf65b6c7f1','user','que hay en este csv?','2025-11-22 17:35:00.987472'),('938ad558-2588-4e6d-b209-74efe05cba89','d48e9ebc-f92d-4a31-9760-92b5332ab37f','user','Hola, tercera pregunta','2025-11-22 16:31:20.607794'),('943cb954-aecc-4895-a7e7-34d470ea15c7','d598692d-fe94-4edb-b2bd-1ccf65b6c7f1','assistant','Lo siento, no puedo procesar imágenes.','2025-11-22 17:35:29.832667'),('94e83f9e-a252-405b-a9aa-6177373671c7','d598692d-fe94-4edb-b2bd-1ccf65b6c7f1','assistant','El CSV contiene un diagrama en blanco con procesos, textos y líneas relacionados con un formulario de identificación y validación de usuario.','2025-11-22 17:35:02.677909'),('9817f271-336a-4794-8c1e-8772c0caa6b9','d598692d-fe94-4edb-b2bd-1ccf65b6c7f1','user','el pdf que te adjunté','2025-11-22 16:28:33.596722'),('99ee5f86-8d9e-4208-bd2f-13dac4ce3e2f','d598692d-fe94-4edb-b2bd-1ccf65b6c7f1','user','hola','2025-11-22 15:03:25.040652'),('9b36306d-c7ea-4e56-a7a3-60580054f6fd','d598692d-fe94-4edb-b2bd-1ccf65b6c7f1','user','hablemos','2025-11-22 00:19:28.165040'),('a362f404-0e76-4d61-807f-d76a22f573a2','a3101552-2a36-4bdd-9797-ddaf28d230b4','assistant','¡Hola! ¿En qué puedo ayudarte?','2025-11-21 23:02:14.427852'),('a3981d4d-5896-46af-9158-dfe736f4c34d','d598692d-fe94-4edb-b2bd-1ccf65b6c7f1','assistant','Claro, ¿en qué puedo ayudarte?','2025-11-22 00:32:51.681244'),('a42c0820-d6f6-44eb-b428-2e7e9eba7b95','d598692d-fe94-4edb-b2bd-1ccf65b6c7f1','user','sigamos','2025-11-22 00:32:51.060919'),('a6b18a66-eb58-4ee6-bf67-dd9ab011fff2','d598692d-fe94-4edb-b2bd-1ccf65b6c7f1','user','De qué va el PDF P_2025_00193.pdf?','2025-11-22 17:11:56.775783'),('a7c054e2-f8b7-40f8-b904-6e259164bde8','d598692d-fe94-4edb-b2bd-1ccf65b6c7f1','assistant','¿Sobre qué tema necesitas un análisis?','2025-11-22 16:05:09.908772'),('a97efb02-17d4-4f4b-b354-a18be9388557','d598692d-fe94-4edb-b2bd-1ccf65b6c7f1','assistant','Claro, ¿en qué puedo ayudarte?','2025-11-22 00:53:55.123027'),('ade55722-4357-474b-9c8d-bf214b77bcd7','d598692d-fe94-4edb-b2bd-1ccf65b6c7f1','user','lee el contenido del pdf','2025-11-22 17:07:29.475111'),('af9fa963-6da4-46e2-a94f-fe3ff2c15a52','d598692d-fe94-4edb-b2bd-1ccf65b6c7f1','user','en muchas cosas','2025-11-22 00:26:04.029365'),('b0c97d40-47c3-4c0a-840c-32227e57db47','d598692d-fe94-4edb-b2bd-1ccf65b6c7f1','user','puedes leer ese pdf?','2025-11-22 17:01:26.154585'),('beee076f-986b-43e8-860b-e24474d8de52','d598692d-fe94-4edb-b2bd-1ccf65b6c7f1','assistant','No, no puedo leer archivos PDF.','2025-11-22 17:01:27.512410'),('c5595065-34d0-4648-9dc5-ece1b88652dc','d598692d-fe94-4edb-b2bd-1ccf65b6c7f1','assistant','Lo siento, no puedo acceder a archivos PDF ni a su contenido.','2025-11-22 17:11:57.995664'),('c6390f19-fc85-4984-97f6-84ede216667d','d598692d-fe94-4edb-b2bd-1ccf65b6c7f1','assistant','Puedo hablar sobre una amplia variedad de temas, como tecnología, ciencia, historia, cultura, y más. ¿Tienes algo específico en mente?','2025-11-22 00:31:28.162712'),('c8c9d55a-fbe1-411a-985b-971cc5ad5c21','d598692d-fe94-4edb-b2bd-1ccf65b6c7f1','user','futbol','2025-11-22 00:36:59.030036'),('cc1f4db0-176a-48e7-92ca-ece4ed87eba7','d598692d-fe94-4edb-b2bd-1ccf65b6c7f1','assistant','¿Qué aspecto del fútbol te interesa?','2025-11-22 00:36:59.839110'),('d3c913dc-82a3-461e-b723-87910329ea41','d598692d-fe94-4edb-b2bd-1ccf65b6c7f1','user','lee el contenido de la imagen','2025-11-22 17:35:29.051094'),('d4fab745-cf8b-497c-93cb-cf83604cc3e4','d598692d-fe94-4edb-b2bd-1ccf65b6c7f1','assistant','¿Te refieres a que no hay un juego disponible?','2025-11-22 00:28:47.616051'),('d84660ea-7cb9-4720-9cf2-9c681ddd4ebe','d598692d-fe94-4edb-b2bd-1ccf65b6c7f1','user','otra vez','2025-11-22 00:24:08.656791'),('e6a6bed9-2ffc-4f7e-adf4-3d87d5c06892','d598692d-fe94-4edb-b2bd-1ccf65b6c7f1','user','que juegos tienes?','2025-11-22 00:31:01.535088'),('e6af6716-67c6-44a3-9b0f-778f3bdf4e5c','d598692d-fe94-4edb-b2bd-1ccf65b6c7f1','assistant','¿En qué puedo ayudarte?','2025-11-22 00:24:09.296683'),('e6b8cf25-e3f4-4e4b-8e00-93d0473af810','d598692d-fe94-4edb-b2bd-1ccf65b6c7f1','assistant','No puedo ver archivos adjuntos.','2025-11-22 16:28:54.754341'),('ff8e6e00-688a-4e0f-9fca-80cd7c2da78d','d598692d-fe94-4edb-b2bd-1ccf65b6c7f1','assistant','Claro, ¿sobre qué tema te gustaría hablar?','2025-11-22 00:32:57.797741');
/*!40000 ALTER TABLE `messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `settings`
--

DROP TABLE IF EXISTS `settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `settings` (
  `id` char(36) NOT NULL,
  `key` varchar(255) NOT NULL,
  `scope` varchar(255) DEFAULT NULL,
  `value` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`value`)),
  `createdAt` datetime(6) NOT NULL DEFAULT current_timestamp(6),
  `updatedAt` datetime(6) NOT NULL DEFAULT current_timestamp(6) ON UPDATE current_timestamp(6),
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniq_key_scope` (`key`,`scope`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `settings`
--

LOCK TABLES `settings` WRITE;
/*!40000 ALTER TABLE `settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usage`
--

DROP TABLE IF EXISTS `usage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usage` (
  `id` char(36) NOT NULL,
  `userId` char(36) DEFAULT NULL,
  `conversationId` char(36) DEFAULT NULL,
  `provider` varchar(50) NOT NULL,
  `model` varchar(255) NOT NULL,
  `inputTokens` int(11) DEFAULT NULL,
  `outputTokens` int(11) DEFAULT NULL,
  `totalTokens` int(11) DEFAULT NULL,
  `createdAt` datetime(6) NOT NULL DEFAULT current_timestamp(6),
  PRIMARY KEY (`id`),
  KEY `idx_usage_createdAt` (`createdAt`),
  KEY `idx_usage_user` (`userId`,`createdAt`),
  KEY `idx_usage_provider_model` (`provider`,`model`,`createdAt`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usage`
--

LOCK TABLES `usage` WRITE;
/*!40000 ALTER TABLE `usage` DISABLE KEYS */;
INSERT INTO `usage` VALUES ('025581e4-4a32-43e6-9398-4b8bf02830d8','fa8d3bd8-c8c8-4922-b8c5-fe8b45e56ce8','d598692d-fe94-4edb-b2bd-1ccf65b6c7f1','openai','gpt-4o-mini',88,27,115,'2025-11-22 16:42:49.128105'),('0d5b20d5-7d83-49b8-8ec5-16cfd334b2eb','fa8d3bd8-c8c8-4922-b8c5-fe8b45e56ce8','d598692d-fe94-4edb-b2bd-1ccf65b6c7f1','openai','gpt-4o-mini',31,23,54,'2025-11-22 17:09:43.119077'),('1a225c88-a762-40cf-b20a-a03a5c0b9a81',NULL,NULL,'openai','gpt-4o-mini',NULL,NULL,0,'2025-11-22 00:48:45.898564'),('1a77e891-5e66-4289-99d2-88ef3cda456f',NULL,NULL,'openai','gpt-4o-mini',41,13,54,'2025-11-27 18:53:19.796483'),('1ea3e06a-1762-4c6d-9a0e-be5c82a613c9','fa8d3bd8-c8c8-4922-b8c5-fe8b45e56ce8','bbfdaada-9b98-4b79-a753-0b4b6efc6cfe','openai','gpt-4o-mini',NULL,NULL,0,'2025-11-21 23:13:35.306774'),('1ee91681-e211-437d-b1a6-7d6ee4a82508','fa8d3bd8-c8c8-4922-b8c5-fe8b45e56ce8','d598692d-fe94-4edb-b2bd-1ccf65b6c7f1','openai','gpt-4o-mini',31,23,54,'2025-11-22 17:15:11.761461'),('270a162b-f692-4fdd-8bb2-38eecb56d85d','fa8d3bd8-c8c8-4922-b8c5-fe8b45e56ce8','d598692d-fe94-4edb-b2bd-1ccf65b6c7f1','openai','gpt-4o-mini',NULL,NULL,0,'2025-11-22 00:31:02.914957'),('2ac8542d-ac02-43b7-a934-450e7ccbd17b',NULL,NULL,'openai','gpt-4o-mini',1277,75,1352,'2025-11-27 20:57:36.132636'),('2b27ae1b-d4a9-4d9c-8d92-1e2d5c928815',NULL,NULL,'openai','gpt-4o-mini',36,9,45,'2025-11-27 16:04:32.956714'),('2c3a7e62-32bd-4e79-8294-d70a43fd1587','fa8d3bd8-c8c8-4922-b8c5-fe8b45e56ce8','d598692d-fe94-4edb-b2bd-1ccf65b6c7f1','openai','gpt-4o-mini',30,8,38,'2025-11-22 17:01:27.508742'),('2dbc69bc-af90-43ea-b036-1ce6b0aa15f4','fa8d3bd8-c8c8-4922-b8c5-fe8b45e56ce8','d598692d-fe94-4edb-b2bd-1ccf65b6c7f1','openai','gpt-4o-mini',30,6,36,'2025-11-22 17:34:39.684493'),('312d68e4-fe4b-402d-a066-8c260de86de4','fa8d3bd8-c8c8-4922-b8c5-fe8b45e56ce8','6ef154f7-3988-4d3f-a1fe-2940d43a1521','openai','gpt-4o-mini',NULL,NULL,0,'2025-11-21 23:41:29.887899'),('31ce626a-7026-4efd-9588-b73df600d63d','fa8d3bd8-c8c8-4922-b8c5-fe8b45e56ce8','d598692d-fe94-4edb-b2bd-1ccf65b6c7f1','openai','gpt-4o-mini',27,10,37,'2025-11-22 16:05:09.905445'),('32938692-584c-4178-b048-87da99271a4e','fa8d3bd8-c8c8-4922-b8c5-fe8b45e56ce8','d598692d-fe94-4edb-b2bd-1ccf65b6c7f1','openai','gpt-4o-mini',34,12,46,'2025-11-22 17:11:26.938102'),('33e03cd6-5e9a-4cb6-9b28-1c8fcd95927c','fa8d3bd8-c8c8-4922-b8c5-fe8b45e56ce8','d598692d-fe94-4edb-b2bd-1ccf65b6c7f1','openai','gpt-4o-mini',NULL,NULL,0,'2025-11-22 00:26:26.173445'),('48c44b25-c0f6-4438-b824-2234fe29ed8b','fa8d3bd8-c8c8-4922-b8c5-fe8b45e56ce8','d598692d-fe94-4edb-b2bd-1ccf65b6c7f1','openai','gpt-4o-mini',574,35,609,'2025-11-22 17:35:02.672261'),('4b06cce6-48f3-4f99-bd4f-5cecf57e4a15','fa8d3bd8-c8c8-4922-b8c5-fe8b45e56ce8','d598692d-fe94-4edb-b2bd-1ccf65b6c7f1','openai','gpt-4o-mini',33,18,51,'2025-11-22 15:21:25.390740'),('561b7580-70ec-420a-ae33-0eca0dea649d','fa8d3bd8-c8c8-4922-b8c5-fe8b45e56ce8','d598692d-fe94-4edb-b2bd-1ccf65b6c7f1','openai','gpt-4o-mini',NULL,NULL,0,'2025-11-22 00:32:57.791258'),('5bfd2adf-01b6-48b7-bffa-f21059ac0a5d','fa8d3bd8-c8c8-4922-b8c5-fe8b45e56ce8','d598692d-fe94-4edb-b2bd-1ccf65b6c7f1','openai','gpt-4o-mini',NULL,NULL,0,'2025-11-22 14:34:55.128456'),('5dccda21-c0d6-4ed7-ad50-fe48943d1290','fa8d3bd8-c8c8-4922-b8c5-fe8b45e56ce8','d598692d-fe94-4edb-b2bd-1ccf65b6c7f1','openai','gpt-4o-mini',NULL,NULL,0,'2025-11-22 00:32:51.672944'),('60977781-9ce0-4557-a2f1-053f11faf8db','fa8d3bd8-c8c8-4922-b8c5-fe8b45e56ce8','d48e9ebc-f92d-4a31-9760-92b5332ab37f','openai','gpt-4o-mini',30,7,37,'2025-11-22 16:31:21.271868'),('6269aa2c-47ed-483a-8139-b9cda7eb0a9e','fa8d3bd8-c8c8-4922-b8c5-fe8b45e56ce8','6ef154f7-3988-4d3f-a1fe-2940d43a1521','openai','gpt-4o-mini',NULL,NULL,0,'2025-11-21 23:36:01.110648'),('6accf0e6-6159-4445-abac-75d3b3bea237',NULL,NULL,'openai','gpt-4o-mini',1269,147,1416,'2025-11-27 19:16:00.256924'),('6e57c983-fd04-4f62-961f-6454a59065e7','fa8d3bd8-c8c8-4922-b8c5-fe8b45e56ce8','d598692d-fe94-4edb-b2bd-1ccf65b6c7f1','openai','gpt-4o-mini',NULL,NULL,0,'2025-11-22 00:24:09.287467'),('7024d79b-9d03-4840-94cc-516cc3202ab0',NULL,NULL,'openai','gpt-4o-mini',40,35,75,'2025-11-27 19:13:20.465270'),('72288a87-4291-455b-8ec7-8401c6da0eb2','fa8d3bd8-c8c8-4922-b8c5-fe8b45e56ce8','d598692d-fe94-4edb-b2bd-1ccf65b6c7f1','openai','gpt-4o-mini',25539,10,25549,'2025-11-22 18:01:42.639713'),('7268a68a-6914-4f35-aaad-2338f4bd4a32','fa8d3bd8-c8c8-4922-b8c5-fe8b45e56ce8','d598692d-fe94-4edb-b2bd-1ccf65b6c7f1','openai','gpt-4o-mini',26,8,34,'2025-11-22 16:42:09.833136'),('79000054-1779-4717-b203-291a71e6e12e','fa8d3bd8-c8c8-4922-b8c5-fe8b45e56ce8','6ef154f7-3988-4d3f-a1fe-2940d43a1521','openai','gpt-4o-mini',NULL,NULL,0,'2025-11-21 23:42:17.360595'),('798b0a72-34eb-4880-b0b2-ca6ec0ccc40b','fa8d3bd8-c8c8-4922-b8c5-fe8b45e56ce8','a3101552-2a36-4bdd-9797-ddaf28d230b4','openai','gpt-4o-mini',NULL,NULL,0,'2025-11-21 23:02:14.411709'),('7b3046ea-3ca5-4b3c-900b-996ca7bc2b73','fa8d3bd8-c8c8-4922-b8c5-fe8b45e56ce8','d598692d-fe94-4edb-b2bd-1ccf65b6c7f1','openai','gpt-4o-mini',NULL,NULL,0,'2025-11-22 00:19:58.668889'),('7bce608a-efbd-485c-a26f-5905547c8471',NULL,NULL,'openai','gpt-4o-mini',43,18,61,'2025-11-27 18:53:29.296217'),('7d8db779-aa9c-4cf4-a904-250358c4df5a','fa8d3bd8-c8c8-4922-b8c5-fe8b45e56ce8','d598692d-fe94-4edb-b2bd-1ccf65b6c7f1','openai','gpt-4o-mini',31,23,54,'2025-11-22 17:18:50.476647'),('8b1ef200-0ae2-49e8-a428-ebc75955b680','fa8d3bd8-c8c8-4922-b8c5-fe8b45e56ce8','d598692d-fe94-4edb-b2bd-1ccf65b6c7f1','openai','gpt-4o-mini',31,8,39,'2025-11-22 16:28:54.748726'),('952bb5fa-f7e2-4438-a226-316c71395618','fa8d3bd8-c8c8-4922-b8c5-fe8b45e56ce8','d598692d-fe94-4edb-b2bd-1ccf65b6c7f1','openai','gpt-4o-mini',NULL,NULL,0,'2025-11-22 00:36:59.828339'),('96edbc64-2ca4-4af3-bcd6-f7c8103f4149','fa8d3bd8-c8c8-4922-b8c5-fe8b45e56ce8','d598692d-fe94-4edb-b2bd-1ccf65b6c7f1','openai','gpt-4o-mini',NULL,NULL,0,'2025-11-22 15:03:26.337937'),('98b8f67d-480a-4fa3-875c-845e7af1782f',NULL,NULL,'openai','gpt-4o-mini',36,9,45,'2025-11-27 15:48:31.582290'),('a53a960e-4556-4a9b-8cf8-157ef919aa62','fa8d3bd8-c8c8-4922-b8c5-fe8b45e56ce8','6ef154f7-3988-4d3f-a1fe-2940d43a1521','openai','gpt-4o-mini',NULL,NULL,0,'2025-11-21 23:43:04.582098'),('a936b4dd-b3b1-4359-bbb6-f4e4fcdc8537','fa8d3bd8-c8c8-4922-b8c5-fe8b45e56ce8','d598692d-fe94-4edb-b2bd-1ccf65b6c7f1','openai','gpt-4o-mini',NULL,NULL,0,'2025-11-22 00:26:05.205703'),('ae89b189-e8fd-4f96-a456-cdf8ce89adb7','fa8d3bd8-c8c8-4922-b8c5-fe8b45e56ce8','d598692d-fe94-4edb-b2bd-1ccf65b6c7f1','openai','gpt-4o-mini',NULL,NULL,0,'2025-11-22 00:19:05.775891'),('c014ec6f-3886-404f-937b-f3562a44aced','fa8d3bd8-c8c8-4922-b8c5-fe8b45e56ce8','d598692d-fe94-4edb-b2bd-1ccf65b6c7f1','openai','gpt-4o-mini',32,10,42,'2025-11-22 17:35:29.826396'),('c0e5d9e2-0926-432a-a036-e3aebc907c1f','fa8d3bd8-c8c8-4922-b8c5-fe8b45e56ce8','d598692d-fe94-4edb-b2bd-1ccf65b6c7f1','openai','gpt-4o-mini',NULL,NULL,0,'2025-11-22 00:53:55.116589'),('cd5f8abd-b0a0-4097-af3b-41df4268fba0','fa8d3bd8-c8c8-4922-b8c5-fe8b45e56ce8','d598692d-fe94-4edb-b2bd-1ccf65b6c7f1','openai','gpt-4o-mini',NULL,NULL,0,'2025-11-22 00:28:47.605902'),('d0aec9a0-c10c-45fe-8c4b-e5b2e1d437ae','fa8d3bd8-c8c8-4922-b8c5-fe8b45e56ce8','d598692d-fe94-4edb-b2bd-1ccf65b6c7f1','openai','gpt-4o-mini',NULL,NULL,0,'2025-11-22 00:19:29.178131'),('d13ad772-8045-484b-82e4-7e9b7e268531','fa8d3bd8-c8c8-4922-b8c5-fe8b45e56ce8','bbfdaada-9b98-4b79-a753-0b4b6efc6cfe','openai','gpt-4o-mini',NULL,NULL,0,'2025-11-21 23:12:36.930740'),('d3c8b3b7-05d4-4167-9aaf-be0d3ea9bd51','fa8d3bd8-c8c8-4922-b8c5-fe8b45e56ce8','d598692d-fe94-4edb-b2bd-1ccf65b6c7f1','openai','gpt-4o-mini',27,17,44,'2025-11-22 16:28:23.116988'),('d41ded0c-2534-4eca-8796-d6beb2817ccf',NULL,NULL,'openai','gpt-4o-mini',1269,45,1314,'2025-11-27 20:57:08.814277'),('d5d0c8b2-f9d6-417c-96e0-0314b87e3085','fa8d3bd8-c8c8-4922-b8c5-fe8b45e56ce8','daca3ec7-43c4-46bb-bdde-2d6a7bd17304','openai','gpt-4o-mini',NULL,NULL,0,'2025-11-21 23:12:27.446757'),('da719dc7-5a3b-4645-b4db-30c3c427e8ee','fa8d3bd8-c8c8-4922-b8c5-fe8b45e56ce8','d598692d-fe94-4edb-b2bd-1ccf65b6c7f1','openai','gpt-4o-mini',31,23,54,'2025-11-22 17:07:31.879880'),('ddd86786-cb92-4568-ab1c-1e4b58dfb15b',NULL,NULL,'openai','gpt-4o-mini',1265,10,1275,'2025-11-27 19:40:45.067650'),('e09a5979-dd87-418b-bfb0-b17274759c2f','fa8d3bd8-c8c8-4922-b8c5-fe8b45e56ce8','d598692d-fe94-4edb-b2bd-1ccf65b6c7f1','openai','gpt-4o-mini',NULL,NULL,0,'2025-11-22 00:22:15.273710'),('e18a6ac6-08b1-499e-a9d9-c2a5f1a51cdc','fa8d3bd8-c8c8-4922-b8c5-fe8b45e56ce8','6ef154f7-3988-4d3f-a1fe-2940d43a1521','openai','gpt-4o-mini',NULL,NULL,0,'2025-11-21 23:34:28.113396'),('e19d3064-db2f-49ce-8230-3d9958654698','fa8d3bd8-c8c8-4922-b8c5-fe8b45e56ce8','6ef154f7-3988-4d3f-a1fe-2940d43a1521','openai','gpt-4o-mini',NULL,NULL,0,'2025-11-21 23:35:54.667280'),('e2c0b640-ff79-48bf-ab98-43b5f0b0595c',NULL,NULL,'openai','gpt-4o-mini',36,9,45,'2025-11-27 15:06:33.908492'),('e427ff65-753c-4594-bb05-4af874718c97',NULL,NULL,'openai','gpt-4o-mini',1267,10,1277,'2025-11-27 20:55:08.064288'),('e779217b-dc50-4fdd-b23f-ab04deec938c',NULL,NULL,'openai','gpt-4o-mini',NULL,NULL,0,'2025-11-22 00:52:20.581211'),('e96d29c7-a9c1-40ef-9bd3-34b7012475f0',NULL,NULL,'openai','gpt-4o-mini',NULL,NULL,0,'2025-11-21 23:25:48.912959'),('ea2ed0b8-d21a-42cc-8bdf-e1fc75b41417','fa8d3bd8-c8c8-4922-b8c5-fe8b45e56ce8','d598692d-fe94-4edb-b2bd-1ccf65b6c7f1','openai','gpt-4o-mini',30,20,50,'2025-11-22 16:28:34.439720'),('eb50a05e-669e-45c5-aad0-afa9a417f21e','fa8d3bd8-c8c8-4922-b8c5-fe8b45e56ce8','6ef154f7-3988-4d3f-a1fe-2940d43a1521','openai','gpt-4o-mini',NULL,NULL,0,'2025-11-21 23:35:51.186796'),('ed123815-1c51-4ee6-a23e-826b87de4341',NULL,NULL,'openai','gpt-4o-mini',1270,78,1348,'2025-11-27 20:56:37.321767'),('ed9e3e3b-142d-4567-ae53-4a34f4bb5a4b',NULL,NULL,'openai','gpt-4o-mini',39,9,48,'2025-11-27 15:05:09.274325'),('eda09633-9aec-4374-a5de-4d49405a581d','fa8d3bd8-c8c8-4922-b8c5-fe8b45e56ce8','d598692d-fe94-4edb-b2bd-1ccf65b6c7f1','openai','gpt-4o-mini',83,29,112,'2025-11-22 16:41:31.329784'),('f6b8d729-2399-4b1b-8f8c-84fa81f52b97','fa8d3bd8-c8c8-4922-b8c5-fe8b45e56ce8','d598692d-fe94-4edb-b2bd-1ccf65b6c7f1','openai','gpt-4o-mini',NULL,NULL,0,'2025-11-22 00:31:28.153004'),('f82098a6-6002-4986-af4b-6adef0a814b5','fa8d3bd8-c8c8-4922-b8c5-fe8b45e56ce8','d598692d-fe94-4edb-b2bd-1ccf65b6c7f1','openai','gpt-4o-mini',33,15,48,'2025-11-22 17:11:57.988498'),('faf22b24-6711-4d51-943c-44e233e60bc3','fa8d3bd8-c8c8-4922-b8c5-fe8b45e56ce8','fa242ab6-8488-49a8-b7bb-3dd38cd4e1e5','openai','gpt-4o-mini',NULL,NULL,0,'2025-11-21 22:20:54.373170'),('ff9b055c-26a3-4d36-b24d-385b8069cfb9',NULL,NULL,'openai','gpt-4o-mini',1268,200,1468,'2025-11-27 20:55:21.467899');
/*!40000 ALTER TABLE `usage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` char(36) NOT NULL,
  `email` varchar(255) NOT NULL,
  `passwordHash` varchar(255) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `createdAt` datetime(6) NOT NULL DEFAULT current_timestamp(6),
  `updatedAt` datetime(6) NOT NULL DEFAULT current_timestamp(6) ON UPDATE current_timestamp(6),
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES ('f0ce5286-6c70-4f66-9b80-cef546e3a2b3','ss@test.com','$2b$10$7NJeQeqVy4pyl2gXpA1PU.VGpNt0S6ALMwrk2Hiub0A3vxSvjVTyW','Usuario Demo','2025-11-21 18:01:08.228043','2025-11-21 18:01:08.228043'),('fa8d3bd8-c8c8-4922-b8c5-fe8b45e56ce8','test@test.com','$2b$10$MO/60wDgM8ZJPKI7IAfpjuiKWf3.7Vb0wg931j8lIkpJXUvOunN7O','Peter','2025-11-21 13:18:22.730057','2025-11-29 11:44:04.000000');
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

-- Dump completed on 2025-11-29 12:44:05
