drop trigger if exists tcapacidade on voos;

create or replace function ftcapacidade() returns trigger 
language plpgsql as $$

declare
    n_voos integer;
    n_capacidade integer;
    codigo_orixe varchar;
    codigo_aeroporto varchar;
    codigo_internacional varchar;
    codigo_nacional varchar;
begin

-- cuenta el nº de vuelos con origen metido por consola
select count(*) into n_voos from voos where codigoao = new.codigoao;
-- da el codigo de origen de los vuelos
select codigoao into codigo_orixe from voos where codigoao = new.codigoao;
-- iguala el codigo de origen de los vuelos al codigo del aeropuerto
select codigoa into codigo_aeroporto from aeroportos where codigoa = codigo_orixe;
-- da la capacidad igualando el codigo de los aeropuertos al codigo nacional
select codigoa, capacidade into codigo_nacional, n_capacidade from nacional where codigoa = codigo_aeroporto;

if n_voos = n_capacidade then
    raise exception 'voo rexeitado, superase a capacidade do aeroporto nacional orixen deste voo';
else
    if codigo_nacional = codigo_aeroporto then
        raise notice 'voo aceptado, e un aeroporto nacional pero non se supera a capacidade';
    else
        raise notice 'voo aceptado, o aeroporto non e nacional, non hai nada que controlar';
    end if;
end if;

return new;
end;$$
;
create trigger tcapacidade before insert on voos for each row execute procedure ftcapacidade()