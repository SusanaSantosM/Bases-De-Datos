drop trigger if exists tescalas on escalas;

create or replace function ftescalas() returns trigger 
language plpgsql as $$

declare
    n_escalas integer = 0;
begin

select count(*) into n_escalas from escalas where codigov = new.codigov;
    if n_escalas >= 3 then
        raise exception 'escala rexeitada, este voo xa fai escala en tres aeroportos';
    else 
        raise notice 'escala aceptada';
    end if;
return new;
end;$$
;
create trigger tescalas before insert on escalas for each row execute procedure ftescalas()