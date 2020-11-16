USE KEEGAN_CORDOBA_DB
GO
CREATE VIEW Mostrar_Productos AS 
SELECT * FROM (
SELECT Nombre,IDCategoria,IDVariedad,Descripcion,Estado,
row_number() OVER (PARTITION BY IDVariedad ORDER BY P.IDVariedad ASC) AS fila
FROM Productos P
WHERE Estado = 1) ctd WHERE fila = 1
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
SELECT P.IDProducto,P.Nombre,P.Descripcion,P.IDTamaño,P.Precio FROM Productos P
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
SELECT * FROM Clientes

GO

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
			VALUES(@FechaCreacion,@IDCliente,@IDEstadoPedido,@IDFactura)
	End Try
	Begin Catch
		RAISERROR('Error al registrar el Pedido', 16,1)
	End Catch
End

------------------------------
exec SP_AgregarPedidos '2020-11-15',1,1,1
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

