/*  1) trigger timpidep
trigger que impida que un asegurado de 2da categoria poda rexistrarse tamen como asegurado de 1ª categoría
 
 insert into a1c values('p15',1); --> El campo que usaremos es de la era categoria a1c
   o asegurado xa o e de 2da categoria
 insert into a1c values('p15',2);
   realizada insercion de asegurado de 1ra categoria
*/ 
drop trigger if exists timpidep on a1c;  
create or replace function ftimpidep() returns trigger language plpgsql as $$

declare
conta integer;

begin
select count(*) into conta from a2c where codp=new.codp and numas=new.numas;
    if conta=1 then
        raise exception 'o asegurado xa o e de 2ª categoria';
    else 
        raise notice 'realizada insercion de asegurado de 1ª categoria'; 
    end if;    
    
return new;
end; $$
; 

create trigger timpidep before insert on a1c for each row execute 
procedure ftimpidep()
