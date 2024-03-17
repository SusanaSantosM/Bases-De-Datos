/*
funcion fimparesp que devuelve la suma de dos n primeros numero impares
*/
create or replace function fimparesp(n int) returns varchar language plpgsql as $$


declare
c int;
k int;

begin
c=0; 

for i in 1 .. n loop 
k=(2*i)-1;
c=c+k;

end loop;
return c; 

end; $$
