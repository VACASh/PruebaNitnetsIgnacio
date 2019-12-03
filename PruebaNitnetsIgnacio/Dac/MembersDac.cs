using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using PruebaNitnetsIgnacio.Models;

namespace PruebaNitnetsIgnacio.Dac
{
    public class MembersDac
    {
        internal static List<Socios> GetAllMembers()
        {
            List<Socios> allMembers = new List<Socios>();

            using (DataBaseSportClubContext dataBaseSportClub = new DataBaseSportClubContext())
            {
                allMembers = dataBaseSportClub.Socios.ToList();
                return allMembers;
            }
        }

        internal static object CreateMember(Socios usuario)
        {
            Socios memberRegistered = new Socios();
            using (DataBaseSportClubContext dbSportContext = new DataBaseSportClubContext())
            {
                dbSportContext.Socios.Add(new Socios
                {
                    AddressFloor = usuario.AddressFloor,
                    AddressStreet = usuario.AddressStreet,
                    AdressNumber = usuario.AdressNumber,
                    Email = usuario.Email,
                    Name = usuario.Name,
                    FirstSurname = usuario.FirstSurname,
                    SecondSurname = usuario.SecondSurname,
                    IdMember = usuario.IdMember,
                    ZipCode = usuario.ZipCode
                });
                if (dbSportContext.SaveChanges() > 0)
                {
                    return memberRegistered;
                }
                else
                {
                    return null;
                }
            }
        }

        internal static bool UpdateMember(Socios member)
        {
            Socios memberToModify = new Socios();
            using (DataBaseSportClubContext dataBaseSportClub = new DataBaseSportClubContext())
            {
                try
                {
                    memberToModify = dataBaseSportClub.Socios.Find(member.IdMember);

                    memberToModify.AddressFloor = member.AddressFloor;
                    memberToModify.AddressStreet = member.AddressStreet;
                    memberToModify.AdressNumber = member.AdressNumber;
                    memberToModify.Email = member.Email;
                    memberToModify.Name = member.Name;
                    memberToModify.FirstSurname = member.FirstSurname;
                    memberToModify.SecondSurname = member.SecondSurname;
                    memberToModify.IdMember = member.IdMember;
                    memberToModify.ZipCode = member.ZipCode;

                    return dataBaseSportClub.SaveChanges() > 0 ? true : false;

                }
                catch (Exception ex)
                {
                    return false;
                }
            }
        }

        internal static Socios GetMember(int idMember)
        {
            using (DataBaseSportClubContext dataBaseSportClub = new DataBaseSportClubContext())
            {
                return dataBaseSportClub.Socios.Find(idMember);
            }
        }
    }
}
