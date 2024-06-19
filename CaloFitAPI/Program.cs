using CaloFitAPI.Dto.Mapper;
using CaloFitAPI.Models;
using CaloFitAPI.Repository;
using CaloFitAPI.Repository.Impl;
using CaloFitAPI.Service;
using CaloFitAPI.Service.Impl;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.OData;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;

var builder = WebApplication.CreateBuilder(args);

// Cấu hình dịch vụ và middleware

builder.Services.AddControllersWithViews().AddOData(opt => opt
    .Select()
    .Expand()
    .Filter()
    .OrderBy()
    .SetMaxTop(100)
    ).AddNewtonsoftJson(options =>
    options.SerializerSettings.ReferenceLoopHandling = Newtonsoft.Json.ReferenceLoopHandling.Ignore);

builder.Services.AddDbContext<CalofitDBContext>(options =>
    options.UseSqlServer(builder.Configuration.GetConnectionString("LoadDB")));

builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();

builder.Services.AddScoped<ILogins, Login>();
builder.Services.AddScoped<ISignup, SignUp>();
builder.Services.AddScoped<IAllegic, AllegicSevices>();
builder.Services.AddScoped<Iusermanagement, userManagement>();
builder.Services.AddScoped<INutritionalAnalysis, NutritionalAnalysis>();
builder.Services.AddScoped<ICreateMeal, CreateMeal>();
builder.Services.AddScoped<Iforgotpass, ForgotPass>();
//builder.Services.AddScoped<ITest, Test>();
builder.Services.AddScoped<IDietRepository, DietRepository>();
builder.Services.AddScoped<IDietService, DietService>();
builder.Services.AddAutoMapper(typeof(MyMapper).Assembly);

builder.Services.AddHttpContextAccessor();
builder.Services.AddODataQueryFilter();
builder.Services.AddSession(options =>
{
    options.IdleTimeout = TimeSpan.FromMinutes(30); // Set the session timeout
    options.Cookie.HttpOnly = true;
    options.Cookie.IsEssential = true; // Make the session cookie essential
});

var app = builder.Build();

// Cấu hình middleware và dịch vụ trong ứng dụng

if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI();
}

app.UseSession();
app.UseRouting();


app.MapControllerRoute(
name: "default",
pattern: "{controller=Login}/{action=Index}");


app.UseAuthorization();

app.MapControllers();

app.Run();
