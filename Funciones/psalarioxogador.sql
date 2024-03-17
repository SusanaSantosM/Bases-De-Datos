/*
Crear una funcion psalarioxogador tal que dado o codigo dun xogador imprima o seu
nome e seu salario 
se o codigo do xogador non existe debe imprimirse a mensaxe 'xogador inexistente'


select fsalarioxogador('x1'); 200
select fsalarioxogador('x17'); 'xogador inexistente'

EXTRA:
select fsalarioxogador('x15'); 'Ten salario nulo' */

create or replace procedure psalarioxogador(c varchar) language plpgsql as $$

declare
nom varchar;
s varchar;

begin
select salario into STRICT nom,s from xogador where codx=c;
if s is null then
    raise notice 'o xogador de codigo % e nome % ten salario nulo ',c,nom;
    else
    raise notice 'o xogador de codigo % e nome % ten un salario de %',c,nom,s;
end if;

exception
when no_data_found then
raise notice 'o codigo % e inexistente',c;

/*
if c is not found then
' xogador inexistente ';
else
*/

end; $$
