/*
Crear una funcion fsalarioxogador tal que dado o codigo dun xogador imprima o seu
salario 
se o codigo do xogador non existe debe imprimirse a mensaxe 'xogador inexistente'


select fsalarioxogador('x1'); 200
select fsalarioxogador('x17'); 'xogador inexistente'

EXTRA:
select fsalarioxogador('x15'); 'Ten salario nulo' */

create or replace function fsalarioxogador(c varchar) returns varchar language plpgsql as $$

declare
s varchar;

begin
select salario into STRICT s from xogador where codx=c;
if s is null then
s=' ten salario nulo ';
end if;
return s;

exception
when no_data_found then
return 'codigo inexistente';

/*
if c is not found then
k=' xogador inexistente ';
else
*/

end; $$
