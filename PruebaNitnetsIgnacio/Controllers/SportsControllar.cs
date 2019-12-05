using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
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
    public class SportsController : ControllerBase
    {
        public SportsController()
        {}

        
        [HttpPost]
        public IActionResult NewSport(Deportes sports)
        {
            if (SportsDac.InsertNewSports(sports))
            {
                return Ok();
            }
            else
            {
                return BadRequest();
            }
        }

        [HttpGet("{numberPage}")]

        public IActionResult GetAllSports(int numberPage)
        {
            if (SportsDac.GetAllSports(numberPage).TotalItemCount > numberPage)
                return Ok(SportsDac.GetAllSports(numberPage));
            else
                return BadRequest();
        }


        [HttpGet]
        [Route("ks/{kindSport}")]
        public Deportes Get(string kindSport)
        {
            return SportsDac.getOneSports(kindSport);
        }

        [HttpDelete]
        public IActionResult Delete(Deportes sport)
        {
            if (SportsDac.DeleteSport(sport.KindSport))
            {
                return Ok();
            }
            else
            {
                return Unauthorized();
            }
        }

        [HttpPut]
        public IActionResult UpdateSport(Deportes sport)
        {
            if( SportsDac.UpdateSport(sport))
            {
                return Ok();
            }
            else
            {
                return Unauthorized();
            }
        }

    
        
    }
}
