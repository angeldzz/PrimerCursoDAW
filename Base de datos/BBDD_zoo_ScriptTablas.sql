-- Creamos la tabla especie con id y nombre
create table especie(
    id_especie int(3) PRIMARY KEY,
    nombre_especie varchar(20) NOT NULL
    );

-- Creamos la tabla horario con id y las horas de desayuno, comida y cena
    
create table horario (
    id_horario int(3) PRIMARY KEY,
    horario_desayuno TIME NOT NULL,
    horario_comida TIME NOT NULL,
    horario_cena TIME NOT NULL
    );
    
-- Creamos la tabla recinto con su respectivo id y su nombre.
    
create table recinto (
    id_recinto int(3) PRIMARY KEY ,
    nombre_recinto varchar(30) NOT NULL
    );
    
-- Creamos la tabla oficio con su respectivo id y nombres.

create table oficio(
        id_oficio int(3) PRIMARY KEY,
        nombre_oficio varchar(20) NOT NULL
        );
        
-- Creamos la tabla empleado con su id y los datos nombre, edad, telefono y el id del oficio de cada uno de ellos.
CREATE table empleado(
    id_empleado int(3) PRIMARY KEY,
    nombre_empleado varchar(30) NOT NULL,
    edad_empleado int(3) NOT NULL,
    telefono_empleado int (10) NOT NULL,
    id_oficio int,
    FOREIGN KEY (id_oficio) REFERENCES oficio (id_oficio)
    );
    
-- Creamos la tabla animal con su id, su edad, nombre y sexo de cada uno de ellos, añadiremos también su especie, recinto en el que se encuentra, su horario de comidas y el id de su empleado cuidador.
CREATE TABLE animal (
 	id_animal int(3) PRIMARY KEY,
    edad_animal int(3) NOT NULL,
    nombre_animal varchar(30) NOT NULL,
    sexo_animal varchar(6) CHECK (sexo_animal IN ('macho','hembra')),
    id_especie int,
    id_recinto int,
    id_horario int,
    id_empleado int,
    FOREIGN KEY (id_especie) REFERENCES especie (id_especie),
    FOREIGN KEY (id_recinto) REFERENCES recinto (id_recinto),
    FOREIGN KEY (id_horario) REFERENCES horario (id_horario),
    FOREIGN KEY (id_empleado) REFERENCES empleado (id_empleado)
    );