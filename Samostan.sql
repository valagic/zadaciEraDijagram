drop database if exists samostan;
create database samostan;
use samostan;

/*U samostanu se nalaze sve�enici. 
Svaki sve�enik je zadu�en za vi�e poslova. 
Jedan posao u isto vrijeme mo�e obavljati vi�e 
sve�enika. Svaki sve�enik ima samo jednog nadre�enog 
sve�enika. */

create table samostan (
	id int not null primary key auto_increment,
	naziv varchar(50) not null,
	svecenici int,
	posao int
);

create table svecenici (
	id int not null primary key auto_increment,
	ime varchar(20) not null,
	prezime varchar(20) not null,
	samostan int not null,
	posao int 
);

create table nadredeni (
	id int not null primary key auto_increment,
	ime varchar(20) not null,
	prezime varchar(20) not null,
	oib char(11),
	svecenici int
);

create table posao (
	id int not null primary key auto_increment,
	vrijemePosla time,
	svecenici int not null
);

alter table svecenici add foreign key(samostan) references samostan(id);
alter table posao add foreign key(svecenici) references svecenici(id);
alter table svecenici add foreign key(posao) references posao(id);
alter table nadredeni add foreign key(svecenici) references svecenici(id);

insert into samostan(naziv) values
('Samostan');

insert into svecenici(ime,prezime,samostan) values
('Pero','Peri�',1),
('Pero','Peri�2',1),
('Pero','Peri�3',1),
('Pero','Peri�4',1),
('Pero','Peri�5',1),
('Pero','Peri�6',1),
('Pero','Peri�7',1);

insert into nadredeni(ime,prezime) values
('Marko','Mari�');

insert into posao(vrijemePosla,svecenici) values
('08:00:00',1),
('08:00:00',2),
('08:00:00',3),
('08:00:00',4),
('08:00:00',5),
('08:00:00',6),
('08:00:00',7);

select * from samostan;
select * from svecenici;
select * from nadredeni;
select * from posao;
