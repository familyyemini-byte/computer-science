<%@ Page Language="C#" %>
<script runat="server">
    protected void Page_Load(object sender, EventArgs e)
    {
        Session.Clear();
        Session.Abandon();
        Response.Redirect("HomePage.aspx", false);
        Context.ApplicationInstance.CompleteRequest();
    }
</script>
