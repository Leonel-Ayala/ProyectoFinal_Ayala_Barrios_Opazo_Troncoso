-- Triggers para PK
CREATE OR REPLACE TRIGGER LAROATLB_ID_CLIENTE
  BEFORE INSERT 
  ON LAROATLB_CLIENTE
  FOR EACH ROW
DECLARE
BEGIN
  SELECT NVL(MAX(ID_CLIENTE),0)+1 INTO :NEW.ID_CLIENTE
  FROM LAROATLB_CLIENTE;
END;


CREATE OR REPLACE TRIGGER LAROATLB_ID_MASCOTA
  BEFORE INSERT 
  ON LAROATLB_MASCOTA
  FOR EACH ROW
DECLARE
BEGIN
  SELECT NVL(MAX(ID_MASCOTA),0)+1 INTO :NEW.ID_MASCOTA
  FROM LAROATLB_MASCOTA;
END;


CREATE OR REPLACE TRIGGER LAROATLB_ID_CITA
  BEFORE INSERT 
  ON LAROATLB_CITA
  FOR EACH ROW
DECLARE
BEGIN
  SELECT NVL(MAX(ID_CITA),0)+1 INTO :NEW.ID_CITA
  FROM LAROATLB_CITA;
END;


CREATE OR REPLACE TRIGGER LAROATLB_ID_VETERINARIO
  BEFORE INSERT 
  ON LAROATLB_VETERINARIO
  FOR EACH ROW
DECLARE
BEGIN
  SELECT NVL(MAX(ID_VETERINARIO),0)+1 INTO :NEW.ID_VETERINARIO
  FROM LAROATLB_VETERINARIO;
END;

CREATE OR REPLACE TRIGGER LAROATLB_ID_TRATAMIENTO
  BEFORE INSERT 
  ON LAROATLB_TRATAMIENTO
  FOR EACH ROW
DECLARE
BEGIN
  SELECT NVL(MAX(ID_TRATAMIENTO),0)+1 INTO :NEW.ID_TRATAMIENTO
  FROM LAROATLB_TRATAMIENTO;
END;

CREATE OR REPLACE TRIGGER LAROATLB_ID_HISTORIAL_MEDICO
  BEFORE INSERT 
  ON LAROATLB_HISTORIAL_MEDICO
  FOR EACH ROW
DECLARE
BEGIN
  SELECT NVL(MAX(ID_HISTORIAL),0)+1 INTO :NEW.ID_HISTORIAL
  FROM LAROATLB_HISTORIAL_MEDICO;
END;


-- Triggers Mayus
CREATE OR REPLACE TRIGGER LAROATLB_MAYUS_CLIENTE
BEFORE INSERT
ON LAROATLB_CLIENTE
FOR EACH ROW
BEGIN
    :NEW.NOMBRE := UPPER(:NEW.NOMBRE);
    :NEW.APELLIDO1 := UPPER(:NEW.APELLIDO1);
    :NEW.APELLIDO2 := UPPER(:NEW.APELLIDO2);
END;


