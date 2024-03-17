/*Triger que impida que un novo xogador cobre mais que o xogador que xa esta cobrando mais de todos os xogadores que xa hai na base*/

/*Exemplo de insercion:
insert into xogador values ('x16','luis','e1',3001,10,null);*/


drop trigger if exists t1_salariomaxp on xogador; --borra o trigger si existe

create or replace function ft1_salariomaxp() returns trigger language plpgsql as $$

declare

salariomax integer; --variable para gardar o salario maximo

begin

select max(salario) into salariomax from xogador;

raise notice '%  %' ,salariomax,new.salario; --new.(columna d tabla isertada)

if new.salario>salariomax then

raise exception 'Insercion rexeitada porque o salario do novo xogador e maior do maximo actual'; --"rompe o programa"

end if;

return new;

end;$$
;
create trigger t1_salariomaxp before insert on xogador for each row execute procedure ft1_salariomaxp()  --asocia o trigger e a tabla
