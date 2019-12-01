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
            catch (DbException ex)
            {
                //capturar excepcion y guardar en bdd el usuario y el porque de la excepción 
                return null; ;
            }

        }

        internal static bool existUserLogin(string login)
        {
            Usuarios user = new Usuarios();
            using (DataBaseSportClubContext dbSportContext = new DataBaseSportClubContext())
            {
                user = dbSportContext.Usuarios.Where(s => s.Login == login).FirstOrDefault();
            }

            if (user != null)
            {
                return true;
            }
            else
            {
                return false;
            }
        }

        internal static bool existUserEmail(string email)
        {
            Usuarios user = new Usuarios();
            using (DataBaseSportClubContext dbSportContext = new DataBaseSportClubContext())
            {
                user = dbSportContext.Usuarios.Where(s => s.Email == email).FirstOrDefault();
            }

            if (user != null)
            {
                return true;
            }
            else
            {
                return false;
            }
        }

        internal static Usuarios RegisterUser(Usuarios userToRegister)
        {
            Usuarios userRegistered = new Usuarios();
            using (DataBaseSportClubContext dbSportContext = new DataBaseSportClubContext())
            {
                dbSportContext.Usuarios.Add(new Usuarios
                {
                    Dni = userToRegister.Dni,
                    Email = userToRegister.Email,
                    Login = userToRegister.Login,
                    Password = userToRegister.Password,
                    Name = userToRegister.Name
                });
                if (dbSportContext.SaveChanges() >0)
                {
                    return userToRegister;
                }
                else
                {
                    return null;
                }
            }
          
        }

        internal static bool existUserDni(string dni)
        {
            Usuarios user = new Usuarios();
            using (DataBaseSportClubContext dbSportContext = new DataBaseSportClubContext())
            {
                user = dbSportContext.Usuarios.Where(s => s.Dni == dni).FirstOrDefault();
            }

            if (user != null)
            {
                return true;
            }
            else
            {
                return false;
            }
        }
    }
}
