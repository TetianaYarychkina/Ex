CREATE TABLE StudG(
  GNO number(10) primary key,
  gname number(10) check (gname in ('11', '22', '33'))
);

Drop table StudG

select *
from StudG

create sequence sq1 start with 1 increment by 1 

INSERT INTO StudG
VALUES
(sq1.nextval, null);

select gno, decode(gname, '11', 'G1', '22', 'G2', '33', 'G3', 'Not') as gname
from StudG

select cast(gno as varchar2(20)) 
from StudG 

select gno, gname
from StudG
where gname is null 

select gno, LPAD(gname,6,'Gr: ')
from StudG

select gno, LTRIM(gname, 2)
from StudG

select gno, TRANSLATE(gname,1,'A')
from StudG

select gname
from StudG
order by gname 

