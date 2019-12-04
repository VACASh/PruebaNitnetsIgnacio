using System;
using System.Collections.Generic;
using System.Data.Common;
using System.Linq;
using System.Threading.Tasks;
using PruebaNitnetsIgnacio.Models;

namespace PruebaNitnetsIgnacio.Dac
{
    public class SportsDac
    {
        internal static List<Deportes> getAllSports()
        {
            List<Deportes> allSports = new List<Deportes>();

            using (DataBaseSportClubContext dataBaseSportClub = new DataBaseSportClubContext())
            {
                allSports = dataBaseSportClub.Deportes.ToList(); 
                return allSports;
            }
        }

        internal static Deportes getOneSports(string kindSport)
        {
            Deportes sport = new Deportes();

            using (DataBaseSportClubContext dataBaseSportClub = new DataBaseSportClubContext())
            {
                sport = dataBaseSportClub.Deportes.Find(kindSport);
                return sport;
            }
        }
        internal static bool DeleteSport(string kindSport)
        {
            Deportes sportToDelete = new Deportes();
            try
            {
                using (DataBaseSportClubContext dbSportContext = new DataBaseSportClubContext())
                {
                    sportToDelete = dbSportContext.Deportes.Find(kindSport);
                    dbSportContext.Remove(sportToDelete);

                    return dbSportContext.SaveChanges() > 0 ? true : false;
                }
            }
            catch (Exception ex)
            {
                //capturar excepcion y guardar en bdd el usuario y el porque de la excepción 
                return false;
            }

        }

        internal static bool UpdateSport(Deportes updateSport)
        {
            Deportes sport = new Deportes();

            try
            {
                using (DataBaseSportClubContext dataBaseSportClub = new DataBaseSportClubContext())
                {
                    sport = dataBaseSportClub.Deportes.Find(updateSport.KindSport);
                    sport.DescSport = updateSport.DescSport;
                    return dataBaseSportClub.SaveChanges() > 0 ? true : false;
                }
            }
            catch (Exception)
            {

                return false;
            }
            
        }

        internal static bool insertNewSports(Deportes newSport)
        {
            Deportes sport = new Deportes();

            try
            {
                using (DataBaseSportClubContext dataBaseSportClub = new DataBaseSportClubContext())
                {
                    dataBaseSportClub.Deportes.Add(newSport);
                    return dataBaseSportClub.SaveChanges() > 0 ? true : false;
                }
            }
            catch (Exception ex )
            {

                return false;
            }
           
        }
    }
   
}
