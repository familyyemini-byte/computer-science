<%@ Page Title="Home" MasterPageFile="~/master.master" Language="C#" %>
<asp:Content ID="TitleContent" ContentPlaceHolderID="TitleContent" runat="server">Home</asp:Content>
<asp:Content ID="MainContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Welcome to the Mini Site</h2>
    <p>This is the home page. Use the navigation menu to visit other pages on the site.</p>

    <section>
        <h3>Featured Cars</h3>
        <p>Sample images are stored in the `Images` folder.</p>
        <div style="display:flex;gap:1rem;flex-wrap:wrap;">
            <img src='<%= ResolveUrl("~/Images/car1.webp") %>' alt="Car 1" style="width:32%;max-width:300px;height:auto;border-radius:6px;" />
            <img src='<%= ResolveUrl("~/Images/car2.webp") %>' alt="Car 2" style="width:32%;max-width:300px;height:auto;border-radius:6px;" />
            <img src='<%= ResolveUrl("~/Images/car3.webp") %>' alt="Car 3" style="width:32%;max-width:300px;height:auto;border-radius:6px;" />
        </div>
    </section>

</asp:Content>
