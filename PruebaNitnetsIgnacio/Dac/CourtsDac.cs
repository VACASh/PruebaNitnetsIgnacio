﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using PruebaNitnetsIgnacio.Models;
using PagedList;

namespace PruebaNitnetsIgnacio.Dac
{
    public class CourtsDac
    {
        internal static List<Pistas> getAllCourtsKindSport(string kindSport)
        {
            List<Pistas> allCourtsByKindSport = new List<Pistas>();

            using (DataBaseSportClubContext dataBaseSportClub = new DataBaseSportClubContext())
            {
                allCourtsByKindSport = dataBaseSportClub.Pistas
                    .Where(r => r.KindSport == kindSport)
                    .ToList();
                return allCourtsByKindSport;
            }
        }

        internal static List<Pistas> getAllCourtsWhitoutReservation(Reservas reservation)
        {
            List<Pistas> allCourtsByKindSport = new List<Pistas>();



            using (DataBaseSportClubContext dataBaseSportClub = new DataBaseSportClubContext())
            {

                
                //Todas las pistas
                allCourtsByKindSport = dataBaseSportClub.Pistas.Where(p => p.KindSport == reservation.KindSport).ToList();
                List<Reservas> sportsWhitoutReservation = new List<Reservas>();

                //Pistas con reserva
                sportsWhitoutReservation =  
                    dataBaseSportClub.Reservas.Where(r => 
                r.DateReservation == reservation.DateReservation 
                && r.KindSport == reservation.KindSport).ToList();

                foreach (Reservas courtForRemove in sportsWhitoutReservation)
                {
                    allCourtsByKindSport.RemoveAll(s => s.IdCourt == courtForRemove.IdCourt);
                }
                return allCourtsByKindSport;
                   
            }
        }

        internal static Pistas GetCourt(int idCourt)
        {
            using (DataBaseSportClubContext dataBaseSportClub = new DataBaseSportClubContext())
            {
                return dataBaseSportClub.Pistas.Find(idCourt);
            }
        }

        internal static IPagedList<Pistas> GetCourts(int pagina)
        {
            using (DataBaseSportClubContext dataBaseSportClub = new DataBaseSportClubContext())
            {
                return dataBaseSportClub.Pistas.ToPagedList(pagina, Constants.NITEMSPERPAGE);
            }
        }

        internal static bool InsertNewCourt(Pistas court)
        {
            using (DataBaseSportClubContext dataBaseSportClub = new DataBaseSportClubContext())
            {
                try
                {
                    dataBaseSportClub.Pistas.AddRange(
                    court
                    );
                    return dataBaseSportClub.SaveChanges() > 0 ? true : false;
                }
                catch (Exception ex)
                {

                    return false;
                }

            }
        }

        internal static bool DeleteMember(Socios member)
        {
            using (DataBaseSportClubContext dataBaseSportClub = new DataBaseSportClubContext())
            {
                try
                {
                    dataBaseSportClub.Socios.Remove(
                    member
                    );
                    return dataBaseSportClub.SaveChanges() > 0 ? true : false;
                }
                catch (Exception ex)
                {

                    return false;
                }

            }
        }

        internal static bool DeleteCourt(Pistas court)
        {
            using (DataBaseSportClubContext dataBaseSportClub = new DataBaseSportClubContext())
            {
                try
                {
                    dataBaseSportClub.Pistas.Remove(
                    court
                    );
                    return dataBaseSportClub.SaveChanges() > 0 ? true : false;
                }
                catch (Exception ex)
                {

                    return false;
                }

            }
        }

        internal static bool UpdateCourt(Pistas court)
        {

            Pistas courtToModify = new Pistas();
            using (DataBaseSportClubContext dataBaseSportClub = new DataBaseSportClubContext())
            {
                try
                {
                    courtToModify = dataBaseSportClub.Pistas.Find(court.IdCourt);
                    courtToModify.KindSport = court.KindSport;

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
