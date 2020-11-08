<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Pizzeria._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <section class ="products">
    <div class="row">

        <% foreach (Dominio.Producto item in listaProducto)
            {%>
        <div class="row">
                <% if (item.IDCategoria == 1)
 
                    {%>
                        <div class="col-md-4">
                            <div class="card" style="width: 12rem;">

                                <img class="card-img-top" src="https://www.demoslavueltaaldia.com/sites/default/files/styles/recetas_listado/public/pizza-de-mozzarella-jamon-y-morron.jpg.jpg?itok=_lTpWe1d" alt="Card image cap">
                                <div class="card-body">
                                    <a href="#"><h5 class="card-title"><%  = item.Nombre%></h5></a>
                                </div>
                            </div>
                        </div>
                <% }%>
        
              </div>
    </div>
        <div class="row">
                <% if (item.IDCategoria == 2)
                    {%>
                <div class="col-md-4">
                    <div class="card" style="width: 12rem;">
                        
                        <img class="card-img-top" src="https://t2.rg.ltmcdn.com/es/images/6/9/4/img_empanadas_de_jamon_queso_y_huevo_7496_600.jpg" alt="Card image cap">
                        <div class="card-body">
                            <a href="#"><h5 class="card-title"><%  = item.Nombre%></h5></a>
                        </div>
                    </div>
                </div>
                 <% }%>
            <% }%>
    </div>
    </section>
    <section>
        <div class="sidebar">
                <div class="order-contents">
                    <h2>Tu Pedido</h2>
                </div>
                    <div class="empty-cart">Choose a pizza<br>to get started</div>
                <div class="order-total">
                    <span class="total-price">0.00</span>
                    <a href="checkout" class="btn btn-warning")">
                        Orden >
                    </a>
    </div>
</div>

    </section>

</asp:Content>
