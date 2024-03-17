create or replace procedure ppais(vnome varchar) language plpgsql as $$
declare
r varchar=E'\n';
p record;
n integer;
i integer; --contador de participantes
--STRICT / EXCEPTION es para los paises

begin
select * into STRICT n from pais where nome=vnome;
i=0;
    for p in select * from participante where np=n loop
    r=r||'participante '||p.nomp||E'\n';
    i=i+1;
    end loop;
    
    if i=0 then
    r=r||'Este pais no tiene participantes registrados'||E'\n';
    else
    r=r||'Total de participantes '||i||E'\n';
    end if;
        
raise notice '%', r;

EXCEPTION
    when no_data_found then
    raise exception 'No existe ese pais';

end; $$


/**     call ppais('francia');
procedemento ppais
tal que dado o nome dun pais 1	
amosar o nome dos participantes de dito pais 0,5	
asi como o numero total dos mesmos. 0,5	

se un pais non ten participantes debe amosarse a mensaxe 'pais sen participantes rexistrados'   0,25	
se un pais non existe debe amosarse a mensaxe 'pais inexistente'



call ppais('holanda');
ainara
isabel
felipe
manuel
amelia
total:5

 execute ppais('italia');
pais sen participante rexistrados

 execute ppais('belxica');
pais inexistente


**/
