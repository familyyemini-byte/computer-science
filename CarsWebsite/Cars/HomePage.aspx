<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Home - Mini Site</title>
    <link href="StyleSheet.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <header>
        <div class="container">
            <div class="branding" role="banner" aria-label="Site logo">
                <svg class="site-logo" viewBox="0 0 900 150" xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid meet" role="img" aria-label="Used Cars logo">
                    <title>UsedCars - Quality Pre-owned Vehicles</title>
                    <g transform="translate(0,10)">
                        <path d="M70 80 C90 50 160 50 200 80 L700 80 C740 50 810 50 830 80 L860 100 L860 110 L60 110 L60 100 Z" fill="#ffffff" opacity="0.95"/>
                        <circle cx="220" cy="110" r="18" fill="#222"/>
                        <circle cx="620" cy="110" r="18" fill="#222"/>
                    </g>
                    <text x="50%" y="55" font-family="Arial, Helvetica, sans-serif" font-size="44" fill="#ffffff" text-anchor="middle">UsedCars</text>
                    <text x="50%" y="85" font-family="Arial, Helvetica, sans-serif" font-size="14" fill="#ffffff" text-anchor="middle">Quality Pre-owned Vehicles</text>
                </svg>
            </div>
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
        <h2>Welcome to the Mini Site</h2>
        <p>This is the home page. Use the navigation menu to visit other pages on the site.</p>

        <section>
            <h3>Featured Cars</h3>
            <p>Sample images are stored in the <code>Images</code> folder.</p>
            <div style="display:flex;gap:1rem;flex-wrap:wrap;">
                <img src="Images/car1.webp" alt="Car 1" style="width:32%;max-width:300px;height:auto;border-radius:6px;" />
                <img src="Images/car2.webp" alt="Car 2" style="width:32%;max-width:300px;height:auto;border-radius:6px;" />
                <img src="Images/car3.webp" alt="Car 3" style="width:32%;max-width:300px;height:auto;border-radius:6px;" />
            </div>
        </section>
    </main>

    <footer>
        <div class="container">
            <p>&copy; 2025 Mini Site</p>
        </div>
    </footer>
</body>
</html>
