create or replace function foperadousnumerosp( operando varchar, n1 int, n2 int) returns numeric(12,2) language plpgsql as $$

declare
 

r numeric(12,2);
begin
if operando='suma' then 
r=n1+n2;
elsif operando='resta' then 
r=n1-n2;
elsif operando='multiplica' then
r=n1*n2;
elsif operando='divide' then
r=n1/n2;
end if;

return r;

end; $$

---select foperadousnumerosp('suma',6,8); para compilarla
---varchar para texto
