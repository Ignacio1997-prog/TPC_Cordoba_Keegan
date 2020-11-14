<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Envios.aspx.cs" Inherits="Pizzeria.Envios" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div style="padding-top:600px" class="container">
       <div class="dialog-container">
           <div style="height:500px;" class="dialog">
               <div class="dialog-title">
                            <h2 style="text-align:center">Donde entregamos el pedido?</h2>
               </div>
               <div class="dialog-buttons">
                   <div>
                       <label>Complete la informacion para el envio</label>
                   </div>
               </div>
               <div class="dialog-body">
                   <p style="display:inline-block">Calle: <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control input-lg" Width="250px" TabIndex="1"></asp:TextBox></p>
                   <p style="display:inline-block">Numero: <asp:TextBox ID="TextBox2" runat="server" CssClass="form-control input-lg" Width="250px" TabIndex="1"></asp:TextBox></p>
                   <p style="display:inline-block">Entre : <asp:TextBox ID="TextBox3" runat="server" CssClass="form-control input-lg" Width="250px" TabIndex="1"></asp:TextBox></p> 
                   <p style="display:inline-block"> y Entre: <asp:TextBox ID="TextBox4" runat="server" CssClass="form-control input-lg" Width="250px" TabIndex="1"></asp:TextBox></p>
                   <!-- lista de localidades
                       <asp:DropDownList ID="localidades" runat="server">
                            
                        </asp:DropDownList>
                       -->
                   <p>Localidad: <asp:TextBox ID="TextBox5" runat="server" CssClass="form-control input-lg" Width="250px" TabIndex="1"></asp:TextBox></p>
                   <p>Telefono: <asp:TextBox ID="TextBox6" runat="server" CssClass="form-control input-lg" Width="250px" TabIndex="1"></asp:TextBox></p>
               </div>
               
               <div style="text-align:center">
                   <asp:LinkButton CssClass="btn btn-secondary mr-auto" ID = "LinkButton1" runat="server" Text='Aceptar' OnClick ="btnAceptar_Click"></asp:LinkButton>
               </div>
         </div>
       </div>
         
   </div>
</asp:Content>
