<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Registration.aspx.cs" Inherits="Registration" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Registration - Mini Site</title>
    <link href="StyleSheet.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <header>
        <div class="container">
            <nav>
                <a href="HomePage.aspx">Home</a>
                <a href="Registration.aspx">Register</a>
                <a href="Login.aspx">Login</a>
                <a href="About.aspx">About</a>
                <a href="Contact.aspx">Contact</a>
                <a href="Services.aspx">Services</a>
            </nav>
        </div>
    </header>

    <main class="container">
    <h2>Registration</h2>
    <p>Please fill in the form to create an account.</p>

    <form id="registrationForm" runat="server">
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
                <td><label for="Username" id="LabelUsername" name="LabelUsername">Username (user id)</label></td>
                <td><asp:TextBox ID="Username" runat="server" /></td>
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
                <td><label for="Area" id="LabelArea" name="LabelArea">Area of residence</label></td>
                <td>
                    <asp:DropDownList ID="Area" runat="server">
                        <asp:ListItem Value="North">North</asp:ListItem>
                        <asp:ListItem Value="South">South</asp:ListItem>
                        <asp:ListItem Value="Center">Center</asp:ListItem>
                        <asp:ListItem Value="Abroad">Abroad</asp:ListItem>
                    </asp:DropDownList>
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
    </form>

    <p style="font-size:0.9rem;color:#666;margin-top:1rem;">Your account is saved to the site database and can be used on the login page.</p>

    </main>

    <footer>
        <div class="container">
            <p>&copy; 2025 Mini Site</p>
        </div>
    </footer>
</body>
</html>


