<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Pizzeria._Default" %>



<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="container">
        <div class="row">
            <div class="col-8 col-md-8 col-sm-6">
                <section style="margin-top: 80px">
                            <asp:Repeater runat="server" ID="pizzas">
                                <ItemTemplate>
                                    <div class="col-md-3">
                                        <div class="main">
                                            <ul class="pizza-cards">
                                                <li style="background-image: url('https://www.demoslavueltaaldia.com/sites/default/files/styles/recetas_listado/public/pizza-de-mozzarella-jamon-y-morron.jpg.jpg?itok=_lTpWe1d')">
                                                        <div class="pizza-info">
                                                            <% if((bool)Session["Admin"]) { %>
                                                            <asp:LinkButton CssClass="btn btn-danger" ID = "LinkButton1" runat="server" Text='X' OnClick ="btnRemover_Click" CommandArgument=<%# Eval("IDCategoria").ToString() + "," + Eval("IDVariedad").ToString() %>></asp:LinkButton></td>
                                                            <asp:LinkButton CssClass="btn btn-primary" ID = "LinkButton2" runat="server" Text='--' OnClick ="btnModificar_Click" CommandArgument=<%# Eval("IDCategoria").ToString() + "," + Eval("IDVariedad").ToString() %>></asp:LinkButton></td>
                                                            <% }                                    %>
                                                            <span class="title"><%# Eval("Nombre")%></span>
                                                            <% if((bool)Session["Admin"] == false) { %>
                                                            <asp:LinkButton CssClass="btn btn-primary" ID = "LinkButton3" runat="server" Text='Detalle' OnClick ="btnDetalle_Click" CommandArgument=<%# Eval("IDCategoria").ToString() + "," + Eval("IDVariedad").ToString() %>></asp:LinkButton>
                                                            <% }                                    %>
                                                        </div>
                                                    </a>
                                                </li>
                                            </ul>
                                        </div> 
                                    </div> 
                                </ItemTemplate>
                            </asp:Repeater>
                            <asp:Repeater runat="server" ID="empanadas">
                                <ItemTemplate>
                                    <div class="col-md-3">
                                         <div class="main">
                                            <ul class="pizza-cards">
                                                <li style="background-image: url('https://t2.rg.ltmcdn.com/es/images/6/9/4/img_empanadas_de_jamon_queso_y_huevo_7496_600.jpg')">
                                                        <div class="pizza-info">
                                                            <% if((bool)Session["Admin"]) { %>
                                                            <asp:LinkButton CssClass="btn btn-danger" ID = "LinkButton1" runat="server" Text='X' OnClick ="btnRemover_Click" CommandArgument=<%# Eval("IDCategoria").ToString() + "," + Eval("IDVariedad").ToString() %>></asp:LinkButton></td>
                                                            <asp:LinkButton CssClass="btn btn-primary" ID = "LinkButton2" runat="server" Text='--' OnClick ="btnModificar_Click" CommandArgument=<%# Eval("IDCategoria").ToString() + "," + Eval("IDVariedad").ToString() %>></asp:LinkButton></td>
                                                            <% }                                    %>
                                                            <span class="title"><%# Eval("Nombre")%></span>
                                                            <% if((bool)Session["Admin"] == false) { %>
                                                            <asp:LinkButton CssClass="btn btn-primary" ID = "LinkButton4" runat="server" Text='Detalle' OnClick ="btnDetalle_Click" CommandArgument=<%# Eval("IDCategoria").ToString() + ","  +  Eval("IDVariedad").ToString() %>></asp:LinkButton>
                                                            <% }                                    %>
                                                        </div>
                                                </li>
                                            </ul>
                                        </div> 
                                    </div> 
                                </ItemTemplate>
                            </asp:Repeater>
                  </section>
             </div>
           <div class="col-4 col-md-4 col-sm-6 sidebar">
                <div class="order-contents">
                      <h2>Tu Pedido</h2>
                    <asp:Repeater runat="server" ID="cart">
                        <ItemTemplate>
                            <div class="cart-item">
                              <%# Eval("Cantidad")%> - <%# Eval("Nombre")%> - $<%# Eval("Precio")%>
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>
                 </div>
                 <div class="empty-cart">Selecciona un producto</div>

                  <div class="order-total">
                       <span class="total-price"><%= total %></span>
                      <a href="CarritoCompras.aspx" class="btn btn-warning" style="margin-left: 8em">Orden</a>
                 </div>
            </div>
    </div> 
</div> 
</asp:Content>
