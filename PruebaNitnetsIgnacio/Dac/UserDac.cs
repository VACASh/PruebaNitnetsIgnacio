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



        //CRUD
        internal static Usuarios CreateUser(Usuarios userToRegister)
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
                if (dbSportContext.SaveChanges() > 0)
                {
                    return userToRegister;
                }
                else
                {
                    return null;
                }
            }
        }

        internal static Usuarios ReadUser(Usuarios user)
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
                return null;
            }

        }

        internal static List <Usuarios> GetAllUsers()
        {
            List<Usuarios> userLogin = new List<Usuarios>();
            try
            {
                using (DataBaseSportClubContext dbSportContext = new DataBaseSportClubContext())
                {
                    userLogin = dbSportContext.Usuarios.ToList();
                }

                return userLogin;
            }
            catch (DbException ex)
            {
                //capturar excepcion y guardar en bdd el usuario y el porque de la excepción 
                return null;
            }

        }

        internal static bool UpdateUser(Usuarios user)
        {
            Usuarios userLogin = new Usuarios();
            try
            {
                using (DataBaseSportClubContext dbSportContext = new DataBaseSportClubContext())
                {
                    userLogin = dbSportContext.Usuarios.Find(user.Login);
                    if (userLogin != null)
                    {
                        userLogin.Dni = user.Dni != null ? user.Dni : userLogin.Dni;
                        userLogin.Email = user.Email != null ? user.Email : userLogin.Email;
                        userLogin.Name = user.Name != null ? user.Name : userLogin.Name;
                        userLogin.Password = user.Password != null ? user.Password : userLogin.Password;


                        return dbSportContext.SaveChanges() > 0 ? true : false;
                    }
                    else
                    {
                        return false;
                    }
                   

                }
            }
            catch (DbException ex)
            {
                //capturar excepcion y guardar en bdd el usuario y el porque de la excepción 
                return false;
            }

        }

        internal static bool DeleteUser(Usuarios user)
        {
            Usuarios userLogin = new Usuarios();
            try
            {
                using (DataBaseSportClubContext dbSportContext = new DataBaseSportClubContext())
                {
                    userLogin = dbSportContext.Usuarios.Find(user.Login);
                    dbSportContext.Remove(userLogin);

                    return dbSportContext.SaveChanges() > 0 ? true : false;
                }
            }
            catch (DbException ex)
            {
                //capturar excepcion y guardar en bdd el usuario y el porque de la excepción 
                return false;
            }

        }


        //Extras
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
