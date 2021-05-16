drop database if exists postolar;
create database postolar;
use postolar;

/*Postolar popravlja obuæu. 
Jedan korisnik može postolaru donijeti 
više komada obuæe na popravak dok jedan 
komad obuæe može biti više puta na popravku. 
Postolar ima šegrta koji sudjeluje u 
odreðenim popravcima obuæe.*/


create table korisnik (
	id int not null primary key auto_increment,
	ime varchar(20),
	prezime varchar(20),
	postolar int,
	obuca int
);

create table popravak (
	id int not null primary key auto_increment,
	postolar int,
	korisnik int,
	obuca int,
	cijena decimal(18,2) not null
);

create table segrt (
	id int not null primary key auto_increment,
	ime varchar(20),
	prezime varchar(20),
	postolar int
);

create table postolar (
	id int not null primary key auto_increment,
	ime varchar(20) not null,
	prezime varchar(20) not null,
	popravak int,
	korisnik int,
	segrt int
);

create table obuca (
	id int not null primary key auto_increment,
	korisnik int,
	postolar int
);

alter table obuca add foreign key (postolar) references postolar(id);
alter table obuca add foreign key(korisnik) references korisnik(id);
alter table popravak add foreign key(obuca) references obuca(id);
alter table segrt add foreign key(postolar) references postolar(id);

insert into postolar(ime,prezime) values
('Jovo','Joviæ');

insert into korisnik(ime,prezime,postolar) values
('Maro','Jokoviæ',1);

insert into obuca(korisnik,postolar) values
(1,1);

insert into popravak(postolar,korisnik,cijena) values
(1,1,2500.00);

insert into segrt(ime,prezime,postolar) values
('Pavo','Paviæ',1);

select * from postolar;
select * from korisnik;
select * from obuca;
select * from popravak;
select * from segrt;



