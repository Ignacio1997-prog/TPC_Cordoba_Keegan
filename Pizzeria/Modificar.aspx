<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Modificar.aspx.cs" Inherits="Pizzeria.Modificar" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div style="padding-top:600px" class="container">
       <div class="dialog-container">
           <div style="height:450px" class="dialog">
               <div style="text-align:center" class="dialog-title">
                            <h2>Modificar Producto</h2>
               </div>
               <div class="dialog-buttons">
                      <div>
                           <label>Elija el producto a modificar</label>
                      </div>
               </div>
               <div class="dialog-body">
                   <p>
                   Nombre del producto <asp:TextBox ID="nombre" runat="server"></asp:TextBox>
                   </p>
                       <asp:Repeater runat="server" ID="product">
                             <ItemTemplate>
                                   <div> 
                                       <label style="text-align:left"><%# Eval("NombreTamanio")%></label>
                                         <div style="display:inline-block;margin-left: 60%;">
                                             <asp:LinkButton CssClass="btn btn-primary mr-auto" ID = "id" runat="server" OnClick="btnModificar_Click" Text='Modificar' CommandArgument=<%# Eval("IDProducto").ToString() %>> </asp:LinkButton> 
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
