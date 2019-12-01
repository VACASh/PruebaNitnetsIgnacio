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
    public class ReservationCourtsController : ControllerBase
    {
       

        // POST: api/ReservationCourts
        [HttpPost]
        public List <Reservas> Post(Reservas reservas)
        {
            List <Reservas> reservationsDay = new List<Reservas>();
            DateTime dayReservations;
             dayReservations = jsonDateIsCorrect(reservas.DateReservation);
            
            if (dayReservations != null)
            {
               
                reservationsDay = ReservationDac.getReservationsDay(dayReservations);

                return reservationsDay;
            }
            else
            {
                return null;
            }
                    
        }

        private DateTime jsonDateIsCorrect(DateTime dateTimeToReserve)
        {
            DateTime dayReservations = new DateTime();
            try
            {
                dayReservations = Convert.ToDateTime(dateTimeToReserve);
            }
            catch (Exception)
            {
               
            }

            return dayReservations;
        }

        // PUT: api/ReservationCourts/5
        [HttpPut("{id}")]
        public void Put(int id, [FromBody] string value)
        {
        }

        // DELETE: api/ApiWithActions/5
        [HttpDelete("{id}")]
        public void Delete(int id)
        {
        }
    }
}
