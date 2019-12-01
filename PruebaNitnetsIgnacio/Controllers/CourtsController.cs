using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using PruebaNitnetsIgnacio.Dac;
using PruebaNitnetsIgnacio.Models;

namespace PruebaNitnetsIgnacio.Controllers
{
    
    [Route("api/[controller]")]
    [ApiController]
    public class CourtsController : ControllerBase
    {
       

        // POST: api/Courts
        [HttpPost]
        public List <Pistas> Post(Reservas reservas)
        {
            List <Pistas> courtsAviable = new List<Pistas>();
            List<Reservas> courtsReservedByMember = new List<Reservas>();
            List<Reservas> courstReservedByDayAndHour = new List<Reservas>();
            List<Pistas> courtsKindSport = new List<Pistas>();
            bool isCorrectJson = verifyJson(reservas);
            int MINHOUR = 8;
            int MAXHOUR = 21;

            if (isCorrectJson)
            {
                if (reservas.DateReservation.TimeOfDay.TotalHours >= MINHOUR && reservas.DateReservation.TimeOfDay.TotalHours <= MAXHOUR)
                {
                    courtsReservedByMember = ReservationDac.listCourtsByMember(reservas.IdMember, reservas.DateReservation);
                    courstReservedByDayAndHour = ReservationDac.getReservationsDayAndHour(reservas);
                    courtsKindSport = CourtsDac.getAllCourtsKindSport(reservas.KindSport);

                    ////TODO POR ARREGLAR LISTAS
                    //foreach (Reservas reservas1 in courstReservedByDayAndHour)
                    //{
                    //    courtsKindSport.Remove(s => s.pi)
                    //}
                    
                    ////JUNTAR LISTAS
                    //(r => r.KindSport.Contains(courstReservedByDayAndHour.Where(s => s.KindSport.Contains(r.KindSport));

                    //if (courtsReservedByMember.Count > 2)
                    //{
                    //    return null;

                    //}
                    //else
                    {
                        foreach (Reservas courtsReserved in courtsReservedByMember)
                        {
                            if (courtsReserved.DateReservation == reservas.DateReservation)
                            {
                                return null;
                            }
                        }

                        


                    }
                }
               
            }

            return courtsAviable;
        }

        private bool verifyJson(Reservas reservas)
        {
            if (!string.IsNullOrEmpty(reservas.KindSport) && reservas.IdMember != 0  && reservas.DateReservation != null)
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
