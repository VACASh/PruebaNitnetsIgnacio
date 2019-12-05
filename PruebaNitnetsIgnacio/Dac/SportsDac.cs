using System;
using System.Collections.Generic;
using System.Data.Common;
using System.Linq;
using System.Threading.Tasks;
using PagedList;
using PruebaNitnetsIgnacio.Models;

namespace PruebaNitnetsIgnacio.Dac
{
    public class SportsDac
    {
        internal static IPagedList<Deportes> GetAllSports(int pagina)
        {
            using (DataBaseSportClubContext dataBaseSportClub = new DataBaseSportClubContext())
            {
                return dataBaseSportClub.Deportes.ToPagedList(pagina,
                                                              Constants.NITEMSPERPAGE);
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

        internal static bool InsertNewSports(Deportes newSport)
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
            catch (Exception ex)
            {

                return false;
            }

        }
    }

}
