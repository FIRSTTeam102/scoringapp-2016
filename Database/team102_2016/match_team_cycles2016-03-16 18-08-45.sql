USE team102_2016;

CREATE TABLE `match_team_cycles` (
  `tournament_id` varchar(20) NOT NULL,
  `match_number` int(11) NOT NULL,
  `team_number` int(11) NOT NULL,
  `cycle_number` int(11) NOT NULL,
  `operation_attempted` varchar(3) NOT NULL,
  `success` varchar(1) NOT NULL,
  PRIMARY KEY (`tournament_id`,`match_number`,`team_number`,`cycle_number`),
  CONSTRAINT `match_team_cycle_match_team_fk` FOREIGN KEY (`tournament_id`, `match_number`, `team_number`) REFERENCES `match_teams` (`tournament_id`, `match_number`, `team_number`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Indicates for each match scoring event what one team did.';


insert into `match_team_cycles`(`tournament_id`,`match_number`,`team_number`,`cycle_number`,`operation_attempted`,`success`) values ('MTO',1,56,1,'CDF','Y');
insert into `match_team_cycles`(`tournament_id`,`match_number`,`team_number`,`cycle_number`,`operation_attempted`,`success`) values ('MTO',1,56,2,'CDF','N');
insert into `match_team_cycles`(`tournament_id`,`match_number`,`team_number`,`cycle_number`,`operation_attempted`,`success`) values ('MTO',1,56,3,'CDF','Y');
insert into `match_team_cycles`(`tournament_id`,`match_number`,`team_number`,`cycle_number`,`operation_attempted`,`success`) values ('MTO',1,56,4,'CDF','Y');
