-- TALLER: TABLAS RELACIONALES Y TABLA DE ROMPIMIENTO
-- PostgreSQL
-- Base de datos: biblioteca_db

- CREAR BASE DE DATOS
CREATE DATABASE biblioteca_db;

- CREAR TABLAS PRINCIPALES
CREATE TABLE libros (
    codigo VARCHAR(5) PRIMARY KEY,
    titulo VARCHAR(50) NOT NULL,
    paginas INT NOT NULL
);

CREATE TABLE autores (
    id INT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    pais VARCHAR(30) NOT NULL
);

- TABLA DE ROMPIMIENTO
CREATE TABLE libro_autor (
    la_libro_codigo_fk VARCHAR(5) NOT NULL,
    la_autor_id_fk INT NOT NULL,
    anio_publicacion INT NOT NULL,

    CONSTRAINT libro_autor_pk
        PRIMARY KEY (la_libro_codigo_fk, la_autor_id_fk),

    CONSTRAINT libro_autor_libro_fk
        FOREIGN KEY (la_libro_codigo_fk)
        REFERENCES libros(codigo),

    CONSTRAINT libro_autor_autor_fk
        FOREIGN KEY (la_autor_id_fk)
        REFERENCES autores(id)
);

- INSERTAR DATOS

-- LIBROS
INSERT INTO libros
(codigo, titulo, paginas)
VALUES
('L0001', 'Bases de Datos Modernas', 320);

INSERT INTO libros
(codigo, titulo, paginas)
VALUES
('L0002', 'Programacion Backend', 280);

INSERT INTO libros
(codigo, titulo, paginas)
VALUES
('L0003', 'Arquitectura de Software', 410);

INSERT INTO libros
(codigo, titulo, paginas)
VALUES
('L0004', 'SQL para Desarrolladores', 250);

-- AUTORES
INSERT INTO autores
(id, nombre, pais)
VALUES
(1, 'Ana Torres', 'Ecuador');

INSERT INTO autores
(id, nombre, pais)
VALUES
(2, 'Carlos Mendoza', 'Colombia');

INSERT INTO autores
(id, nombre, pais)
VALUES
(3, 'Lucia Perez', 'Peru');

-- RELACIONES LIBRO - AUTOR
INSERT INTO libro_autor
(la_libro_codigo_fk, la_autor_id_fk, anio_publicacion)
VALUES
('L0001', 1, 2021);

INSERT INTO libro_autor
(la_libro_codigo_fk, la_autor_id_fk, anio_publicacion)
VALUES
('L0001', 2, 2021);

INSERT INTO libro_autor
(la_libro_codigo_fk, la_autor_id_fk, anio_publicacion)
VALUES
('L0002', 2, 2022);

INSERT INTO libro_autor
(la_libro_codigo_fk, la_autor_id_fk, anio_publicacion)
VALUES
('L0003', 3, 2019);

INSERT INTO libro_autor
(la_libro_codigo_fk, la_autor_id_fk, anio_publicacion)
VALUES
('L0004', 1, 2024);