<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Gracias.aspx.cs" Inherits="Pizzeria.Gracias" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
     <div style="padding-top:600px" class="container">
       <div class="dialog-container">
           <div class="dialog">
               <div style="text-align:center" class="dialog-title">
                            <h2>Gracias por su compra!</h2>
               </div>
               <div class="dialog-buttons">
                      <div>
                           <label>Puede seguir su pedido con la opcion envio en la pantalla principal</label>
                      </div>
               </div>
               <div style="text-align:center">
                   <asp:LinkButton CssClass="btn btn-secondary mr-auto" ID = "LinkButton3" runat="server" Text='Aceptar' OnClick ="btnAceptar_Click"></asp:LinkButton>
               </div>
         </div>
       </div>
         
   </div>
</asp:Content>
