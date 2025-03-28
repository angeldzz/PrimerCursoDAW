CREATE TABLE tarea17_Medico (
    codigo_Medico NUMBER PRIMARY KEY,
    Nombre VARCHAR2(50),
    Apellidos VARCHAR2(50)
);

CREATE TABLE tarea17_Paciente (
    codigo_Paciente NUMBER PRIMARY KEY,
    Nombre VARCHAR2(50),
    Apellidos VARCHAR2(50),
);

CREATE TABLE tarea17_Ingreso (
    codigo_Ingreso NUMBER PRIMARY KEY,
    Habitacion VARCHAR2(20),
    Fecha DATE,
    codigo_Medico NUMBER,
    codigo_Paciente NUMBER,
    FOREIGN KEY (codigo_Medico) REFERENCES tarea17_Medico(codigo_Medico),
    FOREIGN KEY (codigo_Paciente) REFERENCES tarea17_Paciente(codigo_Paciente)
);
