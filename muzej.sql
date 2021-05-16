drop database if exists muzej;
create database muzej;
use muzej;

/*U muzeju postoji više izložaba. 
Jedna izložba ima više djela. 
Svaki kustos je zadužen za jednu izložbu. 
Svaka izložba ima jednog sponzora.*/


create table muzej (
	id int not null primary key auto_increment,
	ime varchar(50) not null
);

create table djela (
	id int not null primary key auto_increment,
	ime varchar(20) not null,
	izlozba int not null
);

create table kustos (
	id int not null primary key auto_increment,
	ime varchar(20) not null,
	prezime varchar(20) not null
);

create table izlozba (
	id int not null primary key auto_increment,
	ime varchar(100) not null,
	sponzor int not null,
	muzej int not null,
	kustos int
);

create table sponzor (
	id int not null primary key auto_increment,
	ime varchar(30) not null,
	prezime varchar(20) not null,
	izlozba int
);

alter table izlozba add foreign key(muzej) references muzej(id);
alter table djela add foreign key(izlozba) references izlozba(id);
alter table izlozba add foreign key(kustos) references kustos(id);
alter table sponzor add foreign key(izlozba) references izlozba(id);

insert into muzej(ime) values
('Novi muzej');

insert into kustos(ime,prezime) values
('Pero','Periæ');

insert into sponzor(ime,prezime) values
('Marko','Mariæ');

insert into izlozba(ime,sponzor,muzej) values
('prva izlozba',1,1),
('druga izlozba',1,1),
('treca izlozba',1,1);

insert into djela(ime,izlozba) values
('prva',1),('druga',2),('treca',3);

select * from muzej;
select * from kustos;
select * from sponzor;
select * from izlozba;
select * from djela;



