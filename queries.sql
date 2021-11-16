create table if not exists kopas(
	id serial constraint pk_kopas primary key,
	selecao varchar(128) unique,
	qnt_copas integer
);

insert into kopas(selecao, qnt_copas) values ('Brasil', 5),
('Alemanha', 5),
('Itália', 4),
('Argentina', 2),
('França', 2),
('Uruguai', 2),
('Inglaterra', 1),
('Espanha', 1),
('Japão', 1);

select selecao, qnt_copas from kopas;

update kopas set qnt_copas = 4 where selecao = 'Alemanha' returning *;
select * from kopas;

delete from kopas where selecao = 'Japão' returning *;
select * from kopas;

alter table kopas add column pts integer;
update kopas set pts = 237 where selecao = 'Brasil';
update kopas set pts = 221 where selecao = 'Alemanha';
update kopas set pts = 156 where selecao = 'Itaĺia';
update kopas set pts = 144 where selecao = 'Argélia';
update kopas set pts = 115 where selecao = 'França';
update kopas set pts = 84 where selecao = 'Uruguai';
update kopas set pts = 108 where selecao = 'Inglaterra';
update kopas set pts = 105 where selecao = 'Espanha';
select * from kopas;


create table if not exists estadios(
	id serial constraint pk_estadios primary key not null unique,
	edicao text,
	ano varchar(4),
	estadio text,
	"local" varchar(128),
	publico_pagante integer
);

insert into estadios(edicao, ano, estadio, "local", publico_pagante) values ('I', 1930, 'Estádio Centenário', 'Montevidéu', 68346), 
('II', 1934, 'Estádio do Partido Nacional Fascista', 'Roma', 55000), 
('III', 1938, 'Estádio Olímpico Yves-du-Manoir', 'Colombes', 45000), 
('IV', 1950, 'Estádio do Maracanã', 'Rio de Janeiro', 173850), 
('V', 1954, 'Estádio Wankdorf', 'Berna', 62500), 
('VI', 1958, 'Estádio Råsunda', 'Solna', 49737), 
('VII', 1962, 'Estádio Nacional do Chile', 'Santiago', 68679), 
('VIII', 1966, 'Estádio de Wembley', 'Londres', 96924), 
('IX', 1970, 'Estádio Azteca', 'Cidade do México', 107412), 
('X', 1974, 'Estádio Olímpico de Munique', 'Munique', 78200), 
('XI', 1978, 'Estádio Monumental de Núñez', 'Buenos Aires', 71483), 
('XII', 1982, 'Estádio Santiago Bernabéu', 'Madrid', 90000), 
('XIII', 1986, 'Estádio Azteca', 'Cidade do México', 114600), 
('XIV', 1990, 'Estádio Olímpico de Roma', 'Roma', 73603), 
('XV', 1994, 'Rose Bowl', 'Pasadena', 94194), 
('XVI', 1998, 'Stade de France', 'Saint-Denis', 80000), 
('XVII', 2002, 'Estádio Internacional de Yokohama', 'Yokohama', 69029), 
('XVIII', 2006, 'Estádio Olímpico de Berlim', 'Berlim', 69000), 
('XIX', 2010, 'Soccer City', 'Joanesburgo', 84490), 
('XX', 2014, 'Estádio do Maracanã', 'Rio de Janeiro', 74738), 
('XXI', 2018, 'Estádio Lujniki', 'Moscou', 78011);


select * from estadios;
select * from estadios where publico_pagante > 100000;
select * from estadios where publico_pagante > 50000 and publico_pagante < 100000;
select * from estadios where estadio like '%y';

alter table estadios alter column ano type integer using ano::integer;
