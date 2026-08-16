using Microsoft.AspNetCore.StaticFiles;

using Microsoft.Extensions.FileProviders;

var builder = WebApplication.CreateBuilder(args);
var app = builder.Build();
var siteRoot = builder.Environment.ContentRootPath;
var fileProvider = new PhysicalFileProvider(siteRoot);

var contentTypeProvider = new FileExtensionContentTypeProvider();
contentTypeProvider.Mappings[".aspx"] = "text/html";
contentTypeProvider.Mappings[".master"] = "text/html";

var defaultFilesOptions = new DefaultFilesOptions
{
    FileProvider = fileProvider
};
defaultFilesOptions.DefaultFileNames.Clear();
defaultFilesOptions.DefaultFileNames.Add("HomePage.aspx");

app.UseDefaultFiles(defaultFilesOptions);
app.UseStaticFiles(new StaticFileOptions
{
    FileProvider = fileProvider,
    ContentTypeProvider = contentTypeProvider
});

app.Run();
