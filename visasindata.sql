DROP DATABASE IF EXISTS Visas;
CREATE DATABASE Visas;
USE Visas;
DROP TABLE IF EXISTS Case_Info;
CREATE TABLE Case_Info (
  Number INTEGER UNIQUE NOT NULL,
  Case_Status VARCHAR(10) NOT NULL,
  YEAR VARCHAR (4) NOT NULL,
PRIMARY KEY(Number)
); 

DROP TABLE IF EXISTS Job_Descrip;
CREATE TABLE Job_Descrip (
  id INTEGER NOT NULL,
  Full_Time VARCHAR(1),
  Title VARCHAR(30) NOT NULL,
  Prevailing_Wage FLOAT NOT NULL,
  Worksite VARCHAR(10) NOT NULL,
 PRIMARY KEY(Prevailing_Wage),
 FOREIGN KEY(id) REFERENCES Case_Info (Number)
);


DROP TABLE IF EXISTS Soc_Name;
CREATE TABLE Soc_Name (
  id INTEGER NOT NULL,
  Soc_name VARCHAR(15) NOT NULL,
  Employer_Name VARCHAR(15) NOT NULL,
  FOREIGN KEY(id) REFERENCES Case_Info (Number),
  PRIMARY KEY(Employer_Name) #no esta bueno que el PK sea un nombre pero elimine el codigo de la compania 
);

#mi idea era con este codigo poder importar los datos del csv (que previamente ya habia importado en otra base de datos llamada datavisas) que ya habia modificado en python pero salta el error 1290 o el 3948 en caso de que quiera importar un local data infile 
LOAD DATA  INFILE 
' /Users/florenciaross/Desktop/H1_Visas.csv' 
INTO TABLE CaseInfo 
FIELDS TERMINATED BY ',' 
LINES TERMINATED BY '\n' 
IGNORE 1 ROWS (CASE_NUMBER, CASE_STATUS, YEAR) ;


