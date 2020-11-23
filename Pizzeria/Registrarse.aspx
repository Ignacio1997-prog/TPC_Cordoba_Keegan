<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Registrarse.aspx.cs" Inherits="Pizzeria.Registrarse" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div style="padding-top:80px">
            <asp:CreateUserWizard ID="CreateUserWizard1" runat="server" OnCreatingUser="CreateUserWizard1_CreatingUser" CreateUserButtonText="Registrarse">
                <WizardSteps>
                    <asp:CreateUserWizardStep ID="CreateUserWizardStep" runat="server">
                        <ContentTemplate>
                            <h2 class="order-contents">Registrese</h2>
                            <hr />
                            <div class="container">
                                <div class="row">
                                    <div class="col-6 col-md-6 col-sm-6 pull-left">
                                        <table>
                                                <tr>
                                                    <td>Usuario:
                                                    </td>
                                                    <td>
                                                        <asp:TextBox ID="UserName" runat="server"></asp:TextBox>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>Nombre:
                                                    </td>
                                                    <td>
                                                        <asp:TextBox ID="Nombre" runat="server"></asp:TextBox>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>Apellido:
                                                    </td>
                                                    <td>
                                                        <asp:TextBox ID="Apellido" runat="server"></asp:TextBox>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>Contraseña:
                                                    </td>
                                                    <td>
                                                        <asp:TextBox ID="Password" runat="server" TextMode="Password"></asp:TextBox></td>
                                                </tr>
                                                <tr>
                                                    <td>Confirme contraseña:</td>
                                                    <td><asp:TextBox ID="ConfirmPassword" runat="server" TextMode="Password"></asp:TextBox>
                                                    </td>
                                                </tr>
                                                <tr class="form-group">
                                                    <td>E-mail:
                                                    </td>
                                                    <td >
                                                        <asp:TextBox ID="Email" runat="server" TextMode="Email"></asp:TextBox>
                                                    </td>
                                                </tr>
                                        </table>
                                      </div>
                                            <div style="right:0;width: 120rem;" class="col-6 col-md-6 col-sm-6 pull-right">
                                                <table>
                                                    <tr>
                                                        <td>Calle:
                                                        </td>
                                                        <td>
                                                            <asp:TextBox ID="Calle" runat="server"></asp:TextBox>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>Numero:
                                                        </td>
                                                        <td>
                                                            <asp:TextBox ID="numeroCalle" runat="server"></asp:TextBox>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>Entre:
                                                        </td>
                                                        <td>
                                                            <asp:TextBox ID="EntreCalle1" runat="server"></asp:TextBox>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>y Entre:
                                                        </td>
                                                        <td>
                                                            <asp:TextBox ID="EntreCalle2" runat="server"></asp:TextBox>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>Piso:
                                                        </td>
                                                        <td>
                                                            <asp:TextBox ID="Piso" runat="server"></asp:TextBox>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>Departamento:
                                                        </td>
                                                        <td>
                                                            <asp:TextBox ID="Departamento" runat="server"></asp:TextBox>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>Localidad:
                                                        </td>
                                                        <td>
                                                            <asp:TextBox ID="Localidad" runat="server"></asp:TextBox>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>Telefono:
                                                        </td>
                                                        <td>
                                                            <asp:TextBox ID="Telefono" runat="server"></asp:TextBox>
                                                        </td>
                                                    </tr>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </ContentTemplate>
                    </asp:CreateUserWizardStep>
                    <asp:CompleteWizardStep runat="server"></asp:CompleteWizardStep>
                </WizardSteps>
            </asp:CreateUserWizard>
    </div>
</asp:Content>
