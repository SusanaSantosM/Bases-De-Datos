/*
funcion fparesp que devuelve la suma de dos n primeros numero pares
*/
create or replace function fparesp(n int) returns varchar language plpgsql as $$


declare
c int;
k int;

begin
c=0; 

for i in 1 .. n loop 
k=2*i;
c=c+k;

end loop;
return c; 

end; $$
