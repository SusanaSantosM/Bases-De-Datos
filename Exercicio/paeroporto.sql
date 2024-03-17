create or replace procedure paeroporto(vcodigoa varchar)
language plpgsql as $$

declare
    c record;
    p record;
    l record;
    contador integer;
begin

for c in select codigoa from aeroportos where codigoa = vcodigoa loop
    contador = 0;
    for p in select codigov from escalas where codigoa = c.codigoa loop
        for l in select codigov, datav, horav from voos where codigov = p.codigov loop
        contador = contador + 1;
            raise notice '%, %, %', l.codigov, l.datav, l.horav;
        end loop;
    end loop;
    if contador = 0 then
        raise notice 'aeroporto sen voos con escalas';
    end if;
end loop;

if not found then
    raise notice 'aeroporto inexistente';
end if;

end;
$$