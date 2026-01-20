<%@ Page Title="Contact" MasterPageFile="~/master.master" Language="C#" %>
<asp:Content ID="TitleContent" ContentPlaceHolderID="TitleContent" runat="server">Contact</asp:Content>
<asp:Content ID="MainContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Contact AutoHub</h2>

    <p>If you have questions about a vehicle, financing, or our policies, please use the form below or contact us directly.</p>

    <h3>Contact Information</h3>
    <p>
        AutoHub Used Cars<br />
        123 Wheel Lane, Motor City<br />
        Phone: <a href="tel:+1234567890">+1 (234) 567-890</a><br />
        Email: <a href="mailto:info@autohub.example">info@autohub.example</a>
    </p>

    <h3>Send us a message</h3>
    <form id="contactForm" name="contactForm" method="post" action="#">
        <table>
            <tr>
                <td><label for="FullName" id="LabelFullName" name="LabelFullName">Full name</label></td>
                <td><input type="text" id="FullName" name="FullName" required /></td>
            </tr>
            <tr>
                <td><label for="ContactEmail" id="LabelContactEmail" name="LabelContactEmail">Email</label></td>
                <td><input type="email" id="ContactEmail" name="ContactEmail" required /></td>
            </tr>
            <tr>
                <td><label for="ContactPhone" id="LabelContactPhone" name="LabelContactPhone">Phone</label></td>
                <td><input type="text" id="ContactPhone" name="ContactPhone" /></td>
            </tr>
            <tr>
                <td><label for="Subject" id="LabelSubject" name="LabelSubject">Subject</label></td>
                <td><input type="text" id="Subject" name="Subject" required /></td>
            </tr>
            <tr>
                <td><label for="Message" id="LabelMessage" name="LabelMessage">Message</label></td>
                <td><textarea id="Message" name="Message" rows="6" style="width:100%;border:1px solid #ddd;border-radius:4px;padding:0.5rem;" required></textarea></td>
            </tr>
            <tr>
                <td colspan="2" style="text-align:right;">
                    <input type="submit" id="ContactSubmit" name="ContactSubmit" value="Send Message" />
                    <input type="reset" id="ContactClear" name="ContactClear" value="Clear" class="clear" />
                </td>
            </tr>
        </table>
    </form>

    <p style="font-size:0.9rem;color:#666;margin-top:1rem;">We will respond to messages within 1-2 business days.</p>

</asp:Content>
