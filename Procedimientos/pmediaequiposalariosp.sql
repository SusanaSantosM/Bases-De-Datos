/*
procedimiento pmediaequiposalariosp que muestre los codigos y nombres de todos los equipos y para cada uno de ellos los salarios que cobran sus jugadores.

e1 cuspedrinos 2500
e2 gambusinos 1500
...

e5 novo
equipo sen xogadores
*/

create or replace procedure pmediaequiposalariosp() language plpgsql as $$

declare
e record;
r varchar=' '; --r siempre debe inicializarse asi
media integer=0; --la media debe inicializar con 0
conta integer;
begin
for e in select codequ,nomequ from equipo loop
select count(*) into conta from xogador where codequ=e.codequ;

 if conta=0 then 
   r=r||e.codequ|| ' no tienen xogadores '||E'\n';
 else
   select avg(salario) into media from xogador where codequ=e.codequ; 
   if media is null then
     r=r||e.codequ||' este equipo tiene todos los jugadores con salario nulo '||E'\n';
   else
     r=r||E'\t'|| e.codequ|| ' , ' || e.nomequ|| ' , ' ||media||E'\n';
   end if;
 end if;
           
end loop; 
raise notice '%',r;

end; $$



/* 
 select avg(salario) into media from xogador where codequ=e.codequ;
 r=r||E'\t'|| e.codequ|| ' , ' || e.nomequ|| ' , ' ||coalesce(media,0)||E'\n';
*/

/*se puede hacer con un if para excluir un equipo sin jugadores
--coalesce siempre devuelve el 1ro numero no null.

if media is null then
 r=r||e.codequ|| ' no tienen xogadores '||E'\n';
 else
 r=r||E'\t'|| e.codequ|| ' , ' || e.nomequ|| ' , ' ||coalesce(media,0)||E'\n';
 end if;
 
*/

