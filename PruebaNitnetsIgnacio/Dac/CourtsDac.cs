using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using PruebaNitnetsIgnacio.Models;

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

        internal static Pistas GetCourt(int idCourt)
        {
            using (DataBaseSportClubContext dataBaseSportClub = new DataBaseSportClubContext())
            {
                return dataBaseSportClub.Pistas.Find(idCourt);
            }
        }

        internal static List<Pistas> GetCourts()
        {
            using (DataBaseSportClubContext dataBaseSportClub = new DataBaseSportClubContext())
            {
                return dataBaseSportClub.Pistas.ToList();
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
