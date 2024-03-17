create or replace function fcontadorp() returns int language plpgsql as $$

declare
c int;

begin
c=0;
c=c+2; --c=0+2=2
c=c+2; --c=2+2=4
c=c+2; --c=4+2=6

return c;
end; $$
