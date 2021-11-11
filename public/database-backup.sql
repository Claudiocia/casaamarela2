-- MySQL dump 10.13  Distrib 8.0.25, for Linux (x86_64)
--
-- Host: localhost    Database: casaamarela
-- ------------------------------------------------------
-- Server version	8.0.25-0ubuntu0.20.04.1

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
-- Table structure for table `campuses`
--

DROP TABLE IF EXISTS `campuses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `campuses` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `campuses`
--

LOCK TABLES `campuses` WRITE;
/*!40000 ALTER TABLE `campuses` DISABLE KEYS */;
INSERT INTO `campuses` VALUES (1,'Campus Avançado',NULL,NULL),(2,'Pólo EAD',NULL,NULL),(3,'Pólo Parfor',NULL,NULL),(4,'Adm. Central',NULL,NULL),(5,'Campus I',NULL,NULL),(6,'Campus II',NULL,NULL),(7,'Campus III',NULL,NULL),(8,'Campus IV',NULL,NULL),(9,'Campus V',NULL,NULL),(10,'Campus VI',NULL,NULL),(11,'Campus VII',NULL,NULL),(12,'Campus VIII',NULL,NULL),(13,'Campus IX',NULL,NULL),(14,'Campus X',NULL,NULL),(15,'Campus XI',NULL,NULL),(16,'Campus XII',NULL,NULL),(17,'Campus XIII',NULL,NULL),(18,'Campus XIV',NULL,NULL),(19,'Campus XV',NULL,NULL),(20,'Campus XVI',NULL,NULL),(21,'Campus XVII',NULL,NULL),(22,'Campus XVIII',NULL,NULL),(23,'Campus XIX',NULL,NULL),(24,'Campus XX',NULL,NULL),(25,'Campus XXI',NULL,NULL),(26,'Campus XXII',NULL,NULL),(27,'Campus XXIII',NULL,NULL),(28,'Campus XXIV',NULL,NULL),(29,'CPEDR',NULL,NULL),(30,'CEEC',NULL,NULL),(31,'CEPAIA',NULL,NULL),(32,'CPT',NULL,NULL),(33,'CEL-FM',NULL,NULL),(34,'CESDE',NULL,NULL),(35,'CAAPA',NULL,NULL),(36,'CDTA',NULL,NULL),(37,'CASULO',NULL,NULL),(38,'CEESAR',NULL,NULL),(39,'OPARÁ',NULL,NULL),(40,'CEGRES/DIADORIM',NULL,NULL),(41,'CEICR',NULL,NULL),(42,'CEPITI',NULL,NULL),(43,'CAECDT',NULL,NULL),(44,'CRDH',NULL,NULL),(45,'CPDCV',NULL,NULL);
/*!40000 ALTER TABLE `campuses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contacts`
--

DROP TABLE IF EXISTS `contacts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contacts` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('s','n') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `role` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '3',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contacts`
--

LOCK TABLES `contacts` WRITE;
/*!40000 ALTER TABLE `contacts` DISABLE KEYS */;
INSERT INTO `contacts` VALUES (1,'Claudio','claudiosouza.cia@gmail.com','71999094687','Teste de mensagem em produção','Esse foi um teste de mensagem de contato em produção','n','3','2021-07-07 17:46:38','2021-07-07 17:46:38',NULL),(2,'João Silva Rocha Filho','jrochauneb@gmail.com','74991883809','teste','testando e-mail','n','3','2021-07-07 17:56:27','2021-07-07 17:56:27',NULL),(3,'Claudio','claudiosouza.cia@gmail.com','71999094687','Teste de mensagem em produção','teste final de mensagem','n','3','2021-07-07 20:06:57','2021-07-07 20:06:57',NULL),(4,'joao','joao.tatoo@uol.com.br','71335798871','eeee','eeeeeeeeeee','s','3','2021-07-15 12:49:07','2021-07-22 19:25:28',NULL);
/*!40000 ALTER TABLE `contacts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contribuis`
--

DROP TABLE IF EXISTS `contribuis`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contribuis` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tema` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `contribui` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `lida` enum('s','n') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `aprov` enum('s','n') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `user_id` bigint unsigned DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `contribuis_user_id_foreign` (`user_id`),
  CONSTRAINT `contribuis_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contribuis`
--

LOCK TABLES `contribuis` WRITE;
/*!40000 ALTER TABLE `contribuis` DISABLE KEYS */;
INSERT INTO `contribuis` VALUES (1,'Claudio Souza','claudiosouza.cia@gmail.com',NULL,'Internacionalização','Lorem ipsum per metus est taciti vitae quisque, porttitor venenatis etiam vehicula mauris pulvinar. porta curabitur ullamcorper mollis a elit nibh phasellus, praesent inceptos accumsan blandit pretium ut aliquet, libero etiam mi interdum arcu ut. varius sem luctus laoreet sociosqu velit elementum curae sem, potenti ante congue elementum sit habitasse risus aliquet, ullamcorper viverra tempus ut class vel aliquet. aenean porta quisque lobortis aptent sit non varius nam sapien sit, tempor a urna habitant duis lobortis est mauris posuere hendrerit ac, volutpat diam iaculis consequat luctus leo nisl porttitor varius. \r\n\r\n	Nibh molestie imperdiet curabitur donec molestie dui rhoncus aliquam placerat dui, curabitur taciti leo magna posuere dapibus mollis eu donec, urna ipsum viverra dui lectus litora bibendum inceptos hac. lectus venenatis fringilla malesuada lectus quisque et ornare habitant, consequat feugiat pulvinar litora nostra per condimentum vel, eget viverra tellus class feugiat bibendum varius. ante fusce magna diam platea nisi ultrices mattis rhoncus nostra dictumst nunc, hendrerit curabitur pellentesque at senectus pharetra lobortis consectetur curabitur netus, fringilla vestibulum ligula quisque est habitasse etiam iaculis imperdiet lectus. cursus tempor sed facilisis nam consequat dui curabitur eros nam purus, feugiat nullam tincidunt varius nullam feugiat dolor nullam aliquet, orci dictumst eros placerat justo etiam ac aenean luctus.','s','n',1,'2021-06-22 15:45:01','2021-06-21 17:20:10','2021-06-22 15:45:01'),(2,'Claudio Souza','claudiosouza.cia@gmail.com',NULL,'Graduação','Facilisis sagittis sed risus erat curabitur consectetur, quis nam commodo phasellus dictum ante luctus, donec consectetur dictum cubilia habitasse. nisi ultricies bibendum neque ultricies placerat nostra eu ultrices hendrerit vulputate nibh, rutrum at phasellus netus et platea accumsan elit fermentum dolor laoreet, quam ipsum diam porttitor dui iaculis metus etiam erat ad. luctus cras augue consectetur nam congue aenean dictumst, varius curae suscipit dapibus vivamus himenaeos convallis, tempor ultrices consequat habitasse conubia quis dui, feugiat hac metus commodo erat taciti. scelerisque arcu ut curae nam tortor rutrum, proin condimentum nec urna mattis dictum, volutpat tristique est praesent bibendum.','s','n',1,'2021-06-22 15:45:14','2021-06-21 17:20:31','2021-06-22 15:45:14'),(3,'Ana Vitória da Paixão Silva','avsilva@uneb.br',NULL,'Gestão de Pessoas','Nas propostas das últimas campanhas para Reitoria da UNEB era notório pontos importantes para os técnicos administrativos. Porém, do lugar que falo e escrevo, por muitas vezes não me sinto técnica da Uneb. Não afirmo isso apenas por não ser concursada. Tenho 22 anos na casa e deveria me sentir contemplada. Contudo, a exclusão com os cargos comissionados é enorme. Seja na ausência na oralidade de um candidato ou na parte física da proposta. Precisamos de uma política que vise nosso bem estar.','s','n',NULL,NULL,'2021-06-22 19:32:46','2021-06-23 09:53:17'),(4,'Naira Souza Moura','na172000@gmail.com',NULL,'Gestão e Organização','Discussão e participação na gestão da Universidade','s','n',NULL,NULL,'2021-06-23 13:38:03','2021-07-11 20:55:39'),(5,'JOSENILDES SANTOS DE OLIVEIRA','josenildes@hotmail.com',NULL,'Gestão e Organização','1.	Formalização dos processos realizados pela Universidade - Muitos de nossos processos não são formalizados e estão desenhados somente nas cabeças dos servidores mais antigos de cada setor. Essa não formalização dificulta o entendimento da atividade que será desempenhada por um novo servidor que chega à universidade. Além disso, favorece a incrementação de ações específicas por cada gestor para uma tarefa que poderia ser realizada de forma mais simples e, consequentemente, em tempo menor. Processos que geram os mesmos produtos podem ser padronizados em toda a Universidade. Não pode ser feito de forma diferente em cada campus. É essencial o fortalecimento do Escritório de Processos e Projetos da Universidade.','s','n',22,NULL,'2021-06-25 14:37:01','2021-07-11 20:58:37'),(6,'JOSENILDES SANTOS DE OLIVEIRA','josenildes@hotmail.com',NULL,'Gestão de Pessoas','2.	Acredito que para construirmos um projeto de universidade inclusiva e plural em todos os seus aspectos temos que trabalhar com a cultura organizacional. Isso leva tempo e é, de fato, realizada com ações cotidianas. A Universidade possui vínculos diferentes em seu quadro funcional. Os cargos em comissão (sem vínculo efetivo) e os terceirizados estão mais propensos a sofrerem assédio moral por parte de chefes e até de colegas. São obrigados (muitas vezes de forma sutil) a desempenharem mais trabalhos que os demais, a atuarem fora do horário de expediente, em finais de semana. Muitas demandas são urgentes e claro, precisam ser resolvidas, mas outras surgem em razão do não planejamento das ações.','s','n',22,NULL,'2021-06-25 14:37:31','2021-07-11 20:58:14'),(7,'JOSENILDES SANTOS DE OLIVEIRA','josenildes@hotmail.com',NULL,'Gestão de Pessoas','3.	A estrutura da universidade é bastante hierarquizada. Por mais que falemos em participação e inclusão ainda é muito forte a sobreposição da vontade de professores em detrimento de posicionamento dos técnicos. Além disso, os relatos de maus tratos de professores a técnicos ainda é uma realidade em alguns campi. Para um projeto de gestão que fortaleça os princípios defendidos por nossa universidade é preciso atentar para essa questão e estabelecer um programa que inclua conscientização, regras claras contra assédio, acompanhamento de servidores e funcionários terceirizados.','s','n',22,NULL,'2021-06-25 14:38:02','2021-07-11 20:56:59'),(8,'JOSENILDES SANTOS DE OLIVEIRA','josenildes@hotmail.com',NULL,'Gestão de Pessoas','2.	Acredito que para construirmos um projeto de universidade inclusiva e plural em todos os seus aspectos temos que trabalhar com a cultura organizacional. Isso leva tempo e é, de fato, realizada com ações cotidianas. A Universidade possui vínculos diferentes em seu quadro funcional. Os cargos em comissão (sem vínculo efetivo) e os terceirizados estão mais propensos a sofrerem assédio moral por parte de chefes e até de colegas. São obrigados (muitas vezes de forma sutil) a desempenharem mais trabalhos que os demais, a atuarem fora do horário de expediente, em finais de semana. Muitas demandas são urgentes e claro, precisam ser resolvidas, mas outras surgem em razão do não planejamento das ações.','s','n',22,NULL,'2021-06-25 14:38:29','2021-07-11 20:56:18'),(9,'TATIANA SILVA DE JESUS MONTEIRO','tmonteiro@uneb.br',NULL,'Gestão de Pessoas','Analisar as aposentadoria dos técnicos e analistas que estão com estabilidade no cargo de DAS 3, que estão preste a se aposentar, adquirir um cargo maior, nem que seja por um ano, para que possa se aposentar com um salário melhor.\r\nParticipação dos técnico e analistas no envolvimento dos projetos e programas com recursos externos da Universidade.\r\nCriar espaços adequados para os técnicos e analistas para que possamos interagir com todos.\r\nVoltar aos nossos encontros anuais,  dos técnicos e analistas,  para que possamos interagir juntos  aos  nossos colegas das outras unidades Gestoras.\r\nAumentar as margens de CET e RTI dos técnicos, analistas e cargos,  que já estão defasadas...\r\nPromover palestras e discussões para nas aéreas administrativas e acadêmicas, para valorização dos servidores..\r\nCursos com cargas horárias maiores, para que possamos usar nos nossos planos e cargo e salários.\r\nVer junto ao governo do Estado, concursos públicos de técnicos e analistas, uma vez que a universidade está carente de servidores.\r\nValorizar mais os servidores técnicos, analistas e cargos em  homenagens , pelo tempo que trabalhou na Universidade.\r\nEsses são os anseios da categoria...','s','n',24,NULL,'2021-06-28 13:58:47','2021-07-11 20:59:21'),(10,'TANIA HETKOWSKI','hetk@uol.com.br',NULL,'Comunicação e Cultura','Destaco duas necessidades imensas: \r\n- Plano de Comunicação interna e externa;\r\n- Universidade como Rede que se desdobra para a comunidade e vice-versa.','s','n',NULL,NULL,'2021-06-28 21:10:31','2021-07-11 20:59:06'),(11,'AMALIA CATHARINA SANTOS CRUZ','amalia.cruz@yahoo.com.br',NULL,'Assistência Estudantil','Criar nos Departamentos um setor de apoio psicológico para atender às demandas, principalmente de estudantes!','s','n',NULL,NULL,'2021-06-28 21:57:07','2021-07-11 20:58:53'),(12,'AMALIA CATHARINA SANTOS CRUZ','amalia.cruz@yahoo.com.br',NULL,'Resp. Social e Ações Afirmativas','Aumentar o número de bolsas e projetos para atender às demandas de estudantes!','s','n',NULL,NULL,'2021-06-28 21:58:15','2021-07-11 20:57:53'),(13,'AMALIA CATHARINA SANTOS CRUZ','amalia.cruz@yahoo.com.br',NULL,'Gestão de Pessoas','Escutar mais as categorias e melhorar o plano de cargos e salários de todas as categorias','s','n',NULL,NULL,'2021-06-28 21:59:44','2021-07-11 20:54:41'),(14,'AMALIA CATHARINA SANTOS CRUZ','amalia.cruz@yahoo.com.br',NULL,'Infraestrutura','Garantir melhor estrutura para os docentes, com gabinetes, mais salas de orientação nós departamentos. Apoiar as ações, equipar e melhorar os laboratórios','s','n',NULL,NULL,'2021-06-28 22:01:09','2021-07-11 20:53:58'),(15,'AMALIA CATHARINA SANTOS CRUZ','amalia.cruz@yahoo.com.br',NULL,'Internacionalização','Promover com mais ênfase, informações e caminhas nos Campo sobre o que é e como é importante a internacionalização para a UNEB','s','n',NULL,NULL,'2021-06-28 22:02:14','2021-07-11 20:55:00'),(16,'AMALIA CATHARINA SANTOS CRUZ','amalia.cruz@yahoo.com.br',NULL,'Pesquisa e Inovação','Apoiar, criar e fomentar mais editais para TODAS as categorias, inclusive, concedendo o incentivo financeiro.','s','n',NULL,NULL,'2021-06-28 22:03:37','2021-07-11 20:53:37'),(17,'AMALIA CATHARINA SANTOS CRUZ','amalia.cruz@yahoo.com.br',NULL,'Pós-Graduação','Apoiar, criar e fomentar mais iniciativas de Pós-graduação stricto e lato sensu, principalmente nos Campi do interior, pois já contamos com pessoal qualificado em quantidade.','s','n',NULL,NULL,'2021-06-28 22:05:00','2021-07-11 20:53:14'),(18,'AMALIA CATHARINA SANTOS CRUZ','amalia.cruz@yahoo.com.br',NULL,'Pós-Graduação','Fomentar mais editais de bolsas de Pós-graduação stricto e lato sensu para as categorias.','s','n',NULL,NULL,'2021-06-28 22:06:19','2021-07-09 13:46:14'),(19,'AMALIA CATHARINA SANTOS CRUZ','amalia.cruz@yahoo.com.br',NULL,'Assistência Estudantil','Ver URGENTEMENTE as questões de moradia, bolsas e permanência estudantil, com atenção aos mais carente e vulneráveis, como a comunidade LGBTQIA+','s','n',NULL,NULL,'2021-06-28 22:07:32','2021-07-11 20:52:24'),(20,'EDINEIRAM MARINHO MACIEL','emaciel@uneb.br',NULL,'Comunicação e Cultura','O Campo da Cultura é essencial para a vida da Universidade. Não pode ser considerado como espaço de lazer, descontração, festividades, apoio e outros similares. Precisa ter a sua concepção ampliada como importante campo de conhecimento das Ciências Sociais e Humanas. A própria disposição deste campo nessa relação de áreas de contribuição já  atesta a ideia que se tem: junto com Comunicação, que também é um campo fundamental para a vida da Universidade. Mas não são um só campo. São dois campos de uma grandeza e importância fundamentais. Se comunicam e se entrelaçam, mas são campos autônomos, com suas características e conceitos próprios.\r\nNa UNEB contamos com a ASCULT,  que tem em seu regimento o propósito de construção deste campo. Mas não tem recebido o devido apoio da gestão que a criou e suas atividades  têm se reduzido à administração do Teatro da UNEB e de apoio a outras atividades, como as propostas pela PROEX ou pelos 4 professores que têm algumas horas do seu planejamento individual de trabalho dedicados a essa Assessoria. Não é este o espaço para relatos, mas é importante ressaltar.\r\nÉ importante ressaltar, também, que CULTURA E ARTE não podem ser vistas como Extensão. E que Extensão, na Universidade, não se limita a projetos nos campos da Cultura e da Arte. \r\nEnfim, vamos às sugestões para esta chapa que concorre à gestão da nossa Universidade.\r\n1. Fortalecimento das ações da ASCULT, ampliando e garantindo a execução orçamentária, para atuação nos diversos campi da Universidade.\r\n2. Criação do Departamento de Arte na UNEB (ou outra estrutura acadêmica similar), com ampliação de cursos oferecidos, tanto de Graduação como de Pós Graduação. Temos docentes Mestres e Doutores que têm condições de desenvolver cursos de pós graduação. \r\nNo momento temos 4 cursos de graduação distribuídos em diferentes espaços, com poucos professores envolvidos e sem relação entre si. Com a criação do Departamento, temos as condições de ampliar a oferta regular de outros cursos, presenciais e/ou a distância. Os únicos cursos com oferta regular são DESIGN (Campus I) e TEATRO (Campus VII). Música é oferta especial na UNEAD e Artes Visuais é convênio com o MEC, através da Plataforma Freire.\r\n3. Designação de um docente ou técnico em cada Campus e/ou Departamento para compor o quadro da ASCULT, com carga horária semanal de apenas 4 horas. Este profissional teria a função de articular as ações no campo da Cultura e da Arte com a Assessoria, que está instalada no Campus I.\r\n4. Ampliação do quadro de profissionais do Teatro da UNEB, possibilitando que o espaço esteja disponível por um tempo ampliado. Atualmente, as atividades são limitadas aos horários: 8 às 12 e 14 às 18. Para as atividades realizadas no turno da noite, o contratante precisa pagar o transporte dos funcionários que trabalharem nesse horário. Um teatro deve ter o seu horário disponibilizado integralmente, no mínimo das 7 às 23 horas!\r\n5. Recuperação e modernização das instalações do Teatro da UNEB.\r\n6. Formação e acompanhamento dos funcionários do Teatro da UNEB, para que exerçam suas funções de forma satisfatória e tenham boa relação com os usuários.\r\n7. Oferta de cursos de extensão nas diferentes áreas do campo da Arte e da Cultura, possibilitando aos estudantes em formação, de qualquer área, e aos professores dos diferentes cursos a compreensão da importância dos mesmos na formação e atuação profissional. Em um mundo onde se hipervaloriza os espaços da objetividade, explorar a subjetividade racionalmente nos torna mais humanos. \r\nNo momento, seguem estas considerações. \r\nPosteriormente volto a contribui.\r\nColoco-me à disposição para debates e construção dessa área na UNEB.','s','n',26,NULL,'2021-06-30 14:56:39','2021-07-11 20:52:00'),(21,'JOÃO PAULO SANTOS DE SOUZA','jpssousa@uneb.br',NULL,'Gestão e Organização','Gostaria de reiterar sobre a questão da necessidade de compra do acervo bibliográfico da UNEB. Algo que não acontece à algum tempo.\r\nAtenciosamente','s','n',27,NULL,'2021-07-05 20:58:49','2021-07-11 20:51:34'),(22,'Ronaldo Nascimento Santos','ronsantos@uneb.br',NULL,'Extensão','Proporcionar cursos ou oficinas que contribui para qualidade de vida do servidores.\r\nOficinas de Massoterapia, ginastica, dança, canto.\r\nNo Campus IV temos o Coral Vozes do Ouro que necessitamos manter essa atividade, que nos permite um momento de relaxamento e de aprendizado e cuido com a voz.','s','n',NULL,NULL,'2021-07-05 21:01:04','2021-07-09 13:46:35'),(23,'Ronaldo Nascimento Santos','ronsantos@uneb.br',NULL,'Tecnologia e Conectividade','Temos necessidades cursos de capacitação em área especifica como de Coordenadores de Informática que também sofre constante mudanças e não temos treinamento a muito tempo.\r\nAquisição de equipamento e reestrutura dos Laboratórios.','s','n',NULL,NULL,'2021-07-05 21:02:26','2021-07-11 20:50:47'),(24,'Ronaldo Nascimento Santos','ronsantos@uneb.br',NULL,'Planejamento e Avaliação Institucional','Temos necessidades cursos de capacitação em área especifica como Comissão de Licitação, constantemente tem alterações nas leis e procedimentos e a capacitação garante o bom desempenho do certame.','s','n',NULL,NULL,'2021-07-05 21:03:34','2021-07-09 14:30:24'),(25,'Claudio','claudiosouza.cia@gmail.com',NULL,'Internacionalização','Teste de contribuição para verificação do email','s','n',NULL,'2021-07-09 14:30:05','2021-07-07 17:48:14','2021-07-09 14:30:05'),(26,'João Silva Rocha Filho','jrochauneb@gmail.com',NULL,'Extensão','testando e-mail','s','n',NULL,'2021-07-11 20:53:05','2021-07-07 17:57:38','2021-07-11 20:53:05'),(27,'Maiana Rosari Lima Alcântara','maianarosari@gmail.com',NULL,'Gestão de Pessoas','Programa de incentivo e apoio para a formação acadêmica e profissional continuada dos técnicos efetivos, terceirizados, Reda e cargos de confiança. Incluindo cursos de graduação, pós, mestrado, doutorado, cursos de extensão e formação profissional.','s','n',NULL,NULL,'2021-07-08 19:30:01','2021-07-11 20:54:18'),(28,'AMALIA CATHARINA SANTOS CRUZ','amalia.cruz@yahoo.com.br',NULL,'Assistência Estudantil','Estimular mais editais de bolsas estudantis para os Campi do interior.','s','n',28,NULL,'2021-07-11 17:51:09','2021-07-11 20:56:43'),(29,'AMALIA CATHARINA SANTOS CRUZ','amalia.cruz@yahoo.com.br',NULL,'Gestão de Pessoas','Escutar mais e melhor as categorias, reconhecendo o trabalho desenvolvido e melhorando a comunicação com os Campi do interior, como a criação de \"subprefeituras\" por região (agrupando os Campi), que tenham autonomia para desburocratizar a vida acadêmica!','s','n',28,NULL,'2021-07-11 17:53:59','2021-07-11 20:56:02'),(30,'Carlos Henrique Valença Silva','chvsss@hotmail.com',NULL,'Extensão','a','n','n',NULL,NULL,'2021-07-12 22:42:43','2021-07-12 22:42:43'),(31,'ROSANGELA DE CARVALHO MATOS','rosinha_matos@hotmail.com',NULL,'Comunicação e Cultura','Monetização das redes sociais institucionais com o objetivo de difundir e propagar ações da universidade e também de provocar arrecadação de recursos para reinvestimento em ações específicas da UNEB.','n','n',13,NULL,'2021-07-13 23:44:50','2021-07-13 23:44:50'),(32,'João','josecaca@uol.com.br',NULL,'Graduação','Tô pensando...','n','n',NULL,NULL,'2021-07-14 20:32:24','2021-07-14 20:32:24'),(33,'SÉRGIO PAULO COSTA VITORINO','svitorinossa@gmail.com',NULL,'Gestão de Pessoas','Trabalho em um setor em que deveríamos ter uma equipe de trabalho qualificada: a Coordenação de TIC, responsável pela comunicação de um Departamento. Não percebemos interesse de contratação de pessoal capacitado, nos empurrando porteiros ou recepcionistas, sendo que a Universidade mantém contrato com empresa especializada, mas com contrato voltado exclusivamente para a Gerência de Informática. O quantitativo de porteiros e recepcionistas pode ser reduzido se pudermos identificar a função que cada terceirizado exerce nos seus postos de trabalho. Muitos sem identificação com a função que exerce. Estamos amadores em vários setores que requerem profissionais qualificados e com vontade de se sentir UNEB.','n','n',29,NULL,'2021-07-16 11:00:13','2021-07-16 11:00:13'),(34,'Aline Teixeira de Matos','at_dias@hotmail.com',NULL,'Assistência Estudantil','A implantação de um núcleo de saúde mental destinado aos estudantes nos departamentos da Uneb a fim de acolher e encaminhar as demandas relacionadas aos transtornos de ansiedade, depressão e esquizofrenia dentre outras. Neste sentido, essa proposta visa entender o sofrimento psíquico em sua complexidade e tratar os agravos mediante o fortalecimento psicológico dos estudantes.','n','n',NULL,NULL,'2021-07-21 18:14:13','2021-07-21 18:14:13');
/*!40000 ALTER TABLE `contribuis` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cursos`
--

DROP TABLE IF EXISTS `cursos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cursos` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=130 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cursos`
--

LOCK TABLES `cursos` WRITE;
/*!40000 ALTER TABLE `cursos` DISABLE KEYS */;
INSERT INTO `cursos` VALUES (1,'Administração',NULL,NULL),(2,'Administração Pública',NULL,NULL),(3,'Agroecologia',NULL,NULL),(4,'Arqueologia',NULL,NULL),(5,'Biologia',NULL,NULL),(6,'Ciências Biológicas',NULL,NULL),(7,'Ciências Contábeis',NULL,NULL),(8,'Ciências da Computação',NULL,NULL),(9,'Ciências Sociais',NULL,NULL),(10,'Comunicação Social / Rádio e TV',NULL,NULL),(11,'Cursos Livres Online',NULL,NULL),(12,'Design',NULL,NULL),(13,'Direito',NULL,NULL),(14,'Educação Digital',NULL,NULL),(15,'Educação Física',NULL,NULL),(16,'Educação Inclusiva',NULL,NULL),(17,'Enfermagem',NULL,NULL),(18,'Engenharia Agroindustrial',NULL,NULL),(19,'Engenharia Agronômica',NULL,NULL),(20,'Engenharia de Bioprocessos e Biotecnologia',NULL,NULL),(21,'Engenharia de Minas',NULL,NULL),(22,'Engenharia de Pesca',NULL,NULL),(23,'Engenharia de Produção Civil',NULL,NULL),(24,'Engenharia Sanitária e Ambiental',NULL,NULL),(25,'Espanhol',NULL,NULL),(26,'Farmácia',NULL,NULL),(27,'Filosofia',NULL,NULL),(28,'Física',NULL,NULL),(29,'Fisioterapia',NULL,NULL),(30,'Fonoaudiologia',NULL,NULL),(31,'Geografia',NULL,NULL),(32,'História',NULL,NULL),(33,'Inglês',NULL,NULL),(34,'Interdisciplinar em Estudos Sociais e Humanidades',NULL,NULL),(35,'Jogos Digitais',NULL,NULL),(36,'Jornalismo em Multimeios',NULL,NULL),(37,'Letras / Língua Espanhola e Literaturas',NULL,NULL),(38,'Letras / Língua Francesa e Literaturas',NULL,NULL),(39,'Letras / Língua Inglesa e Literaturas',NULL,NULL),(40,'Letras / Língua Portuguesa e Literaturas',NULL,NULL),(41,'Letras Espanhol',NULL,NULL),(42,'Letras Inglês',NULL,NULL),(43,'Letras Português',NULL,NULL),(44,'Licenciatura em Letras - Língua Espanhola e suas Literaturas',NULL,NULL),(45,'Licenciatura em Letras - Língua Inglesa e suas Literaturas',NULL,NULL),(46,'Licenciatura em Letras - Língua Portuguesa e suas Literaturas',NULL,NULL),(47,'Licenciatura em Química',NULL,NULL),(48,'Licenciatura Intercultural em Educação Escolar Indígena - LICEEI',NULL,NULL),(49,'Matemática',NULL,NULL),(50,'Medicina',NULL,NULL),(51,'Medicina Veterinária',NULL,NULL),(52,'Música',NULL,NULL),(53,'Nutrição',NULL,NULL),(54,'Pedagogia',NULL,NULL),(55,'Pedagogia Intercultural Indígena',NULL,NULL),(56,'Português',NULL,NULL),(57,'Psicologia',NULL,NULL),(58,'Química',NULL,NULL),(59,'Relações Públicas',NULL,NULL),(60,'Sistemas de Informação',NULL,NULL),(61,'Teatro',NULL,NULL),(62,'Turismo',NULL,NULL),(63,'Turismo e Hotelaria',NULL,NULL),(64,'Urbanismo',NULL,NULL),(65,'Pós-Graduação em Agroecologia e Desenvolvimento Territorial (PPGADT) ',NULL,NULL),(66,'Pós-Graduação em Agronomia: Horticultura Irrigada (PPGHI)',NULL,NULL),(67,'Pós-Graduação em Análise Ambiental e Gestão Sustentável do Território',NULL,NULL),(68,'Pós-Graduação em Biociências e Biodiversidade: Ecologia e Conservação Ambiental (BIOECOA)',NULL,NULL),(69,'Pós-Graduação em Biodiversidade Vegetal (PPGBVeg)',NULL,NULL),(70,'Pós-Graduação em Biologia Vegetal',NULL,NULL),(71,'Pós-Graduação em Ciências Farmacêuticas (PPGFARMA)',NULL,NULL),(72,'Pós-Graduação em Crítica Cultural (Pós-Crítica)',NULL,NULL),(73,'Pós-Graduação em Ecologia Humana e Gestão Socioambiental (PPGEcoH)',NULL,NULL),(74,'Pós-Graduação em Educação a Distância',NULL,NULL),(75,'Pós-Graduação em Educação Ambiental, Biodiversidade e Cultura Regional (EABCR)',NULL,NULL),(76,'Pós-Graduação em Educação de Jovens e Adultos (MPEJA)',NULL,NULL),(77,'Pós-Graduação em Educação do Campo',NULL,NULL),(78,'Pós-Graduação em Educação e Contemporaneidade (PPGEduC)',NULL,NULL),(79,'Pós-Graduação em Educação e Diversidade (MPED)',NULL,NULL),(80,'Pós-Graduação em Educação e Diversidade Étnico-Racial',NULL,NULL),(81,'Pós-Graduação em Educação e Meio Ambiente',NULL,NULL),(82,'Pós-Graduação em Educação Infantil',NULL,NULL),(83,'Pós-Graduação em Educação Matemática',NULL,NULL),(84,'Pós-Graduação em Educação Matemática e Contemporaneidade (PPGEEMC)',NULL,NULL),(85,'Pós-Graduação em Educação, Cultura e Territórios Semiáridos (PPGESA)',NULL,NULL),(86,'Pós-Graduação em Educação, Processos Tecnológicos e Práticas Inovadoras',NULL,NULL),(87,'Pós-Graduação em Enfermagem em Emergência e Unidade de Terapia Intensiva',NULL,NULL),(88,'Pós-Graduação em Ensino de Física (ProfFísica)',NULL,NULL),(89,'Pós-Graduação em Ensino de História (ProfHistoria)',NULL,NULL),(90,'Pós-Graduação em Ensino de Língua Portuguesa e Literaturas',NULL,NULL),(91,'Pós-Graduação em Ensino, Linguagem  e Sociedade  (PPGELS)',NULL,NULL),(92,'Pós-Graduação em Estudo de Linguagens (PPGEL)',NULL,NULL),(93,'Pós-Graduação em Estudos Africanos e Representações da África',NULL,NULL),(94,'Pós-Graduação em Estudos Africanos, Povos Indígenas e Culturas Negras (PPGEAFIN)',NULL,NULL),(95,'Pós-Graduação em Estudos Literários e Linguística Aplicada ao Ensino',NULL,NULL),(96,'Pós-Graduação em Estudos Sociais e Humanidades',NULL,NULL),(97,'Pós-Graduação em Estudos Territoriais (PROET)',NULL,NULL),(98,'Pós-Graduação em Gênero, Raça, Etnia e Sexualidades na Formação de Educadores',NULL,NULL),(99,'Pós-Graduação em Geografia e Desenvolvimento Territorial',NULL,NULL),(100,'Pós-Graduação em Gestão do Patrimônio Histórico-Cultural e Ambiental ',NULL,NULL),(101,'Pós-Graduação em Gestão e Políticas Públicas para a Educação Básica e a Implantação do Observatório de Gestão de Políticas Públicas para a Educação Básica',NULL,NULL),(102,'Pós-Graduação em Gestão e Tecnologia Aplicadas à Educação (GESTEC)',NULL,NULL),(103,'Pós-Graduação em Gestão em Saúde',NULL,NULL),(104,'Pós-Graduação em Gestão Estratégica das Organizações',NULL,NULL),(105,'Pós-Graduação em Gestão Estratégica e Negócios',NULL,NULL),(106,'Pós-Graduação em Gestão Pública',NULL,NULL),(107,'Pós-Graduação em Gestão Pública Municipal',NULL,NULL),(108,'Pós-Graduação em História (Pós-História)',NULL,NULL),(109,'Pós-Graduação em História Regional e Local (PPGHIS)',NULL,NULL),(110,'Pós-Graduação em História Social da Cultura',NULL,NULL),(111,'Pós-Graduação em História, Cultura e Sociedade',NULL,NULL),(112,'Pós-Graduação em História, Educação e Sociedade',NULL,NULL),(113,'Pós-Graduação em Intervenção Educativa e Social (MPIES)',NULL,NULL),(114,'Pós-Graduação em Letras (PPGL)                                                                                                                 ',NULL,NULL),(115,'Pós-Graduação em Linguística Aplicada ao Ensino da Língua Portuguesa',NULL,NULL),(116,'Pós-Graduação em Literatura Brasileira',NULL,NULL),(117,'Pós-Graduação em Literatura Brasileira: Formação do Cânone e Contrapontos Críticos',NULL,NULL),(118,'Pós-Graduação em Matemática Aplicada',NULL,NULL),(119,'Pós-Graduação em Metodologia do Ensino-aprendizagem de Línguas Estrangeiras ',NULL,NULL),(120,'Pós-Graduação em Política do Planejamento Pedagógico: Currículo, Didática e Avaliação',NULL,NULL),(121,'Pós-Graduação em Pós-Graduação em Formação de Professores em Letras/LIBRAS',NULL,NULL),(122,'Pós-Graduação em Práticas Docentes Interdisciplinares',NULL,NULL),(123,'Pós-Graduação em Produção Vegetal no Cerrado',NULL,NULL),(124,'Pós-Graduação em Química Aplicada (PGQA)',NULL,NULL),(125,'Pós-Graduação em Saúde Coletiva  (MEPISCO)',NULL,NULL),(126,'Pós-Graduação Modelagem e Simulação de Biossistemas (PPGMSB)                                                         ',NULL,NULL),(127,'Pós-Graduação Multi-Institucional Multidisciplinar em Difusão do Conhecimento (DMMDC)',NULL,NULL),(128,'Pós-Graduação Profissional em Letras (Profletras)',NULL,NULL),(129,'Pós-Graduação Residência Multiprofissional em Saúde',NULL,NULL);
/*!40000 ALTER TABLE `cursos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `departamentos`
--

DROP TABLE IF EXISTS `departamentos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `departamentos` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sigla` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departamentos`
--

LOCK TABLES `departamentos` WRITE;
/*!40000 ALTER TABLE `departamentos` DISABLE KEYS */;
INSERT INTO `departamentos` VALUES (1,'Administração Central','AdmCentral',NULL,NULL),(2,'Departamento de Ciências da Vida','DCV',NULL,NULL),(3,'Departamento de Ciências Exatas e da Terra','DCET',NULL,NULL),(4,'Departamento de Ciências Humanas','DCH',NULL,NULL),(5,'Departamento de Ciências Humanas e Tecnologias','DCHT',NULL,NULL),(6,'Departamento de Educação','DEDC',NULL,NULL),(7,'Departamento de Linguística, Literatura e Artes','DLLARTES',NULL,NULL),(8,'Departamento de Tecnologia e Ciências Sociais','DTCS',NULL,NULL),(9,'Unidade de Ensino a Distância','EAD - UNEAD',NULL,NULL),(10,'Plano Nac. de Form. Dos Prof. Da Educação Básica','PARFOR',NULL,NULL);
/*!40000 ALTER TABLE `departamentos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dimensions`
--

DROP TABLE IF EXISTS `dimensions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dimensions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sigla` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `introd` text COLLATE utf8mb4_unicode_ci,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `user_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `dimensions_user_id_foreign` (`user_id`),
  CONSTRAINT `dimensions_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dimensions`
--

LOCK TABLES `dimensions` WRITE;
/*!40000 ALTER TABLE `dimensions` DISABLE KEYS */;
INSERT INTO `dimensions` VALUES (1,'Graduação','Grad','Dimensão que se refere ao objeto central da UNEB, que engloba os cursos de graduação. Não por acaso está listada como primeira, mostrando a importância merecida',NULL,1,NULL,NULL),(2,'Pós-Graduação','Pós','Consequuntur inventore voluptates consequatur aut vel et. Eos doloribus expedita. Sapiente atque consequatur minima nihil quae aspernatur quo suscipit voluptatem',NULL,1,NULL,NULL),(3,'Educação a Distância','EAD','Consequuntur inventore voluptates consequatur aut vel et. Eos doloribus expedita. Sapiente atque consequatur minima nihil quae aspernatur quo suscipit voluptatem',NULL,1,NULL,NULL),(4,'Extensão','Exte','Consequuntur inventore voluptates consequatur aut vel et. Eos doloribus expedita. Sapiente atque consequatur minima nihil quae aspernatur quo suscipit voluptatem',NULL,1,NULL,NULL),(5,'Pesquisa e Inovação','Pesq','Consequuntur inventore voluptates consequatur aut vel et. Eos doloribus expedita. Sapiente atque consequatur minima nihil quae aspernatur quo suscipit voluptatem',NULL,1,NULL,NULL),(6,'Internacionalização','Inter','Consequuntur inventore voluptates consequatur aut vel et. Eos doloribus expedita. Sapiente atque consequatur minima nihil quae aspernatur quo suscipit voluptatem',NULL,1,NULL,NULL),(7,'Gestão e Organização','Gestão','Consequuntur inventore voluptates consequatur aut vel et. Eos doloribus expedita. Sapiente atque consequatur minima nihil quae aspernatur quo suscipit voluptatem',NULL,1,NULL,NULL),(8,'Gestão de Pessoas','RecHum','Consequuntur inventore voluptates consequatur aut vel et. Eos doloribus expedita. Sapiente atque consequatur minima nihil quae aspernatur quo suscipit voluptatem',NULL,1,NULL,NULL),(9,'Infraestrutura','Infra','Consequuntur inventore voluptates consequatur aut vel et. Eos doloribus expedita. Sapiente atque consequatur minima nihil quae aspernatur quo suscipit voluptatem',NULL,1,NULL,NULL),(10,'Planejamento e Avaliação Institucional','Aval','Consequuntur inventore voluptates consequatur aut vel et. Eos doloribus expedita. Sapiente atque consequatur minima nihil quae aspernatur quo suscipit voluptatem',NULL,1,NULL,NULL),(11,'Assistência Estudantil','AssitEstud','Consequuntur inventore voluptates consequatur aut vel et. Eos doloribus expedita. Sapiente atque consequatur minima nihil quae aspernatur quo suscipit voluptatem',NULL,1,NULL,NULL),(12,'Responsabilidade Social e Ações Afirmativas','AcAfirm','Consequuntur inventore voluptates consequatur aut vel et. Eos doloribus expedita. Sapiente atque consequatur minima nihil quae aspernatur quo suscipit voluptatem',NULL,1,NULL,NULL),(13,'Comunicação e Cultura','Comunic','Consequuntur inventore voluptates consequatur aut vel et. Eos doloribus expedita. Sapiente atque consequatur minima nihil quae aspernatur quo suscipit voluptatem',NULL,1,NULL,NULL),(14,'Tecnologia e Conectividade','TecCon','Consequuntur inventore voluptates consequatur aut vel et. Eos doloribus expedita. Sapiente atque consequatur minima nihil quae aspernatur quo suscipit voluptatem',NULL,1,NULL,NULL);
/*!40000 ALTER TABLE `dimensions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eixos`
--

DROP TABLE IF EXISTS `eixos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `eixos` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descr` text COLLATE utf8mb4_unicode_ci,
  `forca` text COLLATE utf8mb4_unicode_ci,
  `fraqu` text COLLATE utf8mb4_unicode_ci,
  `oport` text COLLATE utf8mb4_unicode_ci,
  `ameac` text COLLATE utf8mb4_unicode_ci,
  `publica` enum('s','n') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `dimension_id` bigint unsigned NOT NULL,
  `user_id` bigint unsigned NOT NULL,
  `altera` datetime DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `eixos_dimension_id_foreign` (`dimension_id`),
  KEY `eixos_user_id_foreign` (`user_id`),
  CONSTRAINT `eixos_dimension_id_foreign` FOREIGN KEY (`dimension_id`) REFERENCES `dimensions` (`id`),
  CONSTRAINT `eixos_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=66 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eixos`
--

LOCK TABLES `eixos` WRITE;
/*!40000 ALTER TABLE `eixos` DISABLE KEYS */;
INSERT INTO `eixos` VALUES (1,'1 - Formação cidadã e profissional','null','null','null','null','null','s',1,1,NULL,NULL,NULL,NULL),(2,'2 - Produção e difusão do conhecimento ','null','null','null','null','null','s',1,1,NULL,NULL,NULL,NULL),(3,'3 - Acesso e permanência com qualidade ','null','null','null','null','null','s',1,1,NULL,NULL,NULL,NULL),(4,'4 - Articulação universidade e sociedade','null','null','null','null','null','s',1,1,NULL,NULL,NULL,NULL),(5,'5 - Democratização, descentralização e transparência','null','null','null','null','null','s',1,1,NULL,NULL,NULL,NULL),(6,'1 - Formação cidadã e profissional','null','null','null','null','null','s',2,1,NULL,NULL,NULL,NULL),(7,'2 - Produção e difusão do conhecimento ','null','null','null','null','null','s',2,1,NULL,NULL,NULL,NULL),(8,'3 - Acesso e permanência com qualidade ','null','null','null','null','null','s',2,1,NULL,NULL,NULL,NULL),(9,'4 - Articulação universidade e sociedade','null','null','null','null','null','s',2,1,NULL,NULL,NULL,NULL),(10,'5 - Democratização, descentralização e transparência','null','null','null','null','null','s',2,1,NULL,NULL,NULL,NULL),(11,'1 - Formação cidadã e profissional','null','null','null','null','null','s',3,1,NULL,NULL,NULL,NULL),(12,'2 - Produção e difusão do conhecimento ','null','null','null','null','null','s',3,1,NULL,NULL,NULL,NULL),(13,'3 - Acesso e permanência com qualidade ','null','null','null','null','null','s',3,1,NULL,NULL,NULL,NULL),(14,'4 - Articulação universidade e sociedade','null','null','null','null','null','s',3,1,NULL,NULL,NULL,NULL),(15,'5 - Democratização, descentralização e transparência','null','null','null','null','null','s',3,1,NULL,NULL,NULL,NULL),(16,'1 - Formação cidadã e profissional','null','null','null','null','null','s',4,1,NULL,NULL,NULL,NULL),(17,'2 - Produção e difusão do conhecimento ','null','null','null','null','null','s',4,1,NULL,NULL,NULL,NULL),(18,'3 - Acesso e permanência com qualidade ','null','null','null','null','null','s',4,1,NULL,NULL,NULL,NULL),(19,'4 - Articulação universidade e sociedade','null','null','null','null','null','s',4,1,NULL,NULL,NULL,NULL),(20,'5 - Democratização, descentralização e transparência','null','null','null','null','null','s',4,1,NULL,NULL,NULL,NULL),(21,'1 - Formação cidadã e profissional','null','null','null','null','null','s',5,1,NULL,NULL,NULL,NULL),(22,'2 - Produção e difusão do conhecimento ','null','null','null','null','null','s',5,1,NULL,NULL,NULL,NULL),(23,'3 - Acesso e permanência com qualidade ','null','null','null','null','null','s',5,1,NULL,NULL,NULL,NULL),(24,'4 - Articulação universidade e sociedade','null','null','null','null','null','s',5,1,NULL,NULL,NULL,NULL),(25,'5 - Democratização, descentralização e transparência','null','null','null','null','null','s',5,1,NULL,NULL,NULL,NULL),(26,'1 - Formação cidadã e profissional','null','null','null','null','null','s',6,1,NULL,NULL,NULL,NULL),(27,'2 - Produção e difusão do conhecimento ','null','null','null','null','null','s',6,1,NULL,NULL,NULL,NULL),(28,'3 - Acesso e permanência com qualidade ','null','null','null','null','null','s',6,1,NULL,NULL,NULL,NULL),(29,'4 - Articulação universidade e sociedade','null','null','null','null','null','s',6,1,NULL,NULL,NULL,NULL),(30,'5 - Democratização, descentralização e transparência','null','null','null','null','null','s',6,1,NULL,NULL,NULL,NULL),(31,'1 - Formação cidadã e profissional','null','null','null','null','null','s',7,1,NULL,NULL,NULL,NULL),(32,'2 - Produção e difusão do conhecimento ','null','null','null','null','null','s',7,1,NULL,NULL,NULL,NULL),(33,'3 - Acesso e permanência com qualidade ','null','null','null','null','null','s',7,1,NULL,NULL,NULL,NULL),(34,'4 - Articulação universidade e sociedade','null','null','null','null','null','s',7,1,NULL,NULL,NULL,NULL),(35,'5 - Democratização, descentralização e transparência','null','null','null','null','null','s',7,1,NULL,NULL,NULL,NULL),(36,'1 - Formação cidadã e profissional','null','null','null','null','null','s',8,1,NULL,NULL,NULL,NULL),(37,'2 - Produção e difusão do conhecimento ','null','null','null','null','null','s',8,1,NULL,NULL,NULL,NULL),(38,'3 - Acesso e permanência com qualidade ','null','null','null','null','null','s',8,1,NULL,NULL,NULL,NULL),(39,'4 - Articulação universidade e sociedade','null','null','null','null','null','s',8,1,NULL,NULL,NULL,NULL),(40,'5 - Democratização, descentralização e transparência','null','null','null','null','null','s',8,1,NULL,NULL,NULL,NULL),(41,'1 - Formação cidadã e profissional','null','null','null','null','null','s',9,1,NULL,NULL,NULL,NULL),(42,'2 - Produção e difusão do conhecimento ','null','null','null','null','null','s',9,1,NULL,NULL,NULL,NULL),(43,'3 - Acesso e permanência com qualidade ','null','null','null','null','null','s',9,1,NULL,NULL,NULL,NULL),(44,'4 - Articulação universidade e sociedade','null','null','null','null','null','s',9,1,NULL,NULL,NULL,NULL),(45,'5 - Democratização, descentralização e transparência','null','null','null','null','null','s',9,1,NULL,NULL,NULL,NULL),(46,'1 - Formação cidadã e profissional','<p>null</p>','<p>null</p>','<p>Pouca utiliza&ccedil;&atilde;o de registros e dados pelos gestores acad&ecirc;micos</p>\r\n\r\n<p>Pouca utiliza&ccedil;&atilde;o de registros e dados pela gest&atilde;o superior</p>','<p>Consolida&ccedil;&atilde;o do Portal da Avalia&ccedil;&atilde;o Institucional</p>','<p>Baixo desempenho de alguns cursos (com nota 1 ou 2 no ENADE e CPC)</p>','s',10,1,'2021-06-21 15:44:10',NULL,NULL,'2021-06-21 15:44:30'),(47,'2 - Produção e difusão do conhecimento ','null','null','null','null','null','s',10,1,NULL,NULL,NULL,NULL),(48,'3 - Acesso e permanência com qualidade ','null','null','null','null','null','s',10,1,NULL,NULL,NULL,NULL),(49,'4 - Articulação universidade e sociedade','<p>null</p>','<p>Disponibiliza&ccedil;&atilde;o de dados acad&ecirc;micos consolidados atrav&eacute;s do Anu&aacute;rio UNEB em Dados</p>\r\n\r\n<p>Consolida&ccedil;&atilde;o de dados institucionais em plataformas oficiais (e-MEC)</p>','<p>null</p>','<p>Atualiza&ccedil;&atilde;o do Plano de Desenvolvimento Institucional</p>\r\n\r\n<p>Reconstitui&ccedil;&atilde;o da CPA e revis&atilde;o conceitual de sua atua&ccedil;&atilde;o</p>\r\n\r\n<p>Manuten&ccedil;&atilde;o da nota IGC que qualifica a Universidade</p>','<p>Pouca participa&ccedil;&atilde;o da Universidade nos Programas do Plano Plurianual (PPA)</p>','s',10,5,'2021-06-21 16:56:30',NULL,NULL,'2021-06-21 16:57:01'),(50,'5 - Democratização, descentralização e transparência','<p>null</p>','<ul>\r\n	<li>Desenvolvimento de indicadores de acompanhamento de curso junto a Departamentos/colegiados de curso</li>\r\n	<li>Implementa&ccedil;&atilde;o de novo sistema de emiss&atilde;o de diplomas (SRDC)</li>\r\n	<li>Mobiliza&ccedil;&atilde;o da comunidade acad&ecirc;mica para participa&ccedil;&atilde;o no ENADE</li>\r\n	<li>Implanta&ccedil;&atilde;o de aplicativo para dispositivos m&oacute;veis (caderneta mobile)</li>\r\n	<li>Consolida&ccedil;&atilde;o de registros e dados acad&ecirc;micos a partir da SEAVI/SGC/UDO/SERDIC</li>\r\n	<li>Sistematiza&ccedil;&atilde;o de metodologia para presta&ccedil;&atilde;o de informa&ccedil;&atilde;o ao INEP (Censo da educa&ccedil;&atilde;o superior)</li>\r\n	<li>Alinhamento de procedimentos entre SEAVI, SGC e Departamentos para registros acad&ecirc;micos</li>\r\n	<li>Melhoria do atendimento &agrave;s pol&iacute;ticas nacionais de avalia&ccedil;&atilde;o (MEC e INEP)</li>\r\n	<li>Implanta&ccedil;&atilde;o do Sistema Informatizado de Planejamento e Gest&atilde;o Universit&aacute;ria (SPGU)</li>\r\n	<li>Articula&ccedil;&atilde;o entre os processos de planejamento e avalia&ccedil;&atilde;o institucional</li>\r\n	<li>Regulamenta&ccedil;&atilde;o para implementa&ccedil;&atilde;o do or&ccedil;amento participativo</li>\r\n</ul>','<ul>\r\n	<li>Composi&ccedil;&atilde;o funcional da SEAVI</li>\r\n	<li>Dificuldades de articula&ccedil;&atilde;o entre setores da administra&ccedil;&atilde;o superior para desenvolvimento de processos avaliativos</li>\r\n	<li>Dificudade para composi&ccedil;&atilde;o do quadro da CPA</li>\r\n	<li>Dificuldade de atua&ccedil;&atilde;o da CPA</li>\r\n	<li>Atendimento de demandas por informa&ccedil;&otilde;es em car&aacute;ter de urg&ecirc;ncia</li>\r\n	<li>Desatualiza&ccedil;&atilde;o do Sistema Informatizado de Planejamento (SIP)</li>\r\n	<li>Cultura de planejamento institucional incipiente</li>\r\n	<li>Dificuldade na obten&ccedil;&atilde;o de informa&ccedil;&otilde;es sobre as atividades desenvolvidas no &acirc;mbito da Universidade</li>\r\n	<li>Pouca participa&ccedil;&atilde;o da comunidade universit&aacute;ria na elabora&ccedil;&atilde;o da proposta or&ccedil;ament&aacute;ria</li>\r\n</ul>','<ul>\r\n	<li>Articula&ccedil;&atilde;o com as Secretarias de Planejamento e Fazenda (Seplan e Sefaz)</li>\r\n</ul>','<ul>\r\n	<li>Contigenciamento dos recursos financeiros em rela&ccedil;&atilde;o ao or&ccedil;amento aprovado.</li>\r\n</ul>','n',10,5,'2021-06-21 16:58:05',NULL,NULL,'2021-06-21 16:58:18'),(51,'1 - Formação cidadã e profissional','null','null','null','null','null','s',11,1,NULL,NULL,NULL,NULL),(52,'2 - Produção e difusão do conhecimento ','null','null','null','null','null','s',11,1,NULL,NULL,NULL,NULL),(53,'3 - Acesso e permanência com qualidade ','null','null','null','null','null','s',11,1,NULL,NULL,NULL,NULL),(54,'4 - Articulação universidade e sociedade','null','null','null','null','null','s',11,1,NULL,NULL,NULL,NULL),(55,'5 - Democratização, descentralização e transparência','null','null','null','null','null','s',11,1,NULL,NULL,NULL,NULL),(56,'1 - Formação cidadã e profissional','null','null','null','null','null','s',12,1,NULL,NULL,NULL,NULL),(57,'2 - Produção e difusão do conhecimento ','null','null','null','null','null','s',12,1,NULL,NULL,NULL,NULL),(58,'3 - Acesso e permanência com qualidade ','null','null','null','null','null','s',12,1,NULL,NULL,NULL,NULL),(59,'4 - Articulação universidade e sociedade','null','null','null','null','null','s',12,1,NULL,NULL,NULL,NULL),(60,'5 - Democratização, descentralização e transparência','null','null','null','null','null','s',12,1,NULL,NULL,NULL,NULL),(61,'1 - Formação cidadã e profissional','null','null','null','null','null','s',13,1,NULL,NULL,NULL,NULL),(62,'2 - Produção e difusão do conhecimento ','null','null','null','null','null','s',13,1,NULL,NULL,NULL,NULL),(63,'3 - Acesso e permanência com qualidade ','null','null','null','null','null','s',13,1,NULL,NULL,NULL,NULL),(64,'4 - Articulação universidade e sociedade','null','null','null','null','null','s',13,1,NULL,NULL,NULL,NULL),(65,'5 - Democratização, descentralização e transparência','null','null','null','null','null','s',13,1,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `eixos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failed_jobs`
--

LOCK TABLES `failed_jobs` WRITE;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `liders`
--

DROP TABLE IF EXISTS `liders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `liders` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `liders`
--

LOCK TABLES `liders` WRITE;
/*!40000 ALTER TABLE `liders` DISABLE KEYS */;
/*!40000 ALTER TABLE `liders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2014_05_25_233430_create_municipios_table',1),(2,'2014_05_25_233440_create_campuses_table',1),(3,'2014_05_25_233448_create_departamentos_table',1),(4,'2014_05_25_233521_create_cursos_table',1),(5,'2014_10_12_000000_create_users_table',1),(6,'2014_10_12_100000_create_password_resets_table',1),(7,'2014_10_12_200000_add_two_factor_columns_to_users_table',1),(8,'2019_08_19_000000_create_failed_jobs_table',1),(9,'2019_12_14_000001_create_personal_access_tokens_table',1),(10,'2021_05_25_000556_create_sessions_table',1),(11,'2021_05_25_233633_create_liders_table',1),(12,'2021_05_25_233655_create_representantes_table',1),(13,'2021_06_07_140011_create_contacts_table',1),(14,'2021_06_13_162757_create_dimensions_table',1),(15,'2021_06_14_083837_create_eixos_table',1),(16,'2021_06_16_170656_create_contribuis_table',1),(17,'2021_06_22_141422_add_softdelete_columns_to_contacts_table',2);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `municipios`
--

DROP TABLE IF EXISTS `municipios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `municipios` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=418 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `municipios`
--

LOCK TABLES `municipios` WRITE;
/*!40000 ALTER TABLE `municipios` DISABLE KEYS */;
INSERT INTO `municipios` VALUES (1,'Abaíra',NULL,NULL),(2,'Abaré',NULL,NULL),(3,'Acajutiba',NULL,NULL),(4,'Adustina',NULL,NULL),(5,'Água Fria',NULL,NULL),(6,'Érico Cardoso',NULL,NULL),(7,'Aiquara',NULL,NULL),(8,'Alagoinhas',NULL,NULL),(9,'Alcobaça',NULL,NULL),(10,'Almadina',NULL,NULL),(11,'Amargosa',NULL,NULL),(12,'Amélia Rodrigues',NULL,NULL),(13,'América Dourada',NULL,NULL),(14,'Anagé',NULL,NULL),(15,'Andaraí',NULL,NULL),(16,'Andorinha',NULL,NULL),(17,'Angical',NULL,NULL),(18,'Anguera',NULL,NULL),(19,'Antas',NULL,NULL),(20,'Antônio Cardoso',NULL,NULL),(21,'Antônio Gonçalves',NULL,NULL),(22,'Aporá',NULL,NULL),(23,'Apuarema',NULL,NULL),(24,'Aracatu',NULL,NULL),(25,'Araças',NULL,NULL),(26,'Araci',NULL,NULL),(27,'Aramari',NULL,NULL),(28,'Arataca',NULL,NULL),(29,'Aratuípe',NULL,NULL),(30,'Aurelino Leal',NULL,NULL),(31,'Baianópolis',NULL,NULL),(32,'Baixa Grande',NULL,NULL),(33,'Banzaê',NULL,NULL),(34,'Barra',NULL,NULL),(35,'Barra da Estiva',NULL,NULL),(36,'Barra do Choça',NULL,NULL),(37,'Barra do Mendes',NULL,NULL),(38,'Barra do Rocha',NULL,NULL),(39,'Barreiras',NULL,NULL),(40,'Barro Alto',NULL,NULL),(41,'Barrocas',NULL,NULL),(42,'Governador Lomanto Júnior',NULL,NULL),(43,'Belmonte',NULL,NULL),(44,'Belo Campo',NULL,NULL),(45,'Biritinga',NULL,NULL),(46,'Boa Nova',NULL,NULL),(47,'Boa Vista do Tupim',NULL,NULL),(48,'Bom Jesus da Lapa',NULL,NULL),(49,'Bom Jesus da Serra',NULL,NULL),(50,'Boninal',NULL,NULL),(51,'Bonito',NULL,NULL),(52,'Boquira',NULL,NULL),(53,'Botuporã',NULL,NULL),(54,'Brejões',NULL,NULL),(55,'Brejolândia',NULL,NULL),(56,'Brotas de Macaúbas',NULL,NULL),(57,'Brumado',NULL,NULL),(58,'Buerarema',NULL,NULL),(59,'Buritirama',NULL,NULL),(60,'Caatiba',NULL,NULL),(61,'Cabaceiras do Paraguaçu',NULL,NULL),(62,'Cachoeira',NULL,NULL),(63,'Caculé',NULL,NULL),(64,'Caém',NULL,NULL),(65,'Caetanos',NULL,NULL),(66,'Caetité',NULL,NULL),(67,'Cafarnaum',NULL,NULL),(68,'Cairu',NULL,NULL),(69,'Caldeirão Grande',NULL,NULL),(70,'Camacan',NULL,NULL),(71,'Camaçari',NULL,NULL),(72,'Camamu',NULL,NULL),(73,'Campo Alegre de Lourdes',NULL,NULL),(74,'Campo Formoso',NULL,NULL),(75,'Canápolis',NULL,NULL),(76,'Canarana',NULL,NULL),(77,'Canavieiras',NULL,NULL),(78,'Candeal',NULL,NULL),(79,'Candeias',NULL,NULL),(80,'Candiba',NULL,NULL),(81,'Cândido Sales',NULL,NULL),(82,'Cansanção',NULL,NULL),(83,'Canudos',NULL,NULL),(84,'Capela do Alto Alegre',NULL,NULL),(85,'Capim Grosso',NULL,NULL),(86,'Caraíbas',NULL,NULL),(87,'Caravelas',NULL,NULL),(88,'Cardeal da Silva',NULL,NULL),(89,'Carinhanha',NULL,NULL),(90,'Casa Nova',NULL,NULL),(91,'Castro Alves',NULL,NULL),(92,'Catolândia',NULL,NULL),(93,'Catu',NULL,NULL),(94,'Caturama',NULL,NULL),(95,'Central',NULL,NULL),(96,'Chorrochó',NULL,NULL),(97,'Cícero Dantas',NULL,NULL),(98,'Cipó',NULL,NULL),(99,'Coaraci',NULL,NULL),(100,'Cocos',NULL,NULL),(101,'Conceição da Feira',NULL,NULL),(102,'Conceição do Almeida',NULL,NULL),(103,'Conceição do Coité',NULL,NULL),(104,'Conceição do Jacuípe',NULL,NULL),(105,'Conde',NULL,NULL),(106,'Condeúba',NULL,NULL),(107,'Contendas do Sincorá',NULL,NULL),(108,'Coração de Maria',NULL,NULL),(109,'Cordeiros',NULL,NULL),(110,'Coribe',NULL,NULL),(111,'Coronel João Sá',NULL,NULL),(112,'Correntina',NULL,NULL),(113,'Cotegipe',NULL,NULL),(114,'Cravolândia',NULL,NULL),(115,'Crisópolis',NULL,NULL),(116,'Cristópolis',NULL,NULL),(117,'Cruz das Almas',NULL,NULL),(118,'Curaçá',NULL,NULL),(119,'Dário Meira',NULL,NULL),(120,'Dias D\\´Ávila',NULL,NULL),(121,'Dom Basílio',NULL,NULL),(122,'Dom Macedo Costa',NULL,NULL),(123,'Elísio Medrado',NULL,NULL),(124,'Encruzilhada',NULL,NULL),(125,'Entre Rios',NULL,NULL),(126,'Esplanada',NULL,NULL),(127,'Euclides da Cunha',NULL,NULL),(128,'Eunápolis',NULL,NULL),(129,'Fátima',NULL,NULL),(130,'Feira da Mata',NULL,NULL),(131,'Feira de Santana',NULL,NULL),(132,'Filadélfia',NULL,NULL),(133,'Firmino Alves',NULL,NULL),(134,'Floresta Azul',NULL,NULL),(135,'Formosa do Rio Preto',NULL,NULL),(136,'Gandu',NULL,NULL),(137,'Gavião',NULL,NULL),(138,'Gentio do Ouro',NULL,NULL),(139,'Glória',NULL,NULL),(140,'Gongogi',NULL,NULL),(141,'Governador Mangabeira',NULL,NULL),(142,'Guajeru',NULL,NULL),(143,'Guanambi',NULL,NULL),(144,'Guaratinga',NULL,NULL),(145,'Heliópolis',NULL,NULL),(146,'Iaçu',NULL,NULL),(147,'Ibiassucê',NULL,NULL),(148,'Ibicaraí',NULL,NULL),(149,'Ibicoara',NULL,NULL),(150,'Ibicuí',NULL,NULL),(151,'Ibipeba',NULL,NULL),(152,'Ibipitanga',NULL,NULL),(153,'Ibiquera',NULL,NULL),(154,'Ibirapitanga',NULL,NULL),(155,'Ibirapuã',NULL,NULL),(156,'Ibirataia',NULL,NULL),(157,'Ibitiara',NULL,NULL),(158,'Ibititá',NULL,NULL),(159,'Ibotirama',NULL,NULL),(160,'Ichu',NULL,NULL),(161,'Igaporã',NULL,NULL),(162,'Igrapiúna',NULL,NULL),(163,'Iguaí',NULL,NULL),(164,'Ilhéus',NULL,NULL),(165,'Inhambupe',NULL,NULL),(166,'Ipecaetá',NULL,NULL),(167,'Ipiaú',NULL,NULL),(168,'Ipirá',NULL,NULL),(169,'Ipupiara',NULL,NULL),(170,'Irajuba',NULL,NULL),(171,'Iramaia',NULL,NULL),(172,'Iraquara',NULL,NULL),(173,'Irará',NULL,NULL),(174,'Irecê',NULL,NULL),(175,'Itabela',NULL,NULL),(176,'Itaberaba',NULL,NULL),(177,'Itabuna',NULL,NULL),(178,'Itacaré',NULL,NULL),(179,'Itaeté',NULL,NULL),(180,'Itagi',NULL,NULL),(181,'Itagibá',NULL,NULL),(182,'Itagimirim',NULL,NULL),(183,'Itaguaçu da Bahia',NULL,NULL),(184,'Itaju do Colônia',NULL,NULL),(185,'Itajuípe',NULL,NULL),(186,'Itamaraju',NULL,NULL),(187,'Itamari',NULL,NULL),(188,'Itambé',NULL,NULL),(189,'Itanagra',NULL,NULL),(190,'Itanhém',NULL,NULL),(191,'Itaparica',NULL,NULL),(192,'Itapé',NULL,NULL),(193,'Itapebi',NULL,NULL),(194,'Itapetinga',NULL,NULL),(195,'Itapicuru',NULL,NULL),(196,'Itapitanga',NULL,NULL),(197,'Itaquara',NULL,NULL),(198,'Itarantim',NULL,NULL),(199,'Itatim',NULL,NULL),(200,'Itiruçu',NULL,NULL),(201,'Itiúba',NULL,NULL),(202,'Itororó',NULL,NULL),(203,'Ituaçu',NULL,NULL),(204,'Ituberá',NULL,NULL),(205,'Iuiú',NULL,NULL),(206,'Jaborandi',NULL,NULL),(207,'Jacaraci',NULL,NULL),(208,'Jacobina',NULL,NULL),(209,'Jaguaquara',NULL,NULL),(210,'Jaguarari',NULL,NULL),(211,'Jaguaripe',NULL,NULL),(212,'Jandaíra',NULL,NULL),(213,'Jequié',NULL,NULL),(214,'Jeremoabo',NULL,NULL),(215,'Jiquiriçá',NULL,NULL),(216,'Jitaúna',NULL,NULL),(217,'João Dourado',NULL,NULL),(218,'Juazeiro',NULL,NULL),(219,'Jucuruçu',NULL,NULL),(220,'Jussara',NULL,NULL),(221,'Jussari',NULL,NULL),(222,'Jussiape',NULL,NULL),(223,'Lafaiete Coutinho',NULL,NULL),(224,'Lagoa Real',NULL,NULL),(225,'Laje',NULL,NULL),(226,'Lajedão',NULL,NULL),(227,'Lajedinho',NULL,NULL),(228,'Lajedo do Tabocal',NULL,NULL),(229,'Lamarão',NULL,NULL),(230,'Lapão',NULL,NULL),(231,'Lauro de Freitas',NULL,NULL),(232,'Lençóis',NULL,NULL),(233,'Licínio de Almeida',NULL,NULL),(234,'Livramento de Nossa Senhora',NULL,NULL),(235,'Luís Eduardo Magalhães',NULL,NULL),(236,'Macajuba',NULL,NULL),(237,'Macarani',NULL,NULL),(238,'Macaúbas',NULL,NULL),(239,'Macururé',NULL,NULL),(240,'Madre de Deus',NULL,NULL),(241,'Maetinga',NULL,NULL),(242,'Maiquinique',NULL,NULL),(243,'Mairi',NULL,NULL),(244,'Malhada',NULL,NULL),(245,'Malhada de Pedras',NULL,NULL),(246,'Manoel Vitorino',NULL,NULL),(247,'Mansidão',NULL,NULL),(248,'Maracás',NULL,NULL),(249,'Maragogipe',NULL,NULL),(250,'Maraú',NULL,NULL),(251,'Marcionílio Souza',NULL,NULL),(252,'Mascote',NULL,NULL),(253,'Mata de São João',NULL,NULL),(254,'Matina',NULL,NULL),(255,'Medeiros Neto',NULL,NULL),(256,'Miguel Calmon',NULL,NULL),(257,'Milagres',NULL,NULL),(258,'Mirangaba',NULL,NULL),(259,'Mirante',NULL,NULL),(260,'Monte Santo',NULL,NULL),(261,'Morpará',NULL,NULL),(262,'Morro do Chapéu',NULL,NULL),(263,'Mortugaba',NULL,NULL),(264,'Mucugê',NULL,NULL),(265,'Mucuri',NULL,NULL),(266,'Mulungu do Morro',NULL,NULL),(267,'Mundo Novo',NULL,NULL),(268,'Muniz Ferreira',NULL,NULL),(269,'Muquém de São Francisco',NULL,NULL),(270,'Muritiba',NULL,NULL),(271,'Mutuípe',NULL,NULL),(272,'Nazaré',NULL,NULL),(273,'Nilo Peçanha',NULL,NULL),(274,'Nordestina',NULL,NULL),(275,'Nova Canaã',NULL,NULL),(276,'Nova Fátima',NULL,NULL),(277,'Nova Ibiá',NULL,NULL),(278,'Nova Itarana',NULL,NULL),(279,'Nova Redenção',NULL,NULL),(280,'Nova Soure',NULL,NULL),(281,'Nova Viçosa',NULL,NULL),(282,'Novo Horizonte',NULL,NULL),(283,'Novo Triunfo',NULL,NULL),(284,'Olindina',NULL,NULL),(285,'Oliveira Dos Brejinhos',NULL,NULL),(286,'Ouriçangas',NULL,NULL),(287,'Ourolândia',NULL,NULL),(288,'Palmas de Monte Alto',NULL,NULL),(289,'Palmeiras',NULL,NULL),(290,'Paramirim',NULL,NULL),(291,'Paratinga',NULL,NULL),(292,'Paripiranga',NULL,NULL),(293,'Pau Brasil',NULL,NULL),(294,'Paulo Afonso',NULL,NULL),(295,'Pé de Serra',NULL,NULL),(296,'Pedrão',NULL,NULL),(297,'Pedro Alexandre',NULL,NULL),(298,'Piatã',NULL,NULL),(299,'Pilão Arcado',NULL,NULL),(300,'Pindaí',NULL,NULL),(301,'Pindobaçu',NULL,NULL),(302,'Pintadas',NULL,NULL),(303,'Piraí do Norte',NULL,NULL),(304,'Piripá',NULL,NULL),(305,'Piritiba',NULL,NULL),(306,'Planaltino',NULL,NULL),(307,'Planalto',NULL,NULL),(308,'Poções',NULL,NULL),(309,'Pojuca',NULL,NULL),(310,'Ponto Novo',NULL,NULL),(311,'Porto Seguro',NULL,NULL),(312,'Potiraguá',NULL,NULL),(313,'Prado',NULL,NULL),(314,'Presidente Dutra',NULL,NULL),(315,'Presidente Jânio Quadros',NULL,NULL),(316,'Presidente Tancredo Neves',NULL,NULL),(317,'Queimadas',NULL,NULL),(318,'Quijingue',NULL,NULL),(319,'Quixabeira',NULL,NULL),(320,'Rafael Jambeiro',NULL,NULL),(321,'Remanso',NULL,NULL),(322,'Retirolândia',NULL,NULL),(323,'Riachão Das Neves',NULL,NULL),(324,'Riachão do Jacuípe',NULL,NULL),(325,'Riacho de Santana',NULL,NULL),(326,'Ribeira do Amparo',NULL,NULL),(327,'Ribeira do Pombal',NULL,NULL),(328,'Ribeirão do Largo',NULL,NULL),(329,'Rio de Contas',NULL,NULL),(330,'Rio do Antônio',NULL,NULL),(331,'Rio do Pires',NULL,NULL),(332,'Rio Real',NULL,NULL),(333,'Rodelas',NULL,NULL),(334,'Ruy Barbosa',NULL,NULL),(335,'Salinas da Margarida',NULL,NULL),(336,'Salvador',NULL,NULL),(337,'Santa Bárbara',NULL,NULL),(338,'Santa Brígida',NULL,NULL),(339,'Santa Cruz Cabrália',NULL,NULL),(340,'Santa Cruz da Vitória',NULL,NULL),(341,'Santa Inês',NULL,NULL),(342,'Santaluz',NULL,NULL),(343,'Santa Luzia',NULL,NULL),(344,'Santa Maria da Vitória',NULL,NULL),(345,'Santana',NULL,NULL),(346,'Santanópolis',NULL,NULL),(347,'Santa Rita de Cássia',NULL,NULL),(348,'Santa Teresinha',NULL,NULL),(349,'Santo Amaro',NULL,NULL),(350,'Santo Antônio de Jesus',NULL,NULL),(351,'Santo Estêvão',NULL,NULL),(352,'São Desidério',NULL,NULL),(353,'São Domingos',NULL,NULL),(354,'São Félix',NULL,NULL),(355,'São Félix do Coribe',NULL,NULL),(356,'São Felipe',NULL,NULL),(357,'São Francisco do Conde',NULL,NULL),(358,'São Gabriel',NULL,NULL),(359,'São Gonçalo dos Campos',NULL,NULL),(360,'São José da Vitória',NULL,NULL),(361,'São José do Jacuípe',NULL,NULL),(362,'São Miguel das Matas',NULL,NULL),(363,'São Sebastião do Passé',NULL,NULL),(364,'Sapeaçu',NULL,NULL),(365,'Sátiro Dias',NULL,NULL),(366,'Saubara',NULL,NULL),(367,'Saúde',NULL,NULL),(368,'Seabra',NULL,NULL),(369,'Sebastião Laranjeiras',NULL,NULL),(370,'Senhor do Bonfim',NULL,NULL),(371,'Serra do Ramalho',NULL,NULL),(372,'Sento Sé',NULL,NULL),(373,'Serra Dourada',NULL,NULL),(374,'Serra Preta',NULL,NULL),(375,'Serrinha',NULL,NULL),(376,'Serrolândia',NULL,NULL),(377,'Simões Filho',NULL,NULL),(378,'Sítio do Mato',NULL,NULL),(379,'Sítio do Quinto',NULL,NULL),(380,'Sobradinho',NULL,NULL),(381,'Souto Soares',NULL,NULL),(382,'Tabocas do Brejo Velho',NULL,NULL),(383,'Tanhaçu',NULL,NULL),(384,'Tanque Novo',NULL,NULL),(385,'Tanquinho',NULL,NULL),(386,'Taperoá',NULL,NULL),(387,'Tapiramutá',NULL,NULL),(388,'Teixeira de Freitas',NULL,NULL),(389,'Teodoro Sampaio',NULL,NULL),(390,'Teofilândia',NULL,NULL),(391,'Teolândia',NULL,NULL),(392,'Terra Nova',NULL,NULL),(393,'Tremedal',NULL,NULL),(394,'Tucano',NULL,NULL),(395,'Uauá',NULL,NULL),(396,'Ubaíra',NULL,NULL),(397,'Ubaitaba',NULL,NULL),(398,'Ubatã',NULL,NULL),(399,'Uibaí',NULL,NULL),(400,'Umburanas',NULL,NULL),(401,'Una',NULL,NULL),(402,'Urandi',NULL,NULL),(403,'Uruçuca',NULL,NULL),(404,'Utinga',NULL,NULL),(405,'Valença',NULL,NULL),(406,'Valente',NULL,NULL),(407,'Várzea da Roça',NULL,NULL),(408,'Várzea do Poço',NULL,NULL),(409,'Várzea Nova',NULL,NULL),(410,'Varzedo',NULL,NULL),(411,'Vera Cruz',NULL,NULL),(412,'Vereda',NULL,NULL),(413,'Vitória da Conquista',NULL,NULL),(414,'Wagner',NULL,NULL),(415,'Wanderley',NULL,NULL),(416,'Wenceslau Guimarães',NULL,NULL),(417,'Xique-Xique',NULL,NULL);
/*!40000 ALTER TABLE `municipios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_resets`
--

LOCK TABLES `password_resets` WRITE;
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `personal_access_tokens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal_access_tokens`
--

LOCK TABLES `personal_access_tokens` WRITE;
/*!40000 ALTER TABLE `personal_access_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `personal_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `representantes`
--

DROP TABLE IF EXISTS `representantes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `representantes` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `representantes`
--

LOCK TABLES `representantes` WRITE;
/*!40000 ALTER TABLE `representantes` DISABLE KEYS */;
/*!40000 ALTER TABLE `representantes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sessions` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sessions_user_id_index` (`user_id`),
  KEY `sessions_last_activity_index` (`last_activity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessions`
--

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
INSERT INTO `sessions` VALUES ('0IpRGgic06z32aBDb9x13sWG3WwboLzVbjPLzwZ9',NULL,'64.62.197.32','','YTozOntzOjY6Il90b2tlbiI7czo0MDoieHhXamVyZVRrN3B0VUduRlJzcjVCZE8zNU1QUTVFWnZ2c1FSd3FvbiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MTk6Imh0dHA6Ly8yMDQuNDguMTcuNTgiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1627050714),('1fPtmyWhB7lIQckXouCShvxdXlgpCtEfXt4HVJKu',NULL,'60.217.75.69','Mozilla/5.0','YTozOntzOjY6Il90b2tlbiI7czo0MDoiUmJ5WmFJeE5Kdm95UGUzRzFYQkpPQXJRUDN0S3ZzNXRQbldvcnlYZyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MTk6Imh0dHA6Ly8yMDQuNDguMTcuNTgiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1627064018),('1OP6D99ujlXMgfgqyfkeCg6oQeYUYh4yomiSrmtK',NULL,'162.142.125.37','','YTozOntzOjY6Il90b2tlbiI7czo0MDoiM0pIamJCMUxMQkpicjBSWEFXYUZFVWlnclRheVlSanJPOWZjWjlLSCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MTk6Imh0dHA6Ly8yMDQuNDguMTcuNTgiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1627057382),('29fYA7emH3YFSe0jZn43tDfsXws4Me21gt6kPl2t',NULL,'74.120.14.38','','YTozOntzOjY6Il90b2tlbiI7czo0MDoiMmp4ZEdLSkJGODdIcm5MNno0NFNjcVBFbGFMbUdnVFhTUEttRURJdiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjA6Imh0dHBzOi8vMjA0LjQ4LjE3LjU4Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1627052638),('2KGLqMJX0G2S1UZcSjc87bwEZb6vyHcXY9r3mNHZ',NULL,'167.248.133.40','','YTozOntzOjY6Il90b2tlbiI7czo0MDoiTWtTSG9VSmxlN1gySm41cTdiU3Fqd2RVQkJOUXBtRDJ4ZkhuVXAybCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjA6Imh0dHBzOi8vMjA0LjQ4LjE3LjU4Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1627034423),('5iaZyZ8uFY4tsmtbeXtxgyBjJc20NhnE5bgw9gD3',NULL,'205.185.116.89','Mozilla/5.0 (Macintosh; Intel Mac OS X 11_0_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.88 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiUkF3c2FpbTkwSklSTTZaMUZJQ056TlNsd1R0ZGdERktLVWxPTjJTcyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjU6Imh0dHA6Ly90YW5rbG95YWx0eS4zY3gudXMiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1627073282),('6cQGsDi3GcuMdFUyrdVrlsYGsTiaZX8g0yyNjW4a',NULL,'125.64.94.144','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4 240.111 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiM2ttVmRzOW5lS0dUd3NMaEV0MXkwbkhZSXZjOGRPRVJzamhiVHhQdiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjA6Imh0dHBzOi8vMjA0LjQ4LjE3LjU4Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1627033594),('6SwGrpu3Of1ZQdwjnwy27WVepzIpoDivoUvNAs5o',NULL,'123.160.221.48','Chrome/54.0 (Windows NT 10.0)','YToyOntzOjY6Il90b2tlbiI7czo0MDoiMnRSaldpWTNkSlZLaEI1cUpJV0I0Qkd3RkpuODBVb241SDllaGFlbSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1627073277),('9KBiY2PxtMll3xEPbQz1i9KJRgK6XjaRZdQY6KTB',NULL,'185.36.81.24','Linux Gnu (cow)','YTozOntzOjY6Il90b2tlbiI7czo0MDoiN0I3dHVZb1BYdXVvOFB3MlB3OXJaWEVEalRlSWJYUmY5SU1yd2xmZiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MTk6Imh0dHA6Ly8yMDQuNDguMTcuNTgiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1627060758),('b8IbKhRPlRkIBkxyaL8ynjsGbdOOkWSbFI8hMLDv',NULL,'83.41.123.192','Mozilla/5.0 zgrab/0.x','YTozOntzOjY6Il90b2tlbiI7czo0MDoiVGY4aTZZYUJWZ0RtbUpKQnlhZjhhTjJQV29CNVBkMzRKRjk3ZVdkdCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjA6Imh0dHBzOi8vMjA0LjQ4LjE3LjU4Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1627066521),('BDprUBkayt94gb2PNEOJPOqTuDTe2ifeE8RfsHG0',NULL,'162.142.125.54','Mozilla/5.0 (compatible; CensysInspect/1.1; +https://about.censys.io/)','YTozOntzOjY6Il90b2tlbiI7czo0MDoiRWJHZFFrZHJnQmdyMFlvQmlLTHJhZFl3RmdjSmUzYmhSTU1QakJzeSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjA6Imh0dHBzOi8vMjA0LjQ4LjE3LjU4Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1627048398),('cj7LLntjHfexyd7FDdNiHSlWQyGX2WCzaSmKtq85',NULL,'74.120.14.38','Mozilla/5.0 (compatible; CensysInspect/1.1; +https://about.censys.io/)','YTozOntzOjY6Il90b2tlbiI7czo0MDoiV0hvRmV0N2ljbzh0ajVMS0dTa3RvZlhxRnVjenMwcG0wSkdjU1hlUSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjA6Imh0dHBzOi8vMjA0LjQ4LjE3LjU4Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1627052638),('DWd11rgwCcinKPxagogAiGL158JHOwevrOvku8aI',NULL,'176.102.198.226','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/52.0.2743.116 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiQ0ZuZ0poeGlQMmZDajFkSG1uV3lpaVd5ZVNoRFJqQzNraDFDcVZvQiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MTk6Imh0dHA6Ly8yMDQuNDguMTcuNTgiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1627082173),('E9DZII2d7UiOdOqviwMUBgMN2x9NDpYp7CEmOlUO',NULL,'183.136.225.42','Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:47.0) Gecko/20100101 Firefox/47.0','YTozOntzOjY6Il90b2tlbiI7czo0MDoiM1hxTTdiWmlDOGc0cUh5Snc5T0R3U1VSWXJSQ1lrOGZtT0VZeDFnNSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjA6Imh0dHBzOi8vMjA0LjQ4LjE3LjU4Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1627037826),('f6yI3ZduH2aZOBFF3LWiqpP45yUfitw2a5dl8Ubx',NULL,'191.6.208.9','Mozilla/5.0 (Linux; Android 6.0; 5085J) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.99 Mobile Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiZWxPN2dUcXdrR2tVYWNNMnVEc290YUtQVzdkaHRldHp1Z0lXeG5jNSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzA6Imh0dHBzOi8vd3d3LnBsdXJpcGVuc2FyLmNvbS5iciI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1627072320),('FILG5a3ykw74RbF95ZkmxCTVzD6FF9E5q0kHvlI9',NULL,'123.160.221.48','Chrome/54.0 (Windows NT 10.0)','YTozOntzOjY6Il90b2tlbiI7czo0MDoiZERoTzk2OTg3MXNjaWZpV1lCbTJZQm9oUmxQUUJwZHMwODdaSGNDWCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjU6Imh0dHA6Ly90YW5rbG95YWx0eS4zY3gudXMiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1627073282),('FycxW9erFJlLOs1wtKpNprMsw2V53kU1uCJc0oCw',NULL,'185.36.81.24','Linux Gnu (cow)','YTozOntzOjY6Il90b2tlbiI7czo0MDoiRDdYWE1KbUFhSVdjdnRzSWk4cmNtTUllWWdDVUZnaFpleDUwTnNkcSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MTk6Imh0dHA6Ly8yMDQuNDguMTcuNTgiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1627077691),('gHfkptuZv1Mmgo3XX5lOjmwPudvrpxv5VgFf3V8s',NULL,'45.146.164.110','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiUkt4ZmdkWUtIZjFLd0czMmE5NEpVMURSbGpER3c5ZHhlTjRxZUNUUyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTE6Imh0dHBzOi8vMjA0LjQ4LjE3LjU4Lz9YREVCVUdfU0VTU0lPTl9TVEFSVD1waHBzdG9ybSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1627065053),('HYM7ETalZ0NnuyjjMmF2ApDbocQWF894EQzwpArR',NULL,'103.79.35.146','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/52.0.2743.116 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiWjUwR1ZweWxJRWkyMzRZMFI3YjN5MGd1U0NBbUJid01zV0RaN1V5bSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MTk6Imh0dHA6Ly8yMDQuNDguMTcuNTgiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1627035293),('iboNdLCWvIFpSU6n2uYPXvDftfg9t0P1T1hJagEc',NULL,'45.146.164.110','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiVDd3WVE4R2dGQjRwQWhmaEhidnVSTWE4bGNPanhiYURCZDZ6UHQ1ciI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjA6Imh0dHBzOi8vMjA0LjQ4LjE3LjU4Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1627065058),('jOCNGxAX90T36QRdrlo6aqdJ7Si9gkErO7dGyiFz',NULL,'128.1.248.26','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.113 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiZG95bGxTZTVRQlQyQU5oOXJObWtPdWlwbjVZbXVKU2lOWlh3NmtTQiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MTk6Imh0dHA6Ly8yMDQuNDguMTcuNTgiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1627067202),('k47eR2AumJWGp3eLQR4HuWXpx4oiQNV6wOP7fpr3',NULL,'104.155.181.214','Mozilla/5.0 zgrab/0.x','YTozOntzOjY6Il90b2tlbiI7czo0MDoiMHBacnJGVjFzWWtIaWVEV256VHJCZTlEc3AwUVNhY2pHS0xWRUJPaCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MTk6Imh0dHA6Ly8yMDQuNDguMTcuNTgiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1627038763),('mIQqTxVMXmkdOPfPraIVi614jS9iJl5NWq8Zjnvr',NULL,'89.248.173.131','','YTozOntzOjY6Il90b2tlbiI7czo0MDoiaGp4TW5pbTlMRUdLb2llNjRjdzNRT3dmU0sxZ2FjMlNNNkliRHdZRCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MTk6Imh0dHA6Ly8yMDQuNDguMTcuNTgiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1627032534),('MNvtV4pS1YPyccSVKQqTrGFmdOIjJojJWPpRk9ZD',NULL,'111.221.46.54','Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoicUZsUEc3RDcydEw3am5EMkhQQThIQjA3cGtBRTlOMjVUOU9EeExONyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MTk6Imh0dHA6Ly8yMDQuNDguMTcuNTgiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1627040390),('MyzLq1wI0mkk5hQGPPzbZQRjLuwXThL1VwovE6ob',NULL,'185.142.236.43','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/34.0.1847.137 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiWXBnUWRwUmlZdVJnTnRoVXVIQUlyc0JFNFhNSjBPcEJXYkdOSGpSaiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjA6Imh0dHBzOi8vMjA0LjQ4LjE3LjU4Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1627038294),('nv9x4t7oN8WuhuFQf1SaU9NjoVoMozBDOCXj9ta6',NULL,'193.118.53.202','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.113 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiSDRTVlZSQ2ZJbk0ySHJKRWF5NDlWVFlIMDZxb1lzZFRtSWJJMlpPTCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjA6Imh0dHBzOi8vMjA0LjQ4LjE3LjU4Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1627074020),('o7erEbvJl1JSRrHuCPbqMdVClVpUFKVmWym8176T',NULL,'167.248.133.40','Mozilla/5.0 (compatible; CensysInspect/1.1; +https://about.censys.io/)','YTozOntzOjY6Il90b2tlbiI7czo0MDoiSWd0TEJpVVFrSFRldVRuamRZeEJqRjg3MldLRWlwalRvWFFiWWdFQyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjA6Imh0dHBzOi8vMjA0LjQ4LjE3LjU4Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1627034423),('oakn7bLF9Tbmf08UV83c5hemvBU7PDU3RZqqSemQ',NULL,'191.33.97.72','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.164 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoibzJPN1BnM3lQWnI4ZFpnMzE4V1hON1hvTXpPdGJFR3l4a1paSExwaiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDQ6Imh0dHBzOi8vcGx1cmlwZW5zYXIuY29tLmJyL2NvbnRyaWJ1aXMvY3JlYXRlIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1627042142),('Oxp0NP9M173DJYDRjwBWJSdmyZDf3HDAs0Opk60O',NULL,'125.64.94.138','','YTozOntzOjY6Il90b2tlbiI7czo0MDoiZEZ1NXdaQ3JYT0pUT2FZVTJYN3FwZDVzd1dOOHVpaUZjSHMyNnk0aiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjA6Imh0dHBzOi8vMjA0LjQ4LjE3LjU4Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1627080991),('pFV4vjSaRgPY5fczZd80rzQqqWDnYd81YyCo7O9F',NULL,'121.46.25.189','','YTozOntzOjY6Il90b2tlbiI7czo0MDoiNWpsRENCVzJkc0xUUUhKbTVla2tycmcyVmM5ZXdMeHQ5UkJ3VlFFZCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MTk6Imh0dHA6Ly8yMDQuNDguMTcuNTgiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1627046335),('qmveyZmU5QeiZ1ZUcdzxF62qFa74FOoIvHuAH65a',NULL,'104.155.181.214','Mozilla/5.0 zgrab/0.x','YTozOntzOjY6Il90b2tlbiI7czo0MDoiVUdPQkNSZkFaR3lHYUlZNEpuTUo2cWlaTG90eW1xTHVDczJGdmpmWCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjA6Imh0dHBzOi8vMjA0LjQ4LjE3LjU4Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1627039168),('rks4B2USBE19Uwzmy2BKoXYBIh02Br1IMJ0rbCKK',NULL,'45.146.164.110','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoicE1WZnRtY2ZDSHY1dGdDUzFiMHhUWldscWVKOFVwNFhublZLZlJ1ZiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MTU2OiJodHRwczovLzIwNC40OC4xNy41OC9pbmRleC5waHA/ZnVuY3Rpb249Y2FsbF91c2VyX2Z1bmNfYXJyYXkmcz0lMkZJbmRleCUyRiU1Q3RoaW5rJTVDYXBwJTJGaW52b2tlZnVuY3Rpb24mdmFycyU1QjAlNUQ9bWQ1JnZhcnMlNUIxJTVEJTVCMCU1RD1IZWxsb1RoaW5rUEhQMjEiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1627065057),('Rov7TWmnbavr8UCs3Mxkrg53YVhJfQNagV4JdvZN',NULL,'187.207.220.155','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/52.0.2743.116 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiaVdKb3ZuZlQyTWxrMHpjalVPaTdhTGRhYWhKWUIxQnNKSzdXYkwwdyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MTk6Imh0dHA6Ly8yMDQuNDguMTcuNTgiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1627077922),('RsLKfbA14KqvSVb4CFrdQl5gtfCd624xK1PR0Yvk',NULL,'51.254.59.113','Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2228.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiVzNuWVZveXpvMWF4aGhkUmNZWVBlT3A4VndNamh0VU9HZlIzcjBxWCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MTk6Imh0dHA6Ly8yMDQuNDguMTcuNTgiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1627038392),('TslcxWqPdeJIrUnTxlE863TmzJnSD6BbKxqDwN1x',NULL,'198.98.59.211','Linux Gnu (cow)','YTozOntzOjY6Il90b2tlbiI7czo0MDoiZG1tYk56QUtiVDF6RFR3TUdkODJ2ZjdLcDVMQVp2NnFZaXU2ZHZ4SyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MTk6Imh0dHA6Ly8yMDQuNDguMTcuNTgiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1627040626),('ul3gmTUx6VWVFuNjbyLYdwWD8AXwCYYlc1SKbuWD',NULL,'162.142.125.37','Mozilla/5.0 (compatible; CensysInspect/1.1; +https://about.censys.io/)','YTozOntzOjY6Il90b2tlbiI7czo0MDoiQU5DZjhxQWZNNW9EMkNjWGJ1T05ySGxlQ3FKb0RKTWlyeFFSaU91ZCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MTk6Imh0dHA6Ly8yMDQuNDguMTcuNTgiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1627057382),('uOqJCeQzM7IJgpTUVYc9UjeGGZeb4S4iXHTrYOsD',NULL,'123.160.221.48','Chrome/54.0 (Windows NT 10.0)','YToyOntzOjY6Il90b2tlbiI7czo0MDoibXpWdUlTbzhpVjZnY2xnRFUyNFJOWFJzZGFST1JFTXJhRXpHSUh5OSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1627073280),('vNWih6YKqpVawFtg71ReIXW1EXlsholR3ZaIlbIn',NULL,'111.221.46.54','Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoibUlvakU4OHBSMU91NnlybTBPdVhYRXNzbENLaTI2eEFpQTZLdHhZRiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MTk6Imh0dHA6Ly8yMDQuNDguMTcuNTgiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1627040388),('VQBDRuaTblN3FQlYsSByx0cHchH0CISKWN4ltQR3',NULL,'69.171.249.111','facebookexternalhit/1.1 (+http://www.facebook.com/externalhit_uatext.php)','YTozOntzOjY6Il90b2tlbiI7czo0MDoiQ3ZhRFhZYWkzV04wMHlpR2hsSDFtTlNRamZLVjZYaVZmZlRhQzZjVCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzA6Imh0dHBzOi8vd3d3LnBsdXJpcGVuc2FyLmNvbS5iciI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1627079499),('vY5Lr4587ZTOP20N0dbIEX3wCjrJLQAmXK6b2MDc',NULL,'162.142.125.54','','YTozOntzOjY6Il90b2tlbiI7czo0MDoiQThqaW1Od3BZNEhkbWtJMWRSY1NyNFJzcklDWGVYTVlRazg2RHVyZyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjA6Imh0dHBzOi8vMjA0LjQ4LjE3LjU4Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1627048397),('Yr8PQ4x0xWKwiBbhcxrpLQXQ9RbScxKChdXszDzd',NULL,'23.129.64.145','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)','YTozOntzOjY6Il90b2tlbiI7czo0MDoib3FSTExzWTlXZjhTa3NyWEw0Tkk3YzdKSHV3bjJLd2QwRU5sUHNLTSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjA6Imh0dHBzOi8vMjA0LjQ4LjE3LjU4Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1627061642),('zgfcPdJSae3L8Rx0qBjyaS0ZpvmobE9KWSIRjJgv',NULL,'185.36.81.24','Linux Gnu (cow)','YTozOntzOjY6Il90b2tlbiI7czo0MDoiV3hNNkFJeDNNUDg1S2Q5TTRabHo5QTdnTDllSUFsSUppamV0RDNFQSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MTk6Imh0dHA6Ly8yMDQuNDguMTcuNTgiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1627030659),('zTFsHrCKfxWIlMLnaiel1WLlvj3ActiN6RL57ewb',NULL,'185.36.81.24','Linux Gnu (cow)','YTozOntzOjY6Il90b2tlbiI7czo0MDoiNzN6OXJNRzcwMnYwMzB0NnBRM0F6eENwWWZDU2pvemtBQ1FiMjlPMCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MTk6Imh0dHA6Ly8yMDQuNDguMTcuNTgiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1627035855);
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `nome_social` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `genero` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `celular` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `raca` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `matricula` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tipo` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '4',
  `mod_curso` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tipo_curso` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `apoiador` enum('s','n') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `autoriz` enum('s','n') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `municipio_id` bigint unsigned NOT NULL,
  `campus_id` bigint unsigned NOT NULL,
  `departamento_id` bigint unsigned NOT NULL,
  `curso_id` bigint unsigned DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `two_factor_secret` text COLLATE utf8mb4_unicode_ci,
  `two_factor_recovery_codes` text COLLATE utf8mb4_unicode_ci,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `current_team_id` bigint unsigned DEFAULT NULL,
  `profile_photo_path` text COLLATE utf8mb4_unicode_ci,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`),
  UNIQUE KEY `users_celular_unique` (`celular`),
  KEY `users_municipio_id_foreign` (`municipio_id`),
  KEY `users_campus_id_foreign` (`campus_id`),
  KEY `users_departamento_id_foreign` (`departamento_id`),
  KEY `users_curso_id_foreign` (`curso_id`),
  CONSTRAINT `users_campus_id_foreign` FOREIGN KEY (`campus_id`) REFERENCES `campuses` (`id`),
  CONSTRAINT `users_curso_id_foreign` FOREIGN KEY (`curso_id`) REFERENCES `cursos` (`id`),
  CONSTRAINT `users_departamento_id_foreign` FOREIGN KEY (`departamento_id`) REFERENCES `departamentos` (`id`),
  CONSTRAINT `users_municipio_id_foreign` FOREIGN KEY (`municipio_id`) REFERENCES `municipios` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Claudio Souza','fazenda.aparecida@gmail.com','2021-06-21 20:02:19','Claudio Souza','m','71999094687','brt','925294','t','1',NULL,NULL,'n','s',336,4,1,NULL,'$2y$10$SfoCnfxRr7Jt33MpKRfVy.i84SX4qCpF9EynYOa9oGZ8rP.t0L2u.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2021-06-21 20:02:19'),(2,'Staff Teste','stafteste@user.com','2021-06-20 12:59:24','Staff Teste','f','71999094688','prt','925295','p','2',NULL,NULL,'n','s',336,4,1,NULL,'$2y$10$lKCEoCooTJL0t336eQq8DOJ620mXclsLqIbFf8xNRfbsfpoQLsTiK',NULL,NULL,NULL,NULL,NULL,'2021-06-20 18:22:19',NULL,'2021-06-20 18:22:19'),(3,'Redat Teste','redatteste@user.com','2021-06-20 12:59:24','Redat Teste','m','71999094689','brt','925296','p','3',NULL,NULL,'n','s',336,4,1,NULL,'$2y$10$R1sNDBaxjddx9mDEupHsJuvlWy0se.qMpQj.nowkdSSkyaOWvt0/C',NULL,NULL,NULL,NULL,NULL,'2021-06-20 18:22:12',NULL,'2021-06-20 18:22:12'),(4,'Aluno Teste','alunoteste@user.com','2021-06-20 12:59:24','Aluno Teste','f','71999094690','prt','925297','a','4',NULL,NULL,'n','s',336,4,3,NULL,'$2y$10$3THNyaxZxezs8R9tOMtsCe6lVYQeXhF1iAC7gM5Qy3wTnmt0rMgO.',NULL,NULL,NULL,NULL,NULL,'2021-06-20 18:22:03',NULL,'2021-06-20 18:22:03'),(5,'CIDA SOUZA','mamsouza@uneb.br','2021-06-20 15:36:31','CIDA SOUZA','f','71999694767','prd','74.521.412-0','t','2',NULL,NULL,'n','s',336,4,1,NULL,'$2y$10$W2O6PICtupDv4g4BgNZUauwePTgMu5Tg2T5v31.ECURotUaMK2Mb.',NULL,NULL,NULL,NULL,NULL,'2021-06-22 19:38:02','2021-06-20 15:35:46','2021-06-22 19:38:02'),(6,'THAIS DEIRO URPIA LASSE OLIVEIRA','thaisurpia@gmail.com','2021-06-20 15:49:49',NULL,'f','71991852732','prd','745639435','t','2',NULL,NULL,'n','s',336,4,1,NULL,'$2y$10$HQ.Qv9XQiXn0cM2jLUiIfeETJqzkR9dtzp83fBg3eW0qmVdEEbt5S',NULL,NULL,NULL,NULL,NULL,NULL,'2021-06-20 15:49:36','2021-06-20 15:52:26'),(7,'ADRIANA MARMORI','amarmori@hotmail.com',NULL,NULL,'f','71993854880','afd','742960073','p','2',NULL,NULL,'n','s',39,13,4,54,'$2y$10$08QTk75Xlx8nRxYUwhNbX.wdQILqFg2nWQtBT.gsn9xUFqhA7leBW',NULL,NULL,NULL,NULL,NULL,NULL,'2021-06-20 15:53:37','2021-06-20 15:55:53'),(8,'DAYSE LAGO DE MIRANDA','dayselago@gmail.com','2021-06-20 20:53:55','DAYSE','f','71991082526','prd','74362477','p','2','pres','lic','n','s',336,5,6,54,'$2y$10$huNR.TBsAj8JUVMqk5Wt7eKnN0oxpwwIrkqo3e9G3nPuXzaB/KUZ2',NULL,NULL,NULL,NULL,NULL,NULL,'2021-06-20 20:52:34','2021-06-20 20:56:44'),(9,'LIDIA BOAVENTURA PIMENTA','lidiabpimenta@hotmail.com','2021-06-21 21:08:54','LIDIA PIMENTA','f','71988709193','brc','920299600','p','2','pres','pos','n','s',336,5,1,102,'$2y$10$ky/Srk/U2c9xykAY7y8NguwZNgm/LAfwyjDLLiBwHMd.npkEpCr0y',NULL,NULL,'CQZeFOe4D0JpaFBw1gyxzxRsviRDNpstQdyvM9Hpikc69BbDihkr3kDYztsy',NULL,NULL,NULL,'2021-06-21 02:06:49','2021-06-21 21:09:48'),(10,'JOÃO SILVA ROCHA FILHO','jrochauneb@gmail.com','2021-06-21 12:41:20','JOÃO ROCHA','m','74991883809','ngr','74414777-8','p','2','pres','lic','n','s',208,8,4,32,'$2y$10$c5Yz0g6ziwcggeZ2jdq6rejQyhayNB28t7ltDuwp5SMfsCEfq.u3q',NULL,NULL,NULL,NULL,NULL,NULL,'2021-06-21 12:39:46','2021-06-21 12:45:54'),(11,'RODRIGO FERREIRA','rllf20@gmail.com','2021-06-21 13:21:06',NULL,'m','71986947771','prd',NULL,'t','3',NULL,NULL,'n','s',336,4,1,NULL,'$2y$10$.wQMDLJxgNF/Zrrhie//j.r.cIgZROiiJ4KIEwTD5U1NoY.s.Qamu',NULL,NULL,NULL,NULL,NULL,NULL,'2021-06-21 13:06:21','2021-06-21 21:35:08'),(12,'MARIA APARECIDA MEIRELES DE SOUZA','mcidasouza@gmail.com','2021-06-21 19:54:31','CIDA SOUZA','f','71996717448','brc',NULL,'t','2',NULL,NULL,'n','s',336,4,1,NULL,'$2y$10$jhr9STlh3hzCnt.jV1NqNecjoGnmtkqrIRL3k/Wktz4/tFnbSPtyW',NULL,NULL,NULL,NULL,NULL,NULL,'2021-06-21 19:53:17','2021-06-22 19:34:53'),(13,'ROSANGELA DE CARVALHO MATOS','rosinha_matos@hotmail.com','2021-06-21 20:41:44','ROSANGELA MATTOS','f','71999794349','afd','743318423','t','4','pres','pos','n','s',336,4,1,102,'$2y$10$5mvNhsrwvOu6dv0eJNoJG./6Kz.tfQjq26sIoLVuJAqEKEhqmZQyO',NULL,NULL,NULL,NULL,NULL,NULL,'2021-06-21 20:41:11','2021-06-21 20:41:44'),(14,'TANIA MOURA BENEVIDES','taniamoura2511@gmail.com','2021-06-21 20:43:35',NULL,'f','71981357080','brc','74.530169-2','p','4','pres','bach','n','s',336,5,4,1,'$2y$10$lVid1PgF8UY1WO63lQR5iOW/W/dSrf7mnBSjLMj91gTD9.4KcpNm6',NULL,NULL,NULL,NULL,NULL,NULL,'2021-06-21 20:42:38','2021-06-21 20:43:35'),(15,'LUZINETE GAMA DE OLIVEIRA DE OLIVEIRA','luzinete.gamma@gmail.com','2021-06-25 15:06:38',NULL,'f','71991749438','afd','743372760','t','4',NULL,NULL,'n','s',336,4,1,NULL,'$2y$10$XnE2kxRAfzijs4x3Ne47GOQnlEKFPV1tNVryf6pRtELwF2czt9Vvi',NULL,NULL,NULL,NULL,NULL,NULL,'2021-06-21 21:02:47','2021-06-25 15:06:38'),(16,'SIMONE FERREIRA DE SOUZA WANDERLEY','simonewanderley@yahoo.com.br','2021-06-21 21:16:23',NULL,'f','071983014968','ngr',NULL,'p','4','pres','lic','n','s',370,11,6,54,'$2y$10$9z0yrMnnRCyzNj3FCDSxb.H.ygCP6SPHBjW7/ulIkcamlghBQo.Vi',NULL,NULL,NULL,NULL,NULL,NULL,'2021-06-21 21:14:28','2021-06-21 21:16:23'),(17,'JOSÉ GILEÁ','josegilea@hotmail.com','2021-06-21 21:22:22',NULL,'m','988711310','prd','74536209-6','p','4','pres','bach','n','s',350,9,4,1,'$2y$10$NsiQNhGtissRIBMuhqjlfeLa5VWKuZirKmmsVTZirI28qEqR6CM1e',NULL,NULL,NULL,NULL,NULL,NULL,'2021-06-21 21:21:19','2021-06-21 21:22:22'),(18,'RAILUCIA SILVA','rpcn_35@outlook.com','2021-06-22 17:27:41',NULL,'f','71985070616','ngr','733084632','t','4',NULL,NULL,'n','s',336,4,1,NULL,'$2y$10$69Tc8JCiLdObvwlyPn6LaOEwqsaQOb.BZopVxQehnkyO2nGcXvqa.',NULL,NULL,NULL,NULL,NULL,NULL,'2021-06-22 17:26:05','2021-06-22 17:27:41'),(19,'NALU MIRANDA','nmiranda@uneb.br','2021-06-22 18:19:04',NULL,'f','71993281168','brc','74399478','p','4','pres','bach','n','s',336,5,4,59,'$2y$10$uzaRIJnd24OKc6bOgq46/eukcdChoZTN7ff56p43ZDolYxKDJJvRi',NULL,NULL,NULL,NULL,NULL,NULL,'2021-06-22 18:17:54','2021-06-22 18:19:04'),(20,'CIDA SOUZA','cida.cadinhodafe@gmail.com','2021-06-22 19:49:39',NULL,'f','7197214172','brc','745214120','t','4',NULL,NULL,'n','s',336,4,1,NULL,'$2y$10$PdhHbG/MzTXkOGQu5Itys.bLA/11.sq3WCuYEA4SwaHdA7qwcGVUq',NULL,NULL,NULL,NULL,NULL,NULL,'2021-06-22 19:45:19','2021-06-22 19:49:39'),(21,'GABRIEL MENESES DE PURIDADE','gabriel.m.sp@hotmail.com','2021-06-22 20:39:38','GABRIEL MENESES DE PURIDADE','m','71983646372','ngr','92005076','t','4',NULL,NULL,'n','s',336,4,1,NULL,'$2y$10$O5qtMKIPmk0BScVUKGAR5.nP.N1Gf5cVmd58Ex.bQnvJzxDUj2D6m',NULL,NULL,'HHmx4QZbrLW6EfLNRc0ZRBTCTnKMYC92KZiZuz0GijylfqhLr3i57stXBZde',NULL,NULL,NULL,'2021-06-22 20:38:21','2021-06-22 20:39:38'),(22,'JOSENILDES SANTOS DE OLIVEIRA','josenildes@hotmail.com','2021-06-22 23:51:38',NULL,'f','71999317157','ngr','713076180','t','4',NULL,NULL,'n','s',336,4,1,NULL,'$2y$10$3M/VY.edDXCV3LN4rzph8OXMPHO043t9SSn3F7Rr4S9YH5veGVcFi',NULL,NULL,'xkJyi7r8vlxOXRarNCVI0RY3MiNZJ4P4lC35i1EDVYsfUmieBnrq8eVrH34I',NULL,NULL,NULL,'2021-06-22 23:51:12','2021-06-22 23:51:38'),(23,'TATIANA SILVA DE JESUS MONTEIRO','tatissamonteiro@yahoo.com.br',NULL,'TATIANA SILVA DE JESUS MONTEIRO','f','7199852818','prd','74.000.669-5','t','4','ead','bach','n','s',336,4,1,1,'$2y$10$HTk2wYLZTabJrWuF9HNRye6SJrpEFrVipIZvg4gEZEUr5Zwldft.S',NULL,NULL,NULL,NULL,NULL,NULL,'2021-06-28 13:48:51','2021-06-28 13:48:51'),(24,'TATIANA SILVA DE JESUS MONTEIRO','tmonteiro@uneb.br','2021-06-28 13:57:21','TATIANA SILVA DE JESUS MONTEIRO','f','99852818','prd','74.000.669-5','t','4','ead','bach','n','s',336,4,1,1,'$2y$10$2h60bmxjaHi4eKq7jqeequsqrwKf/EwPPi0K5Q8k82nHujCfOORLW',NULL,NULL,NULL,NULL,NULL,NULL,'2021-06-28 13:55:52','2021-06-28 13:57:21'),(25,'HELIANE MOTA DE OLIVEIRA','helianemota3@gmail.com','2021-06-28 21:00:29',NULL,'f','99983009','prd','74002536-4','t','4',NULL,NULL,'n','s',336,5,1,NULL,'$2y$10$9F2wc0YG2RlAfrQ1UU2MHOoYfPG3/6pJscDmrBt4VJK3XfMRdXvz2',NULL,NULL,NULL,NULL,NULL,NULL,'2021-06-28 20:58:46','2021-06-28 21:00:29'),(26,'EDINEIRAM MARINHO MACIEL','emaciel@uneb.br',NULL,NULL,'f','71999152237','afd','743806963','p','4','ead','lic','n','s',336,2,9,52,'$2y$10$FIUEdpZwrlOUBJpnZS/kQ.d.4XzU.G6dUP2kQukj.1hC6cAlygRHi',NULL,NULL,NULL,NULL,NULL,NULL,'2021-06-30 13:45:41','2021-06-30 13:45:41'),(27,'JOÃO PAULO SANTOS DE SOUZA','jpssousa@uneb.br','2021-07-05 20:55:21','JOÃO PAULO','m','74981169490','prd','74.444.679-0','t','4',NULL,NULL,'n','s',208,8,4,NULL,'$2y$10$2f4GUqxPyxa.zyGB2uSwnOrU3sfd1hMSpYcRzofOdPx6Z6lNhcYcK',NULL,NULL,NULL,NULL,NULL,NULL,'2021-07-05 20:46:58','2021-07-05 20:55:21'),(28,'AMALIA CATHARINA SANTOS CRUZ','amalia.cruz@yahoo.com.br','2021-07-11 17:48:31',NULL,'f','74991366390','ngr','745499534','p','4','pres','lic','n','s',208,8,4,15,'$2y$10$wsSsxp0KBGGcBKQ9xhjvBO1DNTl5Rw/7JUyb5qpqTXzTfepuYk96W',NULL,NULL,NULL,NULL,NULL,NULL,'2021-07-11 17:47:33','2021-07-11 17:48:31'),(29,'SÉRGIO PAULO COSTA VITORINO','svitorinossa@gmail.com','2021-07-12 20:51:02',NULL,'m','71993355775','ngr','744349419','t','4',NULL,NULL,'n','s',336,5,2,NULL,'$2y$10$PRrS/3/juMdVbqnYbF1w3OlPVXhe6jllFSo.qwluEtuebThqAUNHy',NULL,NULL,NULL,NULL,NULL,NULL,'2021-07-12 20:49:59','2021-07-12 20:51:02'),(30,'CARLOS HENRIQUE VALENÇA SILVA','chsilva@uneb.br','2021-07-12 22:51:46',NULL,'m','75991194873','brc','745365523','t','4',NULL,NULL,'n','s',103,18,6,NULL,'$2y$10$oDa3oOUpFoFHay2V29vHa.pvGy8Q1yve1o3/VM1N8TtzP6vzBPEM6',NULL,NULL,NULL,NULL,NULL,NULL,'2021-07-12 22:45:44','2021-07-12 22:51:46'),(31,'ANA KARINE LOULA TORRES ROCHA','aklrocha@uneb.br','2021-07-13 14:59:29','ANA KARINE LOULA TORRES ROCHA','f','74999455568','prd','74.440.195-2','p','4','pres','bach','n','s',174,20,5,1,'$2y$10$CxrEgDSBLmcnvp6BWLu.Luv7xch98X8PU29XRtSMOFsB8xbgsfW8q',NULL,NULL,'TdbELYkZuwcHq2hwqJ1CD2bj86ROrfR7BLPMFaHjSCBzO5r63Wu6jnKG6CMK',NULL,NULL,NULL,'2021-07-13 14:51:06','2021-07-13 14:59:29'),(32,'DIOSVALDO FILHO','diosvaldopereira@hotmail.com','2021-07-14 20:20:15','DIOSVALDO FILHO','m','74999549503','brc','746324643','t','4','pres','bach','n','s',368,27,5,36,'$2y$10$PgW0AKBxdVym8mZ3ZHEHnONQTU3dYi9RHAKi4Wasp6E00ThCZ..Ai',NULL,NULL,NULL,NULL,NULL,NULL,'2021-07-14 20:19:08','2021-07-14 20:20:37'),(33,'LUAN','luanpinheirobusiness@gmail.com',NULL,NULL,'nsr','71997257130','prd',NULL,'a','4','pres','bach','n','s',336,5,4,1,'$2y$10$9rlEM0MC/2Ow7BBZG2FE.epYhS.yntLNqZ53eO8j21AxtdooWcEQa',NULL,NULL,NULL,NULL,NULL,NULL,'2021-07-16 15:47:55','2021-07-16 15:47:55');
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

-- Dump completed on 2021-07-24  0:06:15
