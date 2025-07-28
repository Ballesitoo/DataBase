using Microsoft.EntityFrameworkCore;
using DataBase;

public class MyDbContext : DbContext
{
    public MyDbContext(DbContextOptions<MyDbContext> options)
        : base(options)
    {
    }

    // Añade tus tablas como propiedades DbSet
    public DbSet<Usuario> Usuarios { get; set; }
}
