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

        internal static bool CreateMember(Socios newMember)
        {
            Socios memberRegistered = new Socios();
            using (DataBaseSportClubContext dbSportContext = new DataBaseSportClubContext())
            {
                try
                {
                    dbSportContext.Socios.Add(new Socios
                    {
                        AddressFloor = newMember.AddressFloor,
                        AddressStreet = newMember.AddressStreet,
                        AdressNumber = newMember.AdressNumber,
                        Email = newMember.Email,
                        Name = newMember.Name,
                        FirstSurname = newMember.FirstSurname,
                        SecondSurname = newMember.SecondSurname,
                        ZipCode = newMember.ZipCode,
                        IdentityNumber = newMember.IdentityNumber
                    });
                    return dbSportContext.SaveChanges() > 0 ? true : false;
                }
                catch (Exception ex)
                {
                    return false;
                   
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
