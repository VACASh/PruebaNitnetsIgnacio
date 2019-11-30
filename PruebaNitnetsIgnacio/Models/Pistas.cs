using System;
using System.Collections.Generic;

namespace PruebaNitnetsIgnacio.Models
{
    public partial class Pistas
    {
        public Pistas()
        {
            Reservas = new HashSet<Reservas>();
        }

        public int IdCourt { get; set; }
        public string KindSport { get; set; }

        public virtual Deportes KindSportNavigation { get; set; }
        public virtual ICollection<Reservas> Reservas { get; set; }
    }
}
