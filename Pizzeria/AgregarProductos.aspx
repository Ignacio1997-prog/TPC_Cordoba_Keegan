<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AgregarProductos.aspx.cs" Inherits="Pizzeria.AgregarProductos" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div style="padding-top:800px" class="container">
       <div class="dialog-container">
           <div style="height:800px;" class="dialog">
               <div class="dialog-title">
                            <h2 style="text-align:center">Ingrese la informacion del nuevo producto</h2>
               </div>
               <div class="dialog-buttons">
                   <div>
                       <label>Complete la informacion</label>
                   </div>
               </div>
               <div class="dialog-body">
                   <div class ="row">
                       <div class="col-6 col-md-6 col-sm-4">
                           <p style="display:inline-block">Nombre: <asp:TextBox ID="Nombre" runat="server" CssClass="form-control input-lg" Width="250px" TabIndex="1"></asp:TextBox></p>
                           <br />
                           <p style="display:inline-block">Escriba una breve descripcion del producto: <asp:TextBox ID="Descripcion" TextMode="MultiLine" runat="server" CssClass="form-control input-lg" Width="250px" TabIndex="1"></asp:TextBox></p>
                           <br />
                           <p style="display:inline-block">Escriba la nueva variedad del producto: <asp:TextBox ID="Variedad" runat="server" CssClass="form-control input-lg" Width="250px" TabIndex="1"></asp:TextBox></p>
                           <br />
                           <p> Elija la categoria del producto
                           <asp:DropDownList ID="categorias" runat="server" AutoPostBack="True" onselectedindexchanged="itemSelected" >
                           </asp:DropDownList> </p>
                           <br />
                           <a href="AgregarTamaños.aspx">Agregar Tamaño</a>
                       </div>
                           <div class="col-6 col-md-6 col-sm-4 float-right">
                               <asp:Repeater runat="server" ID="tamaños">
                                     <ItemTemplate>
                                           <div>
                                               <asp:Label id="IDTamanio" Text=<%# Eval("IDTamanio")%> Visible="False" runat="server" />
                                               <label id="nombreTamaño" style="text-align:left"><%# Eval("NombreTamanio")%>  <p style="display:inline-block">Ingrese el precio : <asp:TextBox ID="Precio" runat="server" CssClass="form-control input-lg" Width="250px" TabIndex="1"></asp:TextBox></p>                                          
                                            </div>
                                     </ItemTemplate>
                               </asp:Repeater> 
                           </div>
                           <br />
                       <div style="text-align:center">
                            <asp:LinkButton CssClass="btn btn-secondary mr-auto" ID = "LinkButton2" runat="server" Text='Confirmar Producto' OnClick ="btnAceptar_Click"></asp:LinkButton>
                        </div>
                    </div>
               </div>
           </div>
         </div>      
   </div>
</asp:Content>
