CREATE TABLE `rest_api`.Sala (
	idSala int primary key,
    cantFilas int not null,
    cantColumnas int not null,
    estado varchar(255),
    CONSTRAINT CHK_idSala CHECK(idSala >= 1 AND idSala <= 3),
    CONSTRAINT CHK_cantFilas CHECK(cantFilas >= 1 AND cantFilas <= 10),
    CONSTRAINT CHK_cantColumnas CHECK(cantColumnas >= 1 AND cantColumnas <= 10),
    CONSTRAINT CHK_estado CHECK(estado in ('DISPONIBLE', 'MANTENIMIENTO', 'RESERVADA'))
);

CREATE TABLE `rest_api`.Pelicula (
	idPelicula int primary key auto_increment,
    nombre varchar(255) not null,
    duracion int not null,
    clasificacion varchar(1) not null,
    descripcion varchar(255),
    CONSTRAINT CHK_duracion CHECK(duracion >= 60 AND duracion <= 200),
    CONSTRAINT CHK_clasificacion CHECK(clasificacion in ('A', 'B', 'C', 'D'))
);

CREATE TABLE `rest_api`.Funcion (
	idFuncion int primary key auto_increment,
    fecha date,
    hora time,
    costoBoleto decimal(5,2),
    idSala int not null, 
    idPelicula int not null,
    estado VARCHAR(25),
    CONSTRAINT CHK_estado_funcion CHECK(estado in ('DISPONIBLE', 'LLENA')),
    FOREIGN KEY (idSala) REFERENCES Sala(idSala),
    FOREIGN KEY (idPelicula) REFERENCES Pelicula(idPelicula)
);

CREATE TABLE `rest_api`.Asiento (
	idAsiento VARCHAR(25) primary key,
    idSala int not null,
    estado VARCHAR(25),
    CONSTRAINT CHK_idAsiento CHECK(idAsiento RLIKE '^([A-F]{1}[0-9][0-9]?)$'),
    CONSTRAINT CHK_estado_asiento CHECK(estado in ('DISPONIBLE', 'RESERVADO', 'OCUPADO')),
    FOREIGN KEY (idSala) REFERENCES Sala(idSala)
);

INSERT INTO `rest_api`.Pelicula(nombre, duracion, clasificacion, descripcion) VALUES("IT",180,"D","Pelicula de terror de un payaso diabolico.");
INSERT INTO `rest_api`.Pelicula(nombre, duracion, clasificacion, descripcion) VALUES("Star Wars",120,"B","Pelicula de ciencia ficcion sobre batallas espaciales.");
INSERT INTO `rest_api`.Pelicula(nombre, duracion, clasificacion, descripcion) VALUES("Toy Story",150,"A","Pelicula animada de una aventura de juguetes.");
INSERT INTO `rest_api`.Pelicula(nombre, duracion, clasificacion, descripcion) VALUES("Volver al Futuro",100,"B","Pelicula sobre un chico viajando en el tiempo.");
INSERT INTO `rest_api`.Pelicula(nombre, duracion, clasificacion, descripcion) VALUES("Hercules",140,"C","Pelicula animada de mitologia sobre un personaje muy fuerte.");
