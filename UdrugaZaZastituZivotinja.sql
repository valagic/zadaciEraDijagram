drop database if exists udrugazazastituzivotinja;
create database udrugazazastituzivotinja;
use udrugazazastituzivotinja;

create table lokacija (
	id int not null primary key auto_increment,
	naziv varchar(30) not null,
	nazivUlice varchar(30) not null,
	udruga int
);

create table udruga (
	id int not null primary key auto_increment,
	naziv varchar(30) not null,
	osoba int not null,
	sticenik int not null
);

create table osoba(
	id int not null primary key auto_increment,
	ime varchar(20) not null,
	prezime varchar(20) not null,
	udruga int not null
);

create table sticenik (
	id int not null primary key auto_increment,
	osoba int not null,
	vrstaZivotinje varchar(30)
);

create table prostor (
	id int not null primary key auto_increment,
	brojSobe int not null,
	sticenik int not null
);

alter table lokacija add foreign key(udruga) references udruga(id);
alter table osoba add foreign key(udruga) references udruga(id);
alter table sticenik add foreign key(osoba) references osoba(id);
alter table prostor add foreign key(sticenik) references sticenik(id);

insert into udruga(naziv,osoba,sticenik) values
('Udruga za bolesne zivotinje',1,1);
insert into lokacija(naziv,nazivUlice,udruga) values
('Osijek','Ante Starèeviæa',1);
insert into osoba(ime,prezime,udruga) values
('Pero','Periæ',1),('Marko','Mariæ',1),('Anto','Antiæ',1);
insert into sticenik(osoba,vrstaZivotinje) values
(1,'Pas'),(2,'Macka'),(3,'Ptice');
insert into prostor(brojSobe,sticenik) values
(23,1),(45,2),(55,3);

select * from udruga;
select * from lokacija;
select * from osoba;
select * from sticenik;
select * from prostor;


