<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ModificarProducto.aspx.cs" Inherits="Pizzeria.ModificarProducto" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div style="padding-top:600px" class="container">
       <div class="dialog-container">
           <div style="height:250px" class="dialog">
               <div style="text-align:center" class="dialog-title">
                            <h2>Modificar Precio</h2>
               </div>
               <div class="dialog-buttons">
                      <div>
                           <label>Elija el nuevo precio del producto</label>
                      </div>
               </div>
               <div class="dialog-body">
                       Precio: <asp:TextBox ID="precio" runat="server" EnableViewState="true"></asp:TextBox>
               </div>
               <div style="text-align:center">
                   <asp:LinkButton CssClass="btn btn-secondary mr-auto" ID = "LinkButton1" runat="server" Text='Aceptar' OnClick ="btnAceptar_Click"></asp:LinkButton>
                   <asp:LinkButton CssClass="btn btn-secondary mr-auto" ID = "LinkButton3" runat="server" Text='Cancelar' OnClick ="btnCancelar_Click"></asp:LinkButton>
               </div>
         </div>
       </div>
         
   </div>
</asp:Content>
