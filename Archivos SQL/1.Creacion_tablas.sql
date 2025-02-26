DROP SCHEMA IF EXISTS PERFUMES;
CREATE SCHEMA PERFUMES;
USE PERFUMES;
-- _____________________ CREACION DE TABLAS _____________________

-- Creamos la tabla de clientes
create table cliente (
	id_cliente int not null primary key auto_increment,
	nombre_cliente varchar(50) not null,
	apellido_cliente varchar(30) not null,
	direccion varchar(100),
	telefono varchar(20) not null,
	email varchar(100) not null
);

-- Creamos la tabla de lineas
create table linea (
	id_linea int not null primary key auto_increment,
    nombre_linea varchar(50) not null,
    descripcion varchar(100)
);

-- Creamos la tabla de fragancias
create table fragancia (
	id_fragancia int not null primary key auto_increment,
	nombre_fragancia varchar(60) not null,
    descripcion varchar(100)
);

-- Creamos la tabla de notas olfativas
create table nota_olfativa (
	id_nota int not null primary key auto_increment,
	nombre_nota varchar(60) not null,
    descripcion varchar(100)
);

-- Creamos la tabla de los productos
create table producto (
	id_producto int not null primary key auto_increment,
	id_linea int not null,
	id_fragancia int not null,
	id_nota int not null,
	tamaño int not null,
	tipo varchar(50) not null,
    stock int not null,
	foreign key(id_linea) references linea(id_linea),
	foreign key(id_fragancia) references fragancia(id_fragancia),
    foreign key(id_nota) references nota_olfativa(id_nota)
);

-- Creamos la tabla de ventas
create table venta (
	id_venta int not null primary key auto_increment,
    fecha date not null,
    id_cliente int not null,
    total_venta decimal(10,2) not null,
    foreign key(id_cliente) references cliente(id_cliente)
);

-- Creamos la tabla de detalles de ventas
create table detalle_venta (
	id_detalle int not null primary key auto_increment,
    id_venta int not null,
    id_producto int not null,
    cantidad_vendida int not null,
    precio_unitario decimal(10,2) not null,
    foreign key(id_venta) references venta(id_venta),
    foreign key(id_producto) references producto(id_producto)
);