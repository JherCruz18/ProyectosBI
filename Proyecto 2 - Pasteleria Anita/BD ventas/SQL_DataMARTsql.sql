use Anita_Mart

create table dim_ubigeos(
	id_ubigeo int primary key not null,
	ubigeo nvarchar(10),
	departamento nvarchar(100),
	provincia nvarchar(100),
	distrito nvarchar(100)
)

delete dim_ubigeos
DECLARE @MaxID_dim_ubigeos INT;
SELECT @MaxID_dim_ubigeos = IDENT_CURRENT('dim_ubigeos');
IF @MaxID_dim_ubigeos > 0
BEGIN
    DBCC CHECKIDENT ('dim_ubigeos', RESEED, 0);
END

use Anita_Mart
use Anita_Warehouse


select id_ubigeo, ubigeo, departamento, provincia, distrito from Ubigeos

create table dim_tipo_documentos(
	id_tipo_documento int primary key  Identity(1,1) not null,
	tipo_documento nvarchar(50)
)

delete dim_tipo_documentos
DECLARE @MaxID_dim_tipo_documentos INT;
SELECT @MaxID_dim_tipo_documentos = IDENT_CURRENT('dim_tipo_documentos');
IF @MaxID_dim_tipo_documentos > 0
BEGIN
    DBCC CHECKIDENT ('dim_tipo_documentos', RESEED, 0);
END

drop table dim_tipo_documentos

select distinct tipo_documento from clientes 


create table dim_tiendas (
	id_tienda int primary key Identity(1,1) not null,
	id_ubigeo int,
	nombre_tienda nvarchar(50),
	foreign key (id_ubigeo) references dim_ubigeos(id_ubigeo)
)

delete dim_tiendas
DECLARE @MaxID_dim_tiendas INT;
SELECT @MaxID_dim_tiendas = IDENT_CURRENT('dim_tiendas');
IF @MaxID_dim_tiendas > 0
BEGIN
    DBCC CHECKIDENT ('dim_tiendas', RESEED, 0);
END


select id_tienda,id_ubigeo,UPPER (nombre_tienda) from tienda

create table dim_clientes(
	id_clientes int Identity(1,1) primary key not null,
	id_tipo_documento int,
	id_ubigeo int,
	nombre_cliente nvarchar(400),
	correo nvarchar(200),
	telefono nvarchar(20),
	edad int
	foreign key (id_tipo_documento) references dim_tipo_documentos(id_tipo_documento),
	foreign key (id_tipo_documento) references dim_tipo_documentos(id_tipo_documento)
)


delete dim_clientes
DECLARE @MaxID_dim_clientes INT;
SELECT @MaxID_dim_clientes = IDENT_CURRENT('dim_clientes');
IF @MaxID_dim_clientes > 0
BEGIN
    DBCC CHECKIDENT ('dim_clientes', RESEED, 0);
END

select id_ubigeo,UPPER(nombre_cliente) AS nombre_cliente,correo_electronico,edad,documento,tipo_documento,telefono from clientes



select * from ventas

create table dim_monedas(
	id_moneda int primary key Identity(1,1) not null,
	tipo_moneda nvarchar(50)
)

delete dim_monedas
DECLARE @MaxID_dim_monedas INT;
SELECT @MaxID_dim_monedas = IDENT_CURRENT('dim_monedas');
IF @MaxID_dim_monedas > 0
BEGIN
    DBCC CHECKIDENT ('dim_monedas', RESEED, 0);
END


create table dim_categoria_productos(
	id_categoria_producto int Identity(1,1) primary key not null,
	categoria_producto nvarchar(100)
)

delete dim_categoria_productos
DECLARE @MaxID_dim_categoria_productos INT;
SELECT @MaxID_dim_categoria_productos = IDENT_CURRENT('dim_categoria_productos');
IF @MaxID_dim_categoria_productos > 0
BEGIN
    DBCC CHECKIDENT ('dim_categoria_productos', RESEED, 0);
END

select UPPER(nombre_categoria) As nombre_categoria from categorias

create table dim_tipo_pago(
	id_tipo_pago int primary key Identity(1,1) not null,
	tipo_pago nvarchar(50)
)

delete dim_tipo_pago
DECLARE @MaxID_dim_tipo_pago INT;
SELECT @MaxID_dim_tipo_pago = IDENT_CURRENT('dim_tipo_pago');
IF @MaxID_dim_tipo_pago > 0
BEGIN
    DBCC CHECKIDENT ('dim_tipo_pago', RESEED, 0);
END



		SELECT DISTINCT UPPER(
			REPLACE(
				REPLACE(
					REPLACE(
						REPLACE(
							REPLACE(
								REPLACE(
									ISNULL(tipo_pago, 'otros'),
									'YAPE/ EFECTIVO', 'EFECTIVO/YAPE'),
								'EFECTIVO / YAPE', 'EFECTIVO/YAPE'),
							'PROMOCION', 'otros'),
						'REMPLAZO', 'otros'),
					'Helados', 'otros'),
				'VERDADERO', 'otros')
			) AS tipo_pago
		FROM ventas;

select * from dim_tipo_pago
select * from dim_tipo_pago


create table dim_productos(
	id_productos int primary key not null,
	id_categoria_producto int,
	nombre_producto nvarchar(200),
	precio_unitario decimal(18,2),
	precio_compra decimal(18,2)
	foreign key (id_categoria_producto) references dim_categoria_productos(id_categoria_producto)
)


delete dim_productos
DECLARE @MaxID_dim_productos INT;
SELECT @MaxID_dim_productos = IDENT_CURRENT('dim_productos');
IF @MaxID_dim_productos > 0
BEGIN
    DBCC CHECKIDENT ('dim_productos', RESEED, 0);
END

select id_producto,id_categoria,UPPER(nombre_producto) AS nombre_producto,precio_unitario,precio_compra from productos



create table dim_empleados(
	id_empleados int primary key not null,
	nombre_empleado nvarchar(200),
	cod_empleado nvarchar(20),
)

delete dim_empleados
DECLARE @MaxID_dim_empleados INT;
SELECT @MaxID_dim_empleados = IDENT_CURRENT('dim_empleados');
IF @MaxID_dim_empleados > 0
BEGIN
    DBCC CHECKIDENT ('dim_empleados', RESEED, 0);
END


select * from empleados

drop table dim_empleados

select id_empleado, CONCAT(nombre_empleado,' ',apellido_empleado) AS nombre_empleado, cod_empleado  from empleados


create table dim_fechas(
	id_fecha int primary key not null,
	fecha date,
	año int,
	mes int,
	dia int,
	periodo nvarchar(6),
	bimestre int,
	trimestre int
)



delete dim_fechas
DECLARE @MaxID_dim_fechas INT;
SELECT @MaxID_dim_fechas = IDENT_CURRENT('dim_fechas');
IF @MaxID_dim_fechas > 0
BEGIN
    DBCC CHECKIDENT ('dim_fechas', RESEED, 0);
END


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


create table hecho_ventas(
	id_fecha int, 
	id_producto int,
	id_moneda int,
	id_empleado int,
	id_tienda int,
	id_tipo_pago int,
	id_cliente int,
	cantidad int,
	valor_unitario decimal(18,2),
	sub_total decimal(18,2),
	igv decimal(18,2),
	venta_total decimal(18,2),
	foreign key (id_fecha) references dim_fechas(id_fecha),
	foreign key (id_producto) references dim_productos(id_productos),
	foreign key (id_moneda) references dim_monedas(id_moneda),
	foreign key (id_empleado) references dim_empleados(id_empleados),
	foreign key (id_tienda) references dim_tiendas(id_tienda),
	foreign key (id_tipo_pago) references dim_tipo_pago(id_tipo_pago),
	foreign key (id_cliente) references dim_clientes(id_clientes),
)


delete hecho_ventas
DECLARE @MaxID_hecho_ventas INT;
SELECT @MaxID_hecho_ventas = IDENT_CURRENT('hecho_ventas');
IF @MaxID_hecho_ventas > 0
BEGIN
    DBCC CHECKIDENT ('hecho_ventas', RESEED, 0);
END

select * from ventas

select  format(fecha,'yyMMdd') AS id_fecha,id_tienda,id_empleado, id_cliente, id_producto, valor_unitario, sub_total, [Anita_Mart].dbo.dim_monedas from ventas 

select
 id_fecha
,id_producto
,id_moneda
,id_empleado
,id_tienda
, ISNULL(id_tipo_pago, 7) AS id_tipo_pago
,id_cliente
,cantidad
,pro.precio_unitario as valor_unitario
,(cantidad*pro.precio_unitario ) AS sub_total
,((cantidad * pro.precio_unitario) * 0.18) AS igv
,((cantidad * pro.precio_unitario) + ((cantidad * pro.precio_unitario) * 0.18)) AS venta_total
from [Anita_Warehouse].dbo.ventas a
left join [dbo].[dim_fechas] fec on a.fecha=fec.fecha
left join [dbo].[dim_monedas] mon on a.tipo_moneda=mon.tipo_moneda
left join [dbo].[dim_tipo_pago] ti_pa on a.tipo_pago=ti_pa.tipo_pago
left join [dbo].[dim_productos] pro on a.id_producto = pro.id_productos  where id_producto is not null


select * from hecho_ventas

