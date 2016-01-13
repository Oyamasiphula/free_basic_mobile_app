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

CREATE TABLE IF NOT EXISTS `coded_before_options` (
  `background_option_id` int(200) NOT NULL AUTO_INCREMENT,
  `coded_before` text(20) NOT NULL,
 PRIMARY KEY (`background_option_id`)
);
INSERT INTO coded_before_options (coded_before) VALUES ("No, not yet");
INSERT INTO coded_before_options (coded_before) VALUES ("Yes, a little");
INSERT INTO coded_before_options (coded_before) VALUES ("Yes, quite a bit");


CREATE TABLE IF NOT EXISTS `reference_options` (
    `ref_option_id` int(20) NOT NULL AUTO_INCREMENT,
    `reference_spec_opt` text(20) NOT NULL,
  PRIMARY KEY (`ref_option_id`)
);
INSERT INTO reference_options (reference_spec_opt) VALUES ("Teacher");
INSERT INTO reference_options (reference_spec_opt) VALUES ("Mentor");
INSERT INTO reference_options (reference_spec_opt) VALUES ("Employer");


-- Table structure for table `codecademy_mailAdrresses`

CREATE TABLE IF NOT EXISTS `codecademy_mailAdrresses` (
  `mail_id` int(200) NOT NULL AUTO_INCREMENT,
  `email` VARCHAR(30),
   PRIMARY KEY (`mail_id`)
);

-- Table structure for table `applicants_td`

CREATE TABLE IF NOT EXISTS `applicants_td` (
  `applicant_id` int NOT NULL AUTO_INCREMENT,
  `background_option_id` int(200) DEFAULT NULL,
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
  `ref_option_id` int(200) DEFAULT NULL,
  PRIMARY KEY (`applicant_id`)
);

ALTER TABLE applicants_td
ADD FOREIGN KEY (`background_option_id`) REFERENCES coded_before_options(`background_option_id`),
ADD FOREIGN KEY (`mail_id`) REFERENCES codecademy_mailAdrresses(`mail_id`),
ADD FOREIGN KEY (`reference_id`) REFERENCES reference_td(`reference_id`),
ADD FOREIGN KEY (`ref_option_id`) REFERENCES reference_options(`ref_option_id`);

-- Dumping data for table --

INSERT INTO applicants_td (applicant_id,background_option_id,experiance,name,surname,email,cell_no,dob,city,educational_info,reference_id,ref_option_id) VALUES (1,2,"wfewddWEEWD ERWFEWKHBKL BFWEQFWF YBGKJBYVKJ FFEWEFERERFFSE GREGE EW4F","Sphiwe","Ngcinga","oysiphula@gmail.com",0781268545,1994-02-01,"Cape Town","I'm currently having IT certificate",1,2);

INSERT INTO reference_td (name,surname,email,cell_no) VALUES ("sphokazi","Peter","Sp1@gmail.com",0246563325);

INSERT INTO codecademy_mailAdrresses (email) VALUES ("Sphiwe@projectcodex.co");

SELECT applicants_td.background_option_id, applicants_td.experiance, applicants_td.name, applicants_td.surname FROM applicants_td INNER JOIN coded_before_options ON applicants_td.background_option_id = coded_before_options.coded_before;

SELECT name, coded_before FROM applicants_td INNER JOIN coded_before_options ON applicants_td.background_option_id = coded_before_options.background_option_id