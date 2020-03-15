


drop table domain;
create table domain(
	domain varchar(50) primary key
);
insert into domain values("computer networking"),("database management system"),("operating system"),("computer graphics"),("computer architecture"),("c programming"),("object oriented programming");


drop table teacher;
CREATE TABLE teacher (
  tid int(6) NOT NULL AUTO_INCREMENT primary key,
  tname varchar(70) NOT NULL,
  temail varchar(20) NOT NULL unique,
  tpass varchar(15) NOT NULL,
  tmobile varchar(12) DEFAULT NULL,
  dept varchar(50) NOT NULL,
  image MEDIUMBLOB NOT NULL,
  profile MEDIUMTEXT NOT NULL
);

drop table student;
CREATE TABLE student (
  sid int(6) NOT NULL AUTO_INCREMENT primary key,
  sname varchar(70) NOT NULL,
  semail varchar(20) NOT NULL unique,
  spass varchar(15) NOT NULL,
  smobile varchar(12) DEFAULT NULL,
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
  amobile varchar(12) DEFAULT NULL
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
  domain varchar(50) NOT NULL references domain(domain),
  link LONGTEXT NOT NULL
);


drop table repository;
CREATE TABLE repository (
  rid int(13) NOT NULL  primary key auto_increment,
  rname varchar(70) NOT NULL,
  domain varchar(50) NOT NULL references domain(domain),
  types varchar(50) NOT NULL references types(types),
  tid int(6) NOT NULL references teacher(tid),
  link LONGTEXT NOT NULL
);


