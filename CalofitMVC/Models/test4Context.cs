using System;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata;

namespace CalofitMVC.Models
{
    public partial class test4Context : DbContext
    {
        public test4Context()
        {
        }

        public test4Context(DbContextOptions<test4Context> options)
            : base(options)
        {
        }

        public virtual DbSet<Allergy> Allergies { get; set; } = null!;
        public virtual DbSet<Cart> Carts { get; set; } = null!;
        public virtual DbSet<Comment> Comments { get; set; } = null!;
        public virtual DbSet<Diet> Diets { get; set; } = null!;
        public virtual DbSet<Image> Images { get; set; } = null!;
        public virtual DbSet<Ingredient> Ingredients { get; set; } = null!;
        public virtual DbSet<IngredientServingSize> IngredientServingSizes { get; set; } = null!;
        public virtual DbSet<Meal> Meals { get; set; } = null!;
        public virtual DbSet<MealPlan> MealPlans { get; set; } = null!;
        public virtual DbSet<MealPlanManyToMany> MealPlanManyToManies { get; set; } = null!;
        public virtual DbSet<Menu> Menus { get; set; } = null!;
        public virtual DbSet<Nutrition> Nutritions { get; set; } = null!;
        public virtual DbSet<Order> Orders { get; set; } = null!;
        public virtual DbSet<OrderDetail> OrderDetails { get; set; } = null!;
        public virtual DbSet<Product> Products { get; set; } = null!;
        public virtual DbSet<Recipe> Recipes { get; set; } = null!;
        public virtual DbSet<RecipeAllergy> RecipeAllergies { get; set; } = null!;
        public virtual DbSet<RecipeIngredient> RecipeIngredients { get; set; } = null!;
        public virtual DbSet<RecipeRating> RecipeRatings { get; set; } = null!;
        public virtual DbSet<Step> Steps { get; set; } = null!;
        public virtual DbSet<User> Users { get; set; } = null!;
        public virtual DbSet<UserGoal> UserGoals { get; set; } = null!;
        public virtual DbSet<UserPreference> UserPreferences { get; set; } = null!;

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            if (!optionsBuilder.IsConfigured)
            {
#warning To protect potentially sensitive information in your connection string, you should move it out of source code. You can avoid scaffolding the connection string by using the Name= syntax to read it from configuration - see https://go.microsoft.com/fwlink/?linkid=2131148. For more guidance on storing connection strings, see http://go.microsoft.com/fwlink/?LinkId=723263.
                optionsBuilder.UseMySql("server=SG-small-brace-6472-9208-mysql-master.servers.mongodirector.com;port=3306;database=test4;user=sgroot;password=fCfVs+Z5uwX7UInP", Microsoft.EntityFrameworkCore.ServerVersion.Parse("5.7.39-mysql"));
            }
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.UseCollation("latin1_swedish_ci")
                .HasCharSet("latin1");

            modelBuilder.Entity<Allergy>(entity =>
            {
                entity.ToTable("Allergy");

                entity.HasIndex(e => e.UserId, "user_id");

                entity.Property(e => e.AllergyId)
                    .HasColumnType("int(11)")
                    .HasColumnName("allergy_id");

                entity.Property(e => e.Allergen)
                    .HasMaxLength(50)
                    .HasColumnName("allergen")
                    .UseCollation("utf8_general_ci")
                    .HasCharSet("utf8");

                entity.Property(e => e.UserId)
                    .HasColumnType("int(11)")
                    .HasColumnName("user_id");

                entity.HasOne(d => d.User)
                    .WithMany(p => p.Allergies)
                    .HasForeignKey(d => d.UserId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("Allergy_ibfk_1");
            });

            modelBuilder.Entity<Cart>(entity =>
            {
                entity.HasKey(e => new { e.Userid, e.Productid })
                    .HasName("PRIMARY")
                    .HasAnnotation("MySql:IndexPrefixLength", new[] { 0, 0 });

                entity.ToTable("Cart");

                entity.HasIndex(e => e.Productid, "FK_Cart_Ingredients");

                entity.Property(e => e.Userid)
                    .HasColumnType("int(11)")
                    .HasColumnName("userid");

                entity.Property(e => e.Productid)
                    .HasColumnType("int(11)")
                    .HasColumnName("productid");

                entity.Property(e => e.Quantity).HasColumnName("quantity");

                entity.HasOne(d => d.Product)
                    .WithMany(p => p.Carts)
                    .HasForeignKey(d => d.Productid)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Cart_Ingredients");

                entity.HasOne(d => d.User)
                    .WithMany(p => p.Carts)
                    .HasForeignKey(d => d.Userid)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Cart_Users");
            });

            modelBuilder.Entity<Comment>(entity =>
            {
                entity.HasCharSet("utf8mb4")
                    .UseCollation("utf8mb4_unicode_ci");

                entity.HasIndex(e => e.RecipeId, "recipe_id");

                entity.HasIndex(e => e.UserId, "user_id");

                entity.Property(e => e.CommentId)
                    .HasColumnType("int(11)")
                    .HasColumnName("comment_id");

                entity.Property(e => e.CommentDate)
                    .HasColumnType("datetime(3)")
                    .HasColumnName("comment_date")
                    .HasDefaultValueSql("CURRENT_TIMESTAMP(3)");

                entity.Property(e => e.CommentText).HasColumnName("comment_text");

                entity.Property(e => e.RecipeId)
                    .HasColumnType("int(11)")
                    .HasColumnName("recipe_id");

                entity.Property(e => e.UserId)
                    .HasColumnType("int(11)")
                    .HasColumnName("user_id");

                entity.HasOne(d => d.Recipe)
                    .WithMany(p => p.Comments)
                    .HasForeignKey(d => d.RecipeId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("Comments_ibfk_1");

                entity.HasOne(d => d.User)
                    .WithMany(p => p.Comments)
                    .HasForeignKey(d => d.UserId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("Comments_ibfk_4");
            });

            modelBuilder.Entity<Diet>(entity =>
            {
                entity.ToTable("Diet");

                entity.Property(e => e.Id)
                    .HasColumnType("int(11)")
                    .HasColumnName("id");

                entity.Property(e => e.DietName)
                    .HasMaxLength(50)
                    .HasColumnName("diet_name")
                    .UseCollation("utf8_general_ci")
                    .HasCharSet("utf8");
            });

            modelBuilder.Entity<Image>(entity =>
            {
                entity.Property(e => e.ImageId)
                    .HasColumnType("int(11)")
                    .HasColumnName("image_id");

                entity.Property(e => e.ImageFilename)
                    .HasMaxLength(255)
                    .HasColumnName("image_filename")
                    .UseCollation("utf8_general_ci")
                    .HasCharSet("utf8");
            });

            modelBuilder.Entity<Ingredient>(entity =>
            {
                entity.HasIndex(e => e.ImageId, "image_id");

                entity.Property(e => e.IngredientId)
                    .HasColumnType("int(11)")
                    .HasColumnName("ingredient_id");

                entity.Property(e => e.ImageId)
                    .HasColumnType("int(11)")
                    .HasColumnName("image_id");

                entity.Property(e => e.Name)
                    .HasMaxLength(255)
                    .HasColumnName("name")
                    .UseCollation("utf8_general_ci")
                    .HasCharSet("utf8");

                entity.HasOne(d => d.Image)
                    .WithMany(p => p.Ingredients)
                    .HasForeignKey(d => d.ImageId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("Ingredients_ibfk_1");
            });

            modelBuilder.Entity<IngredientServingSize>(entity =>
            {
                entity.HasKey(e => e.ServingSizeId)
                    .HasName("PRIMARY");

                entity.ToTable("Ingredient_Serving_Sizes");

                entity.HasIndex(e => e.IngredientId, "ingredient_id");

                entity.Property(e => e.ServingSizeId)
                    .HasColumnType("int(11)")
                    .HasColumnName("serving_size_id");

                entity.Property(e => e.Description)
                    .HasMaxLength(255)
                    .HasColumnName("description")
                    .UseCollation("utf8_general_ci")
                    .HasCharSet("utf8");

                entity.Property(e => e.Grams).HasColumnName("grams");

                entity.Property(e => e.IngredientId)
                    .HasColumnType("int(11)")
                    .HasColumnName("ingredient_id");

                entity.Property(e => e.Qty).HasColumnName("qty");

                entity.Property(e => e.Scale).HasColumnName("scale");

                entity.Property(e => e.Units)
                    .HasMaxLength(50)
                    .HasColumnName("units")
                    .UseCollation("utf8_general_ci")
                    .HasCharSet("utf8");

                entity.HasOne(d => d.Ingredient)
                    .WithMany(p => p.IngredientServingSizes)
                    .HasForeignKey(d => d.IngredientId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("Ingredient_Serving_Sizes_ibfk_1");
            });

            modelBuilder.Entity<Meal>(entity =>
            {
                entity.ToTable("Meal");

                entity.HasIndex(e => e.MealRecipesId, "FK__Meal__meal_recip__6B24EA82");

                entity.Property(e => e.MealId)
                    .HasColumnType("int(11)")
                    .HasColumnName("meal_id");

                entity.Property(e => e.MealDate).HasColumnName("meal_date");

                entity.Property(e => e.MealRecipesId)
                    .HasColumnType("int(11)")
                    .HasColumnName("meal_recipes_id");

                entity.Property(e => e.MealType)
                    .HasMaxLength(50)
                    .HasColumnName("meal_type")
                    .UseCollation("utf8_general_ci")
                    .HasCharSet("utf8");

                entity.HasOne(d => d.MealRecipes)
                    .WithMany(p => p.Meals)
                    .HasForeignKey(d => d.MealRecipesId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK__Meal__meal_recip__6B24EA82");
            });

            modelBuilder.Entity<MealPlan>(entity =>
            {
                entity.HasKey(e => e.PlanId)
                    .HasName("PRIMARY");

                entity.ToTable("MealPlan");

                entity.HasIndex(e => e.UserId, "user_id");

                entity.Property(e => e.PlanId)
                    .HasColumnType("int(11)")
                    .HasColumnName("plan_id");

                entity.Property(e => e.EndDate)
                    .HasColumnType("datetime")
                    .HasColumnName("end_date");

                entity.Property(e => e.PlanType)
                    .HasMaxLength(10)
                    .HasColumnName("plan_type")
                    .UseCollation("utf8_general_ci")
                    .HasCharSet("utf8");

                entity.Property(e => e.StartDate)
                    .HasColumnType("datetime")
                    .HasColumnName("start_date");

                entity.Property(e => e.UserId)
                    .HasColumnType("int(11)")
                    .HasColumnName("user_id");

                entity.HasOne(d => d.User)
                    .WithMany(p => p.MealPlans)
                    .HasForeignKey(d => d.UserId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("MealPlan_ibfk_1");
            });

            modelBuilder.Entity<MealPlanManyToMany>(entity =>
            {
                entity.ToTable("MealPlanManyToMany");

                entity.HasIndex(e => e.MealId, "FK_MealPlanManyToMany_Meal");

                entity.HasIndex(e => e.PlanId, "FK_MealPlanManyToMany_MealPlan");

                entity.Property(e => e.Id)
                    .HasColumnType("int(11)")
                    .HasColumnName("id");

                entity.Property(e => e.Day)
                    .HasColumnType("datetime(3)")
                    .HasColumnName("day");

                entity.Property(e => e.MealId)
                    .HasColumnType("int(11)")
                    .HasColumnName("meal_id");

                entity.Property(e => e.PlanId)
                    .HasColumnType("int(11)")
                    .HasColumnName("plan_id");

                entity.HasOne(d => d.Meal)
                    .WithMany(p => p.MealPlanManyToManies)
                    .HasForeignKey(d => d.MealId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_MealPlanManyToMany_Meal");

                entity.HasOne(d => d.Plan)
                    .WithMany(p => p.MealPlanManyToManies)
                    .HasForeignKey(d => d.PlanId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_MealPlanManyToMany_MealPlan");
            });

            modelBuilder.Entity<Menu>(entity =>
            {
                entity.ToTable("Menu");

                entity.HasIndex(e => e.DietId, "diet_id");

                entity.Property(e => e.Id)
                    .HasColumnType("int(11)")
                    .HasColumnName("id");

                entity.Property(e => e.DietId)
                    .HasColumnType("int(11)")
                    .HasColumnName("diet_id");

                entity.Property(e => e.MenuName)
                    .HasMaxLength(50)
                    .HasColumnName("menu_name")
                    .UseCollation("utf8_general_ci")
                    .HasCharSet("utf8");

                entity.HasOne(d => d.Diet)
                    .WithMany(p => p.Menus)
                    .HasForeignKey(d => d.DietId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("Menu_ibfk_1");
            });

            modelBuilder.Entity<Nutrition>(entity =>
            {
                entity.HasKey(e => e.IngredientId)
                    .HasName("PRIMARY");

                entity.Property(e => e.IngredientId)
                    .HasColumnType("int(11)")
                    .ValueGeneratedNever()
                    .HasColumnName("ingredient_id");

                entity.Property(e => e.Calories).HasColumnName("calories");

                entity.Property(e => e.Carbohydrates).HasColumnName("carbohydrates");

                entity.Property(e => e.Fat).HasColumnName("fat");

                entity.Property(e => e.Protein).HasColumnName("protein");

                entity.Property(e => e.Sugar).HasColumnName("sugar");

                entity.HasOne(d => d.Ingredient)
                    .WithOne(p => p.Nutrition)
                    .HasForeignKey<Nutrition>(d => d.IngredientId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("Nutritions_ibfk_1");
            });

            modelBuilder.Entity<Order>(entity =>
            {
                entity.ToTable("Order");

                entity.HasIndex(e => e.Userid, "FK_Order_Users");

                entity.Property(e => e.Id)
                    .HasColumnType("int(11)")
                    .HasColumnName("id");

                entity.Property(e => e.Date).HasColumnName("date");

                entity.Property(e => e.Userid)
                    .HasColumnType("int(11)")
                    .HasColumnName("userid");

                entity.HasOne(d => d.User)
                    .WithMany(p => p.Orders)
                    .HasForeignKey(d => d.Userid)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Order_Users");
            });

            modelBuilder.Entity<OrderDetail>(entity =>
            {
                entity.ToTable("OrderDetail");

                entity.HasIndex(e => e.ProductId, "FK_OrderDetail_Ingredients");

                entity.HasIndex(e => e.Orderid, "FK_OrderDetail_Order");

                entity.Property(e => e.Id)
                    .HasColumnType("int(11)")
                    .HasColumnName("id");

                entity.Property(e => e.Orderid)
                    .HasColumnType("int(11)")
                    .HasColumnName("orderid");

                entity.Property(e => e.ProductId)
                    .HasColumnType("int(11)")
                    .HasColumnName("productId");

                entity.Property(e => e.Quantity)
                    .HasColumnType("int(11)")
                    .HasColumnName("quantity");

                entity.HasOne(d => d.Order)
                    .WithMany(p => p.OrderDetails)
                    .HasForeignKey(d => d.Orderid)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_OrderDetail_Order");

                entity.HasOne(d => d.Product)
                    .WithMany(p => p.OrderDetails)
                    .HasForeignKey(d => d.ProductId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_OrderDetail_Ingredients");
            });

            modelBuilder.Entity<Product>(entity =>
            {
                entity.HasKey(e => e.IngredientId)
                    .HasName("PRIMARY");

                entity.ToTable("Product");

                entity.Property(e => e.IngredientId)
                    .HasColumnType("int(11)")
                    .ValueGeneratedNever()
                    .HasColumnName("ingredient_id");

                entity.Property(e => e.Price).HasColumnName("price");

                entity.HasOne(d => d.Ingredient)
                    .WithOne(p => p.Product)
                    .HasForeignKey<Product>(d => d.IngredientId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Product_Ingredients");
            });

            modelBuilder.Entity<Recipe>(entity =>
            {
                entity.HasCharSet("utf8mb4")
                    .UseCollation("utf8mb4_unicode_ci");

                entity.HasIndex(e => e.ImageId, "image_id");

                entity.HasIndex(e => e.MenuId, "menu_id");

                entity.Property(e => e.RecipeId)
                    .HasColumnType("int(11)")
                    .HasColumnName("recipe_id");

                entity.Property(e => e.CookTime)
                    .HasColumnType("int(11)")
                    .HasColumnName("cook_time");

                entity.Property(e => e.Description).HasColumnName("description");

                entity.Property(e => e.ImageId)
                    .HasColumnType("int(11)")
                    .HasColumnName("image_id");

                entity.Property(e => e.MenuId)
                    .HasColumnType("int(11)")
                    .HasColumnName("menu_id");

                entity.Property(e => e.PrepTime)
                    .HasColumnType("int(11)")
                    .HasColumnName("prep_time");

                entity.Property(e => e.RecipeName)
                    .HasMaxLength(255)
                    .HasColumnName("recipe_name");

                entity.Property(e => e.Servings)
                    .HasColumnType("int(11)")
                    .HasColumnName("servings");

                entity.HasOne(d => d.Image)
                    .WithMany(p => p.Recipes)
                    .HasForeignKey(d => d.ImageId)
                    .HasConstraintName("Recipes_ibfk_1");

                entity.HasOne(d => d.Menu)
                    .WithMany(p => p.Recipes)
                    .HasForeignKey(d => d.MenuId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("Recipes_ibfk_4");
            });

            modelBuilder.Entity<RecipeAllergy>(entity =>
            {
                entity.ToTable("Recipe_Allergies");

                entity.HasIndex(e => e.AllergyId, "allergy_id");

                entity.HasIndex(e => e.RecipeId, "recipe_id");

                entity.Property(e => e.RecipeAllergyId)
                    .HasColumnType("int(11)")
                    .HasColumnName("recipe_allergy_id");

                entity.Property(e => e.AllergyId)
                    .HasColumnType("int(11)")
                    .HasColumnName("allergy_id");

                entity.Property(e => e.RecipeId)
                    .HasColumnType("int(11)")
                    .HasColumnName("recipe_id");

                entity.HasOne(d => d.Allergy)
                    .WithMany(p => p.RecipeAllergies)
                    .HasForeignKey(d => d.AllergyId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("Recipe_Allergies_ibfk_1");

                entity.HasOne(d => d.Recipe)
                    .WithMany(p => p.RecipeAllergies)
                    .HasForeignKey(d => d.RecipeId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("Recipe_Allergies_ibfk_4");
            });

            modelBuilder.Entity<RecipeIngredient>(entity =>
            {
                entity.ToTable("Recipe_Ingredients");

                entity.HasIndex(e => e.IngredientId, "ingredient_id");

                entity.HasIndex(e => e.RecipeId, "recipe_id");

                entity.HasIndex(e => e.ServingSizeId, "serving_size_id");

                entity.Property(e => e.RecipeIngredientId)
                    .HasColumnType("int(11)")
                    .HasColumnName("recipe_ingredient_id");

                entity.Property(e => e.IngredientId)
                    .HasColumnType("int(11)")
                    .HasColumnName("ingredient_id");

                entity.Property(e => e.RecipeId)
                    .HasColumnType("int(11)")
                    .HasColumnName("recipe_id");

                entity.Property(e => e.ServingSizeId)
                    .HasColumnType("int(11)")
                    .HasColumnName("serving_size_id");

                entity.HasOne(d => d.Ingredient)
                    .WithMany(p => p.RecipeIngredients)
                    .HasForeignKey(d => d.IngredientId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("Recipe_Ingredients_ibfk_1");

                entity.HasOne(d => d.Recipe)
                    .WithMany(p => p.RecipeIngredients)
                    .HasForeignKey(d => d.RecipeId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("Recipe_Ingredients_ibfk_4");

                entity.HasOne(d => d.ServingSize)
                    .WithMany(p => p.RecipeIngredients)
                    .HasForeignKey(d => d.ServingSizeId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("Recipe_Ingredients_ibfk_7");
            });

            modelBuilder.Entity<RecipeRating>(entity =>
            {
                entity.HasKey(e => e.RatingId)
                    .HasName("PRIMARY");

                entity.ToTable("Recipe_Ratings");

                entity.HasIndex(e => e.RecipeId, "recipe_id");

                entity.HasIndex(e => e.UserId, "user_id");

                entity.Property(e => e.RatingId)
                    .HasColumnType("int(11)")
                    .HasColumnName("rating_id");

                entity.Property(e => e.Rating)
                    .HasColumnType("int(11)")
                    .HasColumnName("rating");

                entity.Property(e => e.RatingDate)
                    .HasColumnType("datetime(3)")
                    .HasColumnName("rating_date")
                    .HasDefaultValueSql("CURRENT_TIMESTAMP(3)");

                entity.Property(e => e.RecipeId)
                    .HasColumnType("int(11)")
                    .HasColumnName("recipe_id");

                entity.Property(e => e.UserId)
                    .HasColumnType("int(11)")
                    .HasColumnName("user_id");

                entity.HasOne(d => d.Recipe)
                    .WithMany(p => p.RecipeRatings)
                    .HasForeignKey(d => d.RecipeId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("Recipe_Ratings_ibfk_1");

                entity.HasOne(d => d.User)
                    .WithMany(p => p.RecipeRatings)
                    .HasForeignKey(d => d.UserId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("Recipe_Ratings_ibfk_4");
            });

            modelBuilder.Entity<Step>(entity =>
            {
                entity.ToTable("Step");

                entity.HasCharSet("utf8mb4")
                    .UseCollation("utf8mb4_unicode_ci");

                entity.HasIndex(e => e.ImageId, "image_id");

                entity.HasIndex(e => e.RecipeId, "recipe_id");

                entity.Property(e => e.StepId)
                    .HasColumnType("int(11)")
                    .HasColumnName("step_id");

                entity.Property(e => e.Description).HasColumnName("description");

                entity.Property(e => e.ImageId)
                    .HasColumnType("int(11)")
                    .HasColumnName("image_id");

                entity.Property(e => e.RecipeId)
                    .HasColumnType("int(11)")
                    .HasColumnName("recipe_id");

                entity.Property(e => e.StepNumber)
                    .HasColumnType("int(11)")
                    .HasColumnName("step_number");

                entity.HasOne(d => d.Image)
                    .WithMany(p => p.Steps)
                    .HasForeignKey(d => d.ImageId)
                    .HasConstraintName("Step_ibfk_1");

                entity.HasOne(d => d.Recipe)
                    .WithMany(p => p.Steps)
                    .HasForeignKey(d => d.RecipeId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("Step_ibfk_4");
            });

            modelBuilder.Entity<User>(entity =>
            {
                entity.HasIndex(e => e.Email, "email")
                    .IsUnique();

                entity.HasIndex(e => e.Username, "username")
                    .IsUnique();

                entity.Property(e => e.UserId)
                    .HasColumnType("int(11)")
                    .HasColumnName("user_id");

                entity.Property(e => e.Email)
                    .HasColumnName("email")
                    .UseCollation("utf8_general_ci")
                    .HasCharSet("utf8");

                entity.Property(e => e.Gender)
                    .HasMaxLength(255)
                    .HasColumnName("gender");

                entity.Property(e => e.Height).HasColumnName("height");

                entity.Property(e => e.Password)
                    .HasMaxLength(255)
                    .HasColumnName("password")
                    .UseCollation("utf8_general_ci")
                    .HasCharSet("utf8");

                entity.Property(e => e.RegistrationDate)
                    .HasColumnType("datetime(3)")
                    .HasColumnName("registration_date")
                    .HasDefaultValueSql("CURRENT_TIMESTAMP(3)");

                entity.Property(e => e.Role)
                    .HasMaxLength(50)
                    .HasColumnName("role")
                    .UseCollation("utf8_general_ci")
                    .HasCharSet("utf8");

                entity.Property(e => e.Username)
                    .HasMaxLength(50)
                    .HasColumnName("username")
                    .UseCollation("utf8_general_ci")
                    .HasCharSet("utf8");

                entity.Property(e => e.Weight).HasColumnName("weight");
            });

            modelBuilder.Entity<UserGoal>(entity =>
            {
                entity.ToTable("User_Goals");

                entity.HasIndex(e => e.UserId, "user_id");

                entity.Property(e => e.UserGoalId)
                    .HasColumnType("int(11)")
                    .HasColumnName("user_goal_id");

                entity.Property(e => e.GoalDetails)
                    .HasMaxLength(255)
                    .HasColumnName("goal_details")
                    .UseCollation("utf8_general_ci")
                    .HasCharSet("utf8");

                entity.Property(e => e.GoalType)
                    .HasMaxLength(50)
                    .HasColumnName("goal_type")
                    .UseCollation("utf8_general_ci")
                    .HasCharSet("utf8");

                entity.Property(e => e.TargetDate).HasColumnName("target_date");

                entity.Property(e => e.UserId)
                    .HasColumnType("int(11)")
                    .HasColumnName("user_id");

                entity.HasOne(d => d.User)
                    .WithMany(p => p.UserGoals)
                    .HasForeignKey(d => d.UserId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("User_Goals_ibfk_1");
            });

            modelBuilder.Entity<UserPreference>(entity =>
            {
                entity.ToTable("User_Preferences");

                entity.HasIndex(e => e.DietId, "diet_id");

                entity.HasIndex(e => e.FavoriteRecipesId, "favorite_recipes_id");

                entity.HasIndex(e => e.UserId, "user_id");

                entity.Property(e => e.UserPreferenceId)
                    .HasColumnType("int(11)")
                    .HasColumnName("user_preference_id");

                entity.Property(e => e.DietId)
                    .HasColumnType("int(11)")
                    .HasColumnName("diet_id");

                entity.Property(e => e.FavoriteRecipesId)
                    .HasColumnType("int(11)")
                    .HasColumnName("favorite_recipes_id");

                entity.Property(e => e.UserId)
                    .HasColumnType("int(11)")
                    .HasColumnName("user_id");

                entity.HasOne(d => d.Diet)
                    .WithMany(p => p.UserPreferences)
                    .HasForeignKey(d => d.DietId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("User_Preferences_ibfk_1");

                entity.HasOne(d => d.FavoriteRecipes)
                    .WithMany(p => p.UserPreferences)
                    .HasForeignKey(d => d.FavoriteRecipesId)
                    .HasConstraintName("User_Preferences_ibfk_4");

                entity.HasOne(d => d.User)
                    .WithMany(p => p.UserPreferences)
                    .HasForeignKey(d => d.UserId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("User_Preferences_ibfk_7");
            });

            OnModelCreatingPartial(modelBuilder);
        }

        partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
    }
}
