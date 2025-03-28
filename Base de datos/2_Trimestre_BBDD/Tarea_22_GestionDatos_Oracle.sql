
CREATE TABLE tarea22_videojuego(
IdVideojuego number Primary key,
nombre varchar2 (30) not null,
tipo varchar2 (20)Check (tipo in('Deportes','Carreras','Lucha','Supervivencia','Rol','Simulacion')),
fechacompra number,
descricion varchar2 (100),
activo varchar2(10)
);
CREATE TABLE tarea22_Plataforma(
IdPlataforma number primary key,
nombre varchar2 (20) not null
);
CREATE TABLE tarea22_usuario(
IdUsuario number primary key,
nickname varchar2 (20) not null,
generoF varchar(20) not null check(generoF in('Deportes','Carreras','Lucha','Supervivencia','Rol','Simulacion')),
email varchar2 (40) not null,
telefono number
);
CREATE TABLE tarea22_partida(
IdPartida NUMBER PRIMARY KEY,
Idvideojuego number,
IdUsuario number,
FOREIGN KEY (Idvideojuego) References tarea22_Videojuego(IdVideojuego),
FOREIGN KEY (IdUsuario) REFERENCES tarea22_Usuario(IdUsuario)
);
CREATE TABLE tarea22_Jugador(
IdJugador NUMBER PRIMARY KEY,
IdPartida number,
IdUsuario number,
FOREIGN KEY (Idpartida) References tarea22_partida(IdPartida),
FOREIGN KEY (IdUsuario) REFERENCES tarea22_Usuario(IdUsuario)
);
INSERT INTO tarea22_videojuego (IdVideojuego, nombre, tipo, fechacompra, descricion, activo)
VALUES (3, 'Forza', 'Simulacion', 2023-02-04, 'Juego de mundo abierto conduccion', 'S');

INSERT INTO tarea22_videojuego (IdVideojuego, nombre, tipo, fechacompra, descricion, activo)
VALUES (2, 'Grand Theft Auto V', 'Simulacion', 2023-02-15, 'Juego de mundo abierto', 'S');

INSERT INTO tarea22_Plataforma (IdPlataforma, nombre)
VALUES (1, 'PlayStation 5');

INSERT INTO tarea22_Plataforma (IdPlataforma, nombre)
VALUES (2, 'Xbox Series X');
INSERT INTO tarea22_usuario (IdUsuario, nickname, generoF, email, telefono)
VALUES (1, 'Jugador1', 'Carreras', 'player1@example.com', 123456789);

INSERT INTO tarea22_usuario (IdUsuario, nickname, generoF, email, telefono)
VALUES (2, 'Jugador2', 'Supervivencia', 'gamer23@example.com', 987654321);

INSERT INTO tarea22_partida (IdPartida, Idvideojuego, IdUsuario)
VALUES (1, 1, 1);

INSERT INTO tarea22_partida (IdPartida, Idvideojuego, IdUsuario)
VALUES (2, 2, 2);

INSERT INTO tarea22_Jugador (IdJugador, IdPartida, IdUsuario)
VALUES (01, 01, 01);

INSERT INTO tarea22_Jugador (IdJugador, IdPartida, IdUsuario)
VALUES (02, 02, 02);

UPDATE tarea22_Plataforma
SET nombre = 'PC'
WHERE IdPlataforma = 1;

UPDATE tarea22_Plataforma
SET nombre = 'Switch'
WHERE IdPlataforma = 2;