USE db_MNRY;

SELECT "" AS "Loading t_student with person.csv";

LOAD DATA INFILE "F:/PROJETS/P_GestProj/Git/SQL/person.csv"
INTO TABLE t_student
CHARACTER SET "latin1"
COLUMNS TERMINATED BY ";"
IGNORE 1 LINES
(@useless, @useless, @useless, @useless, @useless, @useless, @useless, @useless, @useless, stuAVS, @useless)
SET idStudent = NULL;



SELECT "" AS "Loading t_teacherProfession with person.csv";

LOAD DATA INFILE "F:/PROJETS/P_GestProj/Git/SQL/person.csv"
INTO TABLE t_teacherProfession
CHARACTER SET "latin1"
COLUMNS TERMINATED BY ";"
IGNORE 1 LINES
(@useless, @useless, @useless, @useless, @useless, @useless, @useless, @useless, @useless, @useless, teaProfessionName)
SET idTeacherProfession = NULL;


SELECT "" AS "Removing all the unwanted entry in both tables";

DELETE FROM t_student WHERE stuAVS < " ";
DELETE FROM t_teacherProfession WHERE teaProfessionName < " ";



SELECT "" AS "Loading t_person with person.csv";

SET @AVS = "", @profession = "";

LOAD DATA INFILE "F:/PROJETS/P_GestProj/Git/SQL/person.csv"
INTO TABLE t_person
CHARACTER SET "latin1"
COLUMNS TERMINATED BY ";"
IGNORE 1 LINES
(@useless, perFirstName, perLastNAme, perStreet, perStreetNB, perCity, perNPA, perEmail, perPhoneNB, @AVS, @profession)
SET idPerson = NULL, idStudent = (SELECT idStudent FROM t_student WHERE stuAVS = @AVS), idTeacherProfession = (SELECT idTeacherProfession FROM t_teacherProfession WHERE teaProfessionName = @profession);
