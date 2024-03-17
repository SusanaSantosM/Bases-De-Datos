drop trigger if exists tmaxstock on stock; 
create or replace function ftmaxstock() returns trigger language plpgsql as $$

declare
contador integer;

begin
select cantidads into contador from stock where cantidads=new.cantidads;

    if new.cantidads > 3 then
    raise notice 'El stock max es de tres unidades', ;
    end if;
    return new;
    
end; $$
; 

create trigger tmaxstock before insert on stock for each row execute 
procedure ftmaxstock()

/*  insert into stock values ();
trigger que impida que se pueda registrar el stock de un medicamento en una farmacia  donde ya hay más de tres unidades en stock (independientemente de su presentacion).

NO TERMINADA
*/
