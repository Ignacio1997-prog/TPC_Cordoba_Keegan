<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Pizzeria._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">


    <div class="row">


        <% foreach (Dominio.Producto item in listaProducto)
            {%>

                <div class="col-md-4">
                    <div class="card" style="width: 18rem;">
                        
                        <img class="card-img-top" src="..." alt="Card image cap">
                        <div class="card-body">
                            <h5 class="card-title"><%  = item.Nombre%></h5>
                            <p class="card-text"><%  = item.Descripcion%></p>
                            <h5 class="card-title">$<%  = item.Precio%></h5>
                            <a href="#" class="btn btn-primary">Agregar</a>
                        </div>
                    </div>
                </div>
        <%}%>
    </div>


</asp:Content>
