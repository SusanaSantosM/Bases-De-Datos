/* 
trigger: tactualizaequipos4p
cada vez que insira un xogador na taboa xogador debe aumentar en 1 o numero de 
xogadores (campo numx) da do seu equipo (taboa equipo)

update equipo  set numx=numx+1 where codequ='e3';
*/

drop trigger if exists tactualizaequipos4p on xogador;
create or replace function ftactualizaequipos4p() returns trigger 
language plpgsql as $$

declare

begin
if (TG_OP='INSERT') then  --TRIGGER OPCION
 update equipo  set numx=numx+1 where codequ=new.codequ;
elsif (TG_OP='update') then
 update equipo set numx=numx+1 where codequ=new.codequ; 
 update equipo set numx=numx-1 where codequ=old.codequ;
elsif (TG_OP='DELETE') then
 update equipo set numx=numx-1 where codequ=old.codequ; 
end if;
return null; 

end; $$
;

create trigger ttactualizaequipos4p after insert or delete or update of codequ
 on xogador for each row execute procedure ftactualizaequipos4p()


/*
   update para cambiar un dato de un campo de una tabla 
    update xogador set salario = salario+3 where codx='x1';
    update equipo  set numx=numx+1 where codequ='e3';
*/

