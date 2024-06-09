using CaloFitAPI.Dto.Mapper;
using CaloFitAPI.Models;
using CaloFitAPI.Service;
using CaloFitAPI.Service.Impl;
using Microsoft.AspNetCore.OData;
using Microsoft.EntityFrameworkCore;
using static System.Net.Mime.MediaTypeNames;

var builder = WebApplication.CreateBuilder(args);

// Add services to the container.

builder.Services.AddControllers().AddOData(opt => opt
    .Select()
    .Expand()
    .Filter()
    .OrderBy()
    .SetMaxTop(100)
    );
// Learn more about configuring Swagger/OpenAPI at https://aka.ms/aspnetcore/swashbuckle
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();


builder.Services.AddScoped<ILogins, Login>();
builder.Services.AddScoped<ISignup, SignUp>();
builder.Services.AddScoped<Iusermanagement, userManagement>();

builder.Services.AddScoped<INutritionalAnalysis, NutritionalAnalysis>();

builder.Services.AddScoped<ICreateMeal, CreateMeal>();
builder.Services.AddScoped<Iforgotpass, ForgotPass>();
builder.Services.AddAutoMapper(typeof(MyMapper).Assembly);
var app = builder.Build();

// Configure the HTTP request pipeline.
if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI();
}

app.UseAuthorization();

app.MapControllers();

app.Run();
