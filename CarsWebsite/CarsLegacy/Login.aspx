<%@ Page Language="C#" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Login - Mini Site</title>
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
        <h2>Login</h2>
        <p>Use your registered account to sign in.</p>

        <form id="loginForm" runat="server">
            <table>
                <tr>
                    <td><label for="Username">Username</label></td>
                    <td><asp:TextBox ID="Username" runat="server" /></td>
                </tr>
                <tr>
                    <td><label for="Password">Password</label></td>
                    <td><asp:TextBox ID="Password" runat="server" TextMode="Password" /></td>
                </tr>
                <tr>
                    <td colspan="2" style="text-align:right;">
                        <asp:Button ID="SignIn" runat="server" Text="Sign in" OnClick="SignIn_Click" />
                    </td>
                </tr>
            </table>

            <p>
                <asp:Label ID="StatusMessage" runat="server" />
            </p>
        </form>
    </main>

    <footer>
        <div class="container">
            <p>&copy; 2025 Mini Site</p>
        </div>
    </footer>
</body>
</html>

<script runat="server">
    protected void SignIn_Click(object sender, EventArgs e)
    {
        var username = (Username.Text ?? string.Empty).Trim();
        var password = Password.Text ?? string.Empty;

        if (string.IsNullOrWhiteSpace(username) || string.IsNullOrWhiteSpace(password))
        {
            StatusMessage.Text = "Please enter both username and password.";
            StatusMessage.ForeColor = System.Drawing.Color.Firebrick;
            return;
        }

        var repo = new AuthRepository();
        string fullName;
        var success = repo.ValidateUser(username, password, out fullName);
        if (!success)
        {
            StatusMessage.Text = "Invalid username or password.";
            StatusMessage.ForeColor = System.Drawing.Color.Firebrick;
            return;
        }

        Session["CurrentUser"] = string.IsNullOrWhiteSpace(fullName) ? username : fullName;
        Response.Redirect("HomePage.aspx", false);
        Context.ApplicationInstance.CompleteRequest();
    }
</script>
