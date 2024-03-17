/* 
trigger: tactualizaequipos3p
cada vez que insira un xogador na taboa xogador debe aumentar en 1 o numero de 
xogadores (campo numx) da do seu equipo (taboa equipo)

delete from xogador where codx='x2';
    e4= 5
*/

drop trigger if exists tactualizaequipos3p on xogador;
create or replace function ftactualizaequipos3p() returns trigger 
language plpgsql as $$

declare

begin
update equipo set numx=numx-1 where codequ=old.codequ; 
return new; 

end; $$
;

create trigger ttactualizaequipos3p after delete on xogador for each 
row execute procedure ftactualizaequipos3p()

--delete se usa para borrar algun dato del campo que hemos insertado

