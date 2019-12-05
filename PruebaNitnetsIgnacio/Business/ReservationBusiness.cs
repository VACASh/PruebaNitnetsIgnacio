using PruebaNitnetsIgnacio.Dac;
using PruebaNitnetsIgnacio.Models;
using System.Collections.Generic;

namespace PruebaNitnetsIgnacio.Business
{
    public class ReservationBusiness
    {
        public List<Pistas> CourtsAvailable(Reservas reservation)
        {

            if (reservation.DateReservation.TimeOfDay.TotalHours >= Constants.MINHOUR
                && reservation.DateReservation.TimeOfDay.TotalHours <= Constants.MAXHOUR)
            {
                //Comprueba si ha realizado mas de dos reservas
                if (ReservationDac.NumberOfReservations(reservation.IdMember) < 3)
                {
                    if (!ReservationDac.HaveMemberOtherReservationSameHour(reservation.IdMember, reservation.DateReservation))
                    {
                        return CourtsDac.getAllCourtsWhitoutReservation(reservation);
                    }
                }
            }
            return null;
        }
    }
}
