src/webapp
dotnet new mvc --language "C#" --auth Individual --framework "net5.0" --use-local-db

/
dotnet new gitignore


@"

// this will do the initial DB population
InitializeDatabase(app);
}

private void InitializeDatabase(IApplicationBuilder app)
{
try
{
    using (var scope = app.ApplicationServices.GetService<IServiceScopeFactory>().CreateScope())
    {
        scope.ServiceProvider.GetRequiredService<ApplicationDbContext>().Database.Migrate();
    }
}
catch{}
}
"@