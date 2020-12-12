<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CarritoCompras.aspx.cs" Inherits="Pizzeria.CarritoCompras" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div class ="container">
        <div class ="row">
            <div style ="margin-bottom:30px; margin-top:50px;" class ="col-md-12">
                <table class ="table table-borderless">
                   <thead>
                        <tr>
                          <th scope="col">Nombre</th>
                          <th scope="col">Precio</th>
                          <th scope="col">Cantidad</th>
                          <th scope="col">Subtotal</th>
                          <th scope="col"></th>
                        </tr>
                      </thead>
                      <tbody>
                          <asp:Repeater runat="server" ID="cart">
                            <ItemTemplate>
                                <tr>
                                  <td style ="vertical-align:middle;font-size: 15px";><%# Eval("Descripcion")%></td>
                                  <td style ="vertical-align:middle;font-size: 15px";><%# Eval("Precio")%></td>
                                  <td style ="vertical-align:middle;font-size: 15px";><%# Eval("Cantidad")%>     <asp:LinkButton CssClass="btn btn-success" ID = "LinkButton1" runat="server" Text='+' OnClick ="btnAgregar_Click" CommandArgument=<%# Eval("IDProducto")%>></asp:LinkButton></td>
                                  <td style ="vertical-align:middle;font-size: 15px";><%# Eval("PrecioTotal")%></td>
                                  <td style ="vertical-align:middle";><asp:LinkButton CssClass="btn btn-danger" ID = "LinkButton3" runat="server" Text='X' OnClick ="btnRemover_Click" CommandArgument=<%# Eval("IDProducto")%>></asp:LinkButton></td>
                                </tr>
                            </ItemTemplate>
                        </asp:Repeater>
                  </tbody>
                    <tfoot>
                        <tr>
                            <td style="font-size: 15px"; class="right" colspan="4">Total </td><td style="font-size: 15px"; class="right"><% =carrito.Total%></td>
                        </tr>
                    </tfoot>
                </table>
                    <div class ="pull-right">
                        <a href="Default" class ="btn btn-light">Volver</a>
                        <a href="MetodoDePago.aspx" class ="btn btn-success">Checkout</a>
                    </div>
            </div>
          </div>
      </div>

</asp:Content>
