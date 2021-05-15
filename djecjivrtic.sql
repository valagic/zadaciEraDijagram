drop database if exists djecjivrtic;
create database djecjivrtic;
use djecjivrtic;

create table vrtic (
	id int not null primary key auto_increment,
	naziv varchar(50) not null,
	odgajateljica int,
	djeca int,
	skupina int
);

create table djeca (
	id int not null primary key auto_increment,
	ime varchar(20) not null,
	prezime varchar(20) not null,
	skupina int,
	odgajateljica int
);

create table odgajateljica(
	id int not null primary key auto_increment,
	ime varchar(20) not null,
	prezime varchar(20) not null,
	djeca int,
	strucnasprema int
);

create table strucnasprema(
	id int not null primary key auto_increment,
	naziv varchar(50) not null
);

create table skupina (
	id int not null primary key auto_increment,
	odgajateljica int not null,
	djeca int,
	vrtic int,
	naziv varchar(50) not null
);

alter table skupina add foreign key(vrtic) references vrtic(id);
alter table djeca add foreign key(skupina) references skupina(id);
alter table skupina add foreign key(odgajateljica) references odgajateljica(id);
alter table odgajateljica add foreign key(strucnasprema) references strucnasprema(id);

insert into vrtic(naziv) values
('Moj prvi Vrtiæ');

insert into strucnasprema(naziv) values
('Srednja struèna sprema');

insert into odgajateljica(ime,prezime,djeca,strucnasprema) values
('Maja','Mariæ',1,1);

insert into skupina(odgajateljica,djeca,vrtic,naziv) values
(1,1,1,'Moj prvi vrtiæ');

insert into djeca(ime,prezime,skupina,odgajateljica) values
('Pero','Periæ1',1,1),
('Pero','Periæ2',1,1),
('Pero','Periæ3',1,1),
('Pero','Periæ4',1,1),
('Pero','Periæ5',1,1);

select * from vrtic;
select * from odgajateljica;
select * from skupina;
select * from djeca;
select * from strucnasprema;







