\connect starkmap;


-- -----------------------------------------------------
-- Table Sede
-- -----------------------------------------------------
CREATE TABLE Sede (
  idSede SERIAL NOT NULL PRIMARY KEY,
  NombreSede TEXT NOT NULL,
  Posicion POINT,
  Poligono POLYGON NULL
);

INSERT INTO Sede(NombreSede, Posicion)
  VALUES(
    'Sede Principal',
    POINT(-75.604370, 1.620395)
  );

INSERT INTO Sede(NombreSede, Posicion)
  VALUES(
    'Sede Centro',
    POINT(-75.607444, 1.605944)
  );

INSERT INTO Sede(NombreSede, Posicion)
  VALUES(
    'Granja Experimental Santo Domingo',
    POINT(-75.641583, 1.585333)
  );

INSERT INTO Sede(NombreSede, Posicion)
  VALUES(
    'Sede Social',
    POINT(-75.650528, 1.603111)
  );


-- -----------------------------------------------------
-- Table TipoRecursoFisico
-- -----------------------------------------------------
CREATE TABLE TipoRecursoFisico (
  idTipoRecursoFisico SERIAL NOT NULL PRIMARY KEY,
  Descripcion VARCHAR(45) NULL
);

INSERT INTO TipoRecursoFisico(Descripcion) VALUES('Sala');
INSERT INTO TipoRecursoFisico(Descripcion) VALUES('Laboratorio');
INSERT INTO TipoRecursoFisico(Descripcion) VALUES('Oficina');

SELECT * FROM TipoRecursoFisico;


-- -----------------------------------------------------
-- Table Bloque
-- -----------------------------------------------------
CREATE TABLE Bloque (
  idBloque SERIAL NOT NULL PRIMARY KEY,
  NumBloque INTEGER NOT NULL,
  Descripcion TEXT NULL,
  Poligono VARCHAR(45) NULL,
  Posicion POINT NOT NULL,
  fk_idSede INT NOT NULL,
  CONSTRAINT fk_idSede_Bloque FOREIGN KEY (fk_idSede)
         	REFERENCES Sede (idSede)
);

INSERT INTO Bloque(NumBloque, Descripcion, Posicion, fk_idSede)VALUES(0, 'Bloque Administrativo', POINT(1.620677, -75.605018), 2);
INSERT INTO Bloque(NumBloque, Descripcion, Posicion, fk_idSede)VALUES(1, 'Bloque 1', POINT(1.620668, -75.604318), 2);
INSERT INTO Bloque(NumBloque, Descripcion, Posicion, fk_idSede)VALUES(2, 'Bloque 2', POINT(1.620877, -75.604204), 2);
INSERT INTO Bloque(NumBloque, Descripcion, Posicion, fk_idSede)VALUES(3, 'Bloque 3', POINT(1.621084901650203, -75.60442715596866), 2);
INSERT INTO Bloque(NumBloque, Descripcion, Posicion, fk_idSede)VALUES(4, 'Bloque 4', POINT(1.621208585840284, -75.60500114356291), 2);
INSERT INTO Bloque(NumBloque, Descripcion, Posicion, fk_idSede)VALUES(5, 'Bloque 5', POINT(1.621279931064017, -75.60449909336054), 2);
INSERT INTO Bloque(NumBloque, Descripcion, Posicion, fk_idSede)VALUES(6, 'Bloque 6', POINT(1.621415357336218, -75.60498354818867), 2);
INSERT INTO Bloque(NumBloque, Descripcion, Posicion, fk_idSede)VALUES(7, 'Bloque 7', POINT(1.621460, -75.604481), 2);

/*id,Longitude,Latitude,Elevation
AuditorioAngelCuniberti,-75.6042612858753,1.619762068962234,0
Biblioteca,-75.60440174569278,1.620380986065444,0
Bloque Administrativo,-75.60505897844571,1.620682257694531,0

CanchaFutbol,-75.60370463645907,1.620378877816859,0
ConchaAcustica,-75.60467650027071,1.619886851333415,0
RestauranteChe,-75.604213448635,1.62053937493513,0
*/


SELECT Bloque.*, Sede.NombreSede FROM Bloque
  INNER JOIN Sede
  ON Bloque.fk_idSede = Sede.idSede;


-- -----------------------------------------------------
-- Table Sala
-- -----------------------------------------------------
CREATE TABLE RecursoFisico (
  idRecursoFisico SERIAL NOT NULL PRIMARY KEY,
  NombreRecurso VARCHAR(45) NOT NULL,
  Descripcion VARCHAR(45) NULL,
  NumPiso INTEGER NULL,
  Posicion POINT NOT NULL,
  Poligono POLYGON NULL,
  fk_idBloque INT NOT NULL,
  fk_idTipoRecursoFisico INT NOT NULL,
  CONSTRAINT fk_idBloque_RF FOREIGN KEY (fk_idBloque)
    REFERENCES Bloque (idBloque),
  CONSTRAINT fk_idTipoRecursoFisico_ FOREIGN KEY (fk_idTipoRecursoFisico)
    REFERENCES TipoRecursoFisico (idTipoRecursoFisico)
);

INSERT INTO RecursoFisico(NombreRecurso, Descripcion, NumPiso, Posicion, fk_idBloque, fk_idTipoRecursoFisico)
  VALUES('Sala 1', 'Sala 1 del bloque 7', 2, POINT(1.621446, -75.604745), 1, 1);

SELECT rf.*, b.NumBloque, tr.Descripcion as tiporecurso FROM RecursoFisico AS rf
  INNER JOIN Bloque AS b
    ON b.idBloque = rf.fk_idBloque
  INNER JOIN TipoRecursoFisico as tr
    ON tr.idTipoRecursoFisico = rf.fk_idTipoRecursoFisico;


-- -----------------------------------------------------
-- Table PuntosInteres
-- -----------------------------------------------------
CREATE TABLE PuntosInteres (
  idPuntosInteres INT NOT NULL AUTO_INCREMENT,
  Descripcion VARCHAR(45) NULL,
  Longitud FLOAT NULL,
  Latitud FLOAT NULL,
  PRIMARY KEY (idPuntosInteres))
