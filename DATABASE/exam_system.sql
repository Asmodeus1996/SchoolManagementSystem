/*
SQLyog Community Edition- MySQL GUI v6.07
Host - 5.1.44-community : Database - exam_system
*********************************************************************
Server version : 5.1.44-community
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

create database if not exists `exam_system`;

USE `exam_system`;

/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

/*Table structure for table `answers` */

DROP TABLE IF EXISTS `answers`;

CREATE TABLE `answers` (
  `answer_id` int(11) NOT NULL AUTO_INCREMENT,
  `exam_id` int(11) NOT NULL,
  `question` text NOT NULL,
  `answer` mediumtext NOT NULL,
  `correct_answer` text NOT NULL,
  `status` text NOT NULL,
  PRIMARY KEY (`answer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;

/*Data for the table `answers` */

insert  into `answers`(`answer_id`,`exam_id`,`question`,`answer`,`correct_answer`,`status`) values (1,1,'In spring, Dependency injection is also known as','Inversion of Control pattern(IOC)','Inversion of Control pattern(IOC)','correct'),(2,1,'Which of the following function is used to find the column count of the particular resultset ?','getMetaData()','getMetaData()','correct'),(3,1,'Which of the following describes the correct sequence of the steps involved in making a connection with a database. 1)Registering the Driver class 2)Importing JDBC Packages 3)Making the connection with the database. 4)Executing the SQL statement object.','2,1,3,4','2,1,3,4','correct'),(4,2,'Which of the following function is used to find the column count of the particular resultset ?','Metadata()','getMetaData()','incorrect'),(5,2,'Which of the following describes the correct sequence of the steps involved in making a connection with a database. 1)Registering the Driver class 2)Importing JDBC Packages 3)Making the connection with the database. 4)Executing the SQL statement object.','2,1,4,3','2,1,3,4','incorrect'),(6,2,'In spring, Dependency injection is also known as','Inversion of Control pattern(IOC)','Inversion of Control pattern(IOC)','correct'),(7,3,'In spring, Dependency injection is also known as','Inversion of Control pattern(IOC)','Inversion of Control pattern(IOC)','correct'),(8,3,'Which of the following function is used to find the column count of the particular resultset ?','getMetaData()','getMetaData()','correct'),(9,3,'Which of the following describes the correct sequence of the steps involved in making a connection with a database. 1)Registering the Driver class 2)Importing JDBC Packages 3)Making the connection with the database. 4)Executing the SQL statement object.','2,1,4,3','2,1,3,4','incorrect'),(10,16,'Which of the following function is used to find the column count of the particular resultset ?','Metadata()','getMetaData()','incorrect'),(11,16,'Which of the following describes the correct sequence of the steps involved in making a connection with a database. 1)Registering the Driver class 2)Importing JDBC Packages 3)Making the connection with the database. 4)Executing the SQL statement object.','2,1,3,4','2,1,3,4','correct'),(12,17,'Which of the following function is used to find the column count of the particular resultset ?','getMetaData()','getMetaData()','correct'),(13,17,'Which of the following describes the correct sequence of the steps involved in making a connection with a database. 1)Registering the Driver class 2)Importing JDBC Packages 3)Making the connection with the database. 4)Executing the SQL statement object.','2,3,1,4','2,1,3,4','incorrect'),(14,18,'Which of the following describes the correct sequence of the steps involved in making a connection with a database. 1)Registering the Driver class 2)Importing JDBC Packages 3)Making the connection with the database. 4)Executing the SQL statement object.','2,3,1,4','2,1,3,4','incorrect'),(15,18,'Which of the following function is used to find the column count of the particular resultset ?','getMetaData()','getMetaData()','correct'),(16,18,'In spring, Dependency injection is also known as','Inversion of Control pattern(IOC)','Inversion of Control pattern(IOC)','correct'),(17,19,'Which of the following function is used to find the column count of the particular resultset ?','getMetaData()','getMetaData()','correct'),(18,19,'In spring, Dependency injection is also known as','Inversion of Control pattern(IOC)','Inversion of Control pattern(IOC)','correct'),(19,21,'In spring, Dependency injection is also known as','Inversion of Control pattern(IOC)','Inversion of Control pattern(IOC)','correct'),(20,1,'Which method sets the query parameters of the PreparedStatement Object?','setString()','setString()','correct'),(21,1,'In MVC Model,_______________layer is used to display the Model data fetched by the Controller.','Presentation','Presentation','correct'),(22,1,'Which of the following object is used to create Session object in hibernate?','SessionFactory','SessionFactory','correct'),(23,1,'Who is the founder of Spring framework?','Rod Johnson','Rod Johnson','correct');

/*Table structure for table `courses` */

DROP TABLE IF EXISTS `courses`;

CREATE TABLE `courses` (
  `course_name` varchar(25) NOT NULL,
  `total_marks` int(11) NOT NULL,
  `time` varchar(45) NOT NULL,
  `ekey` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`course_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `courses` */

insert  into `courses`(`course_name`,`total_marks`,`time`,`ekey`) values ('J2EE',100,'60','Asq1LuRjYKRliWO'),('Java',50,'1','YlwRKdtOrsKgDyf'),('PHP',100,'90','DPYEphHQUYt62iF');

/*Table structure for table `exams` */

DROP TABLE IF EXISTS `exams`;

CREATE TABLE `exams` (
  `exam_id` int(11) NOT NULL AUTO_INCREMENT,
  `std_id` varchar(45) NOT NULL,
  `course_name` varchar(45) NOT NULL,
  `total_marks` varchar(45) NOT NULL,
  `obt_marks` varchar(45) DEFAULT NULL,
  `date` varchar(45) NOT NULL,
  `start_time` varchar(45) NOT NULL,
  `end_time` varchar(45) DEFAULT NULL,
  `exam_time` varchar(45) DEFAULT NULL,
  `status` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`exam_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `exams` */

insert  into `exams`(`exam_id`,`std_id`,`course_name`,`total_marks`,`obt_marks`,`date`,`start_time`,`end_time`,`exam_time`,`status`) values (1,'4','J2EE','100','175','25-03-2019','19:58:31.479','19:59:50.444','60','Pass');

/*Table structure for table `questions` */

DROP TABLE IF EXISTS `questions`;

CREATE TABLE `questions` (
  `question_id` int(11) NOT NULL AUTO_INCREMENT,
  `course_name` varchar(45) NOT NULL,
  `question` varchar(255) NOT NULL,
  `opt1` varchar(85) NOT NULL,
  `opt2` varchar(85) NOT NULL,
  `opt3` varchar(85) NOT NULL,
  `opt4` varchar(85) NOT NULL,
  `correct` varchar(85) NOT NULL,
  PRIMARY KEY (`question_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

/*Data for the table `questions` */

insert  into `questions`(`question_id`,`course_name`,`question`,`opt1`,`opt2`,`opt3`,`opt4`,`correct`) values (2,'Java','Which of the following function is used to find the column count of the particular resultset ?','getMetaData()','Metadata()','getColumn()','getCount()','getMetaData()'),(3,'Java','Which of the following describes the correct sequence of the steps involved in making a connection with a database. 1)Registering the Driver class 2)Importing JDBC Packages 3)Making the connection with the database. 4)Executing the SQL statement object.','1,3,4,2','2,3,1,4','2,1,3,4','2,1,4,3','2,1,3,4'),(5,'Java','In spring, Dependency injection is also known as','Constructor dependency injection','Inversion of Control pattern(IOC)','Bean configuration file','Object relational mapping','Inversion of Control pattern(IOC)'),(6,'J2EE','Which of the following object is used to create Session object in hibernate?','Configuration','Session','SessionFactory','Transaction','SessionFactory'),(7,'J2EE','In MVC Model,_______________layer is used to display the Model data fetched by the Controller.','Presentation','business logic','application','controller','Presentation'),(8,'J2EE','Who is the founder of Spring framework?','Apache Foundation','Rod Johnson','James Gowsling','Jams smith','Rod Johnson'),(9,'J2EE','Which method sets the query parameters of the PreparedStatement Object?','setParameter()','setAttribute()','setString()','setToString()','setString()');

/*Table structure for table `test` */

DROP TABLE IF EXISTS `test`;

CREATE TABLE `test` (
  `name` varchar(25) NOT NULL,
  `age` int(11) DEFAULT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `test` */

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(45) NOT NULL,
  `last_name` varchar(45) DEFAULT NULL,
  `user_name` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `user_type` varchar(45) NOT NULL,
  `contact_no` varchar(45) DEFAULT NULL,
  `city` varchar(45) DEFAULT NULL,
  `address` varchar(45) DEFAULT NULL,
  `skey` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='		';

/*Data for the table `users` */

insert  into `users`(`user_id`,`first_name`,`last_name`,`user_name`,`email`,`password`,`user_type`,`contact_no`,`city`,`address`,`skey`) values (1,'admin','admin','admin','admin@gmail.com','admin','admin','9888253655','Hyderabad','koti','admin'),(4,'karuna','mura','karuna','vadde.seetha@gmail.com','karuna','student','9666589655','Hyderabad','ameerpet','6ItElGwhkTYg6EQ');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
