CREATE DATABASE KEEGAN_CORDOBA_DB
GO
USE KEEGAN_CORDOBA_DB
GO
CREATE TABLE Localidades(
    IDLocalidad TINYINT not null PRIMARY KEY IDENTITY (1, 1),
    Nombre VARCHAR(50) not null,
	CodigoPostal SMALLINT not null
)
GO
CREATE TABLE Clientes(
    IDCliente BIGINT not null PRIMARY KEY IDENTITY (1, 1),
    Nombre VARCHAR(50) not null,
	Apellido VARCHAR(50) not null,
	FechaAlta DATE not null,
	Direccion VARCHAR(50) not null,
	IDLocalidad TINYINT null FOREIGN KEY REFERENCES Localidades(IDLocalidad),
	Email VARCHAR(50) not null,
	Telefono VARCHAR(50) not null

)
GO
CREATE TABLE EstadoPedidos(
    IDEstadoPedido TINYINT not null PRIMARY KEY IDENTITY(1, 1),
    Nombre VARCHAR(50) not null,
	Descripcion VARCHAR(100) not null
)
GO
CREATE TABLE EstadoFacturas(
    IDEstadoFactura TINYINT not null PRIMARY KEY IDENTITY (1, 1),
    Nombre VARCHAR(50) not null
)
GO

CREATE TABLE Facturas(
    IDFactura BIGINT not null PRIMARY KEY IDENTITY (1, 1),
    Nombre VARCHAR(50) not null,
	FechaEmision DATE not null,
	IDEstadoFactura TINYINT null FOREIGN KEY REFERENCES EstadoFacturas(IDEstadoFactura)
)
GO
CREATE TABLE Tamaños(
	IDTamaño TINYINT not null PRIMARY KEY IDENTITY (1, 1),
    Nombre varchar(50) not null
)
GO
CREATE TABLE Variedades(
	IDVariedad TINYINT not null PRIMARY KEY IDENTITY (1, 1),
    Nombre VARCHAR(50) not null,
)
GO
CREATE TABLE Categorias(
    IDCategoria TINYINT not null PRIMARY KEY IDENTITY (1, 1),
	Nombre VARCHAR(50) not null,
)
GO
CREATE TABLE Productos(
    IDProducto SMALLINT not null PRIMARY KEY IDENTITY (1, 1),
    Nombre VARCHAR(50) not null,
	Precio MONEY not null,
	IDCategoria TINYINT not null FOREIGN KEY REFERENCES Categorias(IDCategoria),
	IDVariedad TINYINT not null FOREIGN KEY REFERENCES Variedades(IDVariedad),
	IDTamaño TINYINT not null FOREIGN KEY REFERENCES Tamaños(IDTamaño),
	Estado BIT not null,
	Descripcion VARCHAR(100) null
)
GO
CREATE TABLE Pedidos(
    IDPedido BIGINT not null PRIMARY KEY IDENTITY (1, 1),
    FechaCreacion DATE not null,
	IDCliente BIGINT not null FOREIGN KEY REFERENCES Clientes(IDCliente),
	IDEstadoPedido TINYINT not null FOREIGN KEY REFERENCES EstadoPedidos(IDEstadoPedido),
	IDFactura BIGINT not null FOREIGN KEY REFERENCES Facturas(IDFactura),
)
GO
CREATE TABLE DetallePedidos(
    IDDetallePedido BIGINT not null PRIMARY KEY IDENTITY  (1, 1),
    Cantidad TINYINT not null,
	Subtotal MONEY not null,
	IDProducto SMALLINT not null FOREIGN KEY REFERENCES Productos(IDProducto),
	IDPedido BIGINT not null FOREIGN KEY REFERENCES Pedidos(IDPedido),
)
GO
CREATE TABLE CategoriasTamaños(
	IDCategoria TINYINT not null FOREIGN KEY REFERENCES Categorias(IDCategoria),
	IDTamaño TINYINT not null FOREIGN KEY REFERENCES Tamaños(IDTamaño),
	PRIMARY KEY(IDCategoria,IDTamaño)
)

GO
CREATE TABLE CategoriasVariedades(
	IDCategoria TINYINT not null FOREIGN KEY REFERENCES Categorias(IDCategoria),
	IDVariedad TINYINT not null FOREIGN KEY REFERENCES Variedades(IDVariedad),
	PRIMARY KEY(IDCategoria,IDVariedad)
)
GO

ALTER TABLE KEEGAN_CORDOBA_DB..DetallePedidos ADD CONSTRAINT DP_Cant_SoloPositivos CHECK(Cantidad>0);
GO
ALTER TABLE KEEGAN_CORDOBA_DB..DetallePedidos ADD CONSTRAINT DP_SBT_SoloPositivos CHECK(Subtotal>=0);
GO
ALTER TABLE KEEGAN_CORDOBA_DB..Clientes ADD CONSTRAINT cc_ValidarTel CHECK(Telefono like '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]');
GO
ALTER TABLE KEEGAN_CORDOBA_DB..Clientes ADD CONSTRAINT chk_email CHECK (Email like '%_@__%.__%');
GO
ALTER TABLE KEEGAN_CORDOBA_DB..Clientes ADD CONSTRAINT P_FechaAlta CHECK (CAST(FechaAlta AS DATE) <= CAST(GETDATE() AS DATE) );
GO
ALTER TABLE KEEGAN_CORDOBA_DB..Productos ADD CONSTRAINT P_SoloPositivos CHECK(Precio>=0);
GO
ALTER TABLE KEEGAN_CORDOBA_DB..Pedidos ADD CONSTRAINT P_Fecha CHECK (CAST(FechaCreacion AS DATE) <= CAST(GETDATE() AS DATE) );
GO
ALTER TABLE KEEGAN_CORDOBA_DB..Facturas ADD CONSTRAINT P_FechaFactura CHECK (CAST(FechaEmision AS DATE) <= CAST(GETDATE() AS DATE) );


select*From Mostrar_Prod_Detalle