CREATE DATABASE KEEGAN_CORDOBA_DB
GO
USE KEEGAN_CORDOBA_DB
GO
CREATE TABLE Localidades(
    IDLocalidad TINYINT not null PRIMARY KEY IDENTITY (1, 1),
    Nombre VARCHAR(50) not null,
	CodigoPostal SMALLINT not null
)

insert into Localidades(Nombre,CodigoPostal)
VALUES('Tigre',1648)

GO
CREATE TABLE Clientes(
    IDCliente BIGINT not null PRIMARY KEY IDENTITY (1, 1),
    Nombre VARCHAR(50) not null,
	Apellido VARCHAR(50) not null,
	Calle VARCHAR(50) not null,
	Numero int not null,
	EntreCalle1 VARCHAR(50) not null,
	EntreCalle2 VARCHAR(50) not null,
	Piso TINYINT not null,
	Departamento VARCHAR(3) not null,
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
	IDRol TINYINT FOREIGN KEY REFERENCES RolUsuario(IDRol)
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


Create Procedure SP_AgregarCliete(
	@Nombre varchar(50),
	@Apellido varchar(50),
	@Calle varchar(50),
	@numero int,
	@EntreCalle1 varchar(50),
	@EntreCalle2 varchar(50),
	@Piso TINYINT,
	@Departamento varchar(3),
	@IDLocalidad Tinyint,
	@Telefono varchar(20)
)
AS
Begin
	Begin Try
		Insert into Clientes(Nombre,Apellido,Calle,Numero,EntreCalle1,EntreCalle2,Piso,Departamento,IDLocalidad,Telefono)
			VALUES(@Nombre,@Apellido,@Calle,@numero,@EntreCalle1,@EntreCalle2,@Piso,@Departamento,@IDLocalidad,@Telefono
		)
	End Try
	Begin Catch
		RAISERROR('Error al registrar Cliente', 16,1)
	End Catch
End


exec SP_AgregarCliete 'Ignacio','Cordoba','Mascardi',123,'Colombia','Florida',0,0,1,'1132484848'

Select*From Clientes

------------------------------
insert into Facturas(Nombre,FechaEmision)
VALUES('Hola',GETDATE());
Select*From Facturas

insert into EstadoPedidos(Nombre,Descripcion)
VALUES('Confirmado','Su pedido fue confirmado');
------------------------------------

Create Procedure SP_AgregarPedidos(
	@FechaCreacion Date,
	@IDCliente Bigint,
	@IDEstadoPedido Tinyint,
	@IDFactura Bigint
)
AS
Begin
	Begin Try
		Insert into Pedidos(FechaCreacion,IDCliente,IDEstadoPedido,IDFactura)
			VALUES(@FechaCreacion,@IDCliente,@IDEstadoPedido,@IDFactura
		)
	End Try
	Begin Catch
		RAISERROR('Error al registrar Cliente', 16,1)
	End Catch
End

exec SP_AgregarPedidos '2020-11-15',6,1,1

Select*From Pedidos

-------------------------------------------------

Create Procedure SP_AgregarDetallePedido(
	@Cantidad Tinyint,
	@Subtotal Money,
	@IDProducto Smallint,
	@IDPedido Bigint
)
AS
Begin
	Begin Try
		Insert into DetallePedidos(Cantidad,Subtotal,IDProducto,IDPedido)
			VALUES(@Cantidad,@Subtotal,@IDProducto,@IDPedido
		)
	End Try
	Begin Catch
		RAISERROR('Error al registrar Cliente', 16,1)
	End Catch
End

exec SP_AgregarDetallePedido 3,180.0,1,1
