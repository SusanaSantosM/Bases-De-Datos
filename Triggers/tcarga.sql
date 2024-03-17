/*
trepartepedido.sql
impedir cargar un pedido realizado en una data distinta a la data de carga

--insert into carga values ('p17','z1',1,2,'14/7/2020',18);
este pedido no puede cargarse en esta data

--insert into carga values ('p17','z1',1,2,'13/7/2020',18);
pedido cargado

select data from pedido where codp in(select codp from pedido where codp='p17');
*/

drop trigger if exists tcarga on carga;
create or replace function ftcarga() returns trigger language plpgsql as $$

declare
vdata date;

begin
select data into vdata from pedido where codp=new.codp;
    if vdata<>new.data then
    raise exception 'este pedido no puede cargarse en esta data';
    else 
    raise notice 'pedido cargado';
    end if;
return new;
end; $$
;

create trigger tcarga before insert on carga for each row execute 
procedure ftcarga()

/*
<> significa distinto de

cuando haces un into se va a meter en unas variables los datos que se crean por ello
el new.dato
*/

