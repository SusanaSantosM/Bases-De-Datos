create or replace function fforlooppenteros(n int) returns varchar language plpgsql as $$
/*
devuelve la suma de los numeros enteros
*/

declare
c int;
r varchar;

begin

c=0; 
r='';

/*estructura de un loop*/
for i in 1 .. n loop 

c=c+i; --0+1=1
r=r||i||'+';  -- ''1+=1+  -- 1+2+

end loop; /*fin del loop*/
r = r ||' = '|| c;
return c; 

end; $$

/*siempre se da valor al inicio para el bucle*/
/* i toma valor del numero que se le da*/

