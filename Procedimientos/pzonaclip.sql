/*
Procedimiento pzonaclip que liste codigo y nombre de todas las zonas y para cada una de ellas el nif, nombre, telefono de los clientes que viven en ellas.

Despues hacer:
-Imprimir tambien el numero de clientes de cada zona debajo de listado de los mismos
-Si una zona no tiene clientes imprimir un mensaje 'zona sin clientes'
*/

create or replace procedure pzonaclip() language plpgsql as $$

declare
z record;
c record;
r varchar='';
a integer;
begin
for z in select codz, nomz from zona loop
r=r||z.codz || ' , ' ||z.nomz||E'\n';
  a=0;
  for c in select nif, nome, telefono from cliente where codz=z.codz loop
  a=a+1;
  r=r||' NIF '||c.nif||', nombre ' ||c.nome||' ,telf ' ||c.telefono||E'\n';
  end loop;
  
  if a=0 then
  r=r||' zona sin clientes '||E'\n';
  else
  r=r|| ' total de clientes ' ||a||E'\n';
  end if;
  
 end loop;
 
raise notice '%',r; 

end; $$

