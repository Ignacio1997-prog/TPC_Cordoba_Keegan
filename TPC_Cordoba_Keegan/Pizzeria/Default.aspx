<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Pizzeria._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">



    <hr />
    <center>
        <h5 class="p-2 bg-warning text-primary">Pizza</h5>
    </center>

    <hr />

    <center>
        <div class="row">

                <% foreach (Dominio.Producto item in listaProducto)
                    {%>
                <% if (item.idCategoria == 1)
                    {%>
                        <asp:Repeater runat="server" ID="list">
                        </asp:Repeater>
                        <div class="col-md-4">
                            <div class="card" style="width: 18rem;">

                                <img class="card-img-top" src="..." alt="Card image cap">
                                <div class="card-body">
                                    <h5 class="card-title"><%  = item.Nombre%></h5>
                                    <%--<p class="card-text"><%  = item.Descripcion%></p>--%>
                                    <h5 class="card-title">$<%  = item.Precio%></h5>
                                    <a href="#" class="btn btn-primary">Agregar</a>
                                </div>
                            </div>
                        </div>
                <% }%>

                <%}%>
        
              </div>
    </center>
    <hr />
    <center>
    <h5 class="p-2 bg-warning text-primary">Empanadas</h5>
    </center>
    
    <hr />
    <center>

        <div class="row">
                <% foreach (Dominio.Producto item in listaProducto)
                    {%>
                <% if (item.idCategoria == 2)
                    {%>
                <asp:Repeater runat="server" ID="Repeater1">
                </asp:Repeater>
                <div class="col-md-4">
                    <div class="card" style="width: 18rem;">

                        <img class="card-img-top" src="..." alt="Card image cap">
                        <div class="card-body">
                            <h5 class="card-title"><%  = item.Nombre%></h5>
                            <%--<p class="card-text"><%  = item.Descripcion%></p>--%>
                            <h5 class="card-title">$<%  = item.Precio%></h5>
                            <a href="#" class="btn btn-primary">Agregar</a>
                        </div>
                    </div>
                </div>
                <% }%>

                <%}%>
            </div>

    </center>



</asp:Content>
