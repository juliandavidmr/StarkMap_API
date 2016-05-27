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
INSERT INTO TipoRecursoFisico(Descripcion) VALUES('Restaurante');
insert into tiporecursofisico(descripcion) values('Biblioteca');
INSERT INTO TipoRecursoFisico(Descripcion) VALUES('Auditorio');
INSERT INTO TipoRecursoFisico(Descripcion) VALUES('Baño');
INSERT INTO TipoRecursoFisico(Descripcion) VALUES('Cafeteria');
INSERT INTO TipoRecursoFisico(Descripcion) VALUES('Camara');
INSERT INTO TipoRecursoFisico(Descripcion) VALUES('Entrada');
INSERT INTO TipoRecursoFisico(Descripcion) VALUES('Laboratorio');
INSERT INTO TipoRecursoFisico(Descripcion) VALUES('Oficina');
INSERT INTO TipoRecursoFisico(Descripcion) VALUES('Papeleria');
INSERT INTO TipoRecursoFisico(Descripcion) VALUES('Parqueadero');
INSERT INTO TipoRecursoFisico(Descripcion) VALUES('Recreacion');


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
INSERT INTO Bloque(NumBloque, Descripcion, Posicion, fk_idSede)VALUES(0, 'No corresponde', POINT(1.621460, -75.604481), 2);


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

INSERT INTO RecursoFisico(NombreRecurso, Descripcion, NumPiso, Posicion, fk_idBloque, fk_idTipoRecursoFisico)
  VALUES('Auditorio Angel Cuniberti', 'Centro del auditorio Angel Cuniberti', 1, POINT(1.619660218720021, -75.60426094367959), 10, 6);

INSERT INTO RecursoFisico(NombreRecurso, Descripcion, NumPiso, Posicion, fk_idBloque, fk_idTipoRecursoFisico)
  VALUES('Entrada superior', 'Porton de la entrada superior', 1, POINT(1.621887640798245, -75.60431589036394), 10, 15);

INSERT INTO RecursoFisico(NombreRecurso, Descripcion, NumPiso, Posicion, fk_idBloque, fk_idTipoRecursoFisico)
  VALUES('Entrada principal	', 'Porton principal', 1, POINT(1.620259875341454, -75.6052105107656), 10, 15);

INSERT INTO RecursoFisico(NombreRecurso, Descripcion, NumPiso, Posicion, fk_idBloque, fk_idTipoRecursoFisico)
  VALUES('Laboratorio mecanica', 'Lugar de mecanica', 1, POINT(1.621615150301372, -75.60451621216247), 10, 11);

INSERT INTO RecursoFisico(NombreRecurso, Descripcion, NumPiso, Posicion, fk_idBloque, fk_idTipoRecursoFisico)
  VALUES('Laboratorio mecanica fina', 'Mecanica fina', 1, POINT(1.621479455989567, -75.60470531986475), 1, 11);

INSERT INTO RecursoFisico(NombreRecurso, Descripcion, NumPiso, Posicion, fk_idBloque, fk_idTipoRecursoFisico)
  VALUES('Laboratorio de GIECOM', 'Laboratorio de investigaciones de giecom', 1, POINT(1.620860716042806, -75.60391048477828), 4, 11);

INSERT INTO RecursoFisico(NombreRecurso, Descripcion, NumPiso, Posicion, fk_idBloque, fk_idTipoRecursoFisico)
  VALUES('Laboratorio de fisica y matematica', 'Fisica y matematica', 1, POINT(1.621412693189534, -75.60501232908965), 8, 11);

INSERT INTO RecursoFisico(NombreRecurso, Descripcion, NumPiso, Posicion, fk_idBloque, fk_idTipoRecursoFisico)
  VALUES('Camara de vigilancia', 'Camara de vigilancia, entrada superior', 1, POINT(1.621822599136475, -75.60446785770495), 10, 9);

INSERT INTO RecursoFisico(NombreRecurso, Descripcion, NumPiso, Posicion, fk_idBloque, fk_idTipoRecursoFisico)
  VALUES('Campo de futbol', 'Campo ', 1, POINT(1.620378877816859, -75.60370463645907), 10, 10);

INSERT INTO RecursoFisico(NombreRecurso, Descripcion, NumPiso, Posicion, fk_idBloque, fk_idTipoRecursoFisico)
  VALUES('Cancha de micro futbol', 'Cancha ', 1, POINT(1.619847680181389, -75.60363707040688), 10, 10);

INSERT INTO RecursoFisico(NombreRecurso, Descripcion, NumPiso, Posicion, fk_idBloque, fk_idTipoRecursoFisico)
  VALUES('Concha Acustica', 'Deportes ', 1, POINT(1.619886851333415, -75.60467650027071), 10, 10);

INSERT INTO RecursoFisico(NombreRecurso, Descripcion, NumPiso, Posicion, fk_idBloque, fk_idTipoRecursoFisico)
  VALUES('Cafeteria 1', ' ', 1, POINT(1.620758041454549, -75.60509079727761), 10, 8);

INSERT INTO RecursoFisico(NombreRecurso, Descripcion, NumPiso, Posicion, fk_idBloque, fk_idTipoRecursoFisico)
  VALUES('Cafeteria 2', ' ', 1, POINT(1.620869843463976, -75.6045563490713), 10, 8);

INSERT INTO RecursoFisico(NombreRecurso, Descripcion, NumPiso, Posicion, fk_idBloque, fk_idTipoRecursoFisico)
  VALUES('Cafeteria 3', ' ', 1, POINT(1.620875384053739, -75.60460957000623), 10, 8);

INSERT INTO RecursoFisico(NombreRecurso, Descripcion, NumPiso, Posicion, fk_idBloque, fk_idTipoRecursoFisico)
  VALUES('Cafeteria de Biblioteca', 'Caf. Salida de la Biblioteca', 1, POINT(1.620621619131929, -75.60454020170202), 2, 8);

INSERT INTO RecursoFisico(NombreRecurso, Descripcion, NumPiso, Posicion, fk_idBloque, fk_idTipoRecursoFisico)
  VALUES('Cafeteria el CHE', 'Caf. Che', 2, POINT(1.620621619131929, -75.604213448635), 10, 8);

INSERT INTO RecursoFisico(NombreRecurso, Descripcion, NumPiso, Posicion, fk_idBloque, fk_idTipoRecursoFisico)
  VALUES('Salas de docentes', 'Edificio de sala de profesores', 1, POINT(1.621298062228573, -75.60536910150105), 10, 1);

INSERT INTO RecursoFisico(NombreRecurso, Descripcion, NumPiso, Posicion, fk_idBloque, fk_idTipoRecursoFisico)
  VALUES('Salas de ingles', 'Ingles', 1, POINT(1.621165538097094, -75.60530769827383), 6, 1);

INSERT INTO RecursoFisico(NombreRecurso, Descripcion, NumPiso, Posicion, fk_idBloque, fk_idTipoRecursoFisico)
  VALUES('Salas Carlos Muñoz', '3105', 1, POINT(1.621086631938226, -75.60453252009239), 5, 1);


UPDATE RecursoFisico
  SET Posicion = POINT(1.620621619131929, -75.604213448635)
  WHERE NombreRecurso = 'Cafeteria el CHE';


SELECT rf.*, b.NumBloque, tr.Descripcion as tiporecurso FROM RecursoFisico AS rf
  INNER JOIN Bloque AS b
    ON b.idBloque = rf.fk_idBloque
  INNER JOIN TipoRecursoFisico as tr
    ON tr.idTipoRecursoFisico = rf.fk_idTipoRecursoFisico;

Cafeteria3	-75.60460957000623	1.620875384053739	0
Cafeteria4	-75.60482523566277	1.620880161854013	0

SalaCarlosMuñoz	-75.60453252009239	1.621086631938226	0
SalaCaqueta	-75.60468982903164	1.621087982641954	0
SalaPutumayo	-75.60432918330228	1.620864925699321	0
ParqueaderoAuditorio	-75.60412641614994	1.61985571194881	0
ParqueaderoEntradaSuperior	-75.60473229138736	1.621680414937267	0
ParqueaderoBloque4	-75.60508039759495	1.62105031270933	0
ParqueaderoEntradaPrincipal	-75.60490660655962	1.620277222577338	0
ParqueaderoBloqueAdministrativo	-75.60494747016942	1.620517722613766	0
Biblioteca	-75.60440174569278	1.620380986065444	0
Bloque Administrativo	-75.60505897844571	1.620682257694531	0
Bloque1	-75.60431944522745	1.620660522433779	0
Bloque2	-75.60418749797302	1.620859225530586	0
Bloque3	-75.60443693708122	1.621074838409086	0
Bloque4	-75.6049955438862	1.621186516464349	0
Bloque5	-75.60450203645094	1.621277611681631	0
Bloque6	-75.6049853445246	1.621390252262274	0
Bloque7	-75.60449702816996	1.621441994503853	0
Papeleria1	-75.60510802104386	1.620805491981484	0
FotocopiadoraManigua	-75.60466716772481	1.620874744478496	0
FotocopiadoraAlphaOmega	-75.60470038209509	1.620877063587888	0
Papeleria2	-75.60469054124763	1.620728852667417	0
BañosBloque1	-75.60437986075638	1.620697341703314	0
BañoBloque2	-75.6040908957026	1.620870614189333	0
BañoBloque5	-75.60443603605378	1.621272105876117	0
Baño1Bloque3	-75.60412499755033	1.621050208001877	0
Baño2Bloque3	-75.60440475545207	1.621056125168918	0
OficinasDTI	-75.60427132243197	1.620699429788476	0
CuartoServidores	-75.60441882288968	1.620698385919101	0
OfinaSoporteTecnico	-75.60434194512065	1.620696297291708	0
OficinaEspecializaciones	-75.60421358970142	1.620695679772733	0
OficinaDepartamentoDistancia	-75.60420784594643	1.620650103469956	0
OficinaDesarrollo	-75.60429038184331	1.62065218326368	0
OficinaMaestriaEducacion	-75.60440880928122	1.620659456246129	0
OficinaEmprendimiento	-75.60424605549672	1.620553872687437	0
OficinaIdiomas	-75.60419382692807	1.6205829557429	0
OficinaBienestarUniversitario	-75.60435442063465	1.619760394201772	0
ZonaMedica	-75.60442254341783	1.619573896315772	0





-- -----------------------------------------------------
-- Table PuntosInteres
-- -----------------------------------------------------
CREATE TABLE PuntosInteres (
  idPuntosInteres INT NOT NULL AUTO_INCREMENT,
  Descripcion VARCHAR(45) NULL,
  Longitud FLOAT NULL,
  Latitud FLOAT NULL,
  PRIMARY KEY (idPuntosInteres))
