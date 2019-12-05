using System;
using System.Collections.Generic;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using PagedList;
using PruebaNitnetsIgnacio.Business;
using PruebaNitnetsIgnacio.Dac;
using PruebaNitnetsIgnacio.Models;

namespace PruebaNitnetsIgnacio.Controllers
{

    [Route("api/[controller]")]
    [ApiController]
    [Authorize]
    public class CourtsController : ControllerBase
    {
        /// <summary>
        /// Pistas permitidas para su reserva
        /// </summary>
        /// <param name="reservas">Reserva</param>
        /// <returns>Listado de pistas que se pueden reservar</returns>
        // POST: api/reservationByDate
        [HttpPost("api/reservationByDate")]
        public List<Pistas> CourtsAvailable(Reservas reservas)
        {
            ReservationBusiness reservationbusiness = new ReservationBusiness();

            return reservationbusiness.CourtsAvailable(reservas);
        }

        /// <summary>
        /// Pistas en base de datos
        /// </summary>
        /// <param name="numberPage">numberPage</param>
        /// <returns>Listado de pistas paginado</returns>
        [HttpGet("{numberPage}")]
        public IPagedList<Pistas> GetCourts(int numberPage)
        {
           // CourtsDac.getAllCourtsWhitoutReservation("Quidditch");
            return CourtsDac.GetCourts(numberPage);
        }

        /// <summary>
        /// Insertado de nueva pista
        /// </summary>
        /// <param name="court">Pista</param>
        /// <returns>evento</returns>
        [HttpPut]
        public IActionResult InsertNewCourt(Pistas court)
        {
            if (VerifyJson(court))
            {
                Deportes kindSportExist = SportsDac.getOneSports(court.KindSport);
                try
                {
                    if (kindSportExist != null)
                    {
                        CourtsDac.InsertNewCourt(court);
                        return Ok();
                    }
                    else
                    {
                        return BadRequest();
                    }

                }
                catch (Exception ex)
                {

                    return Conflict();
                }
            }
            else
            {
                return Conflict();
            }
        }

        /// <summary>
        /// Borrado de pistas en base de datos
        /// </summary>
        /// <param name="court">Pista</param>
        /// <returns>Evento</returns>
        [HttpDelete]
        public IActionResult DeleteCourt(Pistas court)
        {
            Pistas courtExist = CourtsDac.GetCourt(court.IdCourt);
            List<Reservas> reservationList;
            reservationList = ReservationDac.GetAllReservationsCourts(court.IdCourt);
            if (courtExist != null && (reservationList == null || reservationList.Count == 0))
            {
                CourtsDac.DeleteCourt(court);
                return Ok();
            }
            else
            {
                return BadRequest();
            }

        }
        /// <summary>
        /// Actulización de pistas en base de datos
        /// </summary>
        /// <param name="court">Pista</param>
        /// <returns>Evento</returns>
        [HttpPost]
        public IActionResult UpdateCourt(Pistas court)
        {
            Pistas courtExist = CourtsDac.GetCourt(court.IdCourt);
            List<Reservas> reservationList;
            reservationList = ReservationDac.GetAllReservationsCourts(court.IdCourt);
            if (courtExist != null && (reservationList == null || reservationList.Count == 0))
            {
                CourtsDac.UpdateCourt(court);
                return Ok();
            }
            else
            {
                return BadRequest();
            }

        }

        private bool VerifyJson(Pistas courtToVerify)
        {
            return (!string.IsNullOrEmpty(courtToVerify.KindSport)
                && courtToVerify.IdCourt != 0) ? true : false;
        }
    }
}
