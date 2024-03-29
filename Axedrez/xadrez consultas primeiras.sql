
1)amosa os nomes dos hoteis que tenhan entre as duas letras  -i- e  -o- en calquera posicion do seu nome 
select nomh from hotel where nomh like '%i%' and nomh like '%o%';

mexico
viveiro


2) amosa numero de salas do hotel mexico
select count(cods) from sala where nomh=(select nomh from hotel where nomh='mexico');

 5
3)de cantos participantes non se conhece o telefono
select count(*) from participante where telfp is null;

 21

4) cal e a capacidade de todas as salas xuntas 
select sum(capacidade) from sala;

 480

5) cantas salas hai 
select count(*) from sala;

 11

6) cantas salas hai con medios 
select count(*) from sala where cods in( select cods from dispon where nomm in( select nomm from medio));

 5

7) que paises non  envian participantes 
select nome from pais where np not in(select np from participante);

italia

8) amosa os codigos e nomes dos participantes que enviou espanha
select codp, nomp from participante where np in(select np from pais where nome='espanha');

p1  ana
p2  pedro
p3  rafael
p4  bieito
p17 angeles

9) amosar nomes de participantes que se aloxaron no hotel 'mexico';
select nomp from participante where codp in(select codp from aloxa where nomh in(select nomh from hotel where nomh='mexico'));

ana
isabel
felipe
laura
angeles
xose
bieito
jana
ainara

10) amosar nomes de hoteis onde se aloxaron participantes que se chamen 'felipe'. (o resultado tamen e correcto se -mexico- aparece  so unha vez)
select nomh from hotel where nomh in(select nomh from aloxa where codp in(select codp from participante where nomp='felipe'));

laias
zurich
mexico
vento

11)amosar hoteis nos que non se aloxa ningun participante
select nomh from hotel where nomh not in(select nomh from aloxa);

viveiro
 
12) amosar os medios de que dispon o hotel -vento- no conxunto de todas as suas salas
select nomm from dispon where cods in(select cods from sala where nomh in(select nomh from hotel where nomh='vento'));

pdixital
son
tv

13) amosar os codigos dos xogadores que xogaron as partidas celebradas o dia 8 do 6 do 2017 
select codp from xogador where codp in(select codp from xoga where codpa in(select codpa from partida where dia='8' and mes='6' and ano='2017'));

p10
p5
p8
p9

14) amosar os codigos e nomes dos participantes cuxa estancia no hotel -mexico- transcurriu entre  o 1/9/201 e o 1/11/2017 ambolos dous dias incluidos
select codp,nomp from participante where codp in(select codp from aloxa where nomh='mexico' and den>='1/9/2017' and dsa<='1/11/2017');

p1  ana
p4  bieito
p5  jana

15)amosar os codigos das salas onde non se xogan partidas  
select cods from sala where cods not in(select cods from partida);

s8
s9
s11
s10

16)amosara cantas partidas se xogan na sala 's1' 
select count(*) from partida where cods ='s1';

	 3

17) amosar cantas partidas se xogaron nas salas nas que se xogaron partidas 
select sala.cods,count(*) from sala,partida where sala.cods=partida.cods GROUP BY sala.cods;

 s3   |     3
 s1   |     3
 s7   |     1
 s2   |     3
 s4   |     3
 s5   |     2
 s6   |     2


18) amosar cantas partidas se xogaron en todas e cada una das salas 
select sala.cods,count(partida.cods) from sala left join partida on sala.cods=partida.cods group by sala.cods;

 s9   |     0
 s8   |     0
 s3   |     3
 s1   |     3
 s10  |     0
 s7   |     1
 s2   |     3
 s4   |     3
 s5   |     2
 s6   |     2
 s11  |     0

19) amosar codigo e nome de xogadores que non se chamen igual que arbitros 
select codp,nomp from participante where codp in(select codp from xogador) and nomp not in(select nomp from participante where codp in(select codp from arbitro));

 codp |  nomp   
------+---------
 p2   | pedro
 p3   | rafael
 p4   | bieito
 p5   | jana
 p6   | xiana
 p8   | xulia
 p9   | ainara
 p10  | isabel
 p12  | manuel
 p14  | laura
 p15  | luisa
 p16  | ramona
 p17  | angeles
 p18  | daniel
 p19  | amelia


