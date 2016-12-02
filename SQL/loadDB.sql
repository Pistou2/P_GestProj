USE db_MNRY;

SELECT "" AS "Loading t_person with person.csv";

LOAD DATA INFILE "F:/PROJETS/P_GestProj/Git/SQL/person.csv"
INTO TABLE t_person
CHARACTER SET "latin1"
COLUMNS TERMINATED BY ";"
IGNORE 1 LINES
(@useless, perFirstName, perLastNAme, perStreet, perStreetNB, perCity, perNPA, perEmail, perPhoneNB, perStudentAVS, perTeacherProfession)
SET idPerson = NULL;


SELECT "" AS "Loading t_formation with formation.csv";

LOAD DATA INFILE "F:/PROJETS/P_GestProj/Git/SQL/formation.csv"
INTO TABLE t_formation
CHARACTER SET "latin1"
COLUMNS TERMINATED BY ";"
IGNORE 1 LINES
(@useless, forTitle)
SET idFormation = NULL;


SELECT "" AS "Loading t_lesson with lesson.csv";

LOAD DATA INFILE "F:/PROJETS/P_GestProj/Git/SQL/lesson.csv"
INTO TABLE t_lesson
CHARACTER SET "latin1"
COLUMNS TERMINATED BY ";"
IGNORE 1 LINES
(@useless, lesDate, lesDuration, idTeacher, idFormation)
SET idLesson = NULL;



SELECT "" AS "Loading t_lesson_person with student.csv";

LOAD DATA INFILE "F:/PROJETS/P_GestProj/Git/SQL/student.csv"
INTO TABLE t_lesson_person
CHARACTER SET "latin1"
COLUMNS TERMINATED BY ";"
IGNORE 1 LINES
(idLesson, idPerson);