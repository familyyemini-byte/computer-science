# UsedCars (Mini Site)

This repository contains a small ASP.NET Web Forms site (`.aspx` pages and a `master.master` layout).

## Prerequisites
- Windows
- One of the following:
  - Visual Studio (recommended) with **ASP.NET and web development** workload installed
  - IIS Express (installed with Visual Studio or available separately)
- A browser (Edge, Chrome, Firefox)

## Run the site (Recommended: Visual Studio)
1. Open Visual Studio.
2. Choose **File > Open > Web Site...** and select the repository folder (`c:\code\computer-science`).
3. Visual Studio will use IIS Express to host the site. Press `F5` or click the IIS Express green play button to run.
4. The site will open in your browser. If it doesn't, navigate to the URL shown in Visual Studio (usually `http://localhost:port/`).

## Run the site (IIS Express from PowerShell)
You can run the site directly with IIS Express from PowerShell if you don't want to open Visual Studio.

1. Open PowerShell.
2. Run IIS Express pointing to the project folder (adjust path/port if needed):

```powershell
& 'C:\Program Files\IIS Express\iisexpress.exe' /path:"C:\code\computer-science" /port:8080
```

3. Open your browser at `http://localhost:8080/HomePage.aspx` (or the root URL).
4. Stop the server with `Ctrl+C` in the PowerShell window.

Notes:
- If `iisexpress.exe` is not found, install IIS Express or run via Visual Studio.
- If port `8080` is in use, change `/port:8080` to another available port.

## Quick static preview (no server-side execution)
If you only want to preview static assets (HTML/CSS) without server-side ASP.NET processing, you can use Python's simple HTTP server. This will NOT run server-side `.aspx` controls; it only serves files.

```powershell
cd C:\code\computer-science
python -m http.server 8080
# then open http://localhost:8080/HomePage.aspx
```

## Files of interest
- `master.master` — master page layout (logo and navigation)
- `StyleSheet.css` — main styles
- `HomePage.aspx`, `About.aspx`, `Contact.aspx`, etc. — site pages
- `Images/` — image assets

## Troubleshooting
- If pages render with errors, ensure IIS Express / Visual Studio has ASP.NET enabled.
- Check the browser developer console for 404s (missing CSS or images) and make sure paths are correct.

If you want, I can also add a small Visual Studio solution/project file to make running the site even easier — would you like that?
