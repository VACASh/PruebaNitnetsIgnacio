using System;
using System.Collections.Generic;

namespace PruebaNitnetsIgnacio.Models
{
    public partial class Reservas
    {
        public int IdReservation { get; set; }
        public int IdCourt { get; set; }
        public int IdMember { get; set; }
        public int TimeReservation { get; set; }
        public DateTime DateReservation { get; set; }

        public virtual Pistas IdCourtNavigation { get; set; }
        public virtual Socios IdMemberNavigation { get; set; }
    }
}
