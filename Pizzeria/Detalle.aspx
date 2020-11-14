<%@ Page Title="Detalle" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Detalle.aspx.cs" Inherits="Pizzeria.Detalle" %>

<asp:Content ID="Content" ContentPlaceHolderID="MainContent" runat="server">
    <div style="padding-top:600px" class="container">
       <div class="dialog-container">
           <div style="height:450px" class="dialog">
               <div style="text-align:center" class="dialog-title">
                            <h2><% = Nombre  %></h2>
                            <% = Descripcion  %>
               </div>
               <div class="dialog-buttons">
                      <div>
                           <label>Seleccione el producto que desea</label>
                      </div>
               </div>
               <div class="dialog-body">
                   <asp:Repeater runat="server" ID="product">
                         <ItemTemplate>
                               <div>  
                                   <label style="text-align:left"><%# Eval("NombreTamanio")%> ($<%# Eval("Precio")%>)</label>
                                     <div style="display:inline-block;margin-left: 60%;">
                                           <asp:LinkButton CssClass="btn btn-primary mr-auto" ID = "LinkButton2" runat="server" Text='Seleccionar' OnClick ="btnComprar_Click" CommandArgument=<%# Eval("IDProducto")%>></asp:LinkButton> 
                                    </div>                                           
                                </div>
                         </ItemTemplate>
                   </asp:Repeater>
               </div>
               <div style="text-align:center">
                   <asp:LinkButton CssClass="btn btn-secondary mr-auto" ID = "LinkButton1" runat="server" Text='Cancelar' OnClick ="btnCancelar_Click"></asp:LinkButton>
               </div>
         </div>
       </div>
         
   </div>
</asp:Content>
