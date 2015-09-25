<%@ Page Title="Contact Us" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="NHCostumes.Contact" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2><%: Title %></h2>
    <div class="row"><div class="col-sm-6">
    <address>
        Helen Smith & Natasha Yates<br />
        50 Kraft Dr<br />
        Kitchener, ON <br />
        N2J 4G8<br />
    </address>
        <h3>Hours of Operation </h3>        Thursday 6pm-8:30pm<br />        Friday 6pm-8:30pm<br />        Saturday 9am-1pm<br />        Appointments may be accomodated by request<br /><br />
    <address>
        <strong>Email:</strong>   <a href="mailto:nhcostumes@gmail.com">nhcostumes@gmail.com</a>
    </address><div id="mainform" runat="server">
        <label for='name'>Name:</label><asp:TextBox ID="Name" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="Name" ErrorMessage="RequiredFieldValidator">* Please enter your name</asp:RequiredFieldValidator>
            <br/><label for='name'>Email:</label><asp:TextBox ID="emailaddr" runat="server"></asp:TextBox>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="emailaddr" ErrorMessage="RegularExpressionValidator" Display="Dynamic" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">* Please enter a valid email address</asp:RegularExpressionValidator>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="emailaddr" Display="Dynamic" ErrorMessage="RequiredFieldValidator">* Please enter an email address</asp:RequiredFieldValidator>
            <br/><label for='comments'>Message:</label><textarea name='comments' id='comments' runat="server"></textarea><br />
            <label>
            </label><asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="comments">* Please enter a message</asp:RequiredFieldValidator><br/><label></label><asp:Button ID="sendbtn" runat="server" Text="Send" OnClick="sendbtn_Click" />
        </div>
       
        </div><div class="col-sm-6">
    <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d2894.709104086608!2d-80.46597489999999!3d43.4875408!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x882bf3379e598a3b%3A0x7f8a966af4ca1518!2s50+Kraft+Dr%2C+Waterloo%2C+ON+N2J+4G8!5e0!3m2!1sen!2sca!4v1441847906432" width="600" height="450" frameborder="0" style="border:0" allowfullscreen></iframe>
            </div></div>
</asp:Content>
