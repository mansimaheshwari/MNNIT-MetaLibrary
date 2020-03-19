


drop table domain;
create table domain(
	domain varchar(50),
	dept varchar(50) references departments(dept),
	 primary key(domain,dept)
);
insert into domain values("Computer Networking","Computer Science and Engineering"),
	("Database Management System","Computer Science and Engineering"),
	("Operating System","Computer Science and Engineering"),
	("Computer Graphics","Computer Science and Engineering"),
	("Computer Architecture","Computer Science and Engineering"),
	("C Programming","Computer Science and Engineering"),
	("Programming & Problem Solving","Computer Science and Engineering"),
	("Foundation of Logic","Computer Science and Engineering"),
	("Shell Programming","Computer Science and Engineering"),
	("Digital Computer Organization","Computer Science and Engineering"),
	("Data Structures","Computer Science and Engineering"),
	("Object Oriented Programming","Computer Science and Engineering"),
	("XML Applications","Computer Science and Engineering"),
	("Automata Theory","Computer Science and Engineering"),
	("Technical Writing","Computer Science and Engineering"),
	("Principles of IT Industries Management","Computer Science and Engineering"),
	("Soft Computing","Computer Science and Engineering"),
	("Analysis of Algorithms","Computer Science and Engineering"),
	("Object based Modeling","Computer Science and Engineering"),
	("Web Programming","Computer Science and Engineering"),
	("Software Engineering","Computer Science and Engineering"),
	("Computer Network","Computer Science and Engineering"),
	("Multimedia Technology","Computer Science and Engineering"),
	("E-Commerce","Computer Science and Engineering"),
	("Professional Ethics","Computer Science and Engineering"),
	("Software Project Management","Computer Science and Engineering"),
	("Cryptography & Network Security","Computer Science and Engineering"),
	("Software Testing","Computer Science and Engineering"),
	("Real Time Systems","Computer Science and Engineering"),
	("Wireless Network Security","Computer Science and Engineering"),
	("Pattern Recognition","Computer Science and Engineering"),
	("VLSI","Electronics and Communication  Engineering"),
	("Automatic Control Systems","Electronics and Communication  Engineering"),
	("Microprocessors and its Applicatons","Electronics and Communication  Engineering"),
	("Circuit Design","Electronics and Communication  Engineering"),
	("Computer Orientation","Electronics and Communication  Engineering"),
	("Strength of Materials","Mechanical Engineering"),
	("Theory of Machenics","Mechanical Engineering"),
	("Thermodynamics","Mechanical Engineering"),
	("Fluid machenics","Mechanical Engineering"),
	("Production","Mechanical Engineering"),
	("Heat Transfer","Mechanical Engineering"),
	("Power Plant","Mechanical Engineering"),
	("Industrial Engineering","Mechanical Engineering"),
	("Heat Transfer","Chemical Engineering"),
	("Mass Transfer","Chemical Engineering"),
	("Chemical Reaction Engineering","Chemical Engineering"),
	("Fluid Machenics","Chemical Engineering"),
	("Highway Engineering","Civil Engineering"),
	("Structural Engineering","Civil Engineering"),
	("Environmental Engineering","Civil Engineering"),
	("Soil or Geotech Engineering","Civil Engineering"),
	("no subjects inserted","Electrical Engineering"),
	("no subjects inserted","Biotechnology")
	;
	
	
	("","Electrical Engineering"),
	("","Biotechnology"),

	
	
	
	

drop table departments;
create table departments(
	dept varchar(50) primary key
);
insert into departments values("Computer Science and Engineering"),
	("Civil Engineering"),
	("Electrical Engineering"),
	("Electronics and Communication Engineering"),
	("Chemical Engineering"),
	("Biotechnology"),
	("Mechanical Engineering")
;




drop table teacher;
CREATE TABLE teacher (
  tid varchar(8) NOT NULL primary key,
  tname varchar(50) NOT NULL,
  temail varchar(20) NOT NULL unique,
  tpass varchar(15) NOT NULL,
  tmobile varchar(10) DEFAULT NULL,
  dept varchar(50) NOT NULL,
  image MEDIUMBLOB NOT NULL,
  profile MEDIUMTEXT NOT NULL
);

drop table student;
CREATE TABLE student (
  sid varchar(8) NOT NULL  primary key,
  sname varchar(50) NOT NULL,
  semail varchar(20) NOT NULL unique,
  spass varchar(15) NOT NULL,
  smobile varchar(10) DEFAULT NULL,
  dept varchar(50) NOT NULL,
  image MEDIUMBLOB NOT NULL,
  profile MEDIUMTEXT NOT NULL
);

       
drop table admin;
CREATE TABLE admin (
  aid int(6) NOT NULL AUTO_INCREMENT primary key,
  aname varchar(70) NOT NULL,
  aemail varchar(20) NOT NULL unique,
  apass varchar(15) NOT NULL,
  amobile varchar(10) DEFAULT NULL
);
insert  into admin values (1,'mansi','mansi@gmail.com','mansi123','8160704377');

        



drop table types;
CREATE TABLE types (
  types varchar(20) NOT NULL primary key
);
insert into types values("papers"),("notes"),("videos");




drop table book;
CREATE TABLE book (
  isbn varchar(13) NOT NULL  primary key,
  bname varchar(70) NOT NULL,
  dept varchar(50) references departments(dept),
  domain varchar(50) NOT NULL references domain(domain),
  book LONGTEXT NOT NULL
);


drop table repository;
CREATE TABLE repository (
  rid int(13) NOT NULL  primary key auto_increment,
  rname varchar(70) NOT NULL,
  domain varchar(50) NOT NULL references domain(domain),
  types varchar(50) NOT NULL references types(types),
  tid int(6) NOT NULL references teacher(tid),
  repo LONGBLOB NOT NULL
);


drop table review;
CREATE TABLE review (
  id int(7) NOT NULL  primary key auto_increment,
  name varchar(20) NOT NULL,
  email varchar(20) NOT NULL ,
  education varchar(20) NOT NULL ,
  profession varchar(20) NOT NULL ,
  review varchar(500) NOT NULL 
);
