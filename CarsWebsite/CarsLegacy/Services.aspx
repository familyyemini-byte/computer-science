<%@ Page Language="C#" %>
<%
    if (Session["CurrentUser"] == null)
    {
        Response.Redirect("Login.aspx?returnUrl=Services.aspx");
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Services - Mini Site</title>
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
    <h2>Our Services</h2>

    <p>AutoHub offers a full range of services to keep your vehicle running and to make buying or selling a car easy.</p>

    <section>
        <h3>Sales Services</h3>
        <ul>
            <li>Certified pre-owned inspection &amp; reports</li>
            <li>Transparent pricing and vehicle history disclosure</li>
            <li>Trade-in valuation and appraisal</li>
            <li>Flexible financing options and credit assistance</li>
        </ul>
    </section>

    <section>
        <h3>After-Sales & Maintenance</h3>
        <ul>
            <li>120-point pre-sale inspection</li>
            <li>Routine maintenance: oil changes, brakes, tires</li>
            <li>Minor repairs and parts replacement</li>
            <li>Optional extended warranty packages</li>
        </ul>
    </section>

    <section>
        <h3>Additional Services</h3>
        <ul>
            <li>Vehicle detailing and cosmetic touch-ups</li>
            <li>Roadside assistance (30-day complimentary with purchase)</li>
            <li>Vehicle transportation and delivery options</li>
        </ul>
    </section>

    <section>
        <h3>Book a Service</h3>
        <p>Use the quick booking form below to request a service appointment. We'll contact you to confirm the time.</p>
        <form id="serviceForm" name="serviceForm" method="post" action="#">
            <table>
                <tr>
                    <td><label for="SvcName" id="LabelSvcName" name="LabelSvcName">Full name</label></td>
                    <td><input type="text" id="SvcName" name="SvcName" required /></td>
                </tr>
                <tr>
                    <td><label for="SvcPhone" id="LabelSvcPhone" name="LabelSvcPhone">Phone</label></td>
                    <td><input type="text" id="SvcPhone" name="SvcPhone" required /></td>
                </tr>
                <tr>
                    <td><label for="SvcEmail" id="LabelSvcEmail" name="LabelSvcEmail">Email</label></td>
                    <td><input type="email" id="SvcEmail" name="SvcEmail" required /></td>
                </tr>
                <tr>
                    <td><label for="SvcType" id="LabelSvcType" name="LabelSvcType">Service type</label></td>
                    <td>
                        <select id="SvcType" name="SvcType">
                            <option value="Maintenance">Maintenance</option>
                            <option value="Inspection">Inspection</option>
                            <option value="Repair">Repair</option>
                            <option value="Detailing">Detailing</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td><label for="SvcDate" id="LabelSvcDate" name="LabelSvcDate">Preferred date</label></td>
                    <td><input type="date" id="SvcDate" name="SvcDate" /></td>
                </tr>
                <tr>
                    <td colspan="2" style="text-align:right;">
                        <input type="submit" id="SvcSubmit" name="SvcSubmit" value="Request Appointment" />
                        <input type="reset" id="SvcClear" name="SvcClear" value="Clear" class="clear" />
                    </td>
                </tr>
            </table>
        </form>
    </section>

    </main>

    <footer>
        <div class="container">
            <p>&copy; 2025 Mini Site</p>
        </div>
    </footer>
</body>
</html>
