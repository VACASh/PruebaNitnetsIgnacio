using System;
using System.Collections.Generic;

namespace PruebaNitnetsIgnacio.Models
{
    public partial class Deportes
    {
        public Deportes()
        {
            Pistas = new HashSet<Pistas>();
        }

        public string KindSport { get; set; }
        public string DescSport { get; set; }

        public virtual ICollection<Pistas> Pistas { get; set; }
    }
}
