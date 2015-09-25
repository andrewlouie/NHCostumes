<%@ Page Title="Order Successful" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="paid.aspx.cs" Inherits="NHCostumes.paid" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
       <script>
        function clearCart() {
            var d = new Date();
            d.setTime(d.getTime() + 2592000000);
            var expires = "expires=" + d.toUTCString();
            document.cookie = "nhcart" + "=; " + expires + ";domain=nhcostumes.ca;path=/";
            document.getElementById('itemsincart').innerHTML = "0";
        }
    </script>
    <h2>Thank you for your order.  We will be in touch soon.</h2>
</asp:Content>
