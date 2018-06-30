--Generar la tabla tablita_1
CREATE TABLE tablita_1(id integer PRIMARY KEY, nombre varchar2(50), edad integer);

--Vamos a generar nuestro trigger
CREATE OR REPLACE TRIGGER Disp_Tablita1 BEFORE INSERT ON tablita_1 FOR EACH ROW
BEGIN
IF:NEW.edad <18 THEN
Raise_application_error(-20001, 'Lo siento eres menor de edad!');
END IF;
END;
/

INSERT INTO tablita_1 VALUES(1,'Juan',23);
SELECT * FROM tablita_1;

INSERT INTO tablita_1 VALUES(2,'Ana',16);


--Caso 2
--Generar la tabla todos
CREATE TABLE todos(id integer PRIMARY KEY, nombre varchar(50), edad integer);
CREATE TABLE mayores(id integer PRIMARY KEY, nombre varchar(50), edad integer);
CREATE TABLE menores(id integer PRIMARY KEY, nombre varchar(50), edad integer);

CREATE OR REPLACE TRIGGER Disp_todos AFTER INSERT ON todos FOR EACH ROW
BEGIN
IF :NEW.edad>18 THEN
INSERT INTO mayores VALUES(:NEW.ID, :NEW.nombre, :NEW.edad);
ELSE
INSERT INTO menores VALUES(:NEW.ID, :NEW.nombre, :NEW.edad);
END IF;
END;
/

INSERT INTO todos VALUES(1, 'Ana', 23);
INSERT INTO todos VALUES(2, 'Juan', 16);
INSERT INTO todos VALUES(3, 'Alex', 11);

SELECT * FROM todos;
SELECT * FROM menores;
SELECT * FROM mayores;