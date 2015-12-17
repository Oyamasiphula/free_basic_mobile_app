CREATE DATABASE codeX_applicants_db;

USE codeX_applicants_db;
 
CREATE TABLE IF NOT EXISTS `reference_td` (
  `reference_id` int(200) NOT NULL AUTO_INCREMENT,
  `name` text(20) NOT NULL,
  `surname` text(20) NOT NULL,
  `email` varchar(50) NOT NULL,
  `cell_no` int(10) NOT NULL,
  PRIMARY KEY (`reference_id`)
);

-- Table structure for table `codecademy_mailAdrresses`

CREATE TABLE IF NOT EXISTS `codecademy_mailAdrresses` (
  `mail_id` int(200) NOT NULL AUTO_INCREMENT,
  `email` VARCHAR(30),
   PRIMARY KEY (`mail_id`)
);

-- Table structure for table `applicants_td`

CREATE TABLE IF NOT EXISTS `applicants_td` (
  `applicant_id` int(200) NOT NULL AUTO_INCREMENT,
  `coded_before` text(20) NOT NULL,
  `experiance` varchar(400) NOT NULL,
  `name` text(20) NOT NULL,                                
  `surname` text(20) NOT NULL,
  `email` varchar(20) NOT NULL,
  `cell_no` int(10) NOT NULL,
  `dob` Date NOT NULL,
  `city` text(20) NOT NULL,
  `educational_info` varchar(400) NOT NULL,
  `mail_id` int(200) DEFAULT NULL,
  `reference_id` int(200) DEFAULT NULL, 
  `applicant_ref_link` varchar(20) NOT NULL,
  PRIMARY KEY (`applicant_id`),
  FOREIGN KEY (`mail_id`) REFERENCES codecademy_mailAdrresses(`mail_id`),
  FOREIGN KEY (`reference_id`) REFERENCES reference_td(`reference_id`)
);

-- Dumping data for table --

-- INSERT INTO applicants_td (applicant_id,coded_before,experiance,name,surname,email,cell_no,dob,city,educational_info,reference_id,applicant_ref_link) VALUES (1,"yes,quite a bit","wfewddWEEWD ERWFEWKHBKL BFWEQFWF YBGKJBYVKJ FFEWEFERERFFSE GREGE EW4F","Sphiwe","Ngcinga","oysiphula@gmail.com",0781268545,1994-02-01,"Cape Town","I'm currently having IT certificate",1,"Mentor");

-- INSERT INTO reference_td (name,surname,email,cell_no) VALUES ("sphokazi","Peter","Sp1@gmail.com",0246563325);

-- INSERT INTO codecademy_mailAdrresses (email) VALUES ("Sphiwe@projectcodex.co");
