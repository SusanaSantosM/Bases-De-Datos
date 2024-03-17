/*
tfroitas.sql
desenvovler un trigger que impida que un lacteo poda clasificarse tamen como froita
*/

drop trigger if exists tlacteosp on lacteos;
create or replace function ftlacteosp() returns trigger language plpgsql as $$

declare
conta integer;

begin
---new codm, new n.
 select count(*) from froitas where codm=new.codm and n=new.n;
  if conta=1 then
  raise exception 'rexeitada insercion, este produto xa esta en lacteos';
  else
  raise notice 'aceptada insercion';
  end if;
 return new;
 
end; $$
;

create trigger tflacteosp before insert on lacteos for each row execute 
procedure ftlacteosp()

/*
raise exception rompe la excepcion de trigger
*/

