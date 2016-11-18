#------------------------------------------------------------
#        Script MySQL.
#------------------------------------------------------------


#------------------------------------------------------------
# Table: t_student
#------------------------------------------------------------

CREATE TABLE t_student(
        idStudent int (11) Auto_increment  NOT NULL ,
        stuAVS    Char (13) NOT NULL ,
        idPerson  Int NOT NULL ,
        PRIMARY KEY (idStudent )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: t_teacher
#------------------------------------------------------------

CREATE TABLE t_teacher(
        idTeacher     int (11) Auto_increment  NOT NULL ,
        teaProfession Varchar (25) NOT NULL ,
        idPerson      Int NOT NULL ,
        PRIMARY KEY (idTeacher )
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
        perEmail     Varchar (30) ,
        perPhoneNB   Varchar (20) ,
        idStudent    Int NOT NULL ,
        idTeacher    Int NOT NULL ,
        PRIMARY KEY (idPerson )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: t_lesson
#------------------------------------------------------------

CREATE TABLE t_lesson(
        idLesson    int (11) Auto_increment  NOT NULL ,
        lesDate     Date NOT NULL ,
        lesDuration Float NOT NULL ,
        idPerson    Int NOT NULL ,
        idFormation Int NOT NULL ,
        PRIMARY KEY (idLesson )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Follow
#------------------------------------------------------------

CREATE TABLE Follow(
        idPerson Int NOT NULL ,
        idLesson Int NOT NULL ,
        PRIMARY KEY (idPerson ,idLesson )
)ENGINE=InnoDB;

ALTER TABLE t_student ADD CONSTRAINT FK_t_student_idPerson FOREIGN KEY (idPerson) REFERENCES t_person(idPerson);
ALTER TABLE t_teacher ADD CONSTRAINT FK_t_teacher_idPerson FOREIGN KEY (idPerson) REFERENCES t_person(idPerson);
ALTER TABLE t_person ADD CONSTRAINT FK_t_person_idStudent FOREIGN KEY (idStudent) REFERENCES t_student(idStudent);
ALTER TABLE t_person ADD CONSTRAINT FK_t_person_idTeacher FOREIGN KEY (idTeacher) REFERENCES t_teacher(idTeacher);
ALTER TABLE t_lesson ADD CONSTRAINT FK_t_lesson_idPerson FOREIGN KEY (idPerson) REFERENCES t_person(idPerson);
ALTER TABLE t_lesson ADD CONSTRAINT FK_t_lesson_idFormation FOREIGN KEY (idFormation) REFERENCES t_formation(idFormation);
ALTER TABLE Follow ADD CONSTRAINT FK_Follow_idPerson FOREIGN KEY (idPerson) REFERENCES t_person(idPerson);
ALTER TABLE Follow ADD CONSTRAINT FK_Follow_idLesson FOREIGN KEY (idLesson) REFERENCES t_lesson(idLesson);
