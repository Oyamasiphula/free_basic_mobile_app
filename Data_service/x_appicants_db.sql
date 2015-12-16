CREATE DATABASE codeX_applicants_db;

USE codeX_applicants_db;
 
CREATE TABLE reference_td (
  `reference_id` int(200) NOT NULL AUTO_INCREMENT,
  `name` text NOT NULL,
  `surname` text(20) NOT NULL,
  `email` varchar(20) NOT NULL,
  `cell_no` int(10) NOT NULL,
  PRIMARY KEY (`reference_id`)
);

-- Table structure for table `applicants_td`
--
CREATE TABLE applicants_td (
  `applicant_id` int NOT NULL AUTO_INCREMENT,
  `name` text(20) NOT NULL,                                
  `surname` text(20) NOT NULL,
  `email` varchar(20) NOT NULL,
  `cell_no` int(10) NOT NULL,
  `dob` Date NOT NULL,
  `city` text(20) NOT NULL,
  `educational_info` varchar(400) NOT NULL,
  `reference_id` int(200) DEFAULT NULL, 
  `applicant_ref_link` varchar(20) NOT NULL,
  PRIMARY KEY (`applicant_id`),
  KEY `reference_id` (`reference_id`)
);


ALTER TABLE  `applicants_td` ADD FOREIGN KEY (  `reference_id` ) REFERENCES  `codeX_applicants_db`.`reference_td` (
`reference_id`
) ON DELETE RESTRICT ON UPDATE RESTRICT ;

-- Dumping data for table `category`

INSERT INTO reference_td (name,surname,email,cell_no) VALUES ("sphokazi","Peter","Sp1@gmail,com",0246563325);
INSERT INTO reference_td (name,surname,email,cell_no) VALUES ("sphokazi","Peter","Sp1@gmail,com",0246563325);
INSERT INTO reference_td (name,surname,email,cell_no) VALUES ("sphokazi","Peter","Sp1@gmail,com",0246563325);

INSERT INTO applicants_td (name,surname,email,cell_no,dob,city,educational_info,reference_id,applicant_ref_link) VALUES ("Sphiwe","Ngcinga","oysiphula@gmail.com",0781268545,1994-02-01,"Cape Town","I'm currently having IT certificate",1,"Mentor");
