CREATE USER 'appUser'@'localhost' IDENTIFIED BY 'appPassw0rd';
GRANT ALL PRIVILEGES ON dockerappdb.* TO 'appUser'@'localhost';
