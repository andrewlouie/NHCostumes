<%@ Page Title="Submit order" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="PayInPerson.aspx.cs" Inherits="NHCostumes.PayInPerson" %>
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
    <div class="form-group" id="mainform" runat="server">
        <asp:ValidationSummary ID="ValidationSummary1" runat="server" />
        <br />
    <asp:Label ID="Label1" runat="server" Text="Name: "></asp:Label><asp:TextBox ID="Name" runat="server" CssClass="form-control"></asp:TextBox><asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="Name" ErrorMessage="Name is a required field">*</asp:RequiredFieldValidator>
    <br />
    <asp:Label ID="Label2" runat="server" Text="Email:"></asp:Label>
    <asp:TextBox ID="Email" runat="server" CssClass="form-control"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="Email" ErrorMessage="Email address is required">*</asp:RequiredFieldValidator>
    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="Email" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ErrorMessage="Please enter a valid email address">*</asp:RegularExpressionValidator>
    <br />
    <asp:Label ID="Label3" runat="server" Text="Phone Number:"></asp:Label>
    <asp:TextBox ID="PhoneNumber" runat="server" CssClass="form-control"></asp:TextBox>
    <br />
    <asp:Label ID="Label4" runat="server" Text="Comments:"></asp:Label>
    <asp:TextBox ID="Comments" runat="server" CssClass="form-control" Rows="3" TextMode="MultiLine"></asp:TextBox>
    <br />
    <asp:Button ID="Button1" runat="server" Text="Submit Order" OnClick="Button1_Click" CssClass="btn btn-primary" /></div>
</asp:Content>
