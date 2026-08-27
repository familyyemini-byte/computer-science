using System;

public partial class Registration : System.Web.UI.Page
{
    protected void RegisterButton_Click(object sender, EventArgs e)
    {
        var firstName = (FirstName.Text ?? string.Empty).Trim();
        var lastName = (LastName.Text ?? string.Empty).Trim();
        var password = Password.Text ?? string.Empty;
        var confirmPassword = ConfirmPassword.Text ?? string.Empty;
        var email = (Email.Text ?? string.Empty).Trim();
        var gender = (Gender.SelectedValue ?? string.Empty).Trim();

        int yearOfBirth;

        if (string.IsNullOrWhiteSpace(firstName) ||
            string.IsNullOrWhiteSpace(lastName) ||
            string.IsNullOrWhiteSpace(password) ||
            string.IsNullOrWhiteSpace(email) ||
            !int.TryParse(YearOfBirth.Text, out yearOfBirth))
        {
            StatusMessage.Text = "Please fill all required fields correctly.";
            StatusMessage.ForeColor = System.Drawing.Color.Firebrick;
            return;
        }

        if (!string.Equals(password, confirmPassword, StringComparison.Ordinal))
        {
            StatusMessage.Text = "Password and confirmation do not match.";
            StatusMessage.ForeColor = System.Drawing.Color.Firebrick;
            return;
        }

        var safeEmail = email.Replace("'", "''");
        var sql = "select * from users where email='" + safeEmail + "'";
        if (DalBll.IsExist(sql))
        {
            StatusMessage.Text = "User already exists.";
            StatusMessage.ForeColor = System.Drawing.Color.Firebrick;
            return;
        }

        var repo = new AuthRepository();
        string errorMessage;
        var success = repo.RegisterUser(firstName, lastName, password, email, yearOfBirth, gender, out errorMessage);
        if (!success)
        {
            StatusMessage.Text = string.IsNullOrWhiteSpace(errorMessage) ? "Registration failed." : errorMessage;
            StatusMessage.ForeColor = System.Drawing.Color.Firebrick;
            return;
        }

        StatusMessage.Text = "Registration successful. You can now login.";
        StatusMessage.ForeColor = System.Drawing.Color.SeaGreen;
    }
}
