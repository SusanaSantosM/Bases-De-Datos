create or replace procedure ppaises()
language plpgsql as $$

declare
    c record;
    p record;
    contador integer;
    
begin

for c in select nomep, codigop from paises loop
    contador = 0;
    raise notice 'pais: %', c.nomep;
    for p in select codigop, nomea from aeroportos where codigop = c.codigop loop
    contador = contador + 1;
        raise notice '      %', p.nomea;
    end loop;
    if contador = 0 then
        raise notice '      pais sen aeroportos';
    else
        raise notice '      o numero de aeroportos deste pais e: %', contador;
    end if;
end loop;
end;$$