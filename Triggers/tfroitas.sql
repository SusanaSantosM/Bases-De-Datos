/*
tfroitas.sql
desenvovler un trigger que impida que un lacteo poda clasificarse tamen como froita
*/

drop trigger if exists tfroitasp on froitas;
create or replace function ftfroitasp() returns trigger language plpgsql as $$

declare
conta integer;

begin
---new codm, new n.
 select count(*) from lacteos where codm=new.codm and n=new.n;
  if conta=1 then
  raise exception 'rexeitada insercion, este produto xa esta en lacteos';
  else
  raise notice 'aceptada insercion';
  end if;
 return new;
 
end; $$
;

create trigger tfroitasp before insert on froitas for each row execute 
procedure ftfroitasp()

/*
raise exception rompe la excepcion de trigger
*/

