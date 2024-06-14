using CaloFitAPI.Dto.Mapper;
using CaloFitAPI.Models;
using CaloFitAPI.Repository;
using CaloFitAPI.Repository.Impl;
using CaloFitAPI.Service;
using CaloFitAPI.Service.Impl;
using Microsoft.AspNetCore.OData;
using Microsoft.EntityFrameworkCore;
using Newtonsoft.Json;
using static System.Net.Mime.MediaTypeNames;

var builder = WebApplication.CreateBuilder(args);

// Add services to the container.

builder.Services.AddControllers().AddOData(opt => opt
    .Select()
    .Expand()
    .Filter()
    .OrderBy()
    .SetMaxTop(100)
    ).AddNewtonsoftJson(options =>
    options.SerializerSettings.ReferenceLoopHandling = Newtonsoft.Json.ReferenceLoopHandling.Ignore);



builder.Services.AddDbContext<CalofitDBContext>(
              options => options.UseSqlServer(builder.Configuration.GetConnectionString("LoadDb")));

// Learn more about configuring Swagger/OpenAPI at https://aka.ms/aspnetcore/swashbuckle
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();

builder.Services.AddDbContext<CalofitDBContext>();
builder.Services.AddScoped<ILogins, Login>();
builder.Services.AddScoped<ISignup, SignUp>();
builder.Services.AddScoped<IAllegic,AllegicSevices>();
builder.Services.AddScoped<Iusermanagement, userManagement>();

builder.Services.AddScoped<INutritionalAnalysis, NutritionalAnalysis>();

builder.Services.AddScoped<ICreateMeal, CreateMeal>();
builder.Services.AddScoped<Iforgotpass, ForgotPass>();
//builder.Services.AddScoped<ITest, Test>();
builder.Services.AddScoped<IDietRepository, DietRepository>();
builder.Services.AddScoped<IDietService, DietService>();
builder.Services.AddAutoMapper(typeof(MyMapper).Assembly);
builder.Services.AddHttpContextAccessor();

// Add services to the container.
builder.Services.AddControllersWithViews();

// Register session services
builder.Services.AddSession(options =>
{
    // Set a short timeout for easy testing.
    options.IdleTimeout = TimeSpan.FromMinutes(30);
    options.Cookie.HttpOnly = true;
    // Make the session cookie essential
    options.Cookie.IsEssential = true;
});

var app = builder.Build();

// Configure the HTTP request pipeline.
if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI();
}

app.UseSession();
app.UseAuthorization();

app.MapControllers();

app.Run();
