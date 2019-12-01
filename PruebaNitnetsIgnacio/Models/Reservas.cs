using System;
using System.Collections.Generic;

namespace PruebaNitnetsIgnacio.Models
{
    public partial class Reservas
    {
        public int IdReservation { get; set; }
        public int IdCourt { get; set; }
        public int IdMember { get; set; }
        public DateTime DateReservation { get; set; }
        public TimeSpan TimeStart { get; set; }
        public TimeSpan TimeEnd { get; set; }
        public string KindSport { get; set; }

        public virtual Pistas IdCourtNavigation { get; set; }
        public virtual Socios IdMemberNavigation { get; set; }
        public virtual Deportes KindSportNavigation { get; set; }
    }
}
