<%@ Page Title="Consignors" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="consignors.aspx.cs" Inherits="NHCostumes.consignors" MaintainScrollPositionOnPostback="true" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
<script type="text/javascript">
    function validatePhoneNumbers(source, args) {
        var phoneHome = document.getElementById('<%= HomePhone.ClientID %>');
        var phoneBusiness = document.getElementById('<%= OtherPhone.ClientID %>');
        if (phoneHome.value != '' || phoneBusiness.value != '') {
            args.IsValid = true;
        }
        else {
            args.IsValid = false;
        }
    }
    function checkAgree(source,args) {
        if (document.getElementById('<%= agree.ClientID %>').checked == true)
            args.IsValid = true;
        else args.IsValid = false;
    }
</script>
    <h2>
    How to Consign</h2>
    <ol><li>Complete the form below in order to set up an appointment with NH Costumes.<ol style="list-style-type:lower-alpha">
<li>Once completed, NH Costumes will send a confirmation email to you in order schedule an appointment time. </li><li>
The appointment time will be set when a confirmation email has been sent to you.</li></ol>
</li><li>NH Costumes will assign you a Consignor ID number within the email confirmation.</li>
<li>Prepare for your Consignor appointment.<ol style="list-style-type:lower-alpha">
<li>Review the below Consignor Agreement. </li>
    <li>Create a list of all costumes and whether you have a preference if they are rent or sell (or both).</li>
<li>Inspect and prepare all costumes. We ask the following of all costume items prior to
being brought to NH Costumes.</li><ol style="list-style-type:lower-roman"><li>
Be freshly laundered or dry cleaned</li>
<li>Be freshly ironed or steamed</li>
<li>Be free of stains, rips, lose threads, missing buttons, broken zippers etc.</li>
<li>Be organized by size and gender</li>
<li>Any items purchased as a complete set, arrive as a complete set</li></ol></li>
<li>Place all costumes in a bag, box or contain that you do not require to be returned and
mark all with your Consignor ID number.</li></ol></li>
<li>NH Costumes will inspect the costumes to ensure they
meet quality conditions.</li>
<li>After your appointment, your costumes will then be photographed and posted on our website
where customers can browse and select costumes to rent or purchase.</li></ol>
    <h2>Consignor Agreement</h2>
    <ol>
        <li>Consignors receive 45% of rental or sale price paid by customer</li>
<li>Should the costume be returned damaged or should the costume not be returned; NH
Costumes is not responsible. The customer will pay a deposit which will be given to the
consignor (less 10% processing fee).</li>
<li>Consignors will be contacted at the end of the rental period to pick up their earnings and their
costumes. If you are unable to pick up during NH Costumes’ hours simply contact us to make
other arrangements.</li>
<li>We pay out via cash or PayPal at any time during business hours, or consignor credit can be used
towards rental of other costumes.</li><li>
Should the consignors choose not to pick up their costumes by November 30th they will
become property of NH costumes.</li>
<li>If at any time the consignor wishes to take back their costumes, they must contact NH
Costumes and they will be available for pick up within 48 hours. Should the costume be
rented, it will be returned upon the end of the rental period.</li></ol>
<h2>Consignor Information</h2>
    <div id="mainform" runat="server">
    <asp:ValidationSummary ID="ValidationSummary1" runat="server" CssClass="error" />
    <label>First Name: </label><asp:TextBox ID="FirstName" runat="server"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="First name is required" ControlToValidate="FirstName" Display="Dynamic" CssClass="error">*</asp:RequiredFieldValidator>
    <br/>
<label>Last Name: </label><asp:TextBox ID="LastName" runat="server"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Last name is required" ControlToValidate="LastName" Display="Dynamic" CssClass="error">*</asp:RequiredFieldValidator>
    <br/>
<label>Address: </label><asp:TextBox ID="Address" runat="server"></asp:TextBox><br/>
<label>City: </label><asp:TextBox ID="City" runat="server"></asp:TextBox><br/>
<label>Home Phone: </label><asp:TextBox ID="HomePhone" runat="server" CausesValidation="True"></asp:TextBox>
    <asp:CustomValidator ID="CustomValidator2" runat="server" ErrorMessage="Please enter a home or other phone number" OnServerValidate="CustomValidator2_ServerValidate" Display="Dynamic" ClientValidationFunction="validatePhoneNumbers" CssClass="error">*</asp:CustomValidator>
    <br/>
<label>Other Phone: </label><asp:TextBox ID="OtherPhone" runat="server"></asp:TextBox><br/>
<label>Email: </label><asp:TextBox ID="Email" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Email address is required" ControlToValidate="Email" Display="Dynamic">*</asp:RequiredFieldValidator>
    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="Email" ErrorMessage="Please enter a valid email address" Display="Dynamic" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">*</asp:RegularExpressionValidator>
    <br />
        <label>Preferred Appt Time:</label><asp:DropDownList ID="DropDownList1" runat="server">
            <asp:ListItem Selected="True">No Preference</asp:ListItem>
            <asp:ListItem>Morning</asp:ListItem>
            <asp:ListItem>Afternoon</asp:ListItem>
            <asp:ListItem>Evening</asp:ListItem>
        </asp:DropDownList><br />
        <label>Additional Comments:</label>
        <asp:TextBox ID="TextBox1" runat="server" Rows="2" TextMode="MultiLine" Height="63px" Width="385px"></asp:TextBox>
    <br/>
    <asp:CheckBox ID="agree" runat="server" /> I agree to the terms as laid out by NH costumes. I understand NH
Costumes is not responsible for any lost or damaged costumes I choose to consign.&nbsp;&nbsp;
        <br />
    <asp:CustomValidator ID="CustomValidator1" runat="server" ErrorMessage=" You must agree to the terms before submitting" OnServerValidate="CustomValidator1_ServerValidate" Display="Dynamic" ClientValidationFunction="checkAgree" CssClass="error">*</asp:CustomValidator>
        <br/>
    <asp:Button ID="Button1" runat="server" Text="Submit" OnClick="Button1_Click" />
        </div>
</asp:Content>
