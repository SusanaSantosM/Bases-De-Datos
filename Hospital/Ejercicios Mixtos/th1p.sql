/*3) trigger  th1p 
impedir que se poida hospitalizar a un asegurado de 1ra categoría nun hospital concertado si o médico non está adscrito a mesma area que ten asignada dito hospital concertado. En caso contrario debe levarse a cabo a hospitalizacion.
Se o asegurado ( sempre nos referimos ao de 1ra categoria) se hospitaliza nun hospital propio non se ten en conta a restriccion anterir, e decir a hospitalizacion e immediata). 

insert into hosp1 values('h8','p4',2,'m1','1/1/1970','1/2/1970');
 o medico non está adscrito a mesma area que ten asignada dito hospital concertado
insert into hosp1 values('h5','p4',2,'m1','1/1/1980','1/2/1980');
inserción levada a cabo
insert into hosp1 values('h1','p4',2,'m1','1/1/1970','1/2/1970');
realizada insercion en hospital propio
*/

drop trigger if exists th1p on hops1;    
create or replace function fth1p() returns trigger language plpgsql as $$

declare
conta integer;
contam integer;

begin
select count(*) into conta from a1c where codp=new.codp and numas=new.numas;
select count(*) into contam from medico where codm=new.codm;

    if conta=1 and contam=1 then
    raise exception 'o medico non está adscrito a mesma area que ten asignada dito hospital concertado'; 
    else      
    raise notice 'inserción levada a cabo';
    end if;
    
return new;
end; $$
;

create trigger th1p before insert on hosp1 for each row execute 
procedure fth1p()
