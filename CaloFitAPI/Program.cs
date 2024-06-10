using CaloFitAPI.Dto.Mapper;
using CaloFitAPI.Models;
using CaloFitAPI.Repository;
using CaloFitAPI.Repository.Impl;
using CaloFitAPI.Service;
using CaloFitAPI.Service.Impl;
using Microsoft.AspNetCore.OData;
using Microsoft.EntityFrameworkCore;
using Newtonsoft.Json;

var builder = WebApplication.CreateBuilder(args);

// Add services to the container.
builder.Services.AddControllersWithViews() // Add MVC services
    .AddOData(opt => opt
        .Select()
        .Expand()
        .Filter()
        .OrderBy()
        .SetMaxTop(100)
    )
    .AddNewtonsoftJson(options =>
        options.SerializerSettings.ReferenceLoopHandling = Newtonsoft.Json.ReferenceLoopHandling.Ignore);

// Learn more about configuring Swagger/OpenAPI at https://aka.ms/aspnetcore/swashbuckle
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();

// Uncomment and configure your services as needed
//builder.Services.AddScoped<ILogins, Login>();
//builder.Services.AddScoped<ISignup, SignUp>();
//builder.Services.AddScoped<Iusermanagement, userManagement>();
//builder.Services.AddScoped<INutritionalAnalysis, NutritionalAnalysis>();
//builder.Services.AddScoped<ICreateMeal, CreateMeal>();
//builder.Services.AddScoped<Iforgotpass, ForgotPass>();
//builder.Services.AddScoped<IDietRepository, DietRepository>();
//builder.Services.AddScoped<IDietService, DietService>();
//builder.Services.AddAutoMapper(typeof(MyMapper).Assembly);

var app = builder.Build();

// Configure the HTTP request pipeline.
if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI();
}

app.UseHttpsRedirection();
app.UseStaticFiles();

app.UseRouting();

app.UseAuthorization();

app.UseEndpoints(endpoints =>
{
    endpoints.MapControllerRoute(
        name: "default",
        pattern: "{controller=Home}/{action=Index}/{id?}");
});

app.Run();
