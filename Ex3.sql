
CREATE TYPE Stud_type AS OBJECT (
  sName varchar2(10),
  sMark NUMBER
); 

CREATE OR REPLACE PACKAGE Sorting IS
   PROCEDURE getArr(av in dbms_sql.Number_Table);
   FUNCTION Viv(av in dbms_sql.Number_Table) RETURN dbms_sql.Number_Table;
   PROCEDURE BubbleSort(av in dbms_sql.Number_Table);
   PROCEDURE GnomeSort(av in dbms_sql.Number_Table);
   PROCEDURE InsertionSort(av in dbms_sql.Number_Table);
   PROCEDURE CocktailSort(av in dbms_sql.Number_Table);
  -- FUNCTION Viv(av in dbms_sql.Number_Table) RETURN dbms_sql.Number_Table;
END Sorting;

CREATE OR REPLACE PACKAGE BODY Sorting AS
--����� �������
       PROCEDURE getArr(av in dbms_sql.Number_Table)
              IS
       av1 dbms_sql.Number_Table:=av;
       ind pls_integer;
       BEGIN
                 ind:=av1.FIRST;
                -- FOR k IN av1.FIRST..av1.LAST LOOP
                     WHILE (ind IS NOT NULL) LOOP
                    -- DBMS_OUTPUT.put_line(ind);
                     DBMS_OUTPUT.put_line('av('||IND||')=' || av1(IND));
                     ind:=av1.next(ind);
                 END LOOP;
                 --END LOOP;
       END getArr;
       
--����� ��� ���� ������ 
        FUNCTION Viv(av in dbms_sql.Number_Table)
        RETURN dbms_sql.Number_Table
       IS
       av1 dbms_sql.Number_Table:=av;
       res dbms_sql.Number_Table;
       ex int;
       ind pls_integer;
       i pls_integer:=1;
       BEGIN
         ind:=av1.FIRST;
       WHILE (ind IS NOT NULL) LOOP
         res(i):=av1(ind);
         ind:=av1.next(ind);
         i:=i+1;
       END LOOP;
         --getArr1(res);
       RETURN res;   
       END Viv;
-- BubbleSort
       PROCEDURE BubbleSort(av in dbms_sql.Number_Table)
       IS
       av2 dbms_sql.Number_Table:=av;
       av1 dbms_sql.Number_Table;
       ex int;
       ind pls_integer;
       BEGIN
         av1:=Viv(av2);
        FOR i IN (av1.FIRST)..(av1.LAST) LOOP
            FOR j IN  (av1.FIRST)..(av1.LAST - i) LOOP
                IF av1(j)>av1(j+1) THEN 
                    ex:=av1(j);
                    av1(j):= av1(j+1);
                    av1(j+1):=ex;
                END IF;
            END LOOP;
            END LOOP;
         getArr(av1);
       END BubbleSort;
-- GnomeSort
       PROCEDURE GnomeSort(av in dbms_sql.Number_Table)
       IS
       av2 dbms_sql.Number_Table:=av;
       av1 dbms_sql.Number_Table;
       ex int;
       i int;
       BEGIN
         av1:=Viv(av2);
         i:=av1.first;
         WHILE(i<=av1.COUNT) LOOP
                    IF (i=1 OR av1(i-1)<=av1(i)) THEN 
                       i:=i+1;
                    ELSE
                      ex:=av1(i);
                      av1(i):=av1(i-1);
                      av1(i-1):=ex;
                      i:=i-1;
                    END IF;
         END LOOP;
         getArr(av1);
       END GnomeSort;
--InsertionSort       
       PROCEDURE InsertionSort(av in dbms_sql.Number_Table)
       IS
       av2 dbms_sql.Number_Table:=av;
       av1 dbms_sql.Number_Table;
       ex int;
       j int;
       BEGIN
         av1:=Viv(av2);
        FOR i IN 2..av1.COUNT LOOP
            ex:=av1(i);
            j:=i-1;
            WHILE (j>=1 AND av1(j)>ex) LOOP
                  av1(j+1):=av1(j);
                  j:=j-1;
            END LOOP;
            av1(j+1):= ex;
        END LOOP;
        getArr(av1);
       END InsertionSort;
--CocktailSort       
       PROCEDURE CocktailSort(av in dbms_sql.Number_Table)
       IS
       av2 dbms_sql.Number_Table:=av;
       av1 dbms_sql.Number_Table;
       ex int;
       l int:=0;
       r int;
       BEGIN
         av1:=Viv(av2);
        r:=av1.count;
        WHILE (l<=r) LOOP
              FOR i IN 1..av1.count LOOP
                  EXIT WHEN i=av1.count;
                  IF av1(i)>av1(i+1) THEN 
                     ex:=av1(i);
                     av1(i):=av1(i+1);
                     av1(i+1):=ex;
                  END IF;
              END LOOP;
              r:=r-1;
              FOR i IN REVERSE 1..av1.count LOOP
                  EXIT WHEN i=1;
                  IF av1(i)<av1(i-1) THEN 
                     ex:=av1(i);
                     av1(i):=av1(i-1);
                     av1(i-1):=ex;
                  END IF;
              END LOOP;
              l:=l+1;
        END LOOP;
        getArr(av1);
       END CocktailSort;
       
END Sorting;


--
CREATE OR REPLACE TYPE ArrT IS TABLE OF NUMBER 
INDEX BY PLS_INTEGER;

CREATE OR REPLACE PROCEDURE getArr1(av in dbms_sql.Number_Table)
       IS
       av1 dbms_sql.Number_Table:=av;
       ind pls_integer;
       BEGIN
                 ind:=av1.FIRST;
                -- FOR k IN av1.FIRST..av1.LAST LOOP
                     WHILE (ind IS NOT NULL) LOOP
                    -- DBMS_OUTPUT.put_line(ind);
                     DBMS_OUTPUT.put_line('av('||IND||')=' || av1(IND));
                     ind:=av1.next(ind);
                 END LOOP;
                 --END LOOP;
END getArr1;
-- BubbleSort
CREATE OR REPLACE FUNCTION Viv1(av in dbms_sql.Number_Table)
RETURN dbms_sql.Number_Table
       IS
       av1 dbms_sql.Number_Table:=av;
       res dbms_sql.Number_Table;
       ex int;
       ind pls_integer;
       i pls_integer:=1;
       BEGIN
         ind:=av1.FIRST;
       WHILE (ind IS NOT NULL) LOOP
         res(i):=av1(ind);
         ind:=av1.next(ind);
         i:=i+1;
       END LOOP;
         --getArr1(res);
       RETURN res;   
END Viv1;

CREATE OR REPLACE PROCEDURE BubbleSort1(av in dbms_sql.Number_Table)
       IS
       av2 dbms_sql.Number_Table:=av;
       av1 dbms_sql.Number_Table;
       ex int;
       ind pls_integer;
       BEGIN
         av1:=Viv1(av2);
        FOR i IN (av1.FIRST)..(av1.LAST) LOOP
            FOR j IN  (av1.FIRST)..(av1.LAST - i) LOOP
                IF av1(j)>av1(j+1) THEN 
                    ex:=av1(j);
                    av1(j):= av1(j+1);
                    av1(j+1):=ex;
                END IF;
            END LOOP;
            END LOOP;
         getArr1(av1);
       END BubbleSort1;

DROP PROCEDURE getArr1;
DROP PROCEDURE BubbleSort1;
DROP PROCEDURE Viv1;

--

DECLARE
  --av1 Arr := Arr(5,4,2,8,7,3,1,0,9);
  av1 dbms_sql.Number_Table;
  av2 dbms_sql.Number_Table;
  ex int;
  ind pls_integer:=1;
BEGIN
  
  av1(1):=3;  av1(2):=5;  av1(4):=7;  av1(3):=67;  av1(100):=300;  av1(7):=-3;  av1(200):=35;  


  --getArr1(av1);
  --av2:=Viv(av1);
 -- getArr1(av2);
    DBMS_OUTPUT.put_line('BubbleSort');
    Sorting.BubbleSort(av1);
    DBMS_OUTPUT.put_line('GnomeSort');
    Sorting.GnomeSort(av1);
    DBMS_OUTPUT.put_line('InsertionSort');
    Sorting.InsertionSort(av1);
    DBMS_OUTPUT.put_line('CocktailSort');
    Sorting.CocktailSort(av1);
EXCEPTION
WHEN NO_DATA_FOUND THEN 
  DBMS_OUTPUT.put_line('��� � ����!');
--WHEN OTHERS THEN
  --DBMS_OUTPUT.put_line('���-�� �� ���!');
END;

--BubbleSort
--1
DECLARE
  av Arr := Arr(5,5,4,2,8);
  ex int;
BEGIN
  FOR i IN 1..(av.COUNT) LOOP
    FOR j IN  1..(av.COUNT - i) LOOP
        IF av(j)>av(j+1) THEN 
          ex:=av(j);
          av(j):= av(j+1);
          av(j+1):=ex;
          END IF;
      END LOOP;
  END LOOP;
  FOR i IN 1..av.COUNT LOOP
     DBMS_OUTPUT.put_line('av('||i||')=' || av(i));
  END LOOP;
END;
--2
DECLARE
  av Arr := Arr(6,6,5,6,4,6,0);
  ex int;
BEGIN
  FOR i IN REVERSE 1..(av.COUNT) LOOP
    FOR j IN  REVERSE 1..(av.COUNT - i) LOOP
        IF av(j)<av(j+1) THEN 
          ex:=av(j);
          av(j):= av(j+1);
          av(j+1):=ex;
          END IF;
      END LOOP;
  END LOOP;
  FOR i IN 1..av.COUNT LOOP
     DBMS_OUTPUT.put_line('av('||i||')=' || av(i));
  END LOOP;
END;

--GnomeSort

DECLARE
  av Arr := Arr(3,5,7,67,300,-3,35);
  ex int;
  i int :=1;
BEGIN
  WHILE(i<=av.COUNT) LOOP
                    IF (i=1 OR av(i-1)<=av(i)) THEN 
                       i:=i+1;
                    ELSE
                      ex:=av(i);
                      av(i):=av(i-1);
                      av(i-1):=ex;
                      i:=i-1;
                    END IF;
  END LOOP;
  FOR k IN 1..av.COUNT LOOP
     DBMS_OUTPUT.put_line('av('||k||')=' || av(k));
  END LOOP;
END;

--InsertionSort

DECLARE
  av Arr := Arr(5,4,2,8);
  ex int;
  j int;
BEGIN
  FOR i IN 2..av.COUNT LOOP
    ex:=av(i);
    j:=i-1;
    WHILE (j>=1 AND av(j)>ex) LOOP
      av(j+1):=av(j);
      j:=j-1;
    END LOOP;
    av(j+1):= ex;
  END LOOP;
  FOR k IN 1..av.COUNT LOOP
     DBMS_OUTPUT.put_line('av('||k||')=' || av(k));
  END LOOP;
END;

--CocktailSort

DECLARE
  av Arr := Arr(5,4,2,8,7,2);
  ex int;
  l int:=0;
  r int;
BEGIN
  r:=av.count;
  WHILE (l<=r) LOOP
    FOR i IN 1..av.count LOOP
      EXIT WHEN i=av.count;
      IF av(i)>av(i+1) THEN 
        ex:=av(i);
        av(i):=av(i+1);
        av(i+1):=ex;
      END IF;
    END LOOP;
    r:=r-1;
    FOR i IN REVERSE 1..av.count LOOP
      EXIT WHEN i=1;
      IF av(i)<av(i-1) THEN 
        ex:=av(i);
        av(i):=av(i-1);
        av(i-1):=ex;
      END IF;
    END LOOP;
    l:=l+1;
  END LOOP;
  FOR k IN 1..av.COUNT LOOP
     DBMS_OUTPUT.put_line('av('||k||')=' || av(k));
  END LOOP;
END;

--
CREATE OR REPLACE PROCEDURE getArr(av in Arr)
IS
BEGIN
FOR k IN 1..av.COUNT LOOP
     DBMS_OUTPUT.put_line('av('||k||')=' || av(k));
  END LOOP;
END getArr;

--
CREATE OR REPLACE PROCEDURE GnomeSort(av in Arr)
  IS
  av1 Arr:=av;
  ex int;
  i int :=1;
  BEGIN
    WHILE(i<av1.COUNT) LOOP
                    IF (i=1 OR av1(i-1)<=av1(i)) THEN 
                       i:=i+1;
                    ELSE
                      ex:=av1(i);
                      av1(i):=av1(i-1);
                      av1(i-1):=ex;
                      i:=i-1;
                    END IF;
  END LOOP;
  getArr(av1);
  END GnomeSort;

--
DROP PROCEDURE GnomeSort;
DROP PROCEDURE getArr;

DECLARE
  av1 Arr := Arr(5,4,2,8,7,3,1,0,9);
BEGIN
  GnomeSort(av1);
END;

--

DECLARE
  av Arr := Arr(5,4,2,8,0);
  --av Arr := Arr(4,3,2,1,5);
  c Arr := Arr(0,0,0,0,0);
  m int;
  i int;
  j int;
  k int;
  h int;
  step int;
BEGIN
  m:=av.count/2;
  h:=1;
  DBMS_OUTPUT.put_line(mod(m,2));
  IF mod(m,2)=1 THEN
     m:=m-1;
  END IF;
  
    WHILE (h<av.count) LOOP
    --FOR f IN 1..4 LOOP
    step:=h;
    j:=m;
    i:=1;
    k:=1;
    
        WHILE (step<=m) LOOP
          
              WHILE ((i<step) AND (j<av.count) AND (j<(m+step))) LOOP
                IF av(i)<av(j) THEN
                  c(k):= av(i);
                  i:=i+1;
                  k:=k+1;
                  --DBMS_OUTPUT.put_line(c(k));
                ELSE 
                  c(k):=av(j);
                  j:= j+1;
                  k:=k+1;
                  --DBMS_OUTPUT.put_line(c(k));
                END IF;
              END LOOP;
              
              WHILE (i<step) LOOP
                c(k):= av(i);
                  i:=i+1;
                  k:=k+1;
                  --DBMS_OUTPUT.put_line(c(k));
              END LOOP;
              
              WHILE (i>step) LOOP
                c(k):=av(j);
                  j:= j+1;
                  k:=k+1;
                  --DBMS_OUTPUT.put_line(c(k));
              END LOOP;
              
              WHILE ((j<(m+step))AND (j<av.count)) LOOP
                c(k):=av(j);
                j:=j+1;
                k:=k+1;
                --DBMS_OUTPUT.put_line(c(k));
              END LOOP;
              
              step := step+h;
        END LOOP;
        h:=h*2;
        FOR z in 1..av.count LOOP
          --EXIT WHEN z=av.count; 
          av(z):=c(z);
        END LOOP; 
  END LOOP;
  
  FOR r IN 1..c.COUNT LOOP
    DBMS_OUTPUT.put_line('av('||r||')=' || c(r));
  END LOOP;
END;*/

--

CREATE OR REPLACE FUNCTION FACTORIAL(NUM IN NUMBER) RETURN NUMBER
IS

BEGIN

IF (NUM <=1) THEN
 RETURN (NUM);
ELSE
 RETURN (NUM * FACTORIAL(NUM-1));

END IF;

END FACTORIAL;


DECLARE
  c int;
  
  
BEGIN
    DBMS_OUTPUT.put_line(FACTORIAL(3));
END;

--

CREATE TABLE emp (
  sNo INT NOT NULL PRIMARY KEY,
  sSalary NUMBER(10,2)
);

CREATE SEQUENCE s1 START WITH 1 INCREMENT BY 1;



insert into emp
values (s1.NEXTVAL,6000);

SELECT *
FROM emp

CREATE OR REPLACE FUNCTION getSalary (nNo IN NUMBER)
RETURN NUMBER 
IS 
Salary NUMBER(10,2);
BEGIN 
  SELECT sSalary INTO Salary 
  FROM emp
  WHERE sNo=nNo;
  RETURN sSalary;
END;

DECLARE 
  nNo NUMBER:=2;
  Salary NUMBER(10,2);
BEGIN 
  SELECT sSalary INTO Salary 
  FROM emp
  WHERE sNo=nNo;
  DBMS_OUTPUT.put_line(Salary);
END;


CREATE OR REPLACE TRIGGER s_trigger
BEFORE
INSERT OR UPDATE OF sSalary ON emp
FOR EACH ROW
BEGIN
   DBMS_OUTPUT.put_line('���-�� ���������� � ������� emp!! ��� ������:'||USER);
END;

CREATE OR REPLACE PROCEDURE setSalary (nSal IN NUMBER)
IS 
BEGIN 
  insert into emp
  values (s1.NEXTVAL,nSal);
END;

BEGIN
  setSalary(4000.2);
END;
