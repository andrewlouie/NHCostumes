<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Item.aspx.cs" Inherits="NHCostumes.Item" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server"><div id="maindiv" runat="server">
<script>
    function getURLParameter(name) {
        return decodeURIComponent((new RegExp('[?|&]' + name + '=' + '([^&;]+?)(&|#|;|$)').exec(location.search) || [, ""])[1].replace(/\+/g, '%20')) || null
    }
    function setCookie(rent) {
        var currentcart = ""
        var ca = document.cookie.split(';');
        for (var i = 0; i < ca.length; i++) {
            var c = ca[i];
            while (c.charAt(0) == ' ') c = c.substring(1);
            if (c.indexOf("nhcart") == 0) currentcart = c.substring(7, c.length);
        }
        if (currentcart != "") {
            currentcart = currentcart + ",";
            var check = currentcart.split(',');
            for (var a = 0; a < check.length; a++) {
                b = check[a].split(':');
                if (b[0] == getURLParameter("id")) return;
            }
        }
        currentcart = currentcart + getURLParameter("id") + ":" + document.getElementById('<%= quantity.ClientID %>').value + ":" + rent;
        var d = new Date();
        d.setTime(d.getTime() + 2592000000);
        var expires = "expires=" + d.toUTCString();
        document.cookie = "nhcart" + "=" + currentcart + "; " + expires + ";domain=nhcostumes.ca;path=/";
        document.getElementById('itemsincart').innerHTML = currentcart.split(',').length;
    }
    function addtocart(rent) {
        setCookie(rent);
        $("html, body").animate({ scrollTop: 0 }, "fast", function () {
            $(".arrow-up").fadeIn(1500);
            $(".itemadded").fadeIn(1500, function () {
                $(".itemadded").fadeOut(1500);
                $(".arrow-up").fadeOut(1500);
            });
        });
    }
</script>
<!--jCarousel-->
<script src="./jCarousel/jquery-migrate-1.1.0.js"></script>
<script type="text/javascript" src="./jCarousel/jquery.jcarousel.pack.js"></script>
<!--/jCarousel-->
<!--FancyBox--> 
<script type="text/javascript" src="./fancybox/source/jquery.fancybox.pack.js?v=2.1.5"></script>
<!--/FancyBox-->

    <div id="fb-root"></div>
<script>(function (d, s, id) {
    var js, fjs = d.getElementsByTagName(s)[0];
    if (d.getElementById(id)) return;
    js = d.createElement(s); js.id = id;
    js.src = "https://connect.facebook.net/en_US/sdk.js#xfbml=1&version=v2.4";
    fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));</script>



    <a href='~/' runat="server">Home</a> > <a href='#' runat="server" ID="aascat2"></a> > <a href='#' runat="server" id="aascat"></a><br/><h2 runat="server" id="aastitle"></h2><div class='aahr'></div><br/>
    <div class='row'><div class='col-xs-4 imagebox'><a href='#' class='thumbnail fancybox' id='mainlink' rel='gallery' runat="server">
        
     <img src='#' id='mainimg' runat="server"/></a></div>
    <div runat="server" class='col-xs-8'>
        <div class="aasdesc" id='aasdesc' runat="server"></div>
        <div class="aasize" id="aasize" runat="server">Size: </div>
        <div class="aasize" id="aacondition" runat="server">Condition: </div>
        <hr/>
       Quantity:
            <asp:TextBox ID="quantity" runat="server" TextMode="Number" Text="1" CssClass="quantity"></asp:TextBox>
        <br /><br />
        <input runat="server" style="width:60px" type="button" class="btn btn-warning" id="Button1" value="Rent" onclick="addtocart(true)"/>
        <span class='price' id="aaprice" runat="server"></span>
        <br /><br /><input runat="server" style="width:60px" type="button" class="btn btn-warning" id="Button2" value="Buy" onclick="addtocart(false)"/>
        <span class='price' id="aaprice2" runat="server"></span>
        <br/><br />
        <span class='qtyinstock'>Quantity in stock: 
        <strong><span id="aaqty" runat="server"></span></strong>
        </span><br />
        <span id="notavail" runat="server"></span>
    </div>

    </div>
    
    <div class='row' id="aasthumbs" runat="server">
    

    </div><div class='row'><div class='col-xs-6 col-sm-3' style='text-align:center;'><!--google+--><script src='https://apis.google.com/js/platform.js' async defer></script><g:plus action='share'></g:plus></div><div class='col-xs-6 col-sm-3' style='text-align:center;'><!--twitter--><a href='https://twitter.com/share' class='twitter-share-button'>Tweet</a><script>!function (d, s, id) { var js, fjs = d.getElementsByTagName(s)[0], p = /^http:/.test(d.location) ? 'http' : 'https'; if (!d.getElementById(id)) { js = d.createElement(s); js.id = id; js.src = p + '://platform.twitter.com/widgets.js'; fjs.parentNode.insertBefore(js, fjs); } }(document, 'script', 'twitter-wjs');</script></div><div class='col-xs-6 col-sm-3' style='text-align:center;'><!--facebook--><div class='fb-like' data-layout='button_count' data-action='like' data-show-faces='true' data-share='true'></div></div><div class='col-xs-6 col-sm-3' style='text-align:center;'><!--pintrest--><a href='//www.pinterest.com/pin/create/button/' data-pin-do='buttonBookmark'  data-pin-color='red'><img src='//assets.pinterest.com/images/pidgets/pinit_fg_en_rect_red_20.png' /></a><script type='text/javascript' async defer src='//assets.pinterest.com/js/pinit.js'></script></div></div><br/><div class='aahr'></div><br/>
    
    
<script type="text/javascript">
	$(document).ready(function() {
	    $(".tnsmall").click(function () {
			$(".tnsmall").attr('rel','gallery');
			$(this).attr('rel','');
			$('#MainContent_mainimg').attr('src', this.href);
			$('#MainContent_mainlink').attr('href', this.href);
			event.stopPropagation();
			event.preventDefault();
		})
		$(".fancybox").fancybox();
  		$('.carousel').jcarousel();
		$("a[rel=gallery]").fancybox();
	});
</script>
    </div>
</asp:Content>
