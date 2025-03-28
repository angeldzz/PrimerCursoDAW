-- 1. Trigger para mantener consistencia en la asignación de recintos: Este trigger garantiza 
-- que un recinto no pueda ser eliminado si todavía hay animales asignados a él.
DELIMITER //

CREATE TRIGGER before_delete_recinto
BEFORE DELETE ON recinto
FOR EACH ROW
BEGIN
    DECLARE recinto_count INT;
    SELECT COUNT(*) INTO recinto_count FROM animal WHERE id_recinto = OLD.id_recinto;
    IF recinto_count > 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'No se puede eliminar este recinto porque tiene animales asignados.';
    END IF;
END;
//

DELIMITER ;
-- 2. Trigger para controlar la edad máxima de los animales: Este trigger asegura que 
-- la edad de un animal no pueda exceder un cierto límite.
DELIMITER //

CREATE TRIGGER before_insert_animal
BEFORE INSERT ON animal
FOR EACH ROW
BEGIN
    IF NEW.edad_animal > 100 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'La edad máxima permitida para un animal es de 100 años.';
    END IF;
END;
//

DELIMITER ;
-- 3. Trigger para verificar la disponibilidad del empleado cuidador: Este trigger 
-- garantiza que el empleado asignado como cuidador de un animal no esté asignado a más 
-- de cinco animales.
DELIMITER //

CREATE TRIGGER before_insert_update_animal
BEFORE INSERT ON animal
FOR EACH ROW
BEGIN
    DECLARE empleado_count INT;
    SELECT COUNT(*) INTO empleado_count FROM animal WHERE id_empleado = NEW.id_empleado;
    IF empleado_count >= 5 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El empleado ya está asignado a 5 animales, no se puede asignar más.';
    END IF;
END;
//

DELIMITER ;
