<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="DetalleEnvio.aspx.cs" Inherits="Pizzeria.Envios" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div style="padding-top:500px" class="container">
       <div class="dialog-container">
           <div style="width:800px;" class="dialog">
               <div class="dialog-title">
                            <h2 style="text-align:center">Donde entregamos el pedido?</h2>
               </div>
               <div class="dialog-buttons">
                   <div>
                       <label>Complete la informacion para el envio</label>
                   </div>
               </div>
               <div class="dialog-body">
                   <p style="display:inline-block">Calle: <asp:TextBox ID="calle" runat="server" CssClass="form-control input-lg" Width="250px" TabIndex="1"></asp:TextBox></p>
                   <asp:RequiredFieldValidator runat="server" CssClass="error-text" id="reqCalle" controltovalidate="calle" errormessage="Ingrese un valor" />
                   <p style="display:inline-block">Numero: <asp:TextBox ID="numero" runat="server" CssClass="form-control input-lg" Width="250px" TabIndex="1"></asp:TextBox></p>
                   <asp:RequiredFieldValidator runat="server" CssClass="error-text" id="reqNumero" controltovalidate="numero" errormessage="Ingrese un valor" />
                   <p style="display:inline-block">Entre : <asp:TextBox ID="entre1" runat="server" CssClass="form-control input-lg" Width="250px" TabIndex="1"></asp:TextBox></p>
                   <asp:RequiredFieldValidator runat="server" CssClass="error-text" id="reqEntre1" controltovalidate="entre1" errormessage="Ingrese un valor" />
                   <p style="display:inline-block"> y Entre: <asp:TextBox ID="entre2" runat="server" CssClass="form-control input-lg" Width="250px" TabIndex="1"></asp:TextBox></p>
                   <asp:RequiredFieldValidator runat="server" CssClass="error-text" id="reqEntre2" controltovalidate="entre2" errormessage="Ingrese un valor" />
                   <p>Localidad <asp:DropDownList ID="localidades" runat="server" AutoPostBack="True" ></asp:DropDownList></p>
                   <p style="display:inline-block">Piso : <asp:TextBox ID="piso" runat="server" CssClass="form-control input-lg" Width="250px" TabIndex="1"></asp:TextBox></p> 
                   <p style="display:inline-block">Departamento: <asp:TextBox ID="departamento" runat="server" CssClass="form-control input-lg" Width="250px" TabIndex="1"></asp:TextBox></p>
                   <p style="display:inline-block">Telefono: <asp:TextBox ID="telefono" runat="server" CssClass="form-control input-lg" Width="250px" TabIndex="1"></asp:TextBox></p>
                   <asp:RequiredFieldValidator runat="server" CssClass="error-text" id="reqTel" controltovalidate="telefono" errormessage="Ingrese un numero valido" />
                   <p style="display:inline-block"> Observaciones: <asp:TextBox ID="observaciones" runat="server" CssClass="form-control input-lg" Width="500px" TabIndex="1"></asp:TextBox></p>
                    <p style="text-align:center">
                        <asp:LinkButton CssClass="btn btn-secondary mr-auto" ID = "LinkButton2" runat="server" Text='Aceptar' OnClick ="btnAceptar_Click"></asp:LinkButton>
                    </p>
               </div>
         </div>
       </div>
         
   </div>
</asp:Content>
