<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="NHCostumes.admin.Default1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Admin - NH Costumes</title>
</head>
<body>
    <form id="form1" runat="server">
        
    <div id="allowed" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
            <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" DataSourceID="NewDataSource" DataTextField="topcategory" DataValueField="topcategory">
                <asp:ListItem>Child</asp:ListItem>
                <asp:ListItem>Adult</asp:ListItem>
                <asp:ListItem>Accessories</asp:ListItem>
            </asp:DropDownList>
            <asp:SqlDataSource ID="NewDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:MyConnectionString %>" SelectCommand="SELECT DISTINCT [topcategory] FROM [costumes] ORDER BY [topcategory] DESC"></asp:SqlDataSource>
         <asp:DropDownList ID="DropDownList2" runat="server" AutoPostBack="True" DataSourceID="NewSQLSource2" DataTextField="title" DataValueField="item_id" OnDataBound="DropDownList2_DataBound1">
            </asp:DropDownList>
            <asp:SqlDataSource ID="NewSQLSource2" runat="server" ConnectionString="<%$ ConnectionStrings:MyConnectionString %>" SelectCommand="SELECT DISTINCT [item_id], [title] FROM [costumes] WHERE ([topcategory] = @topcategory2) ORDER BY [title]">
                <SelectParameters>
                    <asp:ControlParameter ControlID="DropDownList1" DefaultValue="Child" Name="topcategory2" PropertyName="SelectedValue" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
            <br />
            <br />
            <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" DataSourceID="NewSQLData3" Height="50px" Width="512px" CellPadding="4" ForeColor="#333333" GridLines="None" DataKeyNames="item_id" OnItemDeleted="DetailsView1_ItemDeleted" OnItemInserted="DetailsView1_ItemInserted" OnItemUpdated="DetailsView1_ItemUpdated">
                <AlternatingRowStyle BackColor="White" />
                <CommandRowStyle BackColor="#FFFFC0" Font-Bold="True" />
                <FieldHeaderStyle BackColor="#FFFF99" Font-Bold="True" />
                <Fields>
                    <asp:CheckBoxField DataField="featured" HeaderText="Featured" SortExpression="featured" />
                    <asp:CheckBoxField DataField="visible" HeaderText="Visible" SortExpression="visible" />
                    <asp:TemplateField HeaderText="Item ID" SortExpression="item_id">
                        <EditItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("item_id") %>'></asp:Label>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label6" runat="server" Text='<%# Bind("item_id") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Top Category" SortExpression="topcategory">
                        <EditItemTemplate>
                            <asp:DropDownList ID="DropDownList3" runat="server" DataSourceID="NewDataSource" DataTextField="topcategory" DataValueField="topcategory" SelectedValue='<%# Bind("topcategory") %>'>
                            </asp:DropDownList>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:DropDownList ID="DropDownList3" runat="server" DataSourceID="NewDataSource" DataTextField="topcategory" DataValueField="topcategory" SelectedValue='<%# Bind("topcategory", "{0}") %>'>
                            </asp:DropDownList>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("topcategory") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Category" SortExpression="category">
                        <EditItemTemplate>
                            <ajaxToolkit:ComboBox ID="ComboBox1" runat="server" AutoCompleteMode="Append" DataSourceID="NewDataSource4" DataTextField="category" DataValueField="category" MaxLength="0" SelectedValue='<%# Bind("category") %>' style="display: inline;">
                            </ajaxToolkit:ComboBox>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <ajaxToolkit:ComboBox ID="ComboBox1" runat="server" AutoCompleteMode="Append" DataSourceID="NewDataSource4" DataTextField="category" DataValueField="category" MaxLength="0" SelectedValue='<%# Bind("category") %>' style="display: inline;">
                            </ajaxToolkit:ComboBox>
                            &nbsp;
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("category") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="title" HeaderText="Title" SortExpression="title" />
                    <asp:BoundField DataField="rental" HeaderText="Rental Price" SortExpression="rental" DataFormatString="{0:F2}" />
                    <asp:BoundField DataField="purchase" DataFormatString="{0:F2}" HeaderText="Purchase Price" SortExpression="purchase" />
                    <asp:TemplateField HeaderText="Quantity" SortExpression="quantity">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("quantity") %>' TextMode="Number"></asp:TextBox>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("quantity") %>' TextMode="Number"></asp:TextBox>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label4" runat="server" Text='<%# Bind("quantity") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="owner" HeaderText="Owner" SortExpression="owner" />
                    <asp:TemplateField HeaderText="Description" SortExpression="description">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("description") %>' TextMode="MultiLine" Width="355px"></asp:TextBox>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("description") %>' TextMode="MultiLine" Width="354px"></asp:TextBox>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label5" runat="server" Text='<%# Bind("description") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="size" HeaderText="Size" SortExpression="size" />
                    <asp:BoundField DataField="condition" HeaderText="Condition" SortExpression="condition" />
                    <asp:TemplateField HeaderText="Pictures" SortExpression="pictures">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("pictures") %>'></asp:TextBox>
                            &nbsp;
                            <input id="Button2" type="button" value="Browse/Add" onclick="window.open('browseep.php','newWin','status=yes,width=900,height=600')";/>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("pictures") %>'></asp:TextBox>
                            &nbsp;
                            <input id="Button3" type="button" value="Browse/Add" onclick="window.open('browseep.php', 'newWin', 'status=yes,width=900,height=600')";/>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label3" runat="server" Text='<%# Bind("pictures") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="date" HeaderText="date" SortExpression="date" Visible="False" />
                    <asp:HyperLinkField DataNavigateUrlFields="item_id" DataNavigateUrlFormatString="~/Item?id={0}" Target="_blank" Text="View" />
                    <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ShowInsertButton="True" />
                </Fields>
                <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
            </asp:DetailsView>
            <asp:SqlDataSource ID="NewSQLData3" runat="server" ConnectionString="<%$ ConnectionStrings:MyConnectionString %>" DeleteCommand="DELETE FROM costumes WHERE ([item_id] = @item_id)" InsertCommand="INSERT INTO [costumes] ([topcategory], [title], [rental], [pictures], [purchase], [owner], [description], [featured], [quantity], [date], [category], [size], [visible], [condition]) VALUES (@topcategory, @title, @rental, @pictures, @purchase, @owner, @description, @featured, @quantity, @date, @category, @size, @visible, @condition)" SelectCommand="SELECT * FROM [costumes] WHERE ([item_id] = @item_id)" UpdateCommand="UPDATE [costumes] SET [topcategory] = @topcategory, [title] = @title, [rental] = @rental, [pictures] = @pictures, [purchase] = @purchase, [owner] = @owner, [description] = @description, [featured] = @featured, [quantity] = @quantity, [date] = @date, [category] = @category, [size] = @size, [visible] = @visible, [condition] = @condition WHERE [item_id] = @item_id">
                <DeleteParameters>
                    <asp:Parameter Name="item_id" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="topcategory" Type="String" />
                    <asp:Parameter Name="title" Type="String" />
                    <asp:Parameter Name="rental" Type="Decimal" />
                    <asp:Parameter Name="pictures" Type="String" />
                    <asp:Parameter Name="purchase" Type="Decimal" />
                    <asp:Parameter Name="owner" Type="String" />
                    <asp:Parameter Name="description" Type="String" />
                    <asp:Parameter Name="featured" Type="Boolean" />
                    <asp:Parameter Name="quantity" Type="Int32" />
                    <asp:Parameter Name="date" Type="DateTime" />
                    <asp:Parameter Name="category" Type="String" />
                    <asp:Parameter Name="size" Type="String" />
                    <asp:Parameter Name="visible" Type="Boolean" />
                    <asp:Parameter Name="condition" Type="String" />
                </InsertParameters>
                <SelectParameters>
                    <asp:ControlParameter ControlID="DropDownList2" Name="item_id" PropertyName="SelectedValue" Type="Int32" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:Parameter Name="topcategory" Type="String" />
                    <asp:Parameter Name="title" Type="String" />
                    <asp:Parameter Name="rental" Type="Decimal" />
                    <asp:Parameter Name="pictures" Type="String" />
                    <asp:Parameter Name="purchase" Type="Decimal" />
                    <asp:Parameter Name="owner" Type="String" />
                    <asp:Parameter Name="description" Type="String" />
                    <asp:Parameter Name="featured" Type="Boolean" />
                    <asp:Parameter Name="quantity" Type="Int32" />
                    <asp:Parameter Name="date" Type="DateTime" />
                    <asp:Parameter Name="category" Type="String" />
                    <asp:Parameter Name="size" Type="String" />
                    <asp:Parameter Name="visible" Type="Boolean" />
                    <asp:Parameter Name="condition" Type="String" />
                    <asp:Parameter Name="item_id" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
        <asp:SqlDataSource ID="NewDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:MyConnectionString %>" SelectCommand="SELECT DISTINCT [category] FROM [costumes]"></asp:SqlDataSource>
            <br />
            <asp:Label ID="Label1" runat="server" Font-Bold="True" ForeColor="Red"></asp:Label>
            <br />
    </div>
        <div id="notallowed" runat="server">
            Please enter your password to continue:
            <asp:TextBox ID="TextBox4" runat="server" TextMode="Password"></asp:TextBox><asp:Button ID="Button1" runat="server" Text="Continue" OnClick="Button1_Click" />
        </div>
    </form>
</body>
</html>
