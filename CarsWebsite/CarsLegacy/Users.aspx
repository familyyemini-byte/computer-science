<%@ Page Language="C#" MasterPageFile="~/master.master" %>
<asp:Content ID="TitleContent1" ContentPlaceHolderID="TitleContent" runat="server">
    Users - Mini Site
</asp:Content>

<asp:Content ID="MainContent1" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Users</h2>
    <p>Admin view of all registered users.</p>
    <asp:GridView ID="UsersGrid" runat="server" AutoGenerateColumns="false" CssClass="users-grid">
        <Columns>
            <asp:BoundField DataField="Id" HeaderText="ID" />
            <asp:BoundField DataField="FirstName" HeaderText="First name" />
            <asp:BoundField DataField="LastName" HeaderText="Last name" />
            <asp:BoundField DataField="Email" HeaderText="Email" />
            <asp:BoundField DataField="YearOfBirth" HeaderText="Year of birth" />
            <asp:BoundField DataField="Gender" HeaderText="Gender" />
            <asp:CheckBoxField DataField="is_admin" HeaderText="Admin" />
            <asp:BoundField DataField="CreatedAt" HeaderText="Created" DataFormatString="{0:yyyy-MM-dd HH:mm}" HtmlEncode="false" />
        </Columns>
    </asp:GridView>
</asp:Content>

<script runat="server">
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["CurrentUser"] == null)
        {
            Response.Redirect("Login.aspx?returnUrl=Users.aspx", false);
            Context.ApplicationInstance.CompleteRequest();
            return;
        }

        var isAdmin = Session["IsAdmin"] is bool && (bool)Session["IsAdmin"];
        if (!isAdmin)
        {
            Response.Redirect("HomePage.aspx", false);
            Context.ApplicationInstance.CompleteRequest();
            return;
        }

        if (!IsPostBack)
        {
            BindUsers();
        }
    }

    private void BindUsers()
    {
        var connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["CarsDb"]?.ConnectionString;
        if (string.IsNullOrWhiteSpace(connectionString))
        {
            return;
        }

        const string sql = @"
SELECT Id, FirstName, LastName, Email, YearOfBirth, Gender, is_admin, CreatedAt
FROM dbo.Users
ORDER BY Id;";

        using (var connection = new System.Data.SqlClient.SqlConnection(connectionString))
        using (var command = new System.Data.SqlClient.SqlCommand(sql, connection))
        using (var adapter = new System.Data.SqlClient.SqlDataAdapter(command))
        {
            var table = new System.Data.DataTable();
            adapter.Fill(table);
            UsersGrid.DataSource = table;
            UsersGrid.DataBind();
        }
    }
</script>
