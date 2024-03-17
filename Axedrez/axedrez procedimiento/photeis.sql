create or replace procedure photeis() language plpgsql as $$

declare
r varchar=E'\n';
h record;
v record;
p record;
i integer; --contador

begin
for h in select * from hotel loop
r=r||E'\n'||'Hotel '||h.nomh||E'\n';
i=0;
    for v in select * from aloxa where nomh=h.nomh loop
    r=r||'Fechas: entrada '||v.den||' salida '||v.dsa||E'\n';
        for p in select * from participante where codp=v.codp loop
        r=r||E'\t'||'Participante '||p.nomp||E'\n';
        i=i+1;
        end loop;
        
    end loop;
    r=r||'Total de participantes '||i||E'\n';
end loop;

raise notice '%', r;
end; $$

/*  call photeis();

procedemento: 
Amosar os nomes de todos os hoteis (0,75p)
e para cada un deles as datas de entrada e saida de aloxamento nos hoteis (0,75p)
e o nome dos participantes que se aloxaron nesas datas (0,5p)
asi como o numero total dos mesmos (0,25)
*/
