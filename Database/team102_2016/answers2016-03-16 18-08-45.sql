USE team102_2016;

CREATE TABLE `answers` (
  `question_id` int(11) NOT NULL,
  `team_number` int(11) NOT NULL,
  `answer` varchar(2046) DEFAULT NULL,
  PRIMARY KEY (`question_id`,`team_number`),
  KEY `answer_team_fk` (`team_number`),
  CONSTRAINT `answer_team_fk` FOREIGN KEY (`team_number`) REFERENCES `teams` (`number`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


