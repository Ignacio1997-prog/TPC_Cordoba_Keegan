<%@ Page Title="About" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Envios.aspx.cs" Inherits="Pizzeria.About" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div style="padding-top: 100px; height: 800px" class="container">

        <% if ((bool)Session["Admin"] == false)
            {%>
        <% if (Session["ID"] != null)
            {%>
        <h3>ESTADO DE SU PEDIDO </h3>
        <h4>Aqui podra ver todos sus pedidos hasta la actualidad </h4>
        <p></p>
        <%   foreach (Dominio.Pedido item in listaPedido)
            { %>
        <div id="accordion">

            <div class="card">
                <div class="card-header">
                    <a class="card-link" data-toggle="collapse" href="#collapseOne">
                        <% = item.FechaCreacion %>
                    </a>

                </div>
                <div id="collapseOne" class="collapse show" data-parent="#accordion">
                    <div class="card-body">
                        <p>Estado : <%  = item.EstadoPedido.Nombre %> </p>

                        <div class="container">
                            <table class="table table-bordered">
                                <thead>
                                    <tr>
                                        <th>Nombre</th>
                                        <th>Cantidad</th>
                                        <th>SubTotal</th>
                                        <th>TOTAL</th>
                                    </tr>
                                </thead>
                                <% foreach (Dominio.DetallePedido item2 in listaDetallePedido)
                                    { if (item.IDPedido == item2.IDPedido)
                                        {%>
                                <tbody>
                                    <tr>
                                        <td><%  = item2.Nombre%></td>
                                        <td><%  = item2.Cantidad%></td>
                                        <td><%  = item2.Precio%></td>
                                        <td><%  = item2.PrecioTotal%></td>
                                    </tr>
                                </tbody>
                                <% }
                                            }%>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <%} %>

        <%} %>
        <% }
            else
            {%>
        <h3>LISTA DE PEDIDOS </h3>
        <h4>Aqui podra ver los ultimos pedidos </h4>
        <p></p>
        <asp:GridView ID="PedidosGridView"
            EmptyDataText="No data available."
            CssClass="table table-bordered table-striped"
            AutoGenerateColumns="False"
            Width="100%"
            ViewStateMode="Enabled"
            DataKeyNames="IDPedido"
            runat="server" AllowSorting="True"
            SelectedRowStyle-BackColor="Crimson"
            OnRowDataBound="Estados_RowDataBound">
            <Columns>
                <asp:CommandField ShowSelectButton="True" />
                <asp:BoundField DataField="IDPedido" HeaderText="Pedido" ReadOnly="True" />
                <asp:BoundField DataField="FechaCreacion" HeaderText="Tiempo" ReadOnly="True" />
                <asp:BoundField DataField="NombreCliente" HeaderText="Nombre Cliente" ReadOnly="True" />
                <asp:BoundField DataField="Direccion" HeaderText="Direccion" ItemStyle-Width="200" ItemStyle-Wrap="False" ReadOnly="True" />
                <asp:BoundField DataField="_total" HeaderText="Total" ReadOnly="True" />
                <asp:BoundField DataField="NombreEstado" HeaderText="Estado" ReadOnly="True" Visible="true" />
                <asp:TemplateField HeaderText="Estado" SortExpression="Estado">
                    <ItemTemplate>
                        <asp:DropDownList ID="Estados" runat="server" AutoPostBack="true" OnSelectedIndexChanged="Estado_SelectedIndexChanged">
                        </asp:DropDownList>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>

        </asp:GridView>
        <% } %>
    </div>
</asp:Content>
