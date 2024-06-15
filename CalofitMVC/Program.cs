<<<<<<< HEAD
using Microsoft.Win32;
=======
using Rotativa.AspNetCore;
>>>>>>> master

namespace CalofitMVC
{
    public class Program
    {
        public static void Main(string[] args)
        {
            var builder = WebApplication.CreateBuilder(args);

<<<<<<< HEAD
            // Configure services
            builder.Services.AddControllersWithViews();
            builder.Services.AddHttpContextAccessor();
            // Add session
            builder.Services.AddSession(options =>
            {
                // Set a short timeout for testing.
                options.IdleTimeout = TimeSpan.FromMinutes(30);
                options.Cookie.HttpOnly = true;
                // Make the session cookie essential
                options.Cookie.IsEssential = true;
            });
       


=======
            // Add services to the container.
            builder.Services.AddControllersWithViews(); 
            builder.Services.AddSession();
>>>>>>> master
            var app = builder.Build();
            app.UseSession();
            app.UseRotativa();
            // Configure the HTTP request pipeline.
            if (!app.Environment.IsDevelopment())
            {
                app.UseExceptionHandler("/Home/Error");
                // The default HSTS value is 30 days.
                app.UseHsts();
            }



            app.UseSession();
            app.UseAuthorization();
            app.UseHttpsRedirection();
            app.UseStaticFiles();

            app.UseRouting();

       


            app.MapControllerRoute(
                name: "default",
                pattern: "{controller=Home}/{action=Index}/{id?}");

            app.Run();
        }
    }
    
}