<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Pizzeria._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="container">
       <div class="row">
          <section style="margin-top:80px">
               <% foreach (Dominio.Producto item in listaProducto)
                  {%>
                        <% if (item.IDCategoria == 1)
                           {%>
                            <div class="col-md-6">
                                <div class="main">
                                    <ul class="pizza-cards">
                                                <li style="background-image: url('https://www.demoslavueltaaldia.com/sites/default/files/styles/recetas_listado/public/pizza-de-mozzarella-jamon-y-morron.jpg.jpg?itok=_lTpWe1d')">
                                                    <div class="pizza-info">
                                                        <span class="title"><%  = item.Nombre%></span>
                                                        <span class="price"><%  = item.Precio%></span>
                                                    </div>
                                                </li>
                                    </ul>
                                </div>
                            </div>
                        <% }%>  
                        <% if (item.IDCategoria == 2)
                           {%>
                            <div class="col-md-6">
                                <div class="main">
                                    <ul class="pizza-cards">
                                                <li style="background-image: url('https://t2.rg.ltmcdn.com/es/images/6/9/4/img_empanadas_de_jamon_queso_y_huevo_7496_600.jpg')">
                                                    <div class="pizza-info">
                                                        <span class="title"><%  = item.Nombre%></span>
                                                        <span class="price"><%  = item.Precio%></span>
                                                    </div>
                                                </li>
                                    </ul>
                                </div>
                            </div>
                        <% }%>
               <% }%> 
            </section>
                <div class="col-md-6 col-sm-6 pull-right">
                    <div class="sidebar">
                       <div class="order-contents">
                           <h2>Tu Pedido</h2>
                       </div>
                        <div class="empty-cart">Selecciona un producto</div>
                         <div class="order-total">
                           <span class="total-price">0.00</span>
                              <a href="checkout" class="btn btn-warning" style="margin-left:8em">
                                Orden</a>
                         </div>
                      </div>
                </div>
         </div>
     </div>  
</asp:Content>
