using System;
using System.Collections.Generic;

namespace PruebaNitnetsIgnacio.Models
{
    public partial class Usuarios
    {
        public int IdUser { get; set; }
        public string Login { get; set; }
        public byte[] Password { get; set; }
    }
}
