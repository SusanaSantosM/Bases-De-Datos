/*
procedimiento pcalculamediasalariosequiposp que calcule a media dos salarios de
cada equipo y que actualice el campo 'mediasalarios' en la tabla de equipo
con dichos valores.
*/

create or replace procedure pcalculamediasalariosequiposp() language plpgsql as $$

declare
i record;
r varchar=''; --siempre inicializa la r

begin
--m es un alias de avg(salario)
for i in select codequ, avg(salario) m from xogador group by codequ loop
--r=r||i.codequ || ' , ' || i.m ||E'\n';  NO VISUALIZA NADA
update equipo set mediasalarios=i.m where codequ=i.codequ;
end loop; 
--raise notice '%',r;  PERO SI CREA LOS DATOS EN EL CAMPO MEDIASALARIOS

end; $$



/*
--alter table equipo add mediasalarios integer;
agrega un campo nuevo sin datos pero no se altera el fichero de texto en el script.

--update para subir datos a un campo
--set para poner en un campo
update equipo set mediasalarios=1250 where codequ='e1';
*/

