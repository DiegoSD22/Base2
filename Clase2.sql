--Creación de la tabla Pelicula
CREATE TABLE Pelicula(ID_Pelicula INTEGER,
Titulo VARCHAR2(50), Sinopsis VARCHAR2(250),
CONSTRAINT PK_ID_PELICULA PRIMARY KEY (ID_Pelicula) );

--Creación de la tabla Sala
CREATE TABLE Sala(Numero_Sala INTEGER,
ID_Pelicula INTEGER, Numero_Asientos INTEGER,
CONSTRAINT PK_Numero_Sala PRIMARY KEY (Numero_Sala),
CONSTRAINT FK1_ID_Pelicula FOREIGN KEY (ID_Pelicula) REFERENCES Pelicula(ID_Pelicula) );

--Generamos la secuencia que nos incrementará el ID_Pelicula
CREATE SEQUENCE SEC_Pelicula
START WITH 1
INCREMENT BY 1
NOMAXVALUE;

--Generamos un procedimiento almacenado para asociar nuestra secuencia a nuestra tabla Pelicula
CREATE OR REPLACE PROCEDURE Guardar_Pelicula(MY_ID OUT INTEGER, 
MY_Titulo IN VARCHAR2, MY_Sinopsis IN VARCHAR2)
AS
BEGIN
--Inicia la lógica de asociación de la sec de la tabla
SELECT SEC_Pelicula.NEXTVAL INTO MY_ID FROM DUAL;
INSERT INTO Pelicula VALUES(MY_ID, MY_Titulo, MY_Sinopsis);
END;
/

--Procedimiento almacenado para guardar una sala
CREATE OR REPLACE PROCEDURE Guardar_Sala(MY_Num_Sala IN INTEGER,
MY_ID_Pelicula IN INTEGER, MY_Num_Asientos IN INTEGER)
AS
BEGIN
--Validamos el numero de asientos ingresados
IF my_num_asientos > 10 THEN
raise_application_error(-20001, 'No puedes ingresar más de 10 asientos');
ELSE
INSERT INTO Sala VALUES(MY_Num_Sala, MY_ID_Pelicula, MY_Num_Asientos);
END IF;
END;
/