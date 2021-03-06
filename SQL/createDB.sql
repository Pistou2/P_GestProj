#------------------------------------------------------------
#        Script MySQL.
#------------------------------------------------------------

DROP DATABASE IF EXISTS db_MNRY;
CREATE DATABASE db_MNRY;

USE db_MNRY;

#------------------------------------------------------------
# Table: t_student
#------------------------------------------------------------

CREATE TABLE t_student(
        idStudent int (11) Auto_increment  NOT NULL ,
        stuAVS    Char (13) NOT NULL ,
        PRIMARY KEY (idStudent )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: t_teacherProfession
#------------------------------------------------------------

CREATE TABLE t_teacherProfession(
        idTeacherProfession     int (11) Auto_increment  NOT NULL ,
        teaProfessionName Varchar (25) NOT NULL ,
        PRIMARY KEY (idTeacherProfession )
)ENGINE=InnoDB;


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
        perEmail     Varchar (50) ,
        perPhoneNB   Varchar (20) ,
        idStudent    Int ,
        idTeacherProfession    Int ,
        PRIMARY KEY (idPerson )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: t_lesson
#------------------------------------------------------------

CREATE TABLE t_lesson(
        idLesson    int (11) Auto_increment  NOT NULL ,
        lesDate     Date NOT NULL ,
        lesDuration Float NOT NULL ,
        idTeacherProfession    Int NOT NULL ,
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

ALTER TABLE t_person ADD CONSTRAINT FK_t_person_idStudent FOREIGN KEY (idStudent) REFERENCES t_student(idStudent);
ALTER TABLE t_person ADD CONSTRAINT FK_t_person_idTeacherProfession FOREIGN KEY (idTeacherProfession) REFERENCES t_teacherProfession(idTeacherProfession);
ALTER TABLE t_lesson ADD CONSTRAINT FK_t_lesson_idTeacherProfession FOREIGN KEY (idTeacherProfession) REFERENCES t_person(idPerson);
ALTER TABLE t_lesson ADD CONSTRAINT FK_t_lesson_idFormation FOREIGN KEY (idFormation) REFERENCES t_formation(idFormation);
ALTER TABLE t_lesson_person ADD CONSTRAINT FK_t_lesson_person_idPerson FOREIGN KEY (idPerson) REFERENCES t_person(idPerson);
ALTER TABLE t_lesson_person ADD CONSTRAINT FK_t_lesson_person_idLesson FOREIGN KEY (idLesson) REFERENCES t_lesson(idLesson);
