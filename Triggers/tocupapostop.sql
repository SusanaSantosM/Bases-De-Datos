/*
EJERCICIO 1: procedimiento tocupapostop
trigger chamado t3_tocupapostop que impida que un xogador poda xogar un partido nun posto (o
posto o seu numero de camiseta) que xa esta ocupado por outro xogador no mesmo partido.
E decir non podo haber mais dun xogador ocupando o mesmo posto( ou o que o mesmo xogando
co mesmo numero de mesma camiseta no mesmo partido)
*/

drop trigger if exists tocupapostop on xoga;
create or replace function ftocupapostop() returns trigger 
language plpgsql as $$

declare
conta integer;

begin
select count(*) into conta from xoga where codpar=new.codpar and posto=new.posto;
  if conta=1 then
  raise exception 'rexeitada insercion, o posto xa esta ocupado neste partido';
  else
  raise notice 'aceptada insercion';
  end if;
return new; 
end; $$
;
create trigger tocupapostop before insert on xoga for each row execute 
procedure ftocupapostop()
