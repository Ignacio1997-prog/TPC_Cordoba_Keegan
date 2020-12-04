<%@ Page Title="About" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Envios.aspx.cs" Inherits="Pizzeria.About" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <br />
    <h2>ESTADO DE SU PEDIDO </h2>
    <h3>Aqui podra ver el progreso de su pedido </h3>
    <p></p>

    <% if (Session["ID"] != null)
        {
            foreach (Dominio.Pedido item in listaPedido)
            {%>
            <div id="accordion">

                <div class="card">
                    <div class="card-header">
                        <a class="card-link" data-toggle="collapse" href="#collapseOne">
                            <% = item.FechaCreacion %>
                        </a>
                    </div>
                    <div id="collapseOne" class="collapse show" data-parent="#accordion">
                        <div class="card-body">
                            <p>Estado : <%  = item.EstadoPedido.Nombre%> </p>
                            <p> </p>
                            <p></p>
                        </div>
                    </div>
                </div>
            </div>
            <%}

    }%>
</asp:Content>
