DROP SCHEMA IF EXISTS PERFUMES;
CREATE SCHEMA PERFUMES;
USE PERFUMES;

create table clientes (
	id int primary key,
	nombre_cliente varchar(50),
	apellido_cliente varchar(30),
	direccion varchar(100),
	telefono varchar(20),
	email varchar(100)
);

create table marcas (
	id int primary key,
    nombre_marca varchar(50),
    descripcion varchar(100)
);

create table fragancias (
	id int primary key,
	nombre_fragancia varchar(60),
    descripcion varchar(100)
);

create table notas_olfativas (
	id int primary key,
	nombre_nota varchar(60),
    descripcion varchar(100)
);


create table productos (
	id int primary key,
	id_marca int,
	id_fragancia int,
	id_nota int,
	tamaño int,
	tipo varchar(50),
    stock int,
	foreign key(id_marca) references marcas(id),
	foreign key(id_fragancia) references fragancias(id),
    foreign key(id_nota) references notas_olfativas(id)
);

create table ventas (
	id int primary key,
    fecha date,
    id_cliente int,
    total_venta decimal(10,2),
    foreign key(id_cliente) references clientes(id)
);

create table detalles_ventas (
	id int primary key,
    id_venta int,
    id_producto int,
    cantidad_vendida int,
    precio_unitario decimal(10,2),
    foreign key(id_venta) references ventas(id),
    foreign key(id_producto) references productos(id)
);

