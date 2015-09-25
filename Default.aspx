<%@ Page Title="Welcome" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="NHCostumes.WebForm1" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row">
<div class="col-md-8">
<div class="row">
<div class="col-xs-4 coverimgs"><img src="include/grr.jpg" width="307" height="230" alt=""/></div>
<div class="col-xs-4 coverimgs"><img src="include/Consignor page 1-1.jpg" width="307" height="230" alt=""/></div>
<div class="col-xs-4 coverimgs"><img src="include/cover.jpg" width="307" height="230" alt=""/></div>
</div>
    <h2 style="text-align:center;color:#ff2c00">Celebrate Halloween With Us!</h2>
<p style="text-align:center;font-size: 24px;">At NH Costumes, we give the option of buying or renting Halloween costumes. Both new and gently used costumes are offered in a variety of styles and sizes. NH Costumes is creating a space for Halloween costume recycling, helping families in the Kitchener-Waterloo area save money and the environment. 
</p>
<p style="text-align:center;font-size: 20px;">Currently accepting new consignors! </p>  
</div><div class="col-md-4">
    
<div id="slider1_container" style="position: relative; top: 0px; left: 10px; width: 350px; height: 200px;">
    <!-- Slides Container -->
    <div u="slides" style="cursor: move; position: absolute; overflow: hidden; left: 0px; top: 0px; width: 350px; height: 200px;">
        <div><img u="image" src="include/image1.jpg" /></div>
        <div><a href="~/FAQ.aspx" runat="server"><img u="image" src="include/image2.jpg" /></a></div>
        <div><img u="image" src="include/image3.jpg" /></div>
    </div>
</div>
</div></div>
<hr/>
<h2>Featured Costumes</h2>
    <div class="row">
<asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource4">
<ItemTemplate> 
<div class="col-sm-3"><div class="aafeat">
<asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# "Item?id=" + Eval("item_id") %>'><span class="aatitle"><%# Eval("title") %></span>
<img src="<%# "images/" + Eval("pictures").ToString().Split(',')[0] %>" width="369" height="547" alt="<%# Eval("title") %>"/><br/>
<span class="aaprice">Rental Price: <%# String.Format("{0:C2}",Eval("rental")) %><br/>Purchase price: <%# String.Format("{0:C2}",Eval("purchase")) %></span>
</asp:HyperLink>
</div></div>
</ItemTemplate>
</asp:Repeater>
</div>
        <script src="Scripts/jssor.js"></script>
    <script>
        $(document).ready(function () {
            var options = { $AutoPlay: true };
            var jssor_slider1 = new $JssorSlider$('slider1_container', options);
        });
</script>
<asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:MyConnectionString %>" SelectCommand="SELECT TOP 4 * FROM costumes WHERE featured = 1 AND visible = 1 AND quantity > 0 ORDER BY NEWID();"></asp:SqlDataSource>
</asp:Content>
