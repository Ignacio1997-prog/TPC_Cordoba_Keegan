<%@ Page Title="Detalle" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Detalle.aspx.cs" Inherits="Pizzeria.Detalle" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">
        <% if (detalle.IDCategoria == 2)
            {%>
        <br /><br /><br />
        <img id="imagen" runat="server" src="https://t2.rg.ltmcdn.com/es/images/6/9/4/img_empanadas_de_jamon_queso_y_huevo_7496_600.jpg" alt="..." />
        <p style="font-size: 15px" runat="server">Descripcion: <%= detalle.Descripcion %> </p>
        <h3 style="border-bottom: thin; font-size: 25px" runat="server"><%= detalle.Nombre %></h3>
        <hr />
        <p style="border-bottom: thin; font-size: 15px" runat="server"><%= detalle.IDTamanio %> </p>
        <hr />
        <p style="border-bottom: thin; font-size: 15px" runat="server">Precio: <%= detalle.Precio %> </p>
        <hr />

        <% }%>
        <!--PIZZA--->
        <% if (detalle.IDCategoria == 1)
            {%>
        <br /><br /><br />
        <img id="Img1" runat="server" src="https://www.demoslavueltaaldia.com/sites/default/files/styles/recetas_listado/public/pizza-de-mozzarella-jamon-y-morron.jpg.jpg?itok=_lTpWe1d" alt="..." />
        <div class="btn-group">
            <button type="button" class="btn btn-primary">Chica</button>
            <button type="button" class="btn btn-primary">Mediana</button>
            <button type="button" class="btn btn-primary">Grande</button>
        </div>
        <p style="font-size: 15px" runat="server">Descripcion: <%= detalle.Descripcion %> </p>
        <h3 style="border-bottom: thin; font-size: 25px" runat="server"><%= detalle.Nombre %></h3>
        <hr />
        <p style="border-bottom: thin; font-size: 15px" runat="server"><%= detalle.IDTamanio %> </p>
        <hr />
        <p style="border-bottom: thin; font-size: 15px" runat="server">Precio: <%= detalle.Precio %> </p>
        <hr />

        <% }%>
        <button type="button" class="btn btn-primary btn-lg">Realizar Pago</button>
    </div>
</asp:Content>
