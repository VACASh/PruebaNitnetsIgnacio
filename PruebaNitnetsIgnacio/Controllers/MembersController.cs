using System.Collections.Generic;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Configuration;
using PagedList;
using PruebaNitnetsIgnacio.Dac;
using PruebaNitnetsIgnacio.Models;

namespace PruebaNitnetsIgnacio.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    [Authorize]
    public class MembersController : ControllerBase
    {
        public MembersController()
        {}
        // GET: api/Members
        [HttpGet("{numberPage}")]
        public IPagedList<Socios> GetMembers( int numberPage)
        {
            return MembersDac.GetAllMembers(numberPage);
        }

        // POST: api/Members
        [HttpPost]
        public IActionResult CreateNewMember(Socios member)
        {

            if (MembersDac.CreateMember(member))
            {
                return Ok();
            }
            else
            {
                return Unauthorized();
            }
        }


        [HttpPut()]
        public IActionResult UpdateMember(Socios member)
        {
            Socios memberExist = MembersDac.GetMember(member.IdMember);

            if (memberExist != null)
            {
                MembersDac.UpdateMember(member);
                return Ok();
            }
            else
            {
                return BadRequest();
            }
        }

        // DELETE:
        [HttpDelete()]
        public IActionResult DeleteMember(Socios member)
        {
            Socios memberExist = MembersDac.GetMember(member.IdMember);
            List<Reservas> reservationsByMember = ReservationDac.GetReservationByMember(member.IdMember);
            if (memberExist != null && (reservationsByMember.Count == 0 || reservationsByMember == null))
            {
                CourtsDac.DeleteMember(member);
                return Ok();
            }
            else
            {
                return BadRequest();
            }
        }
    }
}
