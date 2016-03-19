USE team102_2016;

CREATE TABLE `tournaments` (
  `ID` varchar(20) NOT NULL,
  `Title` varchar(100) NOT NULL,
  `active` varchar(1) NOT NULL DEFAULT 'N',
  `FIRST_Abbrev` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


insert into `tournaments`(`ID`,`Title`,`active`,`FIRST_Abbrev`) values ('MAR','Mid-Atlantic Robotics District Championship','N','MRCMP');
insert into `tournaments`(`ID`,`Title`,`active`,`FIRST_Abbrev`) values ('MNT','MAR District - Montgomery Event','N','NJSKI');
insert into `tournaments`(`ID`,`Title`,`active`,`FIRST_Abbrev`) values ('MTO','MAR District - Mt. Olive','Y','NJFLA');
insert into `tournaments`(`ID`,`Title`,`active`,`FIRST_Abbrev`) values ('SEN','MAR District - Seneca Event','N','NJTAB');
