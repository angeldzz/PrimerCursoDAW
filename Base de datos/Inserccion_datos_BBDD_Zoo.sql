-- Inserciones en la tabla especie
INSERT INTO especie (id_especie, nombre_especie) VALUES
(1, 'León'),
(2, 'Tigre'),
(3, 'Oso'),
(4, 'Elefante'),
(5, 'Jirafa'),
(6, 'Cebra'),
(7, 'Hipopótamo'),
(8, 'Cocodrilo'),
(9, 'Panda'),
(10, 'Lobo');

-- Inserciones en la tabla recinto
INSERT INTO recinto (id_recinto, nombre_recinto) VALUES
(1, 'Savannah'),
(2, 'Selva Tropical'),
(3, 'Montañas'),
(4, 'Jungla'),
(5, 'Tundra');

-- Inserciones en la tabla horario (suponiendo horarios específicos)
INSERT INTO horario (id_horario, horario_desayuno, horario_comida, horario_cena) VALUES
(1, '08:00:00', '12:00:00', '18:00:00'),
(2, '07:30:00', '13:00:00', '19:00:00'),
(3, '09:00:00', '14:00:00', '20:00:00'),
(4, '07:00:00', '11:30:00', '17:30:00'),
(5, '08:30:00', '12:30:00', '18:30:00');

-- Inserciones en la tabla oficio
INSERT INTO oficio (id_oficio, nombre_oficio) VALUES
(1, 'Cuidador'),
(2, 'Veterinario'),
(3, 'Biólogo'),
(4, 'Entrenador');

-- Inserciones en la tabla empleado (suponiendo empleados existentes)
INSERT INTO empleado (id_empleado, nombre_empleado, edad_empleado, telefono_empleado, id_oficio) VALUES
(1, 'Juan Pérez', 35, 123456789, 1),
(2, 'María García', 28, 987654321, 2),
(3, 'Pedro López', 42, 555555555, 3),
(4, 'Ana Martínez', 30, 777777777, 4),
(5, 'Luisa Rodríguez', 37, 999999999, 1),
(6, 'Carlos Sánchez', 29, 111111111, 2),
(7, 'Elena Gómez', 45, 333333333, 3),
(8, 'David Fernández', 32, 444444444, 4),
(9, 'Sofía Díaz', 40, 666666666, 1),
(10, 'Jorge Ruiz', 27, 222222222, 2);

-- Inserciones en la tabla animal (con datos lógicos)
INSERT INTO animal (id_animal, edad_animal, nombre_animal, sexo_animal, id_especie, id_recinto, id_horario, id_empleado) VALUES
(1, 5, 'León', 'macho', 1, 1, 1, 1),
(2, 3, 'Tigre', 'hembra', 2, 2, 2, 2),
(3, 2, 'Oso', 'macho', 3, 3, 3, 3),
(4, 4, 'Elefante', 'hembra', 4, 4, 4, 4),
(5, 6, 'Jirafa', 'macho', 5, 5, 5, 5),
(6, 2, 'Cebra', 'hembra', 6, 1, 1, 6),
(7, 8, 'Hipopótamo', 'macho', 7, 2, 2, 7),
(8, 3, 'Cocodrilo', 'hembra', 8, 3, 3, 8),
(9, 5, 'Panda', 'macho', 9, 4, 4, 9),
(10, 4, 'Loba', 'hembra', 10, 5, 5, 10),
(11, 7, 'Leopardo', 'macho', 1, 1, 1, 9),
(12, 3, 'Zorro', 'hembra', 2, 2, 2, 8),
(13, 2, 'Gorila', 'macho', 3, 3, 3, 7),
(14, 4, 'Rinoceronte', 'hembra', 4, 4, 4, 6),
(15, 6, 'Oso Polar', 'macho', 5, 5, 5, 5),
(16, 2, 'Chimpancé', 'hembra', 6, 1, 1, 4),
(17, 8, 'Hiena', 'macho', 7, 2, 2, 3),
(18, 3, 'Tucán', 'hembra', 8, 3, 3, 2),
(19, 5, 'Koala', 'macho', 9, 4, 4, 1),
(20, 4, 'Pingüino', 'hembra', 10, 5, 5, 8);