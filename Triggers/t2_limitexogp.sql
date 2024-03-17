/*Trigger que impida que nun mesmo partido xogen mais de 5 xogadores

 insert into xoga values ('x4','p1',4,0); Debe ser rexeitada
 insert into xoga values ('x5','p3',4,0); Debe ser acceptada*/

drop trigger if exists t2_limitexogp on xoga; 

create or replace function ft2_limitexogp() returns trigger language plpgsql as $$

declare

xogamax integer; --variable para gardar numero de xogadores no partido

begin

select count(codx) into xogamax from xoga where codpar=new.codpar;

if xogamax=5 then

raise exception 'O numero de xogadores que xogan no partido % xa esta o maximo (5)',new.codpar;

end if;

return new;

end;$$
;
create trigger t2_limitexogp before insert on xoga for each row execute procedure ft2_limitexogp()
