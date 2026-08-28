<%@ Page Language="C#" MasterPageFile="~/master.master" %>
<asp:Content ID="TitleContent1" ContentPlaceHolderID="TitleContent" runat="server">
    Change Password - Mini Site
</asp:Content>

<asp:Content ID="MainContent1" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Change Password</h2>
    <table>
        <tr>
            <td><label for="CurrentPasswordTextBox">Current password</label></td>
            <td><asp:TextBox ID="CurrentPasswordTextBox" runat="server" TextMode="Password" /></td>
        </tr>
        <tr>
            <td><label for="NewPasswordTextBox">New password</label></td>
            <td><asp:TextBox ID="NewPasswordTextBox" runat="server" TextMode="Password" /></td>
        </tr>
        <tr>
            <td colspan="2" style="text-align:right;">
                <asp:Button ID="ChangePasswordButton" runat="server" Text="Update" OnClick="ChangePasswordButton_Click" />
            </td>
        </tr>
    </table>
    <p><asp:Label ID="StatusLabel" runat="server" /></p>
</asp:Content>

<script runat="server">
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["CurrentUserEmail"] == null)
        {
            Response.Redirect("Login.aspx?returnUrl=ChangePassword.aspx", false);
            Context.ApplicationInstance.CompleteRequest();
        }
    }

    protected void ChangePasswordButton_Click(object sender, EventArgs e)
    {
        var email = (Session["CurrentUserEmail"] as string ?? string.Empty).Trim();
        var currentPassword = CurrentPasswordTextBox.Text ?? string.Empty;
        var newPassword = NewPasswordTextBox.Text ?? string.Empty;

        if (string.IsNullOrWhiteSpace(currentPassword) || string.IsNullOrWhiteSpace(newPassword))
        {
            StatusLabel.Text = "Please fill in all fields.";
            StatusLabel.ForeColor = System.Drawing.Color.Firebrick;
            return;
        }

        var repo = new AuthRepository();
        string errorMessage;
        var success = repo.ChangePassword(email, currentPassword, newPassword, out errorMessage);
        if (!success)
        {
            StatusLabel.Text = errorMessage;
            StatusLabel.ForeColor = System.Drawing.Color.Firebrick;
            return;
        }

        StatusLabel.Text = "Password updated successfully.";
        StatusLabel.ForeColor = System.Drawing.Color.SeaGreen;
    }
</script>
