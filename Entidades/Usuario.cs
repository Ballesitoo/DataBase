using System.ComponentModel.DataAnnotations.Schema;

namespace DataBase
{
    [Table("Usuarios", Schema = "fototeca")]
    public class Usuario
    {
        public int Id { get; set; }
        public string Nombre { get; set; }
        public string Contrasenya { get; set; }
    }
}
