<%@ Page Title="About" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Envios.aspx.cs" Inherits="Pizzeria.About" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2> ESTADO DE SU PEDIDO </h2>
    <h3> Aqui podra ver el progreso de su pedido </h3>
    <p></p>

    
    <div class="progress">
        <div class="progress-bar" style="width: 70%"></div>
    </div>

</asp:Content>
