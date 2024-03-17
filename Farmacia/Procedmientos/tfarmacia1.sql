drop trigger if exists tfarmacia1 on cidades;
create or replace function ftfarmacia1() returns trigger language plpgsql as $$

declare
contador integer;

begin
select count(*) into contador from cidades where codc=new.codc and nomc=new.nomc;

    if contador=1 then
    raise exception 'Esta ciudad ya esta registrada';
    else
    raise notice 'Ciudad registrada correctamente';
    end if;

return new;
end; $$
;
create trigger tfarmacia1 before insert on cidades for each row execute procedure ftfarmacia1()

/*  insert into cidades values (7,'paxon');
trigger que impida registrar dos ciudades con mismo nombre
*/
