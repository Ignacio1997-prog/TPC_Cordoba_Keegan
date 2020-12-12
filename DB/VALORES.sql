USE KEEGAN_CORDOBA_DB
GO

INSERT INTO Categorias VALUES ('Pizza')
INSERT INTO Categorias VALUES ('Empanadas')
INSERT INTO Categorias VALUES ('Pollo')
INSERT INTO Categorias VALUES ('Hamburguesa')

INSERT INTO Tamaños VALUES ('Individual')
INSERT INTO Tamaños VALUES ('Chico')
INSERT INTO Tamaños VALUES ('Media')
INSERT INTO Tamaños VALUES ('Grande')
INSERT INTO Tamaños VALUES ('Docena')

INSERT INTO Variedades VALUES ('Jamon y Queso')
INSERT INTO Variedades VALUES ('Jamon y Morron')
INSERT INTO Variedades VALUES ('Pollo')
INSERT INTO Variedades VALUES ('Roquefort')
INSERT INTO Variedades VALUES ('Carne')
INSERT INTO Variedades VALUES ('Muzarella')

INSERT INTO CategoriasTamaños VALUES (1,2)
INSERT INTO CategoriasTamaños VALUES (1,3)
INSERT INTO CategoriasTamaños VALUES (1,4)
INSERT INTO CategoriasTamaños VALUES (2,1)
INSERT INTO CategoriasTamaños VALUES (2,5)

INSERT INTO CategoriasVariedades VALUES (1,2)
INSERT INTO CategoriasVariedades VALUES (1,4)
INSERT INTO CategoriasVariedades VALUES (1,6)
INSERT INTO CategoriasVariedades VALUES (2,1)
INSERT INTO CategoriasVariedades VALUES (2,3)
INSERT INTO CategoriasVariedades VALUES (2,5)

INSERT INTO Productos VALUES ('Pizza de morron',100,1,2,2,1,'Pizza de morron chica de 4 porciones')
INSERT INTO Productos VALUES ('Pizza de morron',180,1,2,3,1,'Pizza de morron media de 6 porciones')
INSERT INTO Productos VALUES ('Pizza de morron',250,1,2,4,1,'Pizza de morron grande de 12 porciones')

INSERT INTO Productos VALUES ('Pizza de muzarella',80,1,6,2,1,'Pizza de muzarella chica de 4 porciones')
INSERT INTO Productos VALUES ('Pizza de muzarella',160,1,6,3,1,'Pizza de muzarella media de 6 porciones')
INSERT INTO Productos VALUES ('Pizza de muzarella',230,1,6,4,1,'Pizza de muzarella grande de 12 porciones')

INSERT INTO Productos VALUES ('Empanadas de jamon y queso',40,2,1,1,1,'Empanada de jamon y queso individual')
INSERT INTO Productos VALUES ('Empanadas de jamon y queso',180,2,1,5,1,'Docena de empanadas de jamon y queso')

INSERT INTO Productos VALUES ('Empanadas pollo',50,2,3,1,1,'Empanada de pollo individual')
INSERT INTO Productos VALUES ('Empanadas de jamon y queso',200,2,3,5,1,'Docena de empanadas de pollo')


INSERT INTO Localidades(Nombre,CodigoPostal)
VALUES('Vicente Lopez',1636),
('Olivos',1636), 
('Florida',1602), 
('Villa Martelli',1603);


--------------------------
INSERT INTO Facturas(Nombre,FechaEmision)
VALUES('A121BZ1',GETDATE()),
('A121BZ2',GETDATE()),
('A121BZ3',GETDATE());

INSERT INTO EstadoPedidos(Nombre,Descripcion)
VALUES('Confirmado','Su pedido fue confirmado'),
('Cancelado','Su pedido fue cancelado'),
('Demorado','Su pedido fue confirmado'),
('En camino','Su pedido va en camino');


INSERT INTO RolUsuario VALUES('Cliente'),('Admin')

INSERT INTO Clientes VALUES ('Ignacio','Keegan','test',1,null,null,null,null,1,'1126739473')

INSERT INTO Clientes VALUES ('admin','Keegan','test',1,null,null,null,null,1,'1126739473')

INSERT INTO Usuarios VALUES (1,'igna','1',GETDATE(),'ignaciokeegan@gmail.com',1),
							(2,'admin','1234',GETDATE(),'ignaciokeegan@gmail.com',2)


DELETE FROM EstadoPedidos WHERE IDEstadoPedido = 8

select * from EstadoPedidos