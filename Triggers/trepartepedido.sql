/*
trepartepedido.sql
impedir que un repartido cargue pedidos que sean de clientes de zonas distintas 
a las que el esta asignado

--insert into carga values ('p3','z1',1,2,'12/2/2024',18);
este pedido no corresponde repartirlo a este repartidor

--insert into carga values ('p3','z2',1,2,'12/2/2024',18);
pedido cargado

dime o codigo da zona da cliente que fixo o pedido 'p13' =
dime o nif do cliente que fixo o pedido 'p13'  (366)     +
averiguar a zona onde vive o cliente do nif anterior (z2)

select codz from cliente where nif in(select nif from pedido where codp='p13');
*/

drop trigger if exists trepartepedido on carga;
create or replace function ftrepartopedido() returns trigger language plpgsql as $$

declare
vcodz varchar;

begin
select codz into vcodz from cliente where nif in(select nif from pedido where codp=new.codp);
--Queremos que codz tenga un nuevo valor que se agreg por ello la variable vcodz
    if vcodz=new.codz then
    raise notice 'pedido cargado';
    else 
    raise exception 'este pedido no corresponde repartirlo a este repartidor';
    end if;
return new;
end; $$
;

create trigger trepartepedido before insert on carga for each row execute 
procedure ftrepartepedido()

/*
--codz,n es el codigo del repartidor
declare 
vnif varchar;
vcodz varchar;
select nif into vnif from pedido  where codp=newcodp;
select codz into vcodz from cliente where nif=vnif;


if vcodz<>new.codz then --si es distinto
raise exception '';
else 
raise notice
*/

