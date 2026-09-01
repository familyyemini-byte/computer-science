using System;
using System;
using System.Configuration;
using System.Data.SqlClient;

public class AuthRepository
{
    private readonly string _connectionString;

    public AuthRepository()
    {
        var connectionSetting = ConfigurationManager.ConnectionStrings["CarsDb"];
        _connectionString = connectionSetting == null ? null : connectionSetting.ConnectionString;
        if (string.IsNullOrWhiteSpace(_connectionString))
        {
            throw new InvalidOperationException("Missing CarsDb connection string in Web.config.");
        }
    }

    public bool IsUserAdmin(string email)
    {
        EnsureUsersTable();

        const string sql = @"
SELECT is_admin
FROM dbo.Users
WHERE Email = @Email;";

        using (var connection = new SqlConnection(_connectionString))
        using (var command = new SqlCommand(sql, connection))
        {
            command.Parameters.AddWithValue("@Email", email);

            connection.Open();
            var value = command.ExecuteScalar();
            if (value == null || value == DBNull.Value)
            {
                return false;
            }

            return Convert.ToBoolean(value);
        }
    }

    public bool ChangePassword(string email, string currentPassword, string newPassword, out string errorMessage)
    {
        errorMessage = string.Empty;

        EnsureUsersTable();

        const string sql = @"
UPDATE dbo.Users
SET [Password] = @NewPassword
WHERE Email = @Email AND [Password] = @CurrentPassword;";

        using (var connection = new SqlConnection(_connectionString))
        using (var command = new SqlCommand(sql, connection))
        {
            command.Parameters.AddWithValue("@Email", email);
            command.Parameters.AddWithValue("@CurrentPassword", currentPassword);
            command.Parameters.AddWithValue("@NewPassword", newPassword);

            connection.Open();
            var rows = command.ExecuteNonQuery();
            if (rows > 0)
            {
                return true;
            }
        }

        errorMessage = "Current password is incorrect.";
        return false;
    }

    public bool RegisterUser(string firstName, string lastName, string password, string email, int yearOfBirth, string gender, out string errorMessage)
    {
        errorMessage = string.Empty;

        EnsureUsersTable();

        const string sql = @"
INSERT INTO dbo.Users
    (FirstName, LastName, [Password], Email, YearOfBirth, Gender, CreatedAt)
VALUES
    (@FirstName, @LastName, @Password, @Email, @YearOfBirth, @Gender, @CreatedAt);";

        try
        {
            using (var connection = new SqlConnection(_connectionString))
            using (var command = new SqlCommand(sql, connection))
            {
                command.Parameters.AddWithValue("@FirstName", firstName);
                command.Parameters.AddWithValue("@LastName", lastName);
                command.Parameters.AddWithValue("@Password", password);
                command.Parameters.AddWithValue("@Email", email);
                command.Parameters.AddWithValue("@YearOfBirth", yearOfBirth);
                command.Parameters.AddWithValue("@Gender", gender);
                command.Parameters.AddWithValue("@CreatedAt", DateTime.UtcNow);

                connection.Open();
                command.ExecuteNonQuery();
                return true;
            }
        }
        catch (SqlException ex)
        {
            if (ex.Number == 2601 || ex.Number == 2627)
            {
                errorMessage = "Email already exists.";
                return false;
            }

            throw;
        }
    }

    public bool ValidateUser(string email, string password, out string fullName)
    {
        fullName = string.Empty;

        EnsureUsersTable();

        const string sql = @"
SELECT FirstName, LastName
FROM dbo.Users
WHERE Email = @Email AND [Password] = @Password;";

        using (var connection = new SqlConnection(_connectionString))
        using (var command = new SqlCommand(sql, connection))
        {
            command.Parameters.AddWithValue("@Email", email);
            command.Parameters.AddWithValue("@Password", password);

            connection.Open();
            using (var reader = command.ExecuteReader())
            {
                if (!reader.Read())
                {
                    return false;
                }

                fullName = string.Format("{0} {1}", reader["FirstName"], reader["LastName"]).Trim();
                return true;
            }
        }
    }

    private void EnsureUsersTable()
    {
        const string sql = @"
IF OBJECT_ID('dbo.Users', 'U') IS NULL
BEGIN
    CREATE TABLE dbo.Users
    (
        Id INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
        FirstName NVARCHAR(100) NOT NULL,
        LastName NVARCHAR(100) NOT NULL,
        [Password] NVARCHAR(128) NOT NULL,
        Email NVARCHAR(255) NOT NULL,
        is_admin BIT NOT NULL CONSTRAINT DF_Users_is_admin DEFAULT (0),
        YearOfBirth INT NOT NULL,
        Gender NVARCHAR(20) NOT NULL,
        CreatedAt DATETIME2 NOT NULL
    );

    CREATE UNIQUE INDEX UX_Users_Email ON dbo.Users(Email);
END

IF OBJECT_ID('dbo.Users', 'U') IS NOT NULL
BEGIN
    IF EXISTS (SELECT 1 FROM sys.indexes WHERE name = 'UX_Users_Username' AND object_id = OBJECT_ID('dbo.Users'))
    BEGIN
        DROP INDEX UX_Users_Username ON dbo.Users;
    END

    IF COL_LENGTH('dbo.Users', 'Username') IS NOT NULL
    BEGIN
        ALTER TABLE dbo.Users DROP COLUMN Username;
    END

    IF COL_LENGTH('dbo.Users', 'Area') IS NOT NULL
    BEGIN
        ALTER TABLE dbo.Users DROP COLUMN Area;
    END

    IF COL_LENGTH('dbo.Users', 'Password') IS NULL AND COL_LENGTH('dbo.Users', 'PasswordHash') IS NOT NULL
    BEGIN
        EXEC sp_rename 'dbo.Users.PasswordHash', 'Password', 'COLUMN';
    END

    IF COL_LENGTH('dbo.Users', 'Password') IS NULL
    BEGIN
        ALTER TABLE dbo.Users ADD [Password] NVARCHAR(128) NOT NULL CONSTRAINT DF_Users_Password DEFAULT ('');
    END

    IF COL_LENGTH('dbo.Users', 'PasswordHash') IS NOT NULL
    BEGIN
        ALTER TABLE dbo.Users DROP COLUMN PasswordHash;
    END

    IF COL_LENGTH('dbo.Users', 'is_admin') IS NULL
    BEGIN
        ALTER TABLE dbo.Users ADD is_admin BIT NOT NULL CONSTRAINT DF_Users_is_admin DEFAULT (0);
    END

    UPDATE dbo.Users
    SET is_admin = 1
    WHERE LOWER(FirstName) = 'nadav'
       OR LOWER(Email) = 'nadav'
       OR LOWER(Email) LIKE 'nadav@%';

    IF NOT EXISTS (SELECT 1 FROM sys.indexes WHERE name = 'UX_Users_Email' AND object_id = OBJECT_ID('dbo.Users'))
    BEGIN
        CREATE UNIQUE INDEX UX_Users_Email ON dbo.Users(Email);
    END
END";

        using (var connection = new SqlConnection(_connectionString))
        using (var command = new SqlCommand(sql, connection))
        {
            connection.Open();
            command.ExecuteNonQuery();
        }
    }

}
