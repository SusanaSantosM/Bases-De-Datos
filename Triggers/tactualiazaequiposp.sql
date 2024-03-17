/* 
trigger: tactualizaequiposp
cada vez que insira un xogador na taboa xogador debe aumentar en 1 o numero de 
xogadores (campo numx) da do seu equipo (taboa equipo)

update equipo  set numx=numx+1 where codequ='e3';
*/

drop trigger if exists tactualizaequiposp on xogador;
create or replace function ftactualizaequiposp() returns trigger 
language plpgsql as $$

declare

begin
update equipo  set numx=numx+1 where codequ=new.codequ;

return new; 
end; $$
;

create trigger ttactualizaequiposp before insert on xogador for each row execute 
procedure ftactualizaequiposp()


/*
   update para cambiar un dato de un campo de una tabla 
    update xogador set salario = salario+3 where codx='x1';
    update equipo  set numx=numx+1 where codequ='e3';
*/

