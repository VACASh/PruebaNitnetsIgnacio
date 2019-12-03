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
    public class MembersController : ControllerBase
    {
        // GET: api/Members
        [HttpGet]
        public List <Socios> GetMembers ()
        {
            return MembersDac.GetAllMembers();
        }

        // POST: api/Members
        [HttpPost]
        public IActionResult CreateNewMember(Socios member)
        {

            if (MembersDac.CreateMember(member) != null)
            {
                return Ok();
            }
            else
            {
                return Unauthorized();
            }
        }

        // PUT: api/Members/5
        [HttpPut()]
        public IActionResult UpdateMember(Socios member)
        {
            Socios memberExist = MembersDac.GetMember(member.IdMember);
            
            if (memberExist == null )
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
           
            if (memberExist == null )
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
