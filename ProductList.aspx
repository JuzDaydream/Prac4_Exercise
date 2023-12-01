<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ProductList.aspx.cs" Inherits="Prac4_Exercise.ProductList" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            Select a category:
            <asp:DropDownList ID="ddlCategory" runat="server" DataSourceID="sdsCategory" DataTextField="ProductName" DataValueField="ProductID">
            </asp:DropDownList>
            &nbsp;&nbsp;
            <asp:Button ID="btnSearch" runat="server" OnClick="btnSearch_Click" Text="Search" />
            <asp:SqlDataSource ID="sdsCategory" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [ProductName], [ProductID] FROM [Products]"></asp:SqlDataSource>
            <br />
            <br />
            <asp:GridView ID="gridProducts" runat="server" AutoGenerateColumns="False" DataKeyNames="ProductID" DataSourceID="sdsProducts">
                <Columns>
                    <asp:BoundField DataField="ProductID" HeaderText="ProductID" ReadOnly="True" SortExpression="ProductID" />
                    <asp:BoundField DataField="ProductName" HeaderText="ProductName" SortExpression="ProductName" />
                    <asp:BoundField DataField="CategoryID" HeaderText="CategoryID" SortExpression="CategoryID" />
                    <asp:BoundField DataField="UnitPrice" HeaderText="UnitPrice" SortExpression="UnitPrice" />
                </Columns>
            </asp:GridView>
            <br />
            <asp:Repeater ID="Repeater1" runat="server" DataSourceID="sdsProducts">
                <HeaderTemplate>
                    <table style="width: 100%">
                        <tr>
                            <th colspan="2" style="text-align: center">
                                <b1>Product List</b1>
                                <br />
                                <br />
                            </th>
                        </tr>
                </HeaderTemplate>

                <ItemTemplate>
                    <table style="border: 1px solid black; text-align: left; width: 100%">
                        <tr>
                            <td style="width: 100px">Product ID:</td>
                            <td><%#DataBinder.Eval(Container, "DataItem.ProductID") %><br />
                            </td>
                        </tr>
                        <tr>
                            <td>Product Name:</td>
                            <td><%#DataBinder.Eval(Container, "DataItem.ProductName") %><br />
                            </td>
                            <tr>
                                <td>Category ID:</td>
                                <td><%#DataBinder.Eval(Container, "DataItem.CategoryID") %><br />
                                </td>
                                <tr>
                                    <td>Unit Price:</td>
                                    <td><%#DataBinder.Eval(Container, "DataItem.UnitPrice") %><br />
                                    </td>
                                </tr>
                            </tr>
                        </tr>
                    </table>
                    </table>
                    <br />
                </ItemTemplate>

            </asp:Repeater>
            <asp:SqlDataSource ID="sdsProducts" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [ProductID], [ProductName], [CategoryID], [UnitPrice] FROM [Alphabetical list of products] WHERE ([CategoryID] = @CategoryID)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="ddlCategory" Name="CategoryID" PropertyName="SelectedValue" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
        </div>
    </form>
</body>
</html>
