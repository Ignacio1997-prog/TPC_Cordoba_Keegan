<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Pizzeria.Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
     <div style="padding-top:600px;width:500px" class="container">
       <div style="text-align:center" class="dialog-container">
            <div style="width:400px" class="dialog">
                <asp:Login ID="Login1" runat="server" Height="373px" Width="346px" MembershipProvider="AspNetSqlMembershipProvider"
                    CreateUserText="Registrarse" CreateUserUrl="~/Register.aspx" OnAuthenticate="Login1_Authenticate"
                    InstructionText="Ingrese su usuario y clave para ingresar." 
                    PasswordRecoveryUrl="Recuperar.aspx" PasswordRecoveryText="¿Olvidaste tu contraseña?">
                    <TextBoxStyle CssClass="BootstrapTextBoxStyle" />
                    <LoginButtonStyle CssClass="Bootstrapbuttonstyle" />
                    <CheckBoxStyle CssClass="BootstrapCheckboxStyle" />

                </asp:Login>
	        </div>
        </div>
    </div>
</asp:Content>
