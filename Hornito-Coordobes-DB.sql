USE [master]
GO
/****** Object:  Database [HornitoCoordobes]    Script Date: 09/28/2014 13:06:02 ******/
CREATE DATABASE [HornitoCoordobes]
GO
ALTER DATABASE [HornitoCoordobes] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [HornitoCoordobes].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [HornitoCoordobes] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [HornitoCoordobes] SET ANSI_NULLS OFF
GO
ALTER DATABASE [HornitoCoordobes] SET ANSI_PADDING OFF
GO
ALTER DATABASE [HornitoCoordobes] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [HornitoCoordobes] SET ARITHABORT OFF
GO
ALTER DATABASE [HornitoCoordobes] SET AUTO_CLOSE OFF
GO
ALTER DATABASE [HornitoCoordobes] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [HornitoCoordobes] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [HornitoCoordobes] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [HornitoCoordobes] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [HornitoCoordobes] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [HornitoCoordobes] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [HornitoCoordobes] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [HornitoCoordobes] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [HornitoCoordobes] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [HornitoCoordobes] SET  DISABLE_BROKER
GO
ALTER DATABASE [HornitoCoordobes] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [HornitoCoordobes] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [HornitoCoordobes] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [HornitoCoordobes] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [HornitoCoordobes] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [HornitoCoordobes] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [HornitoCoordobes] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [HornitoCoordobes] SET  READ_WRITE
GO
ALTER DATABASE [HornitoCoordobes] SET RECOVERY FULL
GO
ALTER DATABASE [HornitoCoordobes] SET  MULTI_USER
GO
ALTER DATABASE [HornitoCoordobes] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [HornitoCoordobes] SET DB_CHAINING OFF
GO
USE [HornitoCoordobes]
GO
/****** Object:  Table [dbo].[Barrios]    Script Date: 09/28/2014 13:06:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Barrios](
	[idBarrio] [int] IDENTITY(1,1) NOT NULL,
	[descripcion] [varchar](500) NOT NULL,
 CONSTRAINT [PK_Barrios] PRIMARY KEY CLUSTERED 
(
	[idBarrio] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [Descripcion_Barrio_Unique] UNIQUE NONCLUSTERED 
(
	[descripcion] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[EstadoDePedidos]    Script Date: 09/28/2014 13:06:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[EstadoDePedidos](
	[idEstado] [int] IDENTITY(1,1) NOT NULL,
	[descripcion] [varchar](500) NOT NULL,
 CONSTRAINT [PK_EstadoDePedidos] PRIMARY KEY CLUSTERED 
(
	[idEstado] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TiposDeProducto]    Script Date: 09/28/2014 13:06:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TiposDeProducto](
	[idTipoDeProducto] [int] IDENTITY(1,1) NOT NULL,
	[descripcion] [varchar](500) NOT NULL,
 CONSTRAINT [PK_TiposDeProducto] PRIMARY KEY CLUSTERED 
(
	[idTipoDeProducto] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [Descripcion_TiposDeProducto_Unique] UNIQUE NONCLUSTERED 
(
	[descripcion] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TiposDeDocumento]    Script Date: 09/28/2014 13:06:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TiposDeDocumento](
	[idTiposDeDocumento] [int] IDENTITY(1,1) NOT NULL,
	[descripcion] [varchar](45) NULL,
 CONSTRAINT [PK_TiposDeDocumento] PRIMARY KEY CLUSTERED 
(
	[idTiposDeDocumento] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Sucursales]    Script Date: 09/28/2014 13:06:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Sucursales](
	[idSucursal] [int] IDENTITY(1,1) NOT NULL,
	[idBarrio] [int] NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[direccion] [varchar](500) NOT NULL,
	[fechaAlta] [datetime] NOT NULL,
	[estado] [bit] NOT NULL,
 CONSTRAINT [PK_Sucursales] PRIMARY KEY CLUSTERED 
(
	[idSucursal] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [Nombre_Sucursal_Unique] UNIQUE NONCLUSTERED 
(
	[nombre] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Productos]    Script Date: 09/28/2014 13:06:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Productos](
	[idProducto] [int] IDENTITY(1,1) NOT NULL,
	[idTipoDeProducto] [int] NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[descripcion] [varchar](500) NOT NULL,
	[precioUnitario] [float] NOT NULL,
	[estado] [bit] NOT NULL,
 CONSTRAINT [PK_Productos] PRIMARY KEY CLUSTERED 
(
	[idProducto] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [Nombre_Productos_Unique] UNIQUE NONCLUSTERED 
(
	[nombre] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Clientes]    Script Date: 09/28/2014 13:06:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Clientes](
	[idUsuario] [int] NOT NULL,
	[nroDoc] [int] NOT NULL,
	[idTiposDeDocumento] [int] NOT NULL,
	[email] [varchar](50) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[apellido] [varchar](50) NOT NULL,
	[direccion] [varchar](500) NOT NULL,
	[fechaAlta] [datetime] NOT NULL,
	[idBarrio] [int] NOT NULL,
	[estado] [bit] NOT NULL,
 CONSTRAINT [PK_Clientes] PRIMARY KEY CLUSTERED 
(
	[idUsuario] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [Email_Cliente_Unique] UNIQUE NONCLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [TipoDoc_NroDoc_Cliente_Unique] UNIQUE NONCLUSTERED 
(
	[nroDoc] ASC,
	[idTiposDeDocumento] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Compras]    Script Date: 09/28/2014 13:06:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Compras](
	[idCompra] [int] IDENTITY(1,1) NOT NULL,
	[idSucursal] [int] NOT NULL,
	[fechaCompra] [datetime] NOT NULL,
 CONSTRAINT [PK_Compras] PRIMARY KEY CLUSTERED 
(
	[idCompra] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Administradores]    Script Date: 09/28/2014 13:06:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Administradores](
	[idUsuario] [int] NOT NULL,
	[nroDoc] [int] NOT NULL,
	[idTiposDeDocumento] [int] NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[apellido] [varchar](50) NOT NULL,
	[idSucursal] [int] NOT NULL,
	[estado] [bit] NOT NULL,
	[fechaAlta] [datetime] NOT NULL,
 CONSTRAINT [PK_Administradores] PRIMARY KEY CLUSTERED 
(
	[idUsuario] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [TipoDoc_NroDoc_Admin_Unique] UNIQUE NONCLUSTERED 
(
	[nroDoc] ASC,
	[idTiposDeDocumento] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Empleados]    Script Date: 09/28/2014 13:06:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Empleados](
	[idUsuario] [int] NOT NULL,
	[nroDoc] [int] NOT NULL,
	[idTiposDeDocumento] [int] NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[apellido] [varchar](50) NOT NULL,
	[fechaAlta] [datetime] NOT NULL,
	[estado] [bit] NOT NULL,
	[idSucursal] [int] NOT NULL,
 CONSTRAINT [PK_Empleados] PRIMARY KEY CLUSTERED 
(
	[idUsuario] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [TipoDoc_NroDoc_Empleado_Unique] UNIQUE NONCLUSTERED 
(
	[nroDoc] ASC,
	[idTiposDeDocumento] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[StockEnSucursal]    Script Date: 09/28/2014 13:06:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StockEnSucursal](
	[idProducto] [int] NOT NULL,
	[idSucursal] [int] NOT NULL,
	[cantidad] [int] NOT NULL,
 CONSTRAINT [PK_Table_1] PRIMARY KEY CLUSTERED 
(
	[idProducto] ASC,
	[idSucursal] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DetallesDeCompras]    Script Date: 09/28/2014 13:06:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DetallesDeCompras](
	[idCompra] [int] NOT NULL,
	[idProducto] [int] NOT NULL,
	[cantidad] [int] NOT NULL,
 CONSTRAINT [PK_DetallesDeCompras] PRIMARY KEY CLUSTERED 
(
	[idCompra] ASC,
	[idProducto] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuarios]    Script Date: 09/28/2014 13:06:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Usuarios](
	[idUsuario] [int] IDENTITY(1,1) NOT NULL,
	[nombreUsuario] [varchar](50) NOT NULL,
	[password] [varchar](50) NOT NULL,
	[rol] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Usuarios] PRIMARY KEY CLUSTERED 
(
	[idUsuario] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [nombreUsuario_Unique] UNIQUE NONCLUSTERED 
(
	[nombreUsuario] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Pedidos]    Script Date: 09/28/2014 13:06:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Pedidos](
	[idPedido] [int] IDENTITY(1,1) NOT NULL,
	[idEstado] [int] NOT NULL,
	[idSucursal] [int] NOT NULL,
	[idUsuario] [int] NULL,
	[direccionEntrega] [varchar](500) NULL,
	[fechaPedido] [datetime] NOT NULL,
	[idBarrioEntrega] [int] NULL,
 CONSTRAINT [PK_Pedidos] PRIMARY KEY CLUSTERED 
(
	[idPedido] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DetallesDePedidos]    Script Date: 09/28/2014 13:06:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DetallesDePedidos](
	[idProducto] [int] NOT NULL,
	[idPedido] [int] NOT NULL,
	[cantidad] [int] NOT NULL,
	[precioUnitario] [float] NOT NULL,
 CONSTRAINT [PK_DetallesDePedidos] PRIMARY KEY CLUSTERED 
(
	[idProducto] ASC,
	[idPedido] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Default [DF_Sucursales_fechaAlta]    Script Date: 09/28/2014 13:06:04 ******/
ALTER TABLE [dbo].[Sucursales] ADD  CONSTRAINT [DF_Sucursales_fechaAlta]  DEFAULT (getdate()) FOR [fechaAlta]
GO
/****** Object:  Default [DF_Clientes_fechaAlta]    Script Date: 09/28/2014 13:06:04 ******/
ALTER TABLE [dbo].[Clientes] ADD  CONSTRAINT [DF_Clientes_fechaAlta]  DEFAULT (getdate()) FOR [fechaAlta]
GO
/****** Object:  Default [DF_Compras_fechaCompra]    Script Date: 09/28/2014 13:06:04 ******/
ALTER TABLE [dbo].[Compras] ADD  CONSTRAINT [DF_Compras_fechaCompra]  DEFAULT (getdate()) FOR [fechaCompra]
GO
/****** Object:  Default [DF_Empleados_fechaAlta]    Script Date: 09/28/2014 13:06:04 ******/
ALTER TABLE [dbo].[Empleados] ADD  CONSTRAINT [DF_Empleados_fechaAlta]  DEFAULT (getdate()) FOR [fechaAlta]
GO
/****** Object:  Default [DF_Pedidos_fechaPago]    Script Date: 09/28/2014 13:06:04 ******/
ALTER TABLE [dbo].[Pedidos] ADD  CONSTRAINT [DF_Pedidos_fechaPago]  DEFAULT (getdate()) FOR [fechaPedido]
GO
/****** Object:  ForeignKey [FK_Sucursales_Barrios]    Script Date: 09/28/2014 13:06:04 ******/
ALTER TABLE [dbo].[Sucursales]  WITH CHECK ADD  CONSTRAINT [FK_Sucursales_Barrios] FOREIGN KEY([idBarrio])
REFERENCES [dbo].[Barrios] ([idBarrio])
GO
ALTER TABLE [dbo].[Sucursales] CHECK CONSTRAINT [FK_Sucursales_Barrios]
GO
/****** Object:  ForeignKey [FK_Productos_TiposDeProducto]    Script Date: 09/28/2014 13:06:04 ******/
ALTER TABLE [dbo].[Productos]  WITH CHECK ADD  CONSTRAINT [FK_Productos_TiposDeProducto] FOREIGN KEY([idTipoDeProducto])
REFERENCES [dbo].[TiposDeProducto] ([idTipoDeProducto])
GO
ALTER TABLE [dbo].[Productos] CHECK CONSTRAINT [FK_Productos_TiposDeProducto]
GO
/****** Object:  ForeignKey [FK_Clientes_Barrios]    Script Date: 09/28/2014 13:06:04 ******/
ALTER TABLE [dbo].[Clientes]  WITH CHECK ADD  CONSTRAINT [FK_Clientes_Barrios] FOREIGN KEY([idBarrio])
REFERENCES [dbo].[Barrios] ([idBarrio])
GO
ALTER TABLE [dbo].[Clientes] CHECK CONSTRAINT [FK_Clientes_Barrios]
GO
/****** Object:  ForeignKey [FK_Clientes_TiposDeDocumento]    Script Date: 09/28/2014 13:06:04 ******/
ALTER TABLE [dbo].[Clientes]  WITH CHECK ADD  CONSTRAINT [FK_Clientes_TiposDeDocumento] FOREIGN KEY([idTiposDeDocumento])
REFERENCES [dbo].[TiposDeDocumento] ([idTiposDeDocumento])
GO
ALTER TABLE [dbo].[Clientes] CHECK CONSTRAINT [FK_Clientes_TiposDeDocumento]
GO
/****** Object:  ForeignKey [FK_Compras_Sucursales]    Script Date: 09/28/2014 13:06:04 ******/
ALTER TABLE [dbo].[Compras]  WITH CHECK ADD  CONSTRAINT [FK_Compras_Sucursales] FOREIGN KEY([idSucursal])
REFERENCES [dbo].[Sucursales] ([idSucursal])
GO
ALTER TABLE [dbo].[Compras] CHECK CONSTRAINT [FK_Compras_Sucursales]
GO
/****** Object:  ForeignKey [FK_Administradores_Sucursales]    Script Date: 09/28/2014 13:06:04 ******/
ALTER TABLE [dbo].[Administradores]  WITH CHECK ADD  CONSTRAINT [FK_Administradores_Sucursales] FOREIGN KEY([idSucursal])
REFERENCES [dbo].[Sucursales] ([idSucursal])
GO
ALTER TABLE [dbo].[Administradores] CHECK CONSTRAINT [FK_Administradores_Sucursales]
GO
/****** Object:  ForeignKey [FK_Administradores_TiposDeDocumento]    Script Date: 09/28/2014 13:06:04 ******/
ALTER TABLE [dbo].[Administradores]  WITH CHECK ADD  CONSTRAINT [FK_Administradores_TiposDeDocumento] FOREIGN KEY([idTiposDeDocumento])
REFERENCES [dbo].[TiposDeDocumento] ([idTiposDeDocumento])
GO
ALTER TABLE [dbo].[Administradores] CHECK CONSTRAINT [FK_Administradores_TiposDeDocumento]
GO
/****** Object:  ForeignKey [FK_Empleados_Sucursales]    Script Date: 09/28/2014 13:06:04 ******/
ALTER TABLE [dbo].[Empleados]  WITH CHECK ADD  CONSTRAINT [FK_Empleados_Sucursales] FOREIGN KEY([idSucursal])
REFERENCES [dbo].[Sucursales] ([idSucursal])
GO
ALTER TABLE [dbo].[Empleados] CHECK CONSTRAINT [FK_Empleados_Sucursales]
GO
/****** Object:  ForeignKey [FK_Empleados_TiposDeDocumento]    Script Date: 09/28/2014 13:06:04 ******/
ALTER TABLE [dbo].[Empleados]  WITH CHECK ADD  CONSTRAINT [FK_Empleados_TiposDeDocumento] FOREIGN KEY([idTiposDeDocumento])
REFERENCES [dbo].[TiposDeDocumento] ([idTiposDeDocumento])
GO
ALTER TABLE [dbo].[Empleados] CHECK CONSTRAINT [FK_Empleados_TiposDeDocumento]
GO
/****** Object:  ForeignKey [FK_StockEnSucursal_Productos]    Script Date: 09/28/2014 13:06:04 ******/
ALTER TABLE [dbo].[StockEnSucursal]  WITH CHECK ADD  CONSTRAINT [FK_StockEnSucursal_Productos] FOREIGN KEY([idProducto])
REFERENCES [dbo].[Productos] ([idProducto])
GO
ALTER TABLE [dbo].[StockEnSucursal] CHECK CONSTRAINT [FK_StockEnSucursal_Productos]
GO
/****** Object:  ForeignKey [FK_StockEnSucursal_Sucursales]    Script Date: 09/28/2014 13:06:04 ******/
ALTER TABLE [dbo].[StockEnSucursal]  WITH CHECK ADD  CONSTRAINT [FK_StockEnSucursal_Sucursales] FOREIGN KEY([idSucursal])
REFERENCES [dbo].[Sucursales] ([idSucursal])
GO
ALTER TABLE [dbo].[StockEnSucursal] CHECK CONSTRAINT [FK_StockEnSucursal_Sucursales]
GO
/****** Object:  ForeignKey [FK_DetallesDeCompras_Compras]    Script Date: 09/28/2014 13:06:04 ******/
ALTER TABLE [dbo].[DetallesDeCompras]  WITH CHECK ADD  CONSTRAINT [FK_DetallesDeCompras_Compras] FOREIGN KEY([idCompra])
REFERENCES [dbo].[Compras] ([idCompra])
GO
ALTER TABLE [dbo].[DetallesDeCompras] CHECK CONSTRAINT [FK_DetallesDeCompras_Compras]
GO
/****** Object:  ForeignKey [FK_DetallesDeCompras_Productos]    Script Date: 09/28/2014 13:06:04 ******/
ALTER TABLE [dbo].[DetallesDeCompras]  WITH CHECK ADD  CONSTRAINT [FK_DetallesDeCompras_Productos] FOREIGN KEY([idProducto])
REFERENCES [dbo].[Productos] ([idProducto])
GO
ALTER TABLE [dbo].[DetallesDeCompras] CHECK CONSTRAINT [FK_DetallesDeCompras_Productos]
GO
/****** Object:  ForeignKey [FK_Usuarios_Administradores]    Script Date: 09/28/2014 13:06:04 ******/
ALTER TABLE [dbo].[Usuarios]  WITH CHECK ADD  CONSTRAINT [FK_Usuarios_Administradores] FOREIGN KEY([idUsuario])
REFERENCES [dbo].[Administradores] ([idUsuario])
GO
ALTER TABLE [dbo].[Usuarios] CHECK CONSTRAINT [FK_Usuarios_Administradores]
GO
/****** Object:  ForeignKey [FK_Usuarios_Clientes]    Script Date: 09/28/2014 13:06:04 ******/
ALTER TABLE [dbo].[Usuarios]  WITH CHECK ADD  CONSTRAINT [FK_Usuarios_Clientes] FOREIGN KEY([idUsuario])
REFERENCES [dbo].[Clientes] ([idUsuario])
GO
ALTER TABLE [dbo].[Usuarios] CHECK CONSTRAINT [FK_Usuarios_Clientes]
GO
/****** Object:  ForeignKey [FK_Usuarios_Empleados]    Script Date: 09/28/2014 13:06:04 ******/
ALTER TABLE [dbo].[Usuarios]  WITH CHECK ADD  CONSTRAINT [FK_Usuarios_Empleados] FOREIGN KEY([idUsuario])
REFERENCES [dbo].[Empleados] ([idUsuario])
GO
ALTER TABLE [dbo].[Usuarios] CHECK CONSTRAINT [FK_Usuarios_Empleados]
GO
/****** Object:  ForeignKey [FK_Pedidos_Barrios]    Script Date: 09/28/2014 13:06:04 ******/
ALTER TABLE [dbo].[Pedidos]  WITH CHECK ADD  CONSTRAINT [FK_Pedidos_Barrios] FOREIGN KEY([idBarrioEntrega])
REFERENCES [dbo].[Barrios] ([idBarrio])
GO
ALTER TABLE [dbo].[Pedidos] CHECK CONSTRAINT [FK_Pedidos_Barrios]
GO
/****** Object:  ForeignKey [FK_Pedidos_EstadoDePedidos]    Script Date: 09/28/2014 13:06:04 ******/
ALTER TABLE [dbo].[Pedidos]  WITH CHECK ADD  CONSTRAINT [FK_Pedidos_EstadoDePedidos] FOREIGN KEY([idEstado])
REFERENCES [dbo].[EstadoDePedidos] ([idEstado])
GO
ALTER TABLE [dbo].[Pedidos] CHECK CONSTRAINT [FK_Pedidos_EstadoDePedidos]
GO
/****** Object:  ForeignKey [FK_Pedidos_Sucursales]    Script Date: 09/28/2014 13:06:04 ******/
ALTER TABLE [dbo].[Pedidos]  WITH CHECK ADD  CONSTRAINT [FK_Pedidos_Sucursales] FOREIGN KEY([idSucursal])
REFERENCES [dbo].[Sucursales] ([idSucursal])
GO
ALTER TABLE [dbo].[Pedidos] CHECK CONSTRAINT [FK_Pedidos_Sucursales]
GO
/****** Object:  ForeignKey [FK_Pedidos_Usuarios]    Script Date: 09/28/2014 13:06:04 ******/
ALTER TABLE [dbo].[Pedidos]  WITH CHECK ADD  CONSTRAINT [FK_Pedidos_Usuarios] FOREIGN KEY([idUsuario])
REFERENCES [dbo].[Usuarios] ([idUsuario])
GO
ALTER TABLE [dbo].[Pedidos] CHECK CONSTRAINT [FK_Pedidos_Usuarios]
GO
/****** Object:  ForeignKey [FK_DetallesDePedidos_Pedidos]    Script Date: 09/28/2014 13:06:04 ******/
ALTER TABLE [dbo].[DetallesDePedidos]  WITH CHECK ADD  CONSTRAINT [FK_DetallesDePedidos_Pedidos] FOREIGN KEY([idPedido])
REFERENCES [dbo].[Pedidos] ([idPedido])
GO
ALTER TABLE [dbo].[DetallesDePedidos] CHECK CONSTRAINT [FK_DetallesDePedidos_Pedidos]
GO
/****** Object:  ForeignKey [FK_DetallesDePedidos_Productos]    Script Date: 09/28/2014 13:06:04 ******/
ALTER TABLE [dbo].[DetallesDePedidos]  WITH CHECK ADD  CONSTRAINT [FK_DetallesDePedidos_Productos] FOREIGN KEY([idProducto])
REFERENCES [dbo].[Productos] ([idProducto])
GO
ALTER TABLE [dbo].[DetallesDePedidos] CHECK CONSTRAINT [FK_DetallesDePedidos_Productos]
GO
