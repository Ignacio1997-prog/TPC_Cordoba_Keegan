<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AgregarTamaños.aspx.cs" Inherits="Pizzeria.AgregarTamaños" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div style="padding-top:500px" class="container">
       <div class="dialog-container">
           <div class="dialog">
               <div class="dialog-title">
                            <h2 style="text-align:center">Agregar nuevos Tamaños</h2>
               </div>
               <div class="dialog-buttons">
                   <div>
                       <label>Complete los datos</label>
                   </div>
               </div>
               <div class="dialog-body">
                   <p> Elija la categoria del producto
                           <asp:DropDownList ID="categorias" runat="server" AutoPostBack="True" >
                           </asp:DropDownList> 
                   </p>
                   <p style="display:inline-block">Escriba el nuevo tamaño para la categoria: <asp:TextBox ID="nombre" runat="server" CssClass="form-control input-lg" Width="250px" TabIndex="1"></asp:TextBox></p>
                   <asp:RequiredFieldValidator runat="server" CssClass="error-text" id="reqCalle" controltovalidate="nombre" errormessage="Ingrese un valor" />
                    <p style="text-align:center">
                        <asp:LinkButton CssClass="btn btn-secondary mr-auto" ID = "LinkButton2" runat="server" Text='Aceptar' OnClick ="btnAceptar_Click"></asp:LinkButton>
                    </p>
               </div>
         </div>
       </div>
         
   </div>
</asp:Content>
