drop database if exists taxisluzba;
create database taxisluzba;
use taxisluzba;

create table tvrtka (
	id int not null primary key auto_increment,
	naziv varchar(50) not null,
	vozac int,
	vozila int
);

create table vozilo (
	id int not null primary key auto_increment,
	vozac int,
	putnik int,
	tvrtka int
);

create table vozac (
	id int not null primary key auto_increment,
	ime varchar(20),
	prezime varchar(20),
	putnik int,
	vozilo int
);

create table putnik (
	id int not null primary key auto_increment,
	ime varchar(20),
	prezime varchar(20),
	vozac int,
	voznja int
);

create table voznja (
	id int not null primary key auto_increment,
	vozac int,
	vozilo int,
	putnik int
);

alter table vozilo add foreign key(tvrtka) references tvrtka(id);
alter table vozac add foreign key(vozilo) references vozilo(id);
alter table putnik add foreign key(vozac) references vozac(id);
alter table voznja add foreign key(putnik) references putnik(id);

insert into tvrtka(naziv) values
('Taxi Osijek');

insert into vozilo(vozac,putnik,tvrtka) values
(1,1,1);

insert into vozac(ime,prezime) values
('Pero','Periæ');

insert into putnik(ime,prezime,vozac) values
('Marko','Mariæ',1);

insert into voznja(vozac,vozilo,putnik) values
(1,1,1);

select * from tvrtka;
select * from vozilo;
select * from vozac;
select * from putnik;
select * from voznja;







