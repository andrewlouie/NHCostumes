<%@ Page Title="Shopping Cart" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ShoppingCart.aspx.cs" Inherits="NHCostumes.ShoppingCart" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <script>
        function rbupdate(line,value) {
            var currentcart = "";
            var ca = document.cookie.split(';');
            for (var i = 0; i < ca.length; i++) {
                var c = ca[i];
                while (c.charAt(0) == ' ') c = c.substring(1);
                if (c.indexOf("nhcart") == 0) currentcart = c.substring(7, c.length);
            }
            var cc = currentcart.split(',');
            var ci = cc[line].split(':');
            if (ci[2] == undefined) return;
            ci[2] = ((value == "Rent") ? "true" : ci[2] = "false");
            cc[line] = ci.join(":");
            currentcart = cc.join(",");
            var d = new Date();
            d.setTime(d.getTime() + 2592000000);
            var expires = "expires=" + d.toUTCString();
            document.cookie = "nhcart" + "=" + currentcart + "; " + expires + ";domain=nhcostumes.ca;path=/";
        }
        function updatebtn(line,value) {
            var currentcart = ""
            var ca = document.cookie.split(';');
            for (var i = 0; i < ca.length; i++) {
                var c = ca[i];
                while (c.charAt(0) == ' ') c = c.substring(1);
                if (c.indexOf("nhcart") == 0) currentcart = c.substring(7, c.length);
            }
            var cc = currentcart.split(',');
            var ci = cc[line].split(':');
            ci[1] = value;
            cc[line] = ci.join(":");
            currentcart = cc.join(",");
            var d = new Date();
            d.setTime(d.getTime() + 2592000000);
            var expires = "expires=" + d.toUTCString();
            document.cookie = "nhcart" + "=" + currentcart + "; " + expires + ";domain=nhcostumes.ca;path=/";
        }
        function removebtn(line) {
            var currentcart = ""
            var ca = document.cookie.split(';');
            for (var i = 0; i < ca.length; i++) {
                var c = ca[i];
                while (c.charAt(0) == ' ') c = c.substring(1);
                if (c.indexOf("nhcart") == 0) currentcart = c.substring(7, c.length);
            }
            var cc = currentcart.split(',');
            cc.splice(line,1);
            currentcart = cc.join(",");
            var d = new Date();
            d.setTime(d.getTime() + 2592000000);
            var expires = "expires=" + d.toUTCString();
            document.cookie = "nhcart" + "=" + currentcart + "; " + expires + ";domain=nhcostumes.ca;path=/";
        }
    </script>

    <asp:UpdatePanel ID="UpdatePanel2" runat="server"><ContentTemplate>
    <h2>Shopping Cart</h2>
    <asp:Label ID="Label1" runat="server" Text="Label">Your shopping cart is empty</asp:Label>
    <asp:Table ID="Table1" runat="server" Width="100%" CssClass="carttable">
        <asp:TableHeaderRow runat="server">
            <asp:TableHeaderCell>Item Number</asp:TableHeaderCell>
            <asp:TableHeaderCell>Item Title</asp:TableHeaderCell>
            <asp:TableHeaderCell>Rent/Buy</asp:TableHeaderCell>
            <asp:TableHeaderCell>Price</asp:TableHeaderCell>
            <asp:TableHeaderCell>Quantity</asp:TableHeaderCell>
            <asp:TableHeaderCell>Total</asp:TableHeaderCell>
            <asp:TableHeaderCell>Remove</asp:TableHeaderCell>
        </asp:TableHeaderRow>

    </asp:Table>
    <asp:Literal ID="Literal1" runat="server"></asp:Literal><br /><br />
        <asp:Panel ID="Panel1" runat="server" DefaultButton="Button3">   <label>Coupon Code: </label>
        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
         
        <asp:Button ID="Button3" runat="server" Text="Submit" CSSClass="btn btn-warning" OnClick="Button3_Click"/>

        <asp:Label ID="Label2" runat="server"></asp:Label>
            </asp:Panel>
<input type='hidden' name='cmd' value='_cart'/><input type="hidden" name="return" value="http://www.nhcostumes.ca/paid.aspx"><input type='hidden' name='upload' value='1'/><input type='hidden' name='business' value='nhcostumes@gmail.com'/><input type='hidden' name='item_name' value='Item Name'/><input type='hidden' name='currency_code' value='CAD'/><input type='hidden' name='amount' value='0.00'/>
 <div class="buttons pull-right">
    <asp:Button CSSClass="btn btn-warning" ID="Button1" runat="server" Text="Pay in Person" Visible="False" PostBackUrl="~/PayInPerson.aspx"/>
    <asp:Button CSSClass="btn btn-warning" ID="Button2" runat="server" Text="Pay with PayPal" Visible="False" PostBackUrl="https://www.paypal.com/cgi-bin/webscr" />
     </div>
    <asp:PlaceHolder runat="server" ID="TextBoxPlaceHolder" /></ContentTemplate>
        </asp:UpdatePanel>
</asp:Content>
