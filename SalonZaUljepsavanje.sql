drop database if exists salonzauljepsavanje;
create database salonzauljepsavanje;
use salonzauljepsavanje;

create table radnja (
	id int not null primary key auto_increment,
	naziv varchar(50) not null,
	sef varchar(50) not null
);

create table djelatnica(
	id int not null primary key auto_increment,
	ime varchar(20) not null,
	prezime varchar(20) not null,
	radnja int not null
);

create table korisnik(
	id int not null primary key auto_increment,
	ime varchar(20) not null,
	prezime varchar(20) not null,
	djelatnica int not null
);

create table usluga(
	id int not null primary key auto_increment,
	korisnik int not null,
	vrsta varchar(20) not null,
	cijena decimal(18,2) not null,
	djelatnica int not null
);

alter table djelatnica add foreign key(radnja) references radnja(id);
alter table korisnik add foreign key(djelatnica) references djelatnica(id);
alter table usluga add foreign key(korisnik) references korisnik(id);

insert into radnja(naziv,sef) values
('Cut me','Maro Maric');

insert into djelatnica(radnja,ime,prezime) values
(1,'Mara','maric'),
(1,'iva','ivic'),
(1,'tea','teic');

insert into korisnik(ime,prezime,djelatnica) values
('vedran','alagic',1),
('toni','alagic',2),
('denis','alagic',3);

insert into usluga(korisnik,vrsta,cijena,djelatnica) values
(1,'nokti',100.10,1),
(2,'trepavice',200.00,2),
(3,'sminkanje',300.00,3);

select * from radnja;
select * from djelatnica;
select * from korisnik;
select * from usluga;


