USE db_MNRY;

SELECT "" AS "Loading t_person with person.csv";

LOAD DATA INFILE "F:/PROJETS/P_GestProj/Git/SQL/person.csv"
INTO TABLE t_person
CHARACTER SET "latin1"
COLUMNS TERMINATED BY ";"
IGNORE 1 LINES
(@useless, perFirstName, perLastNAme, perStreet, perStreetNB, perCity, perNPA, perEmail, perPhoneNB, perStudentAVS, perTeacherProfession)
SET idPerson = NULL;