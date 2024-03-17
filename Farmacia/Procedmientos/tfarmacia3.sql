drop trigger if exists tfarmacia3 on traballan; 
create or replace function ftfarmacia3() returns trigger language plpgsql as $$

declare
trabajadores integer;
v record; 

begin
for v in select * from traballan where codf=new.codf loop
trabajadores=trabajadores+1;
end loop;

if trabajadores > 1 then
    raise notice 'El numero de trabajadores que trabajan en la farmacia % ya esta al máximo', new.codf;
end if;

return new;
end; $$
; 

create trigger tfarmacia3 before insert on traballan for each row execute 
procedure ftfarmacia3()

/*  insert into traballan values (10,'36100');

Trigger que impide que en una misma farmacia trabajen mas de dos personas
*/
