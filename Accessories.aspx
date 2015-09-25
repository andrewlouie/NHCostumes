<%@ Page Title="Accessories" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Accessories.aspx.cs" Inherits="NHCostumes.Accessories" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
        
    <script>
$(window).scroll(function () {
	var scroll = $(window).scrollTop();
	if (scroll >= 320 && scroll < $(document).height() - 500) { 
		$('.fixednav').addClass('fixednav2');
		$('.fixednav').removeClass('fixednav3');
		$('.fixednav').css('top','10px'); 
	}
	else if (scroll >= $(document).height() - 500) { 
		$('.fixednav').css('top',$(document).height() - 950); 
		$('.fixednav').addClass('fixednav3');
	}
	else { 
	$('.fixednav').removeClass('fixednav2');
	$('.fixednav').removeClass('fixednav3');
	}
	var b = 1;
	for (var a=1;a<=document.getElementsByTagName('h2').length;a++) {
		if (scroll > $("h2:nth-of-type(" + a + ")").offset().top-5) b = a;
	}
	$('.fixednav>ul>li').removeClass('active');
	$('.fixednav>ul>li:nth-child(' + (b) + ')').addClass('active');
	
});

</script>
<div class="row">
<div class="col-sm-3 hidden-xs">
<div class="fixednav">
<ul class="nav nav-pills nav-stacked">
<asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource3">
<ItemTemplate>
<li role="presentation">
 <a href="#<%# Eval("category") %>"><%# Eval("category") %></a>
</li>
</ItemTemplate>
</asp:Repeater>
</ul>
</div></div>
<div class="col-sm-9" id="aamaindiv" runat="server">

    </div></div>
</asp:Content>
