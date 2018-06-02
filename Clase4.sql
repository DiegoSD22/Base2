--Ejercicio de un cursor de tipo implicito lo usaremos con la tabla pelicula
SET SERVEROUTPUT ON;
DECLARE
 Valor VARCHAR2(50);
 BEGIN
 SELECT Titulo INTO Valor FROM Pelicula WHERE ID_Pelicula=1;
 dbms_output.put_line('El titulo de la pelicula es: ' || Valor);
 END;
 /
 
 --Ahora veremos un cursor explicito con la misma tabla y el ejemplo muy parecido
 
DECLARE
CURSOR CUR_1 IS SELECT * FROM Pelicula;
CURSOR CUR_2 IS SELECT * FROM Pelicula;
BEGIN
  FOR REC IN CUR_1 LOOP
  DBMS_OUTPUT.PUT_LINE('La pelicula es: ' || REC.Titulo);
  END LOOP;
END;
/