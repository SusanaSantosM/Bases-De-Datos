
 Trigers

 Procedimiento que se dispara (activa) por si mismo (es decir, cuando este detecta una accion, se activara, sin ser intencion del usuario que se active)

 ej: Tenemos una tabla con un trigger asociado a ela, ao intentar realizar una accion (insercion, borrado ou update (modificacion)) na tabla o triger comprobara si cumplimos os requisitos segun o seu codigo, e de non cumplilos rexeitara os cambios

 ------------------------------------------------------------------------
 Procedimiento que se dispara automaticamente cando se intenta insertar, modificar o borrar filas en una tabla
 -----------------------------------------------------------------------


/*
Trigger que impida que un novo xogador cobre mais que o xogador que xa esta cobrando mais de todos os xogadores que xa hai na base

Exemplo de insercion:
insert into xogador values ('x16','luis','e1',3001,10,null);

Trigger que impida que nun mesmo partido xogen mais de 5 xogadores

 insert into xoga values ('x4','p1',4,0); Debe ser rexeitada
 insert into xoga values ('x5','p3',4,0); Debe ser acceptada

drop trigger if exists t2_limitexogp on xoga;

*/
