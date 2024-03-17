/* 
trigger: tactualizaequipos2p
cada vez que insira un xogador na taboa xogador debe aumentar en 1 o numero de 
xogadores (campo numx) da do seu equipo (taboa equipo)

update xogador set codequ='e4' where codx='x2';
    x3= 2
    e4= 6
*/

drop trigger if exists tactualizaequipos2p on xogador;
create or replace function ftactualizaequipos2p() returns trigger 
language plpgsql as $$

declare

begin
update equipo set numx=numx+1 where codequ=new.codequ; --new.codequ es codequ='e4'
update equipo set numx=numx-1 where codequ=old.codequ; --es el codequ original por eso old
return new; 

end; $$
;

create trigger ttactualizaequipos2p after update of codequ on xogador for each 
row execute procedure ftactualizaequipos2p()


--update of (campo de la fila) --> para hacer el cambio en ese campo
