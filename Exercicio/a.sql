set datestyle = "ISO, DMY";
set datestyle to DMY, SQL;
show datestyle;
drop table if exists escalas cascade ;
drop table if exists conecta cascade ;
drop table if exists internacional cascade ;
drop table if exists nacional cascade ;
drop table if exists reservas cascade ;
drop table if exists axencias cascade ;
drop table if exists pasaxeiros cascade ;
drop table if exists  voos cascade ;
drop table if exists  aterran cascade ;
drop table if exists  modelos cascade ;
drop table if exists aeroportos cascade ;
drop table if exists paises cascade ; 

create table paises(
codigop varchar(3),
nomep varchar(15) unique,
primary key (codigop)
);
insert into paises values ('p1','portugal');
insert into paises values ('p2','reinounido ');
insert into paises values ('p3','italia ');
insert into paises values ('p4','alemania ');
insert into paises values ('p5','estadosunidos');
insert into paises values ('p6','francia');
insert into paises values ('p7','polonia');
insert into paises values ('p8','espanha');

create table aeroportos(
codigoa varchar(3),
nomea varchar(15) unique,
cidadea varchar(15),
codigop varchar(3),
primary key (codigoa),
foreign key(codigop) references paises(codigop)
);
insert into aeroportos values ('a1','opo','oporto','p1');
insert into aeroportos values ('a2','lis','lisboa','p1');
insert into aeroportos values ('a3','lhr','londres','p2');
insert into aeroportos values ('a4','lgw','londres','p2');
insert into aeroportos values ('a5','ltn','londres','p2');
insert into aeroportos values ('a6','trn','turin','p3');
insert into aeroportos values ('a7','fco','roma','p3');
insert into aeroportos values ('a8','muc','munich','p4');
insert into aeroportos values ('a9','fra','frankfurt','p4');
insert into aeroportos values ('a10','jfk','novayork','p5');
insert into aeroportos values ('a11','ter','teruel','p8');
insert into aeroportos values ('a12','mur','murcia','p8');



create table  modelos(
codigom varchar(10),
capacidadem integer,
primary key (codigom)
);
insert into modelos values ('airbusa380',853);
insert into modelos values ('boeing777',550);
insert into modelos values ('boeing747',524);
insert into modelos values ('airbusa340',295);
insert into modelos values ('airbusa330',440);
insert into modelos values ('ilyushin96',3);

create table aterran (
codigoa varchar(3),
codigom varchar(10),
primary key (codigoa,codigom),
foreign key (codigoa) references aeroportos(codigoa),
foreign key (codigom) references modelos(codigom)
);

insert into aterran values ('a1','boeing777');
insert into aterran values ('a1','airbusa340');
insert into aterran values ('a1','ilyushin96');
insert into aterran values ('a2','boeing777');
insert into aterran values ('a2','airbusa330');
insert into aterran values ('a3','ilyushin96');
insert into aterran values ('a3','boeing777');
insert into aterran values ('a4','airbusa330');
insert into aterran values ('a5','boeing777');
insert into aterran values ('a5','airbusa340');
insert into aterran values ('a9','airbusa340');
insert into aterran values ('a7','airbusa340');

create table voos(
codigov varchar(10),
datav date,
horav integer,
libres integer,
linhaaerea varchar(15),
codigoao varchar(3),
codigoad varchar(3),
codigom  varchar(10),
primary key( codigov),
foreign key (codigoao) references aeroportos(codigoa),
foreign key (codigoad) references aeroportos(codigoa),
foreign key (codigom) references modelos(codigom)
);
insert into voos values ('v1','12/4/2016',16,200,'tap','a1','a3','boeing777');
insert into voos values ('v2','15/5/2016',18,1,'airfrance','a2','a4','airbusa330');
insert into voos values ('v3','17/6/2016',8,3,'ryanair','a1','a3','ilyushin96');
insert into voos values ('v4','19/7/2016',10,2,'tam','a5','a1','airbusa340');
insert into voos values ('v5','21/8/2016',10,2,'delta','a9','a7','airbusa340');

insert into voos values ('v6','21/9/2017',10,2,'tap','a11','a7','airbusa340');
insert into voos values ('v7','20/12/2018',11,20,'delta','a11','a9','airbusa340');
insert into voos values ('v8','12/3/2017',12,20,'tam','a11','a8','airbusa340');
insert into voos values ('v9','14/8/2017',17,12,'delta','a12','a11','airbusa340');
insert into voos values ('v10','2/8/2017',14,22,'airfrance','a12','a1','airbusa340');

create table pasaxeiros(
codigop varchar(3),
n integer,
nome varchar(15),
telf integer, 
dni varchar(9) unique,
primary key (codigop,n),
foreign key (codigop) references paises(codigop)
);
insert into pasaxeiros values ('p1',1,'antia',111,'361');
insert into pasaxeiros values ('p1',2,'xiana',null,'362');
insert into pasaxeiros values ('p1',3,'pedro',333,'363');
insert into pasaxeiros values ('p2',1,'ana',444,'364');
insert into pasaxeiros values ('p2',2,'carlos',555,'365');
insert into pasaxeiros values ('p3',1,'bieito',null,'366');
insert into pasaxeiros values ('p3',2,'ainoa',777,'367');
insert into pasaxeiros values ('p3',3,'xiana',888,'368');

create table axencias(
cif varchar(9),
nomeax  varchar(15),
primary key (cif)
);
insert into axencias values ('c1','lira');
insert into axencias values ('c2','viaxes');
insert into axencias values ('c3','idea');
insert into axencias values ('c4','sonhos');



create table reservas(
codigop varchar(3),
n integer,
codigov varchar(10),
cif varchar(9),
datar date,
nr integer,
primary key (codigop,n,codigov,cif),
foreign key (codigop,n) references pasaxeiros(codigop,n),
foreign key (codigov) references voos(codigov),
foreign key (cif) references axencias(cif)
);

insert into reservas values ('p1',3,'v1','c2','1/3/16',345);
insert into reservas values ('p1',1,'v1','c1','4/3/16',765);
insert into reservas values ('p2',1,'v2','c4','3/3/16',234);
insert into reservas values ('p1',3,'v3','c1','5/3/16',765);
insert into reservas values ('p1',2,'v3','c2','3/3/16',345);
insert into reservas values ('p1',1,'v3','c2','4/3/16',123);


create table nacional(
codigoa varchar(3),
capacidade integer,
extension integer,
primary key (codigoa),
foreign key (codigoa) references aeroportos(codigoa)
);
insert into nacional values ('a11',3,10000);
insert into nacional values ('a12',4,12000);

create table internacional(
codigoa varchar(3),
categoria integer,
primary key (codigoa),
foreign key (codigoa) references aeroportos(codigoa)
);
insert into internacional values ('a2',1);
insert into internacional values ('a3',1);
insert into internacional values ('a1',2);
insert into internacional values ('a4',2);
insert into internacional values ('a5',1);
insert into internacional values ('a6',1);
insert into internacional values ('a9',1);

create table conecta(
codigoa varchar(3),
codigop varchar(3),
foreign key (codigoa) references internacional(codigoa),
foreign key (codigop) references paises(codigop)
);
 
insert into conecta values ('a1','p2');
insert into conecta values ('a2','p2');
insert into conecta values ('a9','p3');

create table escalas(
codigov varchar(10),
codigoa varchar(3),
primary key(codigov,codigoa),
foreign key (codigov) references voos(codigov),
foreign key (codigoa) references aeroportos(codigoa)
);

insert into escalas values ('v1','a4');
insert into escalas values ('v1','a6');
insert into escalas values ('v2','a5');
insert into escalas values ('v2','a7');
insert into escalas values ('v3','a7');



