USE [master]
GO
/****** Object:  Database [DM_Anita]    Script Date: 21/07/2024 12:00:42 ******/
CREATE DATABASE [DM_Anita]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DM_Anita', FILENAME = N'C:\SQLData\DM_Anita.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'DM_Anita_log', FILENAME = N'C:\SQLData\DM_Anita_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [DM_Anita] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DM_Anita].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DM_Anita] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DM_Anita] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DM_Anita] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DM_Anita] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DM_Anita] SET ARITHABORT OFF 
GO
ALTER DATABASE [DM_Anita] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DM_Anita] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DM_Anita] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DM_Anita] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DM_Anita] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DM_Anita] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DM_Anita] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DM_Anita] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DM_Anita] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DM_Anita] SET  DISABLE_BROKER 
GO
ALTER DATABASE [DM_Anita] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DM_Anita] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DM_Anita] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DM_Anita] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DM_Anita] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DM_Anita] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DM_Anita] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DM_Anita] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [DM_Anita] SET  MULTI_USER 
GO
ALTER DATABASE [DM_Anita] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DM_Anita] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DM_Anita] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DM_Anita] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [DM_Anita] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [DM_Anita] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [DM_Anita] SET QUERY_STORE = ON
GO
ALTER DATABASE [DM_Anita] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [DM_Anita]
GO
/****** Object:  Table [dbo].[dim_cargos]    Script Date: 21/07/2024 12:00:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dim_cargos](
	[id_cargo] [int] NOT NULL,
	[cargo] [nvarchar](50) NULL,
 CONSTRAINT [PK_dim_cargos] PRIMARY KEY CLUSTERED 
(
	[id_cargo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[dim_categoria_productos]    Script Date: 21/07/2024 12:00:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dim_categoria_productos](
	[id_categoria_producto] [int] NOT NULL,
	[categoria_producto] [nvarchar](100) NULL,
 CONSTRAINT [PK_dim_categoria_productos] PRIMARY KEY CLUSTERED 
(
	[id_categoria_producto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[dim_clientes]    Script Date: 21/07/2024 12:00:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dim_clientes](
	[id_cliente] [int] NOT NULL,
	[cliente] [nvarchar](200) NULL,
	[documento] [nvarchar](11) NULL,
	[id_tipo_documento] [int] NULL,
	[direccion] [nvarchar](250) NULL,
	[id_ubigeo] [int] NULL,
	[telefono] [nvarchar](50) NULL,
	[correo] [nvarchar](100) NULL,
	[fecha_nacimiento] [date] NULL,
	[zona] [nvarchar](100) NULL,
 CONSTRAINT [PK_dim_clientes] PRIMARY KEY CLUSTERED 
(
	[id_cliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[dim_fechas]    Script Date: 21/07/2024 12:00:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dim_fechas](
	[id_fecha] [int] NOT NULL,
	[fecha] [date] NOT NULL,
	[año] [int] NULL,
	[mes] [int] NULL,
	[dia] [int] NULL,
	[periodo] [nvarchar](6) NULL,
	[fin_mes] [int] NULL,
 CONSTRAINT [PK_dim_fechas] PRIMARY KEY CLUSTERED 
(
	[id_fecha] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[dim_monedas]    Script Date: 21/07/2024 12:00:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dim_monedas](
	[id_moneda] [int] NOT NULL,
	[moneda] [nvarchar](50) NULL,
 CONSTRAINT [PK_dim_monedas] PRIMARY KEY CLUSTERED 
(
	[id_moneda] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[dim_personales]    Script Date: 21/07/2024 12:00:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dim_personales](
	[id_personal] [int] NOT NULL,
	[nombre_personal] [nvarchar](200) NULL,
	[codigo_personal] [nvarchar](50) NULL,
 CONSTRAINT [PK_dim_personales] PRIMARY KEY CLUSTERED 
(
	[id_personal] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[dim_productos]    Script Date: 21/07/2024 12:00:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dim_productos](
	[id_producto] [int] NOT NULL,
	[producto] [nvarchar](100) NULL,
	[id_categoria] [int] NULL,
	[precio] [decimal](18, 5) NULL,
 CONSTRAINT [PK_dim_productos] PRIMARY KEY CLUSTERED 
(
	[id_producto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[dim_tiendas]    Script Date: 21/07/2024 12:00:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dim_tiendas](
	[id_tienda] [int] NOT NULL,
	[tienda] [nvarchar](50) NULL,
	[id_ubigeo] [int] NULL,
 CONSTRAINT [PK_dim_tiendas] PRIMARY KEY CLUSTERED 
(
	[id_tienda] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[dim_tipo_documentos]    Script Date: 21/07/2024 12:00:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dim_tipo_documentos](
	[id_tipo_documento] [int] NOT NULL,
	[tipo_documento] [nvarchar](50) NULL,
 CONSTRAINT [PK_dim_tipo_documentos] PRIMARY KEY CLUSTERED 
(
	[id_tipo_documento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[dim_tipo_pagos]    Script Date: 21/07/2024 12:00:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dim_tipo_pagos](
	[id_tipo_pago] [int] NOT NULL,
	[tipo_pago] [nvarchar](50) NULL,
 CONSTRAINT [PK_dim_tipo_pagos] PRIMARY KEY CLUSTERED 
(
	[id_tipo_pago] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[dim_ubigeos]    Script Date: 21/07/2024 12:00:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dim_ubigeos](
	[id_ubigeo] [int] NOT NULL,
	[ubigeo] [nvarchar](10) NULL,
	[departamento] [nvarchar](100) NULL,
	[provincia] [nvarchar](100) NULL,
	[distrito] [nvarchar](100) NULL,
 CONSTRAINT [PK_dim_ubigeos] PRIMARY KEY CLUSTERED 
(
	[id_ubigeo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[hecho_ventas]    Script Date: 21/07/2024 12:00:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[hecho_ventas](
	[id_fecha] [int] NOT NULL,
	[id_producto] [int] NOT NULL,
	[id_moneda] [int] NOT NULL,
	[id_cargo] [int] NOT NULL,
	[id_personal] [int] NOT NULL,
	[id_tienda] [int] NOT NULL,
	[id_tipo_pago] [int] NOT NULL,
	[id_cliente] [int] NOT NULL,
	[cantidad] [int] NULL,
	[valor_unitario] [decimal](18, 5) NULL,
	[sub_total] [decimal](18, 5) NULL,
	[porcentaje_descuento] [decimal](18, 5) NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[dim_clientes]  WITH CHECK ADD  CONSTRAINT [FK_dim_clientes_dim_tipo_documentos] FOREIGN KEY([id_tipo_documento])
REFERENCES [dbo].[dim_tipo_documentos] ([id_tipo_documento])
GO
ALTER TABLE [dbo].[dim_clientes] CHECK CONSTRAINT [FK_dim_clientes_dim_tipo_documentos]
GO
ALTER TABLE [dbo].[dim_clientes]  WITH CHECK ADD  CONSTRAINT [FK_dim_clientes_dim_ubigeos] FOREIGN KEY([id_ubigeo])
REFERENCES [dbo].[dim_ubigeos] ([id_ubigeo])
GO
ALTER TABLE [dbo].[dim_clientes] CHECK CONSTRAINT [FK_dim_clientes_dim_ubigeos]
GO
ALTER TABLE [dbo].[dim_productos]  WITH CHECK ADD  CONSTRAINT [FK_dim_productos_dim_categoria_productos] FOREIGN KEY([id_categoria])
REFERENCES [dbo].[dim_categoria_productos] ([id_categoria_producto])
GO
ALTER TABLE [dbo].[dim_productos] CHECK CONSTRAINT [FK_dim_productos_dim_categoria_productos]
GO
ALTER TABLE [dbo].[dim_tiendas]  WITH CHECK ADD  CONSTRAINT [FK_dim_tiendas_dim_ubigeos] FOREIGN KEY([id_ubigeo])
REFERENCES [dbo].[dim_ubigeos] ([id_ubigeo])
GO
ALTER TABLE [dbo].[dim_tiendas] CHECK CONSTRAINT [FK_dim_tiendas_dim_ubigeos]
GO
ALTER TABLE [dbo].[hecho_ventas]  WITH CHECK ADD  CONSTRAINT [FK_hecho_ventas_dim_cargos] FOREIGN KEY([id_cargo])
REFERENCES [dbo].[dim_cargos] ([id_cargo])
GO
ALTER TABLE [dbo].[hecho_ventas] CHECK CONSTRAINT [FK_hecho_ventas_dim_cargos]
GO
ALTER TABLE [dbo].[hecho_ventas]  WITH CHECK ADD  CONSTRAINT [FK_hecho_ventas_dim_clientes] FOREIGN KEY([id_cliente])
REFERENCES [dbo].[dim_clientes] ([id_cliente])
GO
ALTER TABLE [dbo].[hecho_ventas] CHECK CONSTRAINT [FK_hecho_ventas_dim_clientes]
GO
ALTER TABLE [dbo].[hecho_ventas]  WITH CHECK ADD  CONSTRAINT [FK_hecho_ventas_dim_fechas] FOREIGN KEY([id_fecha])
REFERENCES [dbo].[dim_fechas] ([id_fecha])
GO
ALTER TABLE [dbo].[hecho_ventas] CHECK CONSTRAINT [FK_hecho_ventas_dim_fechas]
GO
ALTER TABLE [dbo].[hecho_ventas]  WITH CHECK ADD  CONSTRAINT [FK_hecho_ventas_dim_monedas] FOREIGN KEY([id_moneda])
REFERENCES [dbo].[dim_monedas] ([id_moneda])
GO
ALTER TABLE [dbo].[hecho_ventas] CHECK CONSTRAINT [FK_hecho_ventas_dim_monedas]
GO
ALTER TABLE [dbo].[hecho_ventas]  WITH CHECK ADD  CONSTRAINT [FK_hecho_ventas_dim_personales] FOREIGN KEY([id_personal])
REFERENCES [dbo].[dim_personales] ([id_personal])
GO
ALTER TABLE [dbo].[hecho_ventas] CHECK CONSTRAINT [FK_hecho_ventas_dim_personales]
GO
ALTER TABLE [dbo].[hecho_ventas]  WITH CHECK ADD  CONSTRAINT [FK_hecho_ventas_dim_productos] FOREIGN KEY([id_producto])
REFERENCES [dbo].[dim_productos] ([id_producto])
GO
ALTER TABLE [dbo].[hecho_ventas] CHECK CONSTRAINT [FK_hecho_ventas_dim_productos]
GO
ALTER TABLE [dbo].[hecho_ventas]  WITH CHECK ADD  CONSTRAINT [FK_hecho_ventas_dim_tiendas] FOREIGN KEY([id_tienda])
REFERENCES [dbo].[dim_tiendas] ([id_tienda])
GO
ALTER TABLE [dbo].[hecho_ventas] CHECK CONSTRAINT [FK_hecho_ventas_dim_tiendas]
GO
ALTER TABLE [dbo].[hecho_ventas]  WITH CHECK ADD  CONSTRAINT [FK_hecho_ventas_dim_tipo_pagos] FOREIGN KEY([id_tipo_pago])
REFERENCES [dbo].[dim_tipo_pagos] ([id_tipo_pago])
GO
ALTER TABLE [dbo].[hecho_ventas] CHECK CONSTRAINT [FK_hecho_ventas_dim_tipo_pagos]
GO
USE [master]
GO
ALTER DATABASE [DM_Anita] SET  READ_WRITE 
GO
