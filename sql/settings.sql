DROP TABLE IF EXISTS `settings`;

CREATE TABLE `settings` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `device` varchar(32) DEFAULT NULL,
  `device_localtion` varchar(32) DEFAULT NULL,
  `messe_c_tavle` varchar(32) DEFAULT NULL,
  `tavle_location1` varchar(32) DEFAULT NULL,
  `tavle_id1` varchar(32) DEFAULT NULL,
  `ct1` varchar(32) DEFAULT NULL,
  `ct2` varchar(32) DEFAULT NULL,
  `ct3` varchar(32) DEFAULT NULL,
  `ct4` varchar(32) DEFAULT NULL,
  `tavle_location2` varchar(32) DEFAULT NULL,
  `tavle_id2` varchar(32) DEFAULT NULL,
  `ct5` varchar(32) DEFAULT NULL,
  `ct6` varchar(32) DEFAULT NULL,
  `ct7` varchar(32) DEFAULT NULL,
  `ct8` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `settings` WRITE;
/*!40000 ALTER TABLE `settings` DISABLE KEYS */;

INSERT INTO `settings` (`id`, `device`, `device_localtion`, `messe_c_tavle`, `tavle_location1`, `tavle_id1`, `ct1`, `ct2`, `ct3`, `ct4`, `tavle_location2`, `tavle_id2`, `ct5`, `ct6`, `ct7`, `ct8`)
VALUES
	(1,'current-pi1',NULL,'1.1','','24','1','2','3','N',NULL,'25','1','2','3','N'),
	(2,'current-pi2',NULL,'1.2',NULL,'21','1','2','3','N',NULL,NULL,NULL,NULL,NULL,NULL),
	(3,'current-pi3',NULL,'1.3',NULL,'10','1','2','3','N',NULL,NULL,NULL,NULL,NULL,NULL),
	(4,'current-pi4',NULL,'1.4',NULL,'1','1','2','3','N',NULL,'2','1','2','3','N'),
	(5,'current-pi5',NULL,'1.4',NULL,'3','1','2','3','N',NULL,NULL,NULL,NULL,NULL,NULL),
	(6,'current-pi6',NULL,'2.2',NULL,'20','1','2','3','N',NULL,NULL,NULL,NULL,NULL,NULL),
	(7,'current-pi7',NULL,'2.3',NULL,'18','1','2','3','N',NULL,'19','1','2','3','N'),
	(8,'current-pi8',NULL,'2.4',NULL,'6','1','2','3','N',NULL,'7','1','2','3','N'),
	(9,'current-pi9',NULL,'3.2',NULL,'8','1','2','3','N',NULL,'9','1','2','3','N'),
	(10,'current-pi10',NULL,'3.2',NULL,'23','1','2','3','N',NULL,'31','1','2','3','N'),
	(11,'current-pi11',NULL,'3.3',NULL,'28','1','2','3','N',NULL,'29','1','2','3','N'),
	(12,'current-pi12',NULL,'3.3',NULL,'30','1','2','3','N',NULL,NULL,NULL,NULL,NULL,NULL),
	(13,'current-pi13',NULL,'4.1',NULL,'32','1','2','3','N',NULL,NULL,NULL,NULL,NULL,NULL),
	(14,'current-pi14',NULL,'4.2',NULL,'4','1','2','3','N',NULL,'34','1','2','3','N'),
	(15,'current-pi15',NULL,'4.2',NULL,'35','1','2','3','N',NULL,NULL,NULL,NULL,NULL,NULL),
	(16,'current-pi16',NULL,'4.3',NULL,'5','1','2','3','N',NULL,'33','1','2','3','N'),
	(17,'current-pi17',NULL,'4.5',NULL,'14','1','2','3','N',NULL,'15','1','2','3','N'),
	(18,'current-pi18',NULL,'4.5',NULL,'16','1','2','3','N',NULL,'17','1','2','3','N'),
	(19,'current-pi19',NULL,'4.6',NULL,'11','1','2','3','N',NULL,'12','1','2','3','N'),
	(20,'current-pi20',NULL,'4.6',NULL,'13','1','2','3','N',NULL,NULL,NULL,NULL,NULL,NULL);

/*!40000 ALTER TABLE `settings` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
