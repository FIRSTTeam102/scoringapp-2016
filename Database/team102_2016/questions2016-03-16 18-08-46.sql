USE team102_2016;

CREATE TABLE `questions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `question` varchar(1000) NOT NULL,
  `seq_no` double unsigned NOT NULL DEFAULT '1' COMMENT 'The sequence order for this question.',
  `active` varchar(1) NOT NULL DEFAULT 'Y' COMMENT 'Is this question still active?',
  `q_type` varchar(20) NOT NULL DEFAULT 'SHORT' COMMENT 'The type of question: separator, short answer, multiple choice, long answer.',
  `domain` varchar(50) DEFAULT NULL COMMENT 'For multiple choice questions, the domain in ref_codes from which the choices will come.',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=latin1;


insert into `questions`(`id`,`question`,`seq_no`,`active`,`q_type`,`domain`) values (1,'Can your robot breach?',3,'Y','MULT','YES_NO');
insert into `questions`(`id`,`question`,`seq_no`,`active`,`q_type`,`domain`) values (2,'How many defences can your robot cross?',4,'Y','MULT','1TO5');
insert into `questions`(`id`,`question`,`seq_no`,`active`,`q_type`,`domain`) values (3,'Is your robot capable of picking up a boulder?',7,'Y','MULT','YES_NO');
insert into `questions`(`id`,`question`,`seq_no`,`active`,`q_type`,`domain`) values (4,'About how long does it take your robot complete a breach?',5,'Y','MULT','TIME');
insert into `questions`(`id`,`question`,`seq_no`,`active`,`q_type`,`domain`) values (5,'What is your robot''s drive train?',1,'Y','MULT','DRIVE_TYPE');
insert into `questions`(`id`,`question`,`seq_no`,`active`,`q_type`,`domain`) values (6,'Can your robot score shooting points?',6,'Y','MULT','YES_NO');
insert into `questions`(`id`,`question`,`seq_no`,`active`,`q_type`,`domain`) values (7,'What kind of transmission does your robot use?',2,'Y','MULT','TRANSMISSION');
insert into `questions`(`id`,`question`,`seq_no`,`active`,`q_type`,`domain`) values (8,'On a scale of 1-7 how would you rate your ability to score?',15,'Y','MULT','1TO7');
insert into `questions`(`id`,`question`,`seq_no`,`active`,`q_type`,`domain`) values (9,'On a scale of 1-7 how efficient is your robot at scoring?',16,'Y','MULT','1TO7');
insert into `questions`(`id`,`question`,`seq_no`,`active`,`q_type`,`domain`) values (10,'How would you rate the expected amount of points your robot can score per match(Low=0-12, Med=13-21 High=22 and up)',17,'Y','MULT','HIMEDLO');
insert into `questions`(`id`,`question`,`seq_no`,`active`,`q_type`,`domain`) values (11,'Is your robot able to get the boulders to the courtyard?',10,'Y','MULT','YES_NO');
insert into `questions`(`id`,`question`,`seq_no`,`active`,`q_type`,`domain`) values (12,'When do you go for the boulders? ',11,'Y','MULT','AUTO_TEL');
insert into `questions`(`id`,`question`,`seq_no`,`active`,`q_type`,`domain`) values (13,'Can your robot cross a defence in Autonomous mode?',12,'Y','MULT','YES_NO');
insert into `questions`(`id`,`question`,`seq_no`,`active`,`q_type`,`domain`) values (14,'Can your robot score a high goal in Autonomous Mode?',13,'Y','MULT','YES_NO');
insert into `questions`(`id`,`question`,`seq_no`,`active`,`q_type`,`domain`) values (15,'Can your robot score a low goal in Autonomous Mode?',14,'Y','MULT','YES_NO');
insert into `questions`(`id`,`question`,`seq_no`,`active`,`q_type`,`domain`) values (16,'Can your robot pick up a boulder off the floor?',9,'Y','MULT','YES_NO');
insert into `questions`(`id`,`question`,`seq_no`,`active`,`q_type`,`domain`) values (17,'Can your robot pin another robot?',8,'Y','MULT','YES_NO');
insert into `questions`(`id`,`question`,`seq_no`,`active`,`q_type`,`domain`) values (18,'On a scale of 1-5 how much do you rely on your alliance partners?',18,'Y','MULT','1TO5');
insert into `questions`(`id`,`question`,`seq_no`,`active`,`q_type`,`domain`) values (20,'Can your robot cross the Porticullis?',1,'Y','SHORT',null);
insert into `questions`(`id`,`question`,`seq_no`,`active`,`q_type`,`domain`) values (21,'Can your robot cross the Moat',1,'Y','SHORT',null);
insert into `questions`(`id`,`question`,`seq_no`,`active`,`q_type`,`domain`) values (22,'Can your robot cross the Cheval de Frise?',1,'Y','SHORT',null);
insert into `questions`(`id`,`question`,`seq_no`,`active`,`q_type`,`domain`) values (23,'Can your robot cross the Ramparts?',1,'Y','SHORT',null);
