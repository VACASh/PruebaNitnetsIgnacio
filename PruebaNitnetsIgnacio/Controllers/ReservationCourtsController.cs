using System;
using System.Collections.Generic;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using PruebaNitnetsIgnacio.Business;
using PruebaNitnetsIgnacio.Dac;
using PruebaNitnetsIgnacio.Models;

namespace PruebaNitnetsIgnacio.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    [Authorize]
    public class ReservationCourtsController : ControllerBase
    {

        public ReservationCourtsController()
        {
        }

        // Get: api/ReservationCourts
        [HttpGet]
        public List<Reservas> ReservationList(Reservas reservas)
        {
            List<Reservas> reservationsDay = new List<Reservas>();
            DateTime dayReservations;
            dayReservations = JsonDateIsCorrect(reservas.DateReservation);

            try
            {
                reservationsDay = ReservationDac.GetReservationsDay(dayReservations);

                return reservationsDay;
            }
            catch (Exception e)
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

            if (availableCourts != null && availableCourts.Count > 0)
            {
                foreach (Pistas courtsToReserve in availableCourts)
                {
                    if (court.IdCourt == courtsToReserve.IdCourt)
                    {
                        isAvilableCourt = true;
                        break;
                    }

                }
            }
            if ( isAvilableCourt)
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
            Pistas court = CourtsDac.GetCourt(reservas.IdCourt);
            List<Reservas> reservationListDays = new List<Reservas>();
            reservationListDays = ReservationList(reservas);
            bool isBadRequest;
            bool isCorrectTime;

            isBadRequest = (court == null || court.KindSport != reservas.KindSport || reservation == null || reservation.IdMember != reservas.IdMember);
            isCorrectTime = (reservas.DateReservation.TimeOfDay.TotalHours >= Constants.MINHOUR
                    && reservas.DateReservation.TimeOfDay.TotalHours <= Constants.MAXHOUR);

            if (isBadRequest || !isCorrectTime)
            {
                return Unauthorized();
            }
            else
            {
                if (reservationListDays.Find(
               r => r.IdCourt == reservas.IdCourt
               && r.DateReservation == reservas.DateReservation)
               != null || court == null || reservation == null)
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




        }

        private DateTime JsonDateIsCorrect(DateTime dateTimeToReserve)
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
