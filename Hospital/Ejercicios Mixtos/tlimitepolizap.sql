/*2) trigger tlimitepolizap
trigger que impida que unha mesma poliza teña mais de 2 asegurados

insert into asegurado values ('p15',3,'agapito','2/3/2000','a1');
    a poliza xa ten dos asegurados, rexeitado o terceiro
insert into asegurado values ('p14',3,'agapito','2/3/2000','a1');
    realizada insercion de novo asegurado
*/
drop trigger if exists tlimitepolizap on asegurado;    
create or replace function ftlimitepolizap() returns trigger language plpgsql as $$

declare
conta integer;

begin
select count(*) into conta from asegurado where codp=new.codp;
    if conta=2 then
    raise exception 'a poliza xa ten dos asegurados, rexeitado o terceiro';
    else 
    raise notice 'realizada insercion de novo asegurado';
    end if;
    
return new;
end; $$
;

create trigger tlimitepolizap before insert on asegurado for each row execute procedure 
ftlimitepolizap()
