--insert into [Anita_Mart].dbo.dim_Fechas
select distinct format(fecha,'yyMMdd') AS id_fecha, fecha, YEAR(fecha) AS año, MONTH(fecha) AS mes, day(fecha) AS dia, format(fecha,'yyMM') AS periodo,
	    CASE 
        WHEN MONTH(fecha) IN (1, 2) THEN 1
        WHEN MONTH(fecha) IN (3, 4) THEN 2
        WHEN MONTH(fecha) IN (5, 6) THEN 3
        WHEN MONTH(fecha) IN (7, 8) THEN 4
        WHEN MONTH(fecha) IN (9, 10) THEN 5
        WHEN MONTH(fecha) IN (11, 12) THEN 6
		END AS bimestre,
		CASE 
        WHEN MONTH(fecha) IN (1, 2, 3) THEN 1
        WHEN MONTH(fecha) IN (4, 5, 6) THEN 2
        WHEN MONTH(fecha) IN (7, 8, 9) THEN 3
        WHEN MONTH(fecha) IN (10, 11, 12) THEN 4
		 END AS trimestre
		from ventas
		where fecha is not null





Create database Anita_Warehouse

create table Ubigeos(
	id_ubigeo int primary key not null,
	ubigeo nvarchar(10),
	departamento nvarchar(100),
	provincia nvarchar(100),
	distrito nvarchar(100)
)

drop table Ubigeos

delete Ubigeos
DECLARE @MaxID INT;

-- Obtener el valor actual de identidad
SELECT @MaxID = IDENT_CURRENT('Ubigeos');

-- Si el valor actual es mayor que 0, reiniciar el contador
IF @MaxID > 0
BEGIN
    DBCC CHECKIDENT ('Ubigeos', RESEED, 0);
END



create table Direccion_empleados(
	id_direccion int primary key not null,
	zona nvarchar(200),
	urbanizacion nvarchar(200),
	ciudad nvarchar(100),
	provincia nvarchar(100),
	pais nvarchar(50),
	codigo_postal nvarchar(10)
)


delete Direccion_empleados
DECLARE @Max_ID_Direccion_empleados INT;

-- Obtener el valor actual de identidad
SELECT @Max_ID_Direccion_empleados = IDENT_CURRENT('Direccion_empleados');

-- Si el valor actual es mayor que 0, reiniciar el contador
IF @Max_ID_Direccion_empleados > 0
BEGIN
    DBCC CHECKIDENT ('Direccion_empleados', RESEED, 0);
END

select * from Direccion_empleados




create table tienda (
	id_tienda int primary key not null,
	id_ubigeo int,
	nombre_tienda nvarchar(50),
	foreign key (id_ubigeo) references Ubigeos(id_ubigeo)
)

delete tienda
DECLARE @Max_ID_tienda INT;

-- Obtener el valor actual de identidad
SELECT @Max_ID_tienda = IDENT_CURRENT('tienda');

-- Si el valor actual es mayor que 0, reiniciar el contador
IF @Max_ID_tienda > 0
BEGIN
    DBCC CHECKIDENT ('tienda', RESEED, 0);
END


select * from tienda



create table clientes(
	id_cliente int primary key not null,
	id_ubigeo int,
	nombre_cliente nvarchar(400),
	correo_electronico nvarchar(200),
	edad int,
	documento nvarchar(20),
	tipo_documento nvarchar(50),
	telefono nvarchar(20),
	foreign key (id_ubigeo) references Ubigeos(id_ubigeo)
)

delete clientes
DECLARE @Max_ID_clientes INT;

-- Obtener el valor actual de identidad
SELECT @Max_ID_clientes = IDENT_CURRENT('clientes');

-- Si el valor actual es mayor que 0, reiniciar el contador
IF @Max_ID_clientes > 0
BEGIN
    DBCC CHECKIDENT ('clientes', RESEED, 0);
END

create table categorias(
	id_categoria int primary key not null,
	nombre_categoria nvarchar(100),
	descripcion nvarchar(2000)
)

delete categorias
DECLARE @Max_ID_categorias INT;
SELECT @Max_ID_categorias = IDENT_CURRENT('categorias');
IF @Max_ID_categorias > 0
BEGIN
    DBCC CHECKIDENT ('categorias', RESEED, 0);
END

select * from categorias


create table productos(
	id_producto int primary key not null,
	id_categoria int,
	nombre_producto nvarchar(200),
	precio_unitario decimal(18,2),
	precio_compra decimal(18,2),
	existencia int,
	stock_minimo int,
	estado_producto nvarchar(20),
	foreign key (id_categoria) references categorias(id_categoria)
)

delete productos
DECLARE @Max_ID_productos INT;
SELECT @Max_ID_productos = IDENT_CURRENT('productos');
IF @Max_ID_productos > 0
BEGIN
    DBCC CHECKIDENT ('productos', RESEED, 0);
END

select * from productos



create table cargos (
	id_cargo	int primary key not null,
	cargo nvarchar(50)
)


delete cargos
DECLARE @Max_ID_cargos INT;
SELECT @Max_ID_cargos = IDENT_CURRENT('cargos');
IF @Max_ID_cargos > 0
BEGIN
    DBCC CHECKIDENT ('cargos', RESEED, 0);
END

select * from productos

create table empleados(
	id_empleado int primary key not null,
	id_direccion int,
	cod_empleado nvarchar(20),
	nombre_empleado nvarchar(100),
	apellido_empleado nvarchar(200),
	fecha_nacimiento DATE,
	fecha_contratacion DATE,
	telefono nvarchar(10),
	correo nvarchar(50),
	identidad nvarchar(10),
	estado_civil nvarchar(50),
	usuario nvarchar(50)
	foreign key (id_direccion) references Direccion_empleados(id_direccion)
)

delete empleados
DECLARE @Max_ID_empleados INT;
SELECT @Max_ID_empleados = IDENT_CURRENT('empleados');
IF @Max_ID_empleados > 0
BEGIN
    DBCC CHECKIDENT ('empleados', RESEED, 0);
END


create table Historial_Cargos(
	id_historial_cargos int primary key not null,
	id_empleado int,
	id_cargo int,
	fecha_inicio DATE,
	fecha_fin DATE
	foreign key (id_empleado) references empleados(id_empleado),
	foreign key (id_cargo) references cargos(id_cargo)
)

delete Historial_Cargos
DECLARE @Max_ID_Historial_Cargos INT;
SELECT @Max_ID_Historial_Cargos = IDENT_CURRENT('Historial_Cargos');
IF @Max_ID_Historial_Cargos > 0
BEGIN
    DBCC CHECKIDENT ('Historial_Cargos', RESEED, 0);
END

select * from Direccion_empleados

select * from cargos

select * from empleados

select * from Historial_Cargos


create table ventas(
	id_ventas int primary key not null,
	id_tienda int,
	id_empleado int,
	id_cliente int,
	id_producto int,
	cantidad int,
	valor_unitario decimal(18,2),
	sub_total decimal(18,2),
	tipo_moneda nvarchar(50),
	soles decimal(18,2),
	dolares decimal(18,2),
	fecha DATE,
	tipo_pago nvarchar(50)
	foreign key (id_cliente) references clientes(id_cliente),
	foreign key (id_tienda) references tienda(id_tienda),
	foreign key (id_empleado) references empleados(id_empleado),
	foreign key (id_producto) references productos(id_producto),
)

drop table ventas
select * from ventas where id_producto IS NULL

drop table ventas 



delete ventas
DECLARE @Max_ID_ventas INT;
SELECT @Max_ID_ventas = IDENT_CURRENT('ventas');
IF @Max_ID_ventas > 0
BEGIN
    DBCC CHECKIDENT ('ventas', RESEED, 0);
END


select * from ventas

