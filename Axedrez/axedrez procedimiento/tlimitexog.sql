drop trigger if exists tlimitexogp on xoga; 
create or replace function ftlimitexogp() returns trigger language plpgsql as $$

declare
jugadores integer;

begin
select count(codp) into jugadores from xoga where codpa=new.codpa;

    if jugadores=2 then
      raise exception 'insercion rexeitada: a partida xa a xogan dous xogadores ';
    end if;

return new;
end;$$
;
create trigger tlimitexogp before insert on xoga for each row execute procedure ftlimitexogp()

/*
tlimitexog
trigger que impida que unha mesma partida a podan xogar mais de dous xogadores

insert into xoga values('p2','pa1','negras');
insercion rexeitada: a partida xa a xogan dous xogadores 
insert into xoga values('p17','pa16','negras');
insert into xoga values('p9','pa16','brancas');

*/
