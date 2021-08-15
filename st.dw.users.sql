CREATE DATABASE IF NOT EXISTS stagingvisas;
CREATE DATABASE IF NOT EXISTS datavisas;
CREATE DATABASE IF NOT EXISTS dw_visas;
CREATE USER IF NOT EXISTS uservisas@localhost IDENTIFIED BY 'uservisas';
GRANT ALL PRIVILEGES ON *.* TO 'uservisas'@'localhost';
GRANT USAGE ON *.* TO 'uservisas'@'localhost';
