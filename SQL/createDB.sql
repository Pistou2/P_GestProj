#------------------------------------------------------------
#        Script MySQL.
#------------------------------------------------------------

DROP DATABASE IF EXISTS db_MNRY;
CREATE DATABASE db_MNRY;

USE db_MNRY;

#------------------------------------------------------------
# Table: t_formation
#------------------------------------------------------------

CREATE TABLE t_formation(
        idFormation int (11) Auto_increment  NOT NULL ,
        forTitle    Varchar (25) NOT NULL ,
        PRIMARY KEY (idFormation )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: t_person
#------------------------------------------------------------

CREATE TABLE t_person(
        idPerson     int (11) Auto_increment  NOT NULL ,
        perFirstName Varchar (25) NOT NULL ,
        perLastName  Varchar (25) NOT NULL ,
        perStreet    Varchar (35) NOT NULL ,
        perStreetNB  Varchar (5) NOT NULL ,
        perCity      Varchar (20) NOT NULL ,
        perNPA       Varchar (5) NOT NULL ,
        perEmail     Varchar (30) ,
        perPhoneNB   Varchar (20) ,
        perStudentAVS 	VARCHAR (20) ,
        perTeacherProfession 	VARCHAR (50) ,
        PRIMARY KEY (idPerson )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: t_lesson
#------------------------------------------------------------

CREATE TABLE t_lesson(
        idLesson    int (11) Auto_increment  NOT NULL ,
        lesDate     Date NOT NULL ,
        lesDuration Float NOT NULL ,
        idTeacher 	Int NOT NULL ,
        idFormation Int NOT NULL ,
        PRIMARY KEY (idLesson )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: t_lesson_person
#------------------------------------------------------------

CREATE TABLE t_lesson_person(
        idPerson Int NOT NULL ,
        idLesson Int NOT NULL ,
        PRIMARY KEY (idPerson ,idLesson )
)ENGINE=InnoDB;

ALTER TABLE t_lesson ADD CONSTRAINT FK_t_lesson_idTeacher FOREIGN KEY (idTeacher) REFERENCES t_person(idPerson);
ALTER TABLE t_lesson ADD CONSTRAINT FK_t_lesson_idFormation FOREIGN KEY (idFormation) REFERENCES t_formation(idFormation);
ALTER TABLE t_lesson_person ADD CONSTRAINT FK_t_lesson_person_idPerson FOREIGN KEY (idPerson) REFERENCES t_person(idPerson);
ALTER TABLE t_lesson_person ADD CONSTRAINT FK_t_lesson_person_idLesson FOREIGN KEY (idLesson) REFERENCES t_lesson(idLesson);
