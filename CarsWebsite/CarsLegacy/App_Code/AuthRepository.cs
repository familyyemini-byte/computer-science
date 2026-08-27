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

    public bool RegisterUser(string firstName, string lastName, string username, string password, string email, int yearOfBirth, string gender, string area, out string errorMessage)
    {
        errorMessage = string.Empty;

        EnsureUsersTable();

        const string sql = @"
INSERT INTO dbo.Users
    (FirstName, LastName, Username, PasswordHash, Email, YearOfBirth, Gender, Area, CreatedAt)
VALUES
    (@FirstName, @LastName, @Username, @PasswordHash, @Email, @YearOfBirth, @Gender, @Area, @CreatedAt);";

        try
        {
            using (var connection = new SqlConnection(_connectionString))
            using (var command = new SqlCommand(sql, connection))
            {
                command.Parameters.AddWithValue("@FirstName", firstName);
                command.Parameters.AddWithValue("@LastName", lastName);
                command.Parameters.AddWithValue("@Username", username);
                command.Parameters.AddWithValue("@PasswordHash", HashPassword(password));
                command.Parameters.AddWithValue("@Email", email);
                command.Parameters.AddWithValue("@YearOfBirth", yearOfBirth);
                command.Parameters.AddWithValue("@Gender", gender);
                command.Parameters.AddWithValue("@Area", area);
                command.Parameters.AddWithValue("@CreatedAt", DateTime.UtcNow);

                connection.Open();
                command.ExecuteNonQuery();
                return true;
            }
        }
        catch (SqlException ex) when (ex.Number == 2601 || ex.Number == 2627)
        {
            errorMessage = "Username or email already exists.";
            return false;
        }
    }

    public bool ValidateUser(string username, string password, out string fullName)
    {
        fullName = string.Empty;

        EnsureUsersTable();

        const string sql = @"
SELECT FirstName, LastName
FROM dbo.Users
WHERE Username = @Username AND PasswordHash = @PasswordHash;";

        using (var connection = new SqlConnection(_connectionString))
        using (var command = new SqlCommand(sql, connection))
        {
            command.Parameters.AddWithValue("@Username", username);
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
        Username NVARCHAR(100) NOT NULL,
        PasswordHash NVARCHAR(128) NOT NULL,
        Email NVARCHAR(255) NOT NULL,
        YearOfBirth INT NOT NULL,
        Gender NVARCHAR(20) NOT NULL,
        Area NVARCHAR(50) NOT NULL,
        CreatedAt DATETIME2 NOT NULL
    );

    CREATE UNIQUE INDEX UX_Users_Username ON dbo.Users(Username);
    CREATE UNIQUE INDEX UX_Users_Email ON dbo.Users(Email);
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
