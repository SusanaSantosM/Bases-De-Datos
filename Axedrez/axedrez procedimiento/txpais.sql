drop trigger if exists txpais on pais; 
create or replace function ftxpais() returns trigger language plpgsql as $$

declare
v integer;

begin
select npr into v from pais where npr=new.npr;

    if new.npr>2 then
    raise exception 'rexeita insercion';
    else
    raise notice 'aceptada inserción';
    end if;
return new;

end;$$
;
create trigger txpais before insert on pais for each row execute procedure ftxpais()


/*
trigger txpais que impida que un mesmo pais represente a mais dous paises

insert into pais values ('8','hungria',12,3);
'rexeitada insercion'
insert into pais values ('9','luxemburgo',12,2);
'aceptada insercion'
*/
