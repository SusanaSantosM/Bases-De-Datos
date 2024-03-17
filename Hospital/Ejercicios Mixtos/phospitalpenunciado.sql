/*
phospitalp
procedimento que, pasandolle o nome dun hospital, imprima os nomes dos asegurados de 1ra categoria que foron hospitalizados nel .
 Se non ten asegurados de primeira categoria hospitalizados debe imprimirse a mensaxe 'este hospital non ten asegurados de 1ra categoria hospitalizados'  
 Se o hospital non existe debe imprimirse a mensaxe adecuada (mediante tratamento de excepcions) .

call phospitalp ('povisa');
andrea
dorotea

call phospitalp ('sonic');
este hospital non ten asegurados de 1ra categoria hospitalizados


execute phospital ('roma');
este hospital non existe
*/

create or replace procedure phospitalp(vnomh varchar) language plpgsql as $$

declare
r varchar =E'\n';
vcodh varchar;
h record;
a varchar;
i integer;--contador que nos sirve para contar los asegurados de los hospitales

begin
select codh into strict vcodh from hospital where nomh=vnomh;
i=0;
    for h in select * from hosp1 where codh=vcodh loop
    i=1;
        select nomas into a from asegurado where codp=h.codp and numas=h.numas;
        r=r||'asegurados: '||a||E'\n';        
    end loop;
 
    if i=0 then
    r=r||'este hospital non ten asegurados de 1ra categoria hospitalizados'||E'\n';
    end if;    
    
raise notice '%',r;

exception 
when no_data_found then
raise notice 'este hospital non existe';

end; $$
