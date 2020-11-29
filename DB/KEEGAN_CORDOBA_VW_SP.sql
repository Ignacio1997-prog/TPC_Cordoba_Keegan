USE KEEGAN_CORDOBA_DB
GO
CREATE VIEW Mostrar_Productos AS 
SELECT * FROM (
SELECT Nombre,IDCategoria,IDVariedad,Descripcion,Estado,
row_number() OVER (PARTITION BY IDVariedad ORDER BY P.IDVariedad ASC) AS fila
FROM Productos P
WHERE Estado = 1) ctd WHERE fila = 1
GO

CREATE VIEW Mostrar_Localidades AS 
SELECT IDLocalidad,Nombre FROM Localidades
GO

CREATE VIEW Mostrar_Categorias AS 
SELECT IDCategoria,Nombre FROM Categorias
GO


CREATE FUNCTION Mostrar_Tamaños
(
@categoria TINYINT
)
RETURNS TABLE
AS
RETURN
(
SELECT DISTINCT TM.IDCategoria,T.IDTamaño,T.Nombre Nombre FROM CategoriasTamaños TM
JOIN Tamaños T ON T.IDTamaño = TM.IDTamaño
WHERE TM.IDCategoria = @categoria
)
GO


SELECT * FROM Tamaños

SELECT * FROM Get_ID

CREATE VIEW Get_ID AS 
SELECT TOP 1 IDCliente FROM Clientes ORDER BY IDCliente DESC
GO

CREATE VIEW Get_IDPedido AS 
SELECT TOP 1 IDPedido FROM Pedidos ORDER BY IDPedido DESC
GO

SELECT * FROM Get_IDPedido

CREATE FUNCTION Detalle_Producto
(
@categoria TINYINT,
@variedad TINYINT
)
RETURNS TABLE
AS
RETURN
(
SELECT P.IDProducto,P.Nombre,P.Descripcion,P.IDTamaño,T.Nombre NombreTamaño,P.Precio FROM Productos P
JOIN Tamaños T ON T.IDTamaño = P.IDTamaño
WHERE IDCategoria = @categoria AND IDVariedad = @variedad
)
GO


Create Procedure SP_AgregarCliente(
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
			VALUES(@Nombre,@Apellido,@Calle,@numero,@EntreCalle1,@EntreCalle2,@Piso,@Departamento,@IDLocalidad,@Telefono)
	End Try
	Begin Catch
		RAISERROR('Error al registrar Cliente', 16,1)
	End Catch
End
------------------------------
exec SP_AgregarCliente 'Ignacio','Cordoba','Mascardi',123,'Colombia','Florida',0,0,1,'1132484848'
------------------------------

GO

CREATE Procedure SP_AgregarUsuario(
	@IDCliente bigint,
	@NombreUsuario varchar(50),
	@Clave varchar(50),
	@Email varchar(50),
	@FechaAlta date = null,
	@IDRol tinyint = 1
)
AS
Begin
	Begin Try
		Insert into Usuarios VALUES(@IDCliente,@NombreUsuario,@Clave,GETDATE(),@Email,@IDRol)
	End Try
	Begin Catch
		RAISERROR('Error al registrar Usuario', 16,1)
	End Catch
End

------------------------------
exec SP_AgregarUsuario 3,'Cordoba','1','test@gmail.com',1
------------------------------


GO

CREATE Procedure SP_AgregarPedidos(
	@IDCliente Bigint,
	@IDFactura Bigint
)
AS
Begin
	Begin Try
		Insert into Pedidos
			VALUES(GETDATE(),@IDCliente,1,@IDFactura)
	End Try
	Begin Catch
		RAISERROR('Error al registrar el Pedido', 16,1)
	End Catch
End

------------------------------
exec SP_AgregarPedidos 1,1
------------------------------
GO

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
		RAISERROR('Error al registrar la Venta', 16,1)
	End Catch
End


------------------------------
exec SP_AgregarDetallePedido 2,180.0,1,1
exec SP_AgregarDetallePedido 4,360.0,2,1
exec SP_AgregarDetallePedido 3,330.0,6,1
------------------------------

SELECT * FROM CategoriasVariedades
DECLARE @id tinyint = SELECT CAST(scope_identity() AS int); 
INSERT INTO CategoriasVariedades VALUES (1,7)

GO

CREATE Procedure SP_AgregarProducto(
	@Nombre varchar(50),
	@Precio Money,
	@IDCategoria tinyint,
	@IDVariedad tinyint,
	@IDTamaño tinyint,
	@Estado BIT,
	@Descripcion varchar(50)
)
AS
Begin
	Begin Try
		Insert into Productos VALUES (@Nombre,@Precio,@IDCategoria,@IDVariedad,@IDTamaño,@Estado,@Descripcion)
	End Try
	Begin Catch
		RAISERROR('Error al registrar el Producto', 16,1)
	End Catch
End
------------
exec SP_AgregarProducto 'test',100,1,7,2,1,'test'
----------

