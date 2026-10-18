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

-- PARTE 5 - CONSULTAS

-- CONSULTA 1
-- Mostrar titulo, autor, pais y año de publicacion
-- utilizando INNER JOIN.
SELECT
    l.titulo,
    a.nombre AS autor,
    a.pais,
    la.anio_publicacion
FROM libros l
INNER JOIN libro_autor la
    ON l.codigo = la.la_libro_codigo_fk
INNER JOIN autores a
    ON a.id = la.la_autor_id_fk;

-- CONSULTA 2
-- Mostrar libros publicados despues de 2020.
SELECT DISTINCT
    l.codigo,
    l.titulo,
    la.anio_publicacion
FROM libros l
INNER JOIN libro_autor la
    ON l.codigo = la.la_libro_codigo_fk
WHERE la.anio_publicacion > 2020;

-- CONSULTA 3
-- Mostrar autores de Ecuador.
SELECT *
FROM autores
WHERE pais = 'Ecuador';

-- CONSULTA 4
-- Ordenar libros por año de publicacion
-- de mayor a menor.
SELECT DISTINCT
    l.codigo,
    l.titulo,
    la.anio_publicacion
FROM libros l
INNER JOIN libro_autor la
    ON l.codigo = la.la_libro_codigo_fk
ORDER BY la.anio_publicacion DESC;

-- CONSULTA 5
-- Contar cuantos libros tiene cada autor.
SELECT
    a.id,
    a.nombre,
    COUNT(la.la_libro_codigo_fk) AS cantidad_libros
FROM autores a
INNER JOIN libro_autor la
    ON a.id = la.la_autor_id_fk
GROUP BY
    a.id,
    a.nombre
ORDER BY
    cantidad_libros DESC;

- MODIFICACION DE LA TABLA
ALTER TABLE libros
ADD COLUMN precio DOUBLE PRECISION;

-- Actualizar precios
UPDATE libros
SET precio = 35.50
WHERE codigo = 'L0001';

UPDATE libros
SET precio = 29.99
WHERE codigo = 'L0002';

UPDATE libros
SET precio = 45.00
WHERE codigo = 'L0003';

UPDATE libros
SET precio = 32.75
WHERE codigo = 'L0004';

-- Mostrar titulo y precio
SELECT
    titulo,
    precio
FROM libros;