/*
funcion frepitep que devuelve una palabra tantas veces como se indique por 
parametros
*/
create or replace function frepitep(n int,hola varchar) returns varchar language plpgsql as $$

declare
k varchar;
c int;

begin
c=0; 
k='hola';
for i in 1 .. n loop 
c=c+i;
k=k||hola;


end loop;
return k; 

end; $$
