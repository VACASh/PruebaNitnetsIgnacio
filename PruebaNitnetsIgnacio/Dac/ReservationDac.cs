using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using PruebaNitnetsIgnacio.Models;

namespace PruebaNitnetsIgnacio.Dac
{
    public class ReservationDac
    {
        internal static List<Reservas> GetReservationsDay(DateTime dateReservation)
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

        internal static Reservas GetReservation(int idReservation)
        {

            using (DataBaseSportClubContext dbSportContext = new DataBaseSportClubContext())
            {
                return dbSportContext.Reservas.Find(idReservation);

            }
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


        internal static int NumberOfReservations(int idMember)
        {
            List<Reservas> courtsReserverdByMember = new List<Reservas>();

            using (DataBaseSportClubContext dataBaseSportClub = new DataBaseSportClubContext())
            {
                courtsReserverdByMember = dataBaseSportClub.Reservas
                    .Where(r => r.IdMember == idMember)
                    .ToList();
                return courtsReserverdByMember.Count;
            }
        }

        internal static bool HaveMemberOtherReservationSameHour(int idMember, DateTime dateReservation)
        {
            List<Reservas> courtsReserverdByMember = new List<Reservas>();

            using (DataBaseSportClubContext dataBaseSportClub = new DataBaseSportClubContext())
            {
                courtsReserverdByMember = dataBaseSportClub.Reservas
                    .Where(r => r.IdMember == idMember && r.DateReservation.Date == dateReservation.Date)
                    .ToList();
                return courtsReserverdByMember.Count == 0 ? false : true;
            }
        }

        internal static List<Reservas> GetReservationByMember(int idMember)
        {
            List<Reservas> courtsReserverdByMember = new List<Reservas>();

            using (DataBaseSportClubContext dataBaseSportClub = new DataBaseSportClubContext())
            {
                courtsReserverdByMember = dataBaseSportClub.Reservas
                    .Where(r => r.IdMember == idMember )
                    .ToList();
                return courtsReserverdByMember;
            }
        }

        internal static List <Reservas> GetAllReservationsCourts(int idCourt)
        {
            using (DataBaseSportClubContext dbSportContext = new DataBaseSportClubContext())
            {
                return dbSportContext.Reservas.Where(r =>  r.IdCourt == idCourt).ToList();

            }
        }

        internal static List<Reservas> getReservationsDayAndHour(Reservas reservas)
        {
            List<Reservas> courtsReserverdBySportAndHour = new List<Reservas>();

            using (DataBaseSportClubContext dataBaseSportClub = new DataBaseSportClubContext())
            {
                courtsReserverdBySportAndHour = dataBaseSportClub.Reservas
                   .Where(r => r.DateReservation == reservas.DateReservation && r.KindSport == reservas.KindSport)
                   .ToList();

                return courtsReserverdBySportAndHour;
            }
        }

        internal static bool DeleteReservation(int idReservation)
        {
            Reservas reservationtoDelete = new Reservas();
            using (DataBaseSportClubContext dataBaseSportClub = new DataBaseSportClubContext())
            {
                try
                {
                    reservationtoDelete = dataBaseSportClub.Reservas.Find(idReservation);
                    dataBaseSportClub.Reservas.Remove(reservationtoDelete);
                    return dataBaseSportClub.SaveChanges() > 0 ? true : false;

                }
                catch (Exception ex)
                {
                    return false;
                }
            }
        }

        internal static bool UpdateReservation(Reservas reservas)
        {
            Reservas reservationToModify = new Reservas();
            using (DataBaseSportClubContext dataBaseSportClub = new DataBaseSportClubContext())
            {
                try
                {
                    reservationToModify = dataBaseSportClub.Reservas.Find(reservas.IdReservation);

                    reservationToModify.IdCourt = reservas.IdCourt;
                    reservationToModify.KindSport = reservas.KindSport;
                    reservationToModify.DateReservation = reservas.DateReservation;
                                        
                    return dataBaseSportClub.SaveChanges() > 0 ? true : false;

                }
                catch (Exception ex)
                {
                    return false;
                }
            }
        }

        internal static bool ReserveCourt(Reservas reservas)
        {
            using (DataBaseSportClubContext dataBaseSportClub = new DataBaseSportClubContext())
            {
                try
                {
                    dataBaseSportClub.Reservas.Add(
                    reservas
                    );
                    return dataBaseSportClub.SaveChanges() > 0 ? true : false;
                }
                catch (Exception ex)
                {

                    return false;
                }

            }
        }
    }
}
