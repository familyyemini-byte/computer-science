<%@ Page Language="C#" MasterPageFile="~/master.master" AutoEventWireup="true" CodeFile="Registration.aspx.cs" Inherits="Registration" %>
<asp:Content ID="TitleContent1" ContentPlaceHolderID="TitleContent" runat="server">
    Registration - Mini Site
</asp:Content>

<asp:Content ID="MainContent1" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Registration</h2>
    <p>Please fill in the form to create an account.</p>

    <asp:Panel ID="RegistrationFormPanel" runat="server">
        <table>
            <tr>
                <td><label for="FirstName" id="LabelFirstName" name="LabelFirstName">First name</label></td>
                <td><asp:TextBox ID="FirstName" runat="server" /></td>
            </tr>
            <tr>
                <td><label for="LastName" id="LabelLastName" name="LabelLastName">Last name</label></td>
                <td><asp:TextBox ID="LastName" runat="server" /></td>
            </tr>
            <tr>
                <td><label for="Password" id="LabelPassword" name="LabelPassword">Password</label></td>
                <td><asp:TextBox ID="Password" runat="server" TextMode="Password" /></td>
            </tr>
            <tr>
                <td><label for="ConfirmPassword" id="LabelConfirmPassword" name="LabelConfirmPassword">Password confirmation</label></td>
                <td><asp:TextBox ID="ConfirmPassword" runat="server" TextMode="Password" /></td>
            </tr>
            <tr>
                <td><label for="Email" id="LabelEmail" name="LabelEmail">Email</label></td>
                <td><asp:TextBox ID="Email" runat="server" TextMode="Email" /></td>
            </tr>
            <tr>
                <td><label for="YearOfBirth" id="LabelYearOfBirth" name="LabelYearOfBirth">Year of birth</label></td>
                <td><asp:TextBox ID="YearOfBirth" runat="server" TextMode="Number" /></td>
            </tr>
            <tr>
                <td><label id="LabelGender" name="LabelGender">Gender</label></td>
                <td>
                    <div class="radio-group">
                        <asp:RadioButtonList ID="Gender" runat="server" RepeatDirection="Horizontal">
                            <asp:ListItem Value="Male" Selected="True">Male</asp:ListItem>
                            <asp:ListItem Value="Female">Female</asp:ListItem>
                        </asp:RadioButtonList>
                    </div>
                </td>
            </tr>
            <tr>
                <td colspan="2" style="text-align:right;">
                    <asp:Button ID="Submit" runat="server" Text="Submit" OnClick="RegisterButton_Click" />
                    <input type="reset" id="Clear" name="Clear" value="Clear" class="clear" />
                </td>
            </tr>
        </table>

        <p>
            <asp:Label ID="StatusMessage" runat="server" />
        </p>
    </asp:Panel>

    <asp:Panel ID="PostRegisterPanel" runat="server" Visible="false">
        <p>????? ?????? ????.</p>
        <p>
            <a href="ChangePassword.aspx">????? ?????</a> |
            <a href="Logout.aspx">???????</a>
            <asp:PlaceHolder ID="AdminUsersLinkPlaceholder" runat="server" Visible="false">
                | <a href="Users.aspx">?? ???????</a>
            </asp:PlaceHolder>
        </p>
    </asp:Panel>

    <p style="font-size:0.9rem;color:#666;margin-top:1rem;">Your account is saved to the site database and can be used on the login page.</p>
</asp:Content>


