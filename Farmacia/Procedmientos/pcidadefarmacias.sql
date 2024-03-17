create or replace procedure pcidadefarmacias(vcodc integer) language plpgsql as $$

declare
r varchar=E'\n';
d record;
c record;
i integer; --contador para el las farmacias ya que hay mas de 1 en una ciudad

begin
for c in select * from cidades where codc=vcodc loop 
i=0;
    for d in select nomf from farmacias where codc=c.codc loop
    i=1;
    r=r||'La ciudad '||c.nomc||' tiene: '||'Farmacia '||d.nomf||E'\n';
    end loop;
    if i=0 then
      r=r||' ciudad sin farmacias '||E'\n';
    end if;
 end loop;
    
raise notice '%',r;
end; $$

/*  call pcidadefarmacias(6);
procedimiento tal que pasandole el codigo de la ciudad como parametro, me diga los nombres de las farmacias que se encuentran en el.
*/
