using System;
using System.Collections.Generic;

namespace PruebaNitnetsIgnacio.Models
{
    public partial class Socios
    {
        public Socios()
        {
            Reservas = new HashSet<Reservas>();
        }

        public int IdMember { get; set; }
        public string Name { get; set; }
        public string FirstSurname { get; set; }
        public string SecondSurname { get; set; }
        public string IdentityNumber { get; set; }
        public string AddressStreet { get; set; }
        public string AdressNumber { get; set; }
        public int? AddressFloor { get; set; }
        public string ZipCode { get; set; }

        public virtual ICollection<Reservas> Reservas { get; set; }
    }
}
