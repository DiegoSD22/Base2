--Continuación bloque PL-SQL
CREATE TABLE USUARIO_UNITEC(ID_Usuario INTEGER PRIMARY KEY,
Nombre VARCHAR2(40), Edad INTEGER);

DECLARE
Nombre VARCHAR2(40);
Edad INTEGER;
BEGIN
Nombre:='Juan';
Edad:=46;
INSERT INTO usuario_unitec VALUES(1, Nombre, Edad);
END;
/

SELECT * FROM usuario_unitec;

--Estructuras de control y ciclos: caso ciclo For
DECLARE
Nombre VARCHAR2(40);
Edad INTEGER;
BEGIN
Nombre:='Juan';
Edad:=46;
--Se implementa el ciclo FOR
FOR I IN 2..100 LOOP
INSERT INTO usuario_unitec VALUES(I, Nombre, Edad);
END LOOP;
END;
/

SELECT * FROM usuario_unitec;