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
    }
    
}
