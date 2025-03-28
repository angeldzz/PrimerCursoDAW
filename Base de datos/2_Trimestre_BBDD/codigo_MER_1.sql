CREATE TABLE tarea17_Jugadores (
    Cod_Jugadores NUMBER PRIMARY KEY,
    Venta NUMBER,
    Nombre VARCHAR2(50),
    Apellidos VARCHAR2(50),
    Suspendido CHAR(1),
    Lesionado CHAR(1),
    Cod_Equipo NUMBER,
    FOREIGN KEY (Cod_Equipo) REFERENCES tarea17_Equipos(Cod_Equipo)
);

CREATE TABLE tarea17_Partidos (
    Cod_Partido NUMBER PRIMARY KEY,
    Fech_Partido DATE,
    Goles_visitante NUMBER,
    Goles_casa NUMBER
);

CREATE TABLE tarea17_Equipos (
    Cod_Equipo NUMBER PRIMARY KEY,
    Estadio VARCHAR2(50),
    Ciudad VARCHAR2(50),
    Nombre VARCHAR2(50)
);

CREATE TABLE tarea17_Entrenadores (
    Cod_Entrenador NUMBER PRIMARY KEY,
    Nacionalidad VARCHAR2(50),
    Categoria VARCHAR2(50),
    Fech_Nacimiento DATE,
    Nombre VARCHAR2(50),
    Apellidos VARCHAR2(50),
    Cod_Equipo NUMBER,
    FOREIGN KEY (Cod_Equipo) REFERENCES tarea17_Equipos(Cod_Equipo)
);

CREATE TABLE tarea17_Jugadores_Goles_Partidos (
    Codigo_Gol NUMBER PRIMARY KEY,
    Descripcion VARCHAR2(100),
    Minuto NUMBER,
    Cod_partido NUMBER,
    Cod_Jugadores NUMBER,
    FOREIGN KEY (Cod_partido) REFERENCES tarea17_Partidos(Cod_Partido),
    FOREIGN KEY (Cod_Jugadores) REFERENCES tarea17_Jugadores(Cod_Jugadores)
);

CREATE TABLE tarea17_Equipos_Juegan_Partidos (
    Local_Visitante VARCHAR2(1),
    Cod_Partido NUMBER,
    Cod_Equipo NUMBER,
    FOREIGN KEY (Cod_Partido) REFERENCES tarea17_Partidos(Cod_Partido),
    FOREIGN KEY (Cod_Equipo) REFERENCES tarea17_Equipos(Cod_Equipo)
);
