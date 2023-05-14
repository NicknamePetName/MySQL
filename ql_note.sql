-- Active: 1683973826757@@127.0.0.1@3306@youkedadb
-- CREATE DATABASE youkedadb;
-- CREATE TABLE  user;
CREATE TABLE timi_adc(
  id INT UNSIGNED AUTO_INCREMENT,
  hero_name VARCHAR (20),
  fever VARCHAR (10) NOT NULL,
  win_rate DOUBLE NOT NULL,
  appearance_rate DOUBLE NOT NULL,
  ban_rate DOUBLE NOT NULL,
  gmt_created datetime NOT NULL,
  gmt_modified datetime NOT NULL,
  PRIMARY KEY (id)
);

INSERT INTO timi_adc (hero_name,fever,win_rate,appearance_rate,ban_rate,gmt_created,gmt_modified)
VALUES
('后裔','T0',0.4995,0.3030,0.0108,now(),now()),
('鲁班七号','T0',0.5262,0.3290,0.0044,now(),now()),
('狄仁杰','T2',0.5082,0.1000,0.0016,now(),now());

