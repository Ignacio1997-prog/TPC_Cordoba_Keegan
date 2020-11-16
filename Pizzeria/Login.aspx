<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Pizzeria.Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div style="padding-top:600px" class="container">
       <div class="dialog-container">
            <div class="dialog">
                <asp:Login ID="Login1" runat="server" Height="373px" Width="346px">
                    <TextBoxStyle CssClass="BootstrapTextBoxStyle" />
                    <LoginButtonStyle CssClass="Bootstrapbuttonstyle" />
                    <CheckBoxStyle CssClass="BootstrapCheckboxStyle" />
                </asp:Login>
	        </div>
        </div>
    </div>
</asp:Content>
