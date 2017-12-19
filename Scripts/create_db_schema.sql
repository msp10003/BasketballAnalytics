CREATE TABLE `Team` (
	`TeamID` INT NOT NULL UNIQUE,
	`UniversityID` INT NOT NULL,
	PRIMARY KEY (`TeamID`)
);

CREATE TABLE `TeamSeason` (
	`TeamSeasonID` INT NOT NULL AUTO_INCREMENT,
	`TeamID` INT NOT NULL,
	`SeasonID` INT NOT NULL,
	PRIMARY KEY (`TeamSeasonID`)
);

CREATE TABLE `Season` (
	`SeasonID` INT NOT NULL AUTO_INCREMENT,
	`Year` DATE NOT NULL UNIQUE,
	PRIMARY KEY (`SeasonID`)
);

CREATE TABLE `University` (
	`UniversityID` INT NOT NULL AUTO_INCREMENT,
	`UniversityName` varchar(256) NOT NULL,
	`UniversityMascotName` varchar(256) NOT NULL,
	PRIMARY KEY (`UniversityID`)
);

CREATE TABLE `GameTeam` (
	`GameTeamID` INT NOT NULL AUTO_INCREMENT,
	`GameID` INT NOT NULL,
	`TeamSeasonID` INT NOT NULL,
	`HomeStatusTypeID` INT NOT NULL,
	`Points` INT NOT NULL,
	`TotalShotsTaken` INT NOT NULL,
	`TotalShotsMade` INT NOT NULL,
	`3PtShotsTaken` INT NOT NULL,
	`3PtShotsMade` INT NOT NULL,
	`FreeThrowsTaken` INT NOT NULL,
	`FreeThrowsMade` INT NOT NULL,
	`Rebounds` INT NOT NULL,
	`Fouls` INT NOT NULL,
	`TimeOfPossesion` INT NOT NULL,
	`Blocks` INT NOT NULL,
	PRIMARY KEY (`GameTeamID`)
);

CREATE TABLE `HomeStatusType` (
	`HomeStatusTypeID` INT NOT NULL AUTO_INCREMENT,
	`HomeStatusTypeName` varchar(256) NOT NULL,
	PRIMARY KEY (`HomeStatusTypeID`)
);

CREATE TABLE `Game` (
	`GameID` INT NOT NULL AUTO_INCREMENT,
	`GameDate` DATETIME NOT NULL,
	PRIMARY KEY (`GameID`)
);

ALTER TABLE `Team` ADD CONSTRAINT `Team_fk0` FOREIGN KEY (`UniversityID`) REFERENCES `University`(`UniversityID`);

ALTER TABLE `TeamSeason` ADD CONSTRAINT `TeamSeason_fk0` FOREIGN KEY (`TeamID`) REFERENCES `Team`(`TeamID`);

ALTER TABLE `TeamSeason` ADD CONSTRAINT `TeamSeason_fk1` FOREIGN KEY (`SeasonID`) REFERENCES `Season`(`SeasonID`);

ALTER TABLE `GameTeam` ADD CONSTRAINT `GameTeam_fk0` FOREIGN KEY (`GameID`) REFERENCES `Game`(`GameID`);

ALTER TABLE `GameTeam` ADD CONSTRAINT `GameTeam_fk1` FOREIGN KEY (`TeamSeasonID`) REFERENCES `TeamSeason`(`TeamSeasonID`);

ALTER TABLE `GameTeam` ADD CONSTRAINT `GameTeam_fk2` FOREIGN KEY (`HomeStatusTypeID`) REFERENCES `HomeStatusType`(`HomeStatusTypeID`);