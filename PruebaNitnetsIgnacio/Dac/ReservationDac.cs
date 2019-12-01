using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using PruebaNitnetsIgnacio.Models;

namespace PruebaNitnetsIgnacio.Dac
{
    public class ReservationDac
    {
        internal static List <Reservas> getReservationsDay(DateTime? dateReservation)
        {
            List<Reservas> reservationsDay;
            //TODO DEVOLVER EL DEPORTE
            using (DataBaseSportClubContext dbSportContext = new DataBaseSportClubContext())
            {
                reservationsDay = dbSportContext.Reservas.
                    Where(s => s.DateReservation == dateReservation)
                   .ToList();
                    
            }


            return reservationsDay;
        }
    }
}
