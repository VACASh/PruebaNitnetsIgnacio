using PruebaNitnetsIgnacio.Models;
using System;
using System.Collections.Generic;
using System.Data.Common;
using System.Linq;
using System.Threading.Tasks;

namespace PruebaNitnetsIgnacio.Dac
{
    public class UserDac
    {

        

        internal static Usuarios isCorrectLogin(Usuarios user)
        {
            Usuarios userLogin = new Usuarios();
            try
            {
                using (DataBaseSportClubContext dbSportContext = new DataBaseSportClubContext())
                {
                    userLogin = dbSportContext.Usuarios.Where(s => s.Login == user.Login && s.Password == user.Password).FirstOrDefault();
                }

                return userLogin;
            }
            catch (DbException ex )
            {
                //capturar excepcion y guardar en bdd el usuario y el porque de la excepción 
                return null; ;
            }
          
        }
    }
}
