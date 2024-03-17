/*
Procedimiento pzonaclip2 donde dando el nombre de la zona, liste su nif, nombre
y telefono de los clientes

exemplo:
call pzonaclientep2('radio1')

*/

create or replace procedure pzonaclip2(vnomz varchar) language plpgsql as $$

declare
vcodz varchar;
c record;
a integer;
r varchar=''; 

begin
r=r||E'\n';
--solo devuelve un dato por eso se usa into
select codz into STRICT vcodz from zona where nomz=vnomz; 
a=0;
  for c in select nif, nome, telefono from cliente where codz=vcodz loop
    a=1;
    r=r||' NIF '||c.nif||', nombre ' ||c.nome||' ,telf ' ||c.telefono||E'\n';
  end loop;
  
  if a=0 then
   r=r||' zona sin clientes '||E'\n';
  end if;
  
raise notice '%',r; 

exception
when no_data_found then
raise notice 'zona inexistente';

end; $$
