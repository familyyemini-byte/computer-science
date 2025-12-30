<%@ Page Title="Registration" MasterPageFile="~/master.master" Language="C#" %>
<asp:Content ID="TitleContent" ContentPlaceHolderID="TitleContent" runat="server">Registration</asp:Content>
<asp:Content ID="MainContent" ContentPlaceHolderID="MainContent" runat="server">
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
                    <!-- Radio buttons: grouped with name="Gender"; ids are unique -->
                    <input type="radio" id="GenderMale" name="Gender" value="Male" checked />
                    <label for="GenderMale" id="LabelGenderMale" name="LabelGenderMale">Male</label>
                    &nbsp;&nbsp;
                    <input type="radio" id="GenderFemale" name="Gender" value="Female" />
                    <label for="GenderFemale" id="LabelGenderFemale" name="LabelGenderFemale">Female</label>
                    &nbsp;&nbsp;
                    <input type="radio" id="GenderOther" name="Gender" value="Other" />
                    <label for="GenderOther" id="LabelGenderOther" name="LabelGenderOther">Other</label>
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

</asp:Content>
