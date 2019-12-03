using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using PruebaNitnetsIgnacio.Business;
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
        [Route("api/reservationByDate")]
        public List<Pistas> CourtsAvailable(Reservas reservas)
        {
            ReservationBusiness reservationbusiness = new ReservationBusiness();

            return reservationbusiness.CourtsAvailable(reservas);
        }

        [HttpGet]
        public List<Pistas> GetCourts()
        {
            return CourtsDac.GetCourts();
        }

        [HttpPut]
        public IActionResult InsertNewCourt(Pistas court)
        {
            try
            {
                CourtsDac.InsertNewCourt(court);
                return Ok();
            }
            catch (Exception ex)
            {

                return Conflict();
            }



        }

        [HttpDelete]
        public IActionResult DeleteCourt(Pistas court)
        {
            Pistas courtExist = CourtsDac.GetCourt(court.IdCourt);
            List <Reservas> reservationList ;
            reservationList = ReservationDac.GetAllReservationsCourts(court.IdCourt);
            if (courtExist == null && reservationList == null)
            {
                CourtsDac.DeleteCourt(court);
                return Ok();
            }
            else
            {
                return  BadRequest();
            }

        }

        [HttpPost]
        public IActionResult UpdateCourt(Pistas court)
        {
            Pistas courtExist = CourtsDac.GetCourt(court.IdCourt);
            List<Reservas> reservationList ;
            reservationList = ReservationDac.GetAllReservationsCourts(court.IdCourt);
            if (courtExist == null && reservationList == null)
            {
                CourtsDac.UpdateCourt(court);
                return Ok();
            }
            else
            {
                return BadRequest();
            }

        }



        private bool VerifyJson(Reservas reservas)
        {
            if (!string.IsNullOrEmpty(reservas.KindSport) && reservas.IdMember != 0 && reservas.DateReservation != null)
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
