/*
tfroitas.sql
desenvovler un trigger que impida que un lacteo poda clasificarse tamen como froita
*/

drop trigger if exists tfroitas2p on froitas;
create or replace function ftfroitas2p() returns trigger language plpgsql as $$
 
declare
contal integer;
contac integer;
contaf integer;
begin
 select count(*) into contal from lacteos where codm=new.codm and n=new.n;
 select count(*) into contac from conservas where codm=new.codm and n=new.n;
 select count(*) into contaf from fiambres where codm=new.codm and n=new.n;
  if contal=1 or contac=1 or contaf=1 then
  raise exception 'rexeitada insercion, este produto xa esta en otra tabla';
  else
  raise notice 'aceptada insercion';
  end if;
 return new;
 
end; $$
;

create trigger tfroitas2p before insert on froitas for each row execute 
procedure ftfroitas2p()


