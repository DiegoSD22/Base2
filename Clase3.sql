--Vamos a invocar primero añ procedimiento de la pelicula
DECLARE 
Valor INTEGER;
BEGIN
Guardar_Pelicula(Valor, 'Dead pool','Esta bien chistosa');
END;
/

SELECT * FROM Pelicula;

--Vamos a invocar primero añ procedimiento de la pelicula
DECLARE 
Valor INTEGER;
BEGIN
Guardar_Pelicula(Valor, 'Jurassic park','Promete ser buena');
END;
/

--Vamos a generar una sala con 10 asientos

BEGIN
guardar_sala(1,1,10);
END;
/
SELECT * FROM Sala;
DELETE FROM Sala WHERE ID_Pelicula =1;


BEGIN
 FOR I IN 1..5 LOOP
  guardar_sala(I, 1, 10);
 END LOOP;
END;
/
SELECT * FROM Sala;

BEGIN
 FOR I IN 6..10 LOOP
  guardar_sala(I, 2, 10);
 END LOOP;
END;
/
SELECT * FROM Sala;

