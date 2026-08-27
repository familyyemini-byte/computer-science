using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Security.Cryptography;
using System.Text;

public class AuthRepository
{
    private readonly string _connectionString;

    public AuthRepository()
    {
        _connectionString = ConfigurationManager.ConnectionStrings["CarsDb"]?.ConnectionString;
        if (string.IsNullOrWhiteSpace(_connectionString))
        {
            throw new InvalidOperationException("Missing CarsDb connection string in Web.config.");
        }
    }

    public bool RegisterUser(string firstName, string lastName, string password, string email, int yearOfBirth, string gender, out string errorMessage)
    {
        errorMessage = string.Empty;

        EnsureUsersTable();

        const string sql = @"
INSERT INTO dbo.Users
    (FirstName, LastName, PasswordHash, Email, YearOfBirth, Gender, CreatedAt)
VALUES
    (@FirstName, @LastName, @PasswordHash, @Email, @YearOfBirth, @Gender, @CreatedAt);";

        try
        {
            using (var connection = new SqlConnection(_connectionString))
            using (var command = new SqlCommand(sql, connection))
            {
                command.Parameters.AddWithValue("@FirstName", firstName);
                command.Parameters.AddWithValue("@LastName", lastName);
                command.Parameters.AddWithValue("@PasswordHash", HashPassword(password));
                command.Parameters.AddWithValue("@Email", email);
                command.Parameters.AddWithValue("@YearOfBirth", yearOfBirth);
                command.Parameters.AddWithValue("@Gender", gender);
                command.Parameters.AddWithValue("@CreatedAt", DateTime.UtcNow);

                connection.Open();
                command.ExecuteNonQuery();
                return true;
            }
        }
        catch (SqlException ex) when (ex.Number == 2601 || ex.Number == 2627)
        {
            errorMessage = "Email already exists.";
            return false;
        }
    }

    public bool ValidateUser(string email, string password, out string fullName)
    {
        fullName = string.Empty;

        EnsureUsersTable();

        const string sql = @"
SELECT FirstName, LastName
FROM dbo.Users
WHERE Email = @Email AND PasswordHash = @PasswordHash;";

        using (var connection = new SqlConnection(_connectionString))
        using (var command = new SqlCommand(sql, connection))
        {
            command.Parameters.AddWithValue("@Email", email);
            command.Parameters.AddWithValue("@PasswordHash", HashPassword(password));

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
        PasswordHash NVARCHAR(128) NOT NULL,
        Email NVARCHAR(255) NOT NULL,
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

    private static string HashPassword(string password)
    {
        using (var sha = SHA256.Create())
        {
            var bytes = Encoding.UTF8.GetBytes(password ?? string.Empty);
            var hash = sha.ComputeHash(bytes);
            var builder = new StringBuilder(hash.Length * 2);
            for (var i = 0; i < hash.Length; i++)
            {
                builder.Append(hash[i].ToString("x2"));
            }

            return builder.ToString();
        }
    }
}
