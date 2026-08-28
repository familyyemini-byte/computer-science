<%@ Page Language="C#" %>
<%
    if (Session["CurrentUser"] == null)
    {
        Response.Redirect("Login.aspx?returnUrl=Contact.aspx");
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Contact - Mini Site</title>
    <link href="StyleSheet.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <header>
        <div class="container">
            <nav>
                <a href="HomePage.aspx">Home</a>
                <% if (Session["CurrentUser"] == null) { %>
                    <a href="Registration.aspx">Register</a>
                    <a href="Login.aspx">Login</a>
                <% } else { %>
                    <a href="ChangePassword.aspx">Change password</a>
                    <a href="Logout.aspx">Logout</a>
                <% } %>
                <a href="About.aspx">About</a>
                <a href="Contact.aspx">Contact</a>
                <a href="Services.aspx">Services</a>
                <% if (Session["IsAdmin"] is bool && (bool)Session["IsAdmin"]) { %>
                    <a href="Users.aspx">Users</a>
                <% } %>
            </nav>
        </div>
    </header>

    <main class="container">
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

    </main>

    <footer>
        <div class="container">
            <p>&copy; 2025 Mini Site</p>
        </div>
    </footer>
</body>
</html>
