CREATE TABLE PriceT (
  no INT NOT NULL PRIMARY KEY,
  price NUMBER
);

insert into PriceT
values (22,9);

select *
from PriceT

SELECT p1.no AS n1, p2.no AS n2 FROM PriceT p1, PriceT p2 
WHERE p1.no<p2.no AND NOT EXISTS 
  (SELECT * FROM PriceT p3 
   WHERE p3.no BETWEEN p1.no AND p2.no
   AND p3.price NOT BETWEEN p1.price AND p2.price) 
AND p2.no-p1.no>3;

SAVEPOINT t1;

ROLLBACK TO t1;
