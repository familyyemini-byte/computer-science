<%@ Page Language="C#" MasterPageFile="~/master.master" %>
<asp:Content ID="TitleContent1" ContentPlaceHolderID="TitleContent" runat="server">
    Users - Mini Site
</asp:Content>

<asp:Content ID="MainContent1" ContentPlaceHolderID="MainContent" runat="server">
    <h2>?? ???????</h2>
    <p>???? ??? ?? ????? ????? ???? ????.</p>
</asp:Content>

<script runat="server">
    protected void Page_Load(object sender, EventArgs e)
    {
        var isAdmin = Session["IsAdmin"] is bool && (bool)Session["IsAdmin"];
        if (!isAdmin)
        {
            Response.Redirect("HomePage.aspx", false);
            Context.ApplicationInstance.CompleteRequest();
        }
    }
</script>
