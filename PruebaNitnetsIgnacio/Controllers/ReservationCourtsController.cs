using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Configuration;
using PruebaNitnetsIgnacio.Business;
using PruebaNitnetsIgnacio.Dac;
using PruebaNitnetsIgnacio.Models;

namespace PruebaNitnetsIgnacio.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ReservationCourtsController : ControllerBase
    {
        private readonly IConfiguration configuration;

        public ReservationCourtsController(IConfiguration configuration)
        {
            this.configuration = configuration;
        }

        // Get: api/ReservationCourts
        [HttpGet]
        public List<Reservas> ReservationList(Reservas reservas)
        {
            List<Reservas> reservationsDay = new List<Reservas>();
            DateTime dayReservations;
            dayReservations = JasonDateIsCorrect(reservas.DateReservation);

            if (dayReservations != null)
            {

                reservationsDay = ReservationDac.GetReservationsDay(dayReservations);

                return reservationsDay;
            }
            else
            {
                return null;
            }

        }

        [HttpPost]
        public IActionResult ReservationCourt(Reservas reservas)
        {
            ReservationBusiness reservationBusiness = new ReservationBusiness();
            List<Pistas> availableCourts = new List<Pistas>();
            availableCourts = reservationBusiness.CourtsAvailable(reservas);
            Pistas court = CourtsDac.GetCourt(reservas.IdCourt);
            bool isAvilableCourt = false;

            foreach (Pistas courtsToReserve in availableCourts)
            {
                if (court.IdCourt == courtsToReserve.IdCourt)
                {
                    isAvilableCourt = true;
                    break;
                }
                
            }

            if (availableCourts != null && isAvilableCourt)
            {
                ReservationDac.ReserveCourt(reservas);
                return Ok();
            }
            else
            {
                return Unauthorized();
            }
        }

        [HttpDelete]
        public IActionResult DeleteReservation(Reservas reservation)
        {

            Reservas reservationToDelete = ReservationDac.GetReservation(reservation.IdReservation);
            if (reservationToDelete != null && reservationToDelete.DateReservation.Date > DateTime.Now.Date)
            {
                ReservationDac.DeleteReservation(reservation.IdReservation);
                return Ok();
            }
            else
            {
                return BadRequest();
            }
        }

        [HttpPut]
        public IActionResult ModifyReservation(Reservas reservas)
        {
            Reservas reservation = ReservationDac.GetReservation(reservas.IdReservation);
            Pistas courts = CourtsDac.GetCourt(reservas.IdCourt);
            List<Reservas> reservationListDays = new List<Reservas>();
            reservationListDays = ReservationList(reservas);

            if (reservationListDays.Find(
                r => r.KindSport == reservas.KindSport
                && r.IdCourt == reservas.IdCourt
                && r.DateReservation == reservas.DateReservation)
                != null || courts == null || reservation == null)
            {
                return Unauthorized();
            }
            else
            {
                try
                {
                    ReservationDac.UpdateReservation(reservas);
                    return Ok();
                }
                catch (Exception ex)
                {

                    return Conflict();
                }
               
            }


        }




        private DateTime JasonDateIsCorrect(DateTime dateTimeToReserve)
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

       
    }
}
