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
	Calle VARCHAR(50) not null,
	Numero int not null,
	EntreCalle1 VARCHAR(50) null,
	EntreCalle2 VARCHAR(50) null,
	Piso TINYINT null,
	Departamento VARCHAR(3) null,
	IDLocalidad TINYINT null FOREIGN KEY REFERENCES Localidades(IDLocalidad),
	Telefono VARCHAR(20) not null

)
GO
CREATE TABLE RolUsuario(
    IDRol TINYINT not null PRIMARY KEY IDENTITY (1, 1),
    Nombre VARCHAR(50) not null,
)
GO
CREATE TABLE Usuarios(
    IDUsuario BIGINT not null FOREIGN KEY REFERENCES Clientes(IDCliente),
	NombreUsuario VARCHAR(50) not null,
	Clave VARCHAR(20) not null,
    FechaAlta DATE not null,
	Email VARCHAR(50) not null,
	IDRol TINYINT FOREIGN KEY REFERENCES RolUsuario(IDRol),
	PRIMARY KEY (IDUsuario)
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
CREATE TABLE Categorias(
    IDCategoria TINYINT not null PRIMARY KEY IDENTITY (1, 1),
	Nombre VARCHAR(50) not null,
)

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
CREATE TABLE Envios(
    IDPedido BIGINT not null FOREIGN KEY REFERENCES Pedidos(IDPedido),
    Calle VARCHAR(50) not null,
	Numero int not null,
	EntreCalle1 VARCHAR(50) not null,
	EntreCalle2 VARCHAR(50) not null,
	Piso TINYINT not null,
	Departamento VARCHAR(3) not null,
	IDLocalidad TINYINT null FOREIGN KEY REFERENCES Localidades(IDLocalidad),
	Telefono VARCHAR(20) not null,
	Observaciones VARCHAR(100) not null
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

CREATE FUNCTION dbo.VariedadCorrecta(@variedad TINYINT,@categoria TINYINT)

    RETURNS bit
    AS
    BEGIN
     DECLARE @return bit;

     IF(@variedad) IN ( SELECT CV.IDVariedad FROM CategoriasVariedades CV
	 WHERE CV.IDCategoria = @categoria)
     SET @return = 'true';
     ELSE
     SET @return = 'false';

     RETURN @return;

    END;
GO
CREATE FUNCTION dbo.TamañoCorrecto(@tamaño TINYINT,@categoria TINYINT)

    RETURNS bit
    AS
    BEGIN
     DECLARE @return bit;

     IF(@tamaño) IN ( SELECT CT.IDTamaño FROM CategoriasTamaños CT
	 WHERE CT.IDCategoria = @categoria)
     SET @return = 'true';
     ELSE
     SET @return = 'false';

     RETURN @return;

    END;
GO

Select* From Pedidos

DROP PROCEDURE PedidoxIDCliente

 CREATE PROCEDURE PedidoxIDCliente(@ID TINYINT)
    AS BEGIN
      SELECT P.IDPedido,P.FechaCreacion,EP.Nombre,P.IDFactura
      from Pedidos P,EstadoPedidos EP where IDCliente = @ID and EP.IDEstadoPedido=P.IDEstadoPedido
    END

DROP PROCEDURE DetallePedidoxIDPedido

CREATE PROCEDURE DetallePedidoxIDPedido(@ID TINYINT)
	AS BEGIN
      Select IDDetallePedido,Cantidad,Subtotal,P.Nombre From DetallePedidos DP, Productos P,Pedidos PED
	  Where PED.IDCliente=@ID and PED.IDPedido=DP.IDPedido and P.IDProducto=DP.IDProducto 
    END

EXEC DetallePedidoxIDPedido 1

exec PedidoxIDCliente 1
Select * From Clientes
Select * From Usuarios
Select * From RolUsuario
Select * From Pedidos
Select * From DetallePedidos

 CREATE PROCEDURE EstadoPedidoxID(@ID TINYINT)
    AS BEGIN
      SELECT Nombre,Descripcion
      from EstadoPedidos where IDEstadoPedido = @ID
    END

exec EstadoPedidoxID 2

GO

ALTER TABLE KEEGAN_CORDOBA_DB..DetallePedidos ADD CONSTRAINT DP_Cant_SoloPositivos CHECK(Cantidad>0);
GO
ALTER TABLE KEEGAN_CORDOBA_DB..DetallePedidos ADD CONSTRAINT DP_SBT_SoloPositivos CHECK(Subtotal>=0);
GO
ALTER TABLE KEEGAN_CORDOBA_DB..Clientes ADD CONSTRAINT cc_ValidarTelCliente CHECK(Telefono like '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]');
GO
ALTER TABLE KEEGAN_CORDOBA_DB..Envios ADD CONSTRAINT cc_ValidarTelEnvio CHECK(Telefono like '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]');
GO
ALTER TABLE KEEGAN_CORDOBA_DB..Usuarios ADD CONSTRAINT chk_email CHECK (Email like '%_@__%.__%');
GO
ALTER TABLE KEEGAN_CORDOBA_DB..Usuarios ADD CONSTRAINT P_FechaAlta CHECK (CAST(FechaAlta AS DATE) <= CAST(GETDATE() AS DATE) );
GO
ALTER TABLE KEEGAN_CORDOBA_DB..Productos ADD CONSTRAINT P_SoloPositivos CHECK(Precio>=0);
GO
ALTER TABLE KEEGAN_CORDOBA_DB..Productos ADD CONSTRAINT P_VariedadCorrecta CHECK(dbo.VariedadCorrecta(IDVariedad,IDCategoria) = 'true');
GO
ALTER TABLE KEEGAN_CORDOBA_DB..Productos ADD CONSTRAINT P_TamañoCorrecto CHECK(dbo.TamañoCorrecto(IDTamaño,IDCategoria) = 'true');
GO
ALTER TABLE KEEGAN_CORDOBA_DB..Pedidos ADD CONSTRAINT P_Fecha CHECK (CAST(FechaCreacion AS DATE) <= CAST(GETDATE() AS DATE) );
GO
ALTER TABLE KEEGAN_CORDOBA_DB..Facturas ADD CONSTRAINT P_FechaFactura CHECK (CAST(FechaEmision AS DATE) <= CAST(GETDATE() AS DATE) );

