using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using PruebaNitnetsIgnacio.Models;

namespace PruebaNitnetsIgnacio.Dac
{
    public class ReservationDac
    {
        internal static List<Reservas> getReservationsDay(DateTime dateReservation)
        {
            List<Reservas> reservationsDay;
            //TODO NO DEJAR INSERTAR UN DEPORTE DISTINTO DE EL DE LA PISTA por codigo
            using (DataBaseSportClubContext dbSportContext = new DataBaseSportClubContext())
            {
                reservationsDay = dbSportContext.Reservas.
                    Where(s => s.DateReservation.Date == dateReservation.Date)
                   .ToList();

            }


            return reservationsDay;
        }

        internal static List<Reservas> listCourtsByMember(int idMember, DateTime dateReservation)
        {
            List<Reservas> courtsReserverdByMember = new List<Reservas>();

            using (DataBaseSportClubContext dataBaseSportClub = new DataBaseSportClubContext())
            {
                courtsReserverdByMember = dataBaseSportClub.Reservas
                    .Where(r => r.IdMember == idMember && r.DateReservation.Date == dateReservation.Date)
                    .ToList();
                return courtsReserverdByMember;
            }
        }

        internal static List<Reservas> getReservationsDayAndHour(Reservas reservas)
        {
            List<Reservas> courtsReserverdBySportAndHour = new List<Reservas>();

            using (DataBaseSportClubContext dataBaseSportClub = new DataBaseSportClubContext())
            {
                courtsReserverdBySportAndHour = dataBaseSportClub.Reservas
                    .Where(r =>  r.DateReservation == reservas.DateReservation && r.KindSport== reservas.KindSport )
                    .ToList();
                return courtsReserverdBySportAndHour;
            }
        }
    }
}
