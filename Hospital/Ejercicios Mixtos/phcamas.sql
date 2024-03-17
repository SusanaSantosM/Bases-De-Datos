/*
phcamas:
procedimento que, pasandolle o numero de camas como parametro, devolte os nomes dos hospitais propios que as superan asi como os nomes dos hospitalizados de 1ra categoria que estiveron neles, e o seu total. Se ningun hospital propio supera o numero de camas a mensaxe debe ser: 'ningun hospital propio supera ese numero de camas'
Si agun dos hospitais non ten hospitalizados de 1ra categoria a mensaxe debe ser : 'hospital sen hospitalizados'.




Ex:
call phcamas(150);
hospital: canalejo
dolores
dolores
o numero de hospitalizados e : 2

hospital: meixoeiro
hospital sen hospitalizados

hospital: paz
andrea
o numero de hospitalizados e : 1
Ex:
call  phcamas(3000);
ningun hospital propio supera ese numero de camas
*/

create or replace procedure phcamas(vnumc integer) language plpgsql as $$

declare
r varchar=E'\n';
c record;
v record;
a varchar;
i integer; --contador para numero de hospitalizados
j integer = 0; -- contador para las camas de los hospitales

begin
--select nomh into c from hospital where codh in(select codh from propios) and numc>vnumc;

for c in select * from hospital where numc>vnumc and codh in(select codh from propio) loop
r=r||'Hospital: '||c.nomh||E'\n';
i=0;
j=1+j;

    for v in select * from hosp1 where codh=c.codh loop
    i=i+1;
    
    select nomas into a from asegurado where codp=v.codp and numas=v.numas;
    r=r||'asegurado: '||a||E'\n';
    end loop;
    
        if i=0 then
        r=r||'hospital sen hospitalizados: '||E'\n';
        else 
        r=r||'o numero de hospitalizados e: '||i||E'\n';
        end if;        
end loop;
    
    if j=0 then
    r=r||'ningun hospital propio supera ese numero de camas'||E'\n';
    end if;
    
raise notice '%',r;
end; $$





