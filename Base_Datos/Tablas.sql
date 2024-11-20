CREATE TABLE LAROATLB_USUARIOS(
  ID_USUARIO NUMBER,
  NOMBRE_USUARIO VARCHAR(50),
  ROL_USUARIO NUMBER,
  CONTRA_USUARIO VARCHAR2(100),
  CONSTRAINT PK_LAROATLB_USUARIO PRIMARY KEY(ID_USUARIO)
  );
CREATE TABLE LAROATLB_SECRETARIA(
  ID_SECRE NUMBER,
  NOMBRE VARCHAR2(80),
  APELLIDO1 VARCHAR2(30),
  APELLIDO2 VARCHAR2(30),
  TELEFONO NUMBER,
  EMAIL VARCHAR2(80),
  CONSTRAINT PK_LAROATLB_SECRETARIA PRIMARY KEY(ID_SECRE)
  );

CREATE TABLE LAROATLB_REGION_CLIENTE (
  ID_REGION NUMBER,
  NOMBRE_REGION VARCHAR2(50),
  CONSTRAINT PK_LAROATLB_REGION_CLIENTE PRIMARY KEY(ID_REGION)
);

CREATE TABLE LAROATLB_CLIENTE (
  ID_CLIENTE NUMBER,
  RUT NUMBER,
  NOMBRE VARCHAR2(80),
  APELLIDO1 VARCHAR2(30),
  APELLIDO2 VARCHAR2(30),
  TELEFONO NUMBER,
  ID_REGION NUMBER,
  CONSTRAINT PK_LAROATLB_CLIENTE PRIMARY KEY(ID_CLIENTE),
  CONSTRAINT FK_LAROATLB_CLIENTE_REGION FOREIGN KEY(ID_REGION) REFERENCES LAROATLB_REGION_CLIENTE(ID_REGION)
);

CREATE TABLE LAROATLB_COMUNA_CLIENTE (
  ID_COMUNA NUMBER,
  NOMBRE_COMUNA VARCHAR2(50),
  ID_REGION NUMBER,
  CONSTRAINT PK_LAROATLB_COMUNA_CLIENTE PRIMARY KEY(ID_COMUNA)
);

CREATE TABLE LAROATLB_CALLE_CLIENTE (
  ID_CALLE NUMBER,
  NOMBRE_CALLE VARCHAR2(50),
  NUMERO_CALLE NUMBER,
  ID_COMUNA NUMBER,
  CONSTRAINT PK_LAROATLB_CALLE_CLIENTE PRIMARY KEY(ID_CALLE),
  CONSTRAINT FK_LAROATLB_CALLE_COMUNA FOREIGN KEY(ID_COMUNA) REFERENCES LAROATLB_COMUNA_CLIENTE(ID_COMUNA)
);

CREATE TABLE LAROATLB_MASCOTA (
  ID_MASCOTA NUMBER,
  NOMBRE VARCHAR2(80),
  EDAD NUMBER,
  ID_CLIENTE NUMBER,
  ID_RAZA NUMBER,
  CONSTRAINT PK_LAROATLB_MASCOTA PRIMARY KEY(ID_MASCOTA),
  CONSTRAINT FK_LAROATLB_MASCOTA_CLIENTE FOREIGN KEY(ID_CLIENTE) REFERENCES LAROATLB_CLIENTE(ID_CLIENTE),
  CONSTRAINT FK_LAROATLB_MASCOTA_RAZA FOREIGN KEY(ID_RAZA) REFERENCES LAROATLB_RAZA(ID_RAZA)
);

CREATE TABLE LAROATLB_ESPECIE (
  ID_ESPECIE NUMBER,
  NOMBRE_ESPECIE VARCHAR2(50),
  CONSTRAINT PK_LAROATLB_ESPECIE PRIMARY KEY(ID_ESPECIE)
);

CREATE TABLE LAROATLB_RAZA (
  ID_RAZA NUMBER,
  NOMBRE_RAZA VARCHAR2(50),
  ID_ESPECIE NUMBER,
  CONSTRAINT PK_LAROATLB_RAZA PRIMARY KEY(ID_RAZA),
  CONSTRAINT FK_LAROATLB_RAZA_ESPECIE FOREIGN KEY(ID_ESPECIE) REFERENCES LAROATLB_ESPECIE(ID_ESPECIE)
);

CREATE TABLE LAROATLB_CITA (
  ID_CITA NUMBER,
  FECHA DATE,
  SALA NUMBER,
  ID_MASCOTA NUMBER,
  ID_VETERINARIO NUMBER,
  CONSTRAINT PK_LAROATLB_CITA PRIMARY KEY(ID_CITA),
  CONSTRAINT FK_LAROATLB_CITA_MASCOTA FOREIGN KEY(ID_MASCOTA) REFERENCES LAROATLB_MASCOTA(ID_MASCOTA),
  CONSTRAINT FK_LAROATLB_CITA_VETERINARIO FOREIGN KEY(ID_VETERINARIO) REFERENCES LAROATLB_VETERINARIO(ID_VETERINARIO)
);

CREATE TABLE LAROATLB_VETERINARIO (
  ID_VETERINARIO NUMBER,
  NOMBRE VARCHAR2(80),
  APELLIDO1 VARCHAR2(30),
  APELLIDO2 VARCHAR2(30),
  ESPECIALIDAD VARCHAR2(50),
  TELEFONO NUMBER,
  EMAIL VARCHAR2(80),
  CONSTRAINT PK_LAROATLB_VETERINARIO PRIMARY KEY(ID_VETERINARIO)
);

CREATE TABLE LAROATLB_PRODUCTO (
  ID_PRODUCTO NUMBER,                   
  NOMBRE_PRODUCTO VARCHAR2(50),            
  STOCK NUMBER,                           
  CONSTRAINT PK_LAROATLB_PRODUCTOS PRIMARY KEY(ID_PRODUCTO) 
);

CREATE TABLE LAROATLB_TRATAMIENTO (
  ID_TRATAMIENTO NUMBER,
  DESCRIPCION VARCHAR2(300),
  FECHA DATE,
  ID_MASCOTA NUMBER,
  ID_VETERINARIO NUMBER,
  CONSTRAINT PK_LAROATLB_TRATAMIENTO PRIMARY KEY(ID_TRATAMIENTO),
  CONSTRAINT FK_LAROATLB_TRATAMIENTO_MASCOTA FOREIGN KEY(ID_MASCOTA) REFERENCES LAROATLB_MASCOTA(ID_MASCOTA),
  CONSTRAINT FK_LAROATLB_TRATAMIENTO_VETERINARIO FOREIGN KEY(ID_VETERINARIO) REFERENCES LAROATLB_VETERINARIO(ID_VETERINARIO)
);



CREATE TABLE LAROATLB_DETALLE_PRODUCTO_TRATAMIENTO (
    ID_TRATAMIENTO NUMBER REFERENCES LAROATLB_Tratamiento(ID_Tratamiento),
    ID_PRODUCTO NUMBER REFERENCES LAROATLB_Productos(ID_Producto),
    CANTIDAD NUMBER, 
    CONSTRAINT PK_LAROATLB_DETALLE_PRODUCTO_TRATAMIENTO PRIMARY KEY (ID_TRATAMIENTO, ID_PRODUCTO)
    CONSTRAINT FK_LAROATLB_TRATAMIENTO_DETALLE FOREIGN KEY(ID_TRATAMIENTO) REFERENCES LAROATLB_TRATAMIENTO(ID_TRATAMIENTO),
    CONSTRAINT FK_LAROATLB_PRODUCTO_DETALLE FOREIGN KEY(ID_PRODUCTO) REFERENCES LAROATLB_PRODUCTO(ID_PRODUCTO)
);


