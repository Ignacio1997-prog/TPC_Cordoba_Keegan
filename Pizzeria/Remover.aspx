<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Remover.aspx.cs" Inherits="Pizzeria.Remover" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div style="padding-top:600px" class="container">
       <div class="dialog-container">
           <div style="height:450px" class="dialog">
               <div style="text-align:center" class="dialog-title">
                            <h2>Remover Producto</h2>
               </div>
               <div class="dialog-buttons">
                      <div>
                           <label>Elija el producto a remover</label>
                      </div>
               </div>
               <div class="dialog-body">
                   <asp:LinkButton CssClass="btn btn-primary mr-auto" ID = "LinkButton1" runat="server" Text='Remover todos' OnClick ="btnRemoverTodos_Click"></asp:LinkButton>
                       <asp:Repeater runat="server" ID="product">
                             <ItemTemplate>
                                   <div> 
                                       <label style="text-align:left"><%# Eval("NombreTamanio")%></label>
                                         <div style="display:inline-block;margin-left: 60%;">
                                               <asp:LinkButton CssClass="btn btn-primary mr-auto" ID = "LinkButton2" runat="server" Text='Remover' OnClick ="btnRemover_Click" CommandArgument=<%# Eval("IDProducto")%>></asp:LinkButton> 
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
