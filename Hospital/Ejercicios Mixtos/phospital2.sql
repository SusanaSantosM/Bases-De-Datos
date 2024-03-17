/*
phospital2
procedemento que amose os nomes de todos os hospitais e para ca un deles os nomes dos medicos que prescribiron  hospitalizacions a asegurados de primeira categoria 
*/
Create or replace procedure phospital2() language plpgsql as $$
declare
r varchar=E'\n';
v record;
h record;
m varchar;

begin
for v in select * from hospital loop
r=r||'Hospitales: '||v.nomh||E'\n'; 
    for h in select codh from hosp1 where codh=v.codh group by codh loop
        select nomm into m from medico where codm in(select codm from hosp1 where codh=h.codh);
        r=r||'Medicos: '||m||E'\n';
    end loop;
end loop;
    
raise notice '%',r;
end;$$


--group by codh loop para no repetir los nombres de los médicos.
--despues de agruparlos en el for tenemos que ajustar el select.
