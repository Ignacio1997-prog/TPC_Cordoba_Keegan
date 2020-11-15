<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="MetodoDePago.aspx.cs" Inherits="Pizzeria.MetodoDePago" %>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div style="padding-top: 600px" class="container">
        <div class="dialog-container">
            <div style="height: 500px;" class="dialog">
                <div class="dialog-title">
                    <h2 style="text-align: center">Metodo De Pago</h2>
                </div>
                <div class="dialog-buttons">
                    <div>
                        <label>Elija un metodo de pago</label>
                    </div>
                </div>
                <center>
                        <div class="form-check">
                            <label class="form-check-label">
                                <input type="radio" class="form-check-input" name="optradio">Efectivo     
                            </label>
                        </div>
                        <div class="form-check">
                            <label class="form-check-label">
                                <input type="radio" class="form-check-input" name="optradio">Mercado Pago
                            </label>
                        </div>
                </center>

                <div style="text-align: center">
                    <asp:LinkButton CssClass="btn btn-secondary mr-auto" ID="LinkButton2" runat="server" Text='Finalizar Compra' OnClick="LinkButton2_Click"></asp:LinkButton>
                </div>
            </div>
        </div>

    </div>
</asp:Content>

