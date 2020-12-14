<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Recuperar.aspx.cs" Inherits="Pizzeria.Recuperar" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
     <div style="padding-top:600px" class="container">
       <div class="dialog-container">
           <div style="height:450px" class="dialog">
               <div style="text-align:center" class="dialog-title">
                            <h2>Recuperar Productos</h2>
               </div>
               <div class="dialog-buttons">
                      <div>
                           <label>Elija el producto a recuperar</label>
                      </div>
               </div>
               <div class="dialog-body">
                   <asp:LinkButton CssClass="btn btn-primary mr-auto" ID = "LinkButton1" runat="server" Text='Recuperar todos' OnClick ="btnRecuperarTodos_Click"></asp:LinkButton>
                       <asp:Repeater runat="server" ID="product">
                             <ItemTemplate>
                                   <div> 
                                       <label style="text-align:left"><%# Eval("NombreTamanio")%></label>
                                         <div style="display:inline-block;margin-left: 60%;">
                                               <asp:LinkButton CssClass="btn btn-primary mr-auto" ID = "LinkButton2" runat="server" Text='Recuperar' OnClick ="btnRecuperar_Click" CommandArgument=<%# Eval("IDProducto")%>></asp:LinkButton> 
                                        </div>                                           
                                    </div>
                             </ItemTemplate>
                       </asp:Repeater>
               </div>
               <div style="text-align:center">
                   <asp:LinkButton CssClass="btn btn-secondary mr-auto" ID = "LinkButton3" runat="server" Text='Cancelar' OnClick ="btnCancelar_Click"></asp:LinkButton>
               </div>
         </div>
       </div>
         
   </div>
</asp:Content>
