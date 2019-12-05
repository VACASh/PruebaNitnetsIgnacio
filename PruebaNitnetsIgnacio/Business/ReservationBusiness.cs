using PruebaNitnetsIgnacio.Dac;
using PruebaNitnetsIgnacio.Models;
using System.Collections.Generic;

namespace PruebaNitnetsIgnacio.Business
{
    public class ReservationBusiness
    {
        public List<Pistas> CourtsAvailable(Reservas reservation)
        {
            List<Pistas> courtsAviable = null;
            List<Reservas> courtsReservedByMember = new List<Reservas>();
            List<Reservas> courstReservedByDayAndHour = new List<Reservas>();
            List<Pistas> courtsKindSport = new List<Pistas>();
           
                if (reservation.DateReservation.TimeOfDay.TotalHours >= Constants.MINHOUR
                    && reservation.DateReservation.TimeOfDay.TotalHours <= Constants.MAXHOUR)
                {
                    courtsReservedByMember = ReservationDac.listCourtsByMember(reservation.IdMember, reservation.DateReservation);
                    courstReservedByDayAndHour = ReservationDac.getReservationsDayAndHour(reservation);
                    courtsKindSport = CourtsDac.getAllCourtsKindSport(reservation.KindSport);

               
                //Elimina las pistas que estan reservadas para ese deporte por cualquier socio
                foreach (Reservas CourtsReserved in courstReservedByDayAndHour)
                    {
                        courtsKindSport.RemoveAll(c => c.IdCourt == CourtsReserved.IdCourt);
                    }

                    //Comprueba si ha realizado mas de dos reservas
                    if (courtsReservedByMember.Count < 3)
                    {
                        foreach (Reservas courtsReserved in courtsReservedByMember)
                        {
                            //Recorre la lista de reservas y comprueba que no tenga reserva a la misma hora 
                            if (courtsReserved.DateReservation == reservation.DateReservation)
                            {
                                return null;
                            }
                        }
                        //Da valor a la lista con pistas disponibles
                        courtsAviable = courtsKindSport;
                    }
                }
            
            //Devuelve pistas disponibles en caso de haber alguna pista y devuelve null en caso de no haber disponible
            return courtsAviable;
        }
    }
}
