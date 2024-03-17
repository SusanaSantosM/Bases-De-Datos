create or replace function fcomparadousnumerosp(n1 int, n2 int) returns varchar language plpgsql as $$

declare
r varchar(100); /*el 100 es la cantidad de caracteristicas que quieres
                    en este caso es 100 letras, incluye espacios*/

begin
if n1=n2 then
r='  igual que ';
elsif n1>n2 then
r=' mayor que ';
else
r=' menor que ';
end if; /* fin de bucle */

r=n1||r||n2; /* Esto es otra manera de concatenar pero fuera del bucle*/

return r;

end; $$ 

/* $$ es para abrir y cerrar funciones, esto permite crear mas funciones*/

/* || concatena es decir junta y tambien se puede hacer r=n1||' igual que '||n2; 
dentro del bucle*/
