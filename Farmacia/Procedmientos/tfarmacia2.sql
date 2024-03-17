drop trigger if exists tfarmacia2 on farmaceuticos;
create or replace function ftfarmacia2() returns trigger language plpgsql as $$

declare
contador integer;

begin
select count(*) into contador from propios where dnip in(select dnip from persoas where dnip=new.dnip);
    
    if contador=1 then
        raise exception 'Este dni ya esta en propios';
    else
        raise notice 'Dni agregado correctamente';
    end if;
        
return new;
end; $$
;

create trigger tfarmacia2 before insert on farmaceuticos for each row execute procedure
ftfarmacia2()

/*  insert into farmaceuticos values ('dnip',codc,ncolexiado);

trigger que impida que una persona sea registrada al mismo tiempo en la tabla FARMACEUTICOS y en la tabla PROPIOS.(PUEDE ESTAR REGISTRADA EN UNA DE LAS TABLAS NO EM ABAS) Antes de nada borrar el script'farmacias.sql' en la linea que pone :insert into farmaceuticos values ('3681',5,134) y volverlo a lanzar.
*/
