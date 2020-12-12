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


CREATE VIEW Get_IDPedido AS 
SELECT TOP 1 IDPedido FROM Pedidos ORDER BY IDPedido DESC
GO




CREATE FUNCTION Detalle_Producto
(
@categoria TINYINT,
@variedad TINYINT
)
RETURNS TABLE
AS
RETURN
(
SELECT P.IDProducto,P.Nombre,P.Descripcion,P.IDTamaño,T.Nombre NombreTamaño,P.Precio,P.Estado FROM Productos P
JOIN Tamaños T ON T.IDTamaño = P.IDTamaño
WHERE IDCategoria = @categoria AND IDVariedad = @variedad
)
GO


CREATE Procedure SP_AgregarCliente(
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
		INSERT INTO Clientes(Nombre,Apellido,Calle,Numero,EntreCalle1,EntreCalle2,Piso,Departamento,IDLocalidad,Telefono)
			VALUES(@Nombre,@Apellido,@Calle,@numero,@EntreCalle1,@EntreCalle2,@Piso,@Departamento,@IDLocalidad,@Telefono)
	End Try
	Begin Catch
		RAISERROR('Error al registrar Cliente', 16,1)
	End Catch
End

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

GO

CREATE Procedure SP_RemoverProducto(
	@id SMALLINT
)
AS
Begin
	Begin Try
		DELETE FROM Productos WHERE IDProducto = @id
	End Try
	Begin Catch
		RAISERROR('Error al borrar el Producto', 16,1)
	End Catch
End

GO

CREATE Procedure SP_RemoverProductoTodos(
	@categoria TINYINT,
	@variedad TINYINT
)
AS
Begin
	Begin Try
		DELETE FROM Productos WHERE IDCategoria = @categoria AND IDVariedad = @variedad
	End Try
	Begin Catch
		RAISERROR('Error al borrar el Producto', 16,1)
	End Catch
End

GO


CREATE Procedure SP_ModificarPrecio(
	@producto SMALLINT,
	@precio MONEY
)
AS
Begin
	Begin Try
		UPDATE Productos SET Precio = @precio WHERE IDProducto = @producto
	End Try
	Begin Catch
		RAISERROR('Error al modificar el Producto', 16,1)
	End Catch
End

GO

CREATE Procedure SP_ModificarNombre(
	@producto SMALLINT,
	@nombre VARCHAR(50)
)
AS
Begin
	Begin Try
		UPDATE Productos SET Nombre = @nombre WHERE IDProducto = @producto
	End Try
	Begin Catch
		RAISERROR('Error al modificar el Producto', 16,1)
	End Catch
End

GO


CREATE TRIGGER TR_BajaLogica_Producto ON Productos
INSTEAD OF DELETE
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION
			DECLARE @producto SMALLINT
			SELECT @producto = IDProducto FROM DELETED

			UPDATE Productos SET Estado = 0 WHERE IDProducto = @producto

		COMMIT TRANSACTION
	END TRY
	BEGIN CATCH
		ROLLBACK TRANSACTION
	END CATCH
END

GO

CREATE Procedure SP_listarPedidos
AS
Begin
	Begin Try
		SELECT P.IDPedido,FORMAT(P.FechaCreacion,'hh:mm') as FechaCreacion,C.Nombre,C.Apellido,CONCAT(E.Calle,SPACE(1),E.Numero,SPACE(1),L.Nombre) as Direccion,EP.IDEstadoPedido,EP.Nombre Estado,SUM(DP.Subtotal) as Total FROM Pedidos P 
		JOIN Clientes C ON P.IDCliente = C.IDCliente
		JOIN DetallePedidos DP ON DP.IDPedido = P.IDPedido
		JOIN EstadoPedidos EP ON EP.IDEstadoPedido = P.IDEstadoPedido
		JOIN Envios E ON E.IDPedido = P.IDPedido
		JOIN Localidades L ON L.IDLocalidad = E.IDLocalidad
		GROUP BY P.IDPedido,P.FechaCreacion,C.Nombre,C.Apellido,CONCAT(E.Calle,SPACE(1),E.Numero,SPACE(1),L.Nombre),EP.IDEstadoPedido,EP.Nombre
		ORDER BY DATEDIFF ( minute , GETDATE() , P.FechaCreacion )
	End Try
	Begin Catch
		RAISERROR('Error al listar los pedidos', 16,1)
	End Catch
End

GO



CREATE PROCEDURE SP_PedidoxIDCliente(@ID TINYINT)
    AS BEGIN
      SELECT P.IDPedido,P.FechaCreacion,EP.Nombre,P.IDFactura
      from Pedidos P,EstadoPedidos EP where IDCliente = @ID and EP.IDEstadoPedido=P.IDEstadoPedido
	END

GO

CREATE PROCEDURE SP_EstadoPedidoxID(@ID TINYINT)
    AS BEGIN
      SELECT Nombre,Descripcion
      from EstadoPedidos where IDEstadoPedido = @ID
    END


GO

CREATE Procedure SP_ModificarEstado(
	@pedido BIGINT,
	@estado TINYINT
)
AS
Begin
	Begin Try
		UPDATE Pedidos SET IDEstadoPedido = @estado WHERE IDPedido = @pedido
	End Try
	Begin Catch
		RAISERROR('Error al modificar el Pedido', 16,1)
	End Catch
End

GO

CREATE Procedure SP_RegistrarEnvio(
	@IDPedido BIGINT,
	@Calle varchar(50),
	@Numero int,
	@EntreCalle1 varchar(50),
	@EntreCalle2 varchar(50),
	@Piso int,
	@Departamento varchar(3),
	@IDLocalidad tinyint,
	@Telefono varchar(20),
	@Observaciones varchar(100)
)
AS
Begin
	Begin Try
		Insert into Envios VALUES (@IDPedido,@Calle,@Numero,@EntreCalle1,@EntreCalle2,@Piso,NULLIF(@Departamento,''),@IDLocalidad,@Telefono,NULLIF(@Observaciones, ''))
	End Try
	Begin Catch
		RAISERROR('Error al registrar el envio', 16,1)
	End Catch
End

GO

DBCC CHECKIDENT ('Variedades', RESEED, 6)

SELECT * FROM Variedades

DELETE FROM Variedades WHERE IDVariedad = 7

SELECT * FROM CategoriasVariedades