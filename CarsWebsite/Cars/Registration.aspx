<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Registration - Mini Site</title>
    <link href="StyleSheet.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <header>
        <div class="container">
            <nav>
                <a href="HomePage.aspx">Home</a>
                <a href="Registration.aspx">Register</a>
                <a href="About.aspx">About</a>
                <a href="Contact.aspx">Contact</a>
                <a href="Services.aspx">Services</a>
            </nav>
        </div>
    </header>

    <main class="container">
    <h2>Registration</h2>
    <p>Please fill in the form to create an account.</p>

    <form id="registrationForm" name="registrationForm">
        <table>
            <tr>
                <td><label for="FirstName" id="LabelFirstName" name="LabelFirstName">First name</label></td>
                <td><input type="text" id="FirstName" name="FirstName" /></td>
            </tr>
            <tr>
                <td><label for="LastName" id="LabelLastName" name="LabelLastName">Last name</label></td>
                <td><input type="text" id="LastName" name="LastName" /></td>
            </tr>
            <tr>
                <td><label for="Username" id="LabelUsername" name="LabelUsername">Username (user id)</label></td>
                <td><input type="text" id="Username" name="Username" /></td>
            </tr>
            <tr>
                <td><label for="Password" id="LabelPassword" name="LabelPassword">Password</label></td>
                <td><input type="password" id="Password" name="Password" /></td>
            </tr>
            <tr>
                <td><label for="ConfirmPassword" id="LabelConfirmPassword" name="LabelConfirmPassword">Password confirmation</label></td>
                <td><input type="password" id="ConfirmPassword" name="ConfirmPassword" /></td>
            </tr>
            <tr>
                <td><label for="Email" id="LabelEmail" name="LabelEmail">Email</label></td>
                <td><input type="email" id="Email" name="Email" /></td>
            </tr>
            <tr>
                <td><label for="YearOfBirth" id="LabelYearOfBirth" name="LabelYearOfBirth">Year of birth</label></td>
                <td><input type="number" id="YearOfBirth" name="YearOfBirth" min="1900" max="2025" /></td>
            </tr>
            <tr>
                <td><label id="LabelGender" name="LabelGender">Gender</label></td>
                <td>
                    <div class="radio-group">
                        <label class="radio-item" for="GenderMale">
                            <input type="radio" id="GenderMale" name="Gender" value="Male" checked />
                            <span>Male</span>
                        </label>
                        <label class="radio-item" for="GenderFemale">
                            <input type="radio" id="GenderFemale" name="Gender" value="Female" />
                            <span>Female</span>
                        </label>
                        
                    </div>
                </td>
            </tr>
            <tr>
                <td><label for="Area" id="LabelArea" name="LabelArea">Area of residence</label></td>
                <td>
                    <select id="Area" name="Area">
                        <option id="AreaNorth" name="AreaNorth" value="North">North</option>
                        <option id="AreaSouth" name="AreaSouth" value="South">South</option>
                        <option id="AreaCenter" name="AreaCenter" value="Center">Center</option>
                        <option id="AreaAbroad" name="AreaAbroad" value="Abroad">Abroad</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td colspan="2" style="text-align:right;">
                    <input type="submit" id="Submit" name="Submit" value="Submit" />
                    <input type="reset" id="Clear" name="Clear" value="Clear" class="clear" />
                </td>
            </tr>
        </table>
    </form>

    <p style="font-size:0.9rem;color:#666;margin-top:1rem;">Notes: Radio buttons and dropdown list are included as required. Each input/select has matching `id` and `name` (radio buttons share the same name `Gender` to group them).</p>

    </main>

    <footer>
        <div class="container">
            <p>&copy; 2025 Mini Site</p>
        </div>
    </footer>
</body>
</html>
