using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Configuration;
using PruebaNitnetsIgnacio.Dac;
using PruebaNitnetsIgnacio.Models;

namespace PruebaNitnetsIgnacio.Controllers
{
    
    [Route("api/[controller]")]
    [ApiController]
    public class SportsController : ControllerBase
    {
        private readonly IConfiguration configuration;

        public SportsController(IConfiguration configuration)
        {
            this.configuration = configuration;
        }

        // POST: api/Users
        [HttpPost]
        public IActionResult CreateUser(Deportes sports)
        {
            if (SportsDac.insertNewSports(sports))
            {
                return Ok();
            }
            else
            {
                return Unauthorized();
            }
        }
        [HttpGet]
        public List<Deportes> Get(Deportes sports)
        {
            return SportsDac.getAllSports();
        }

        [HttpGet]
        [Route("api/sports/{id}")]
        public Deportes Get(string kindSport)
        {
            return SportsDac.getOneSports(kindSport);
        }

        [HttpDelete]
        public IActionResult Delete(string sport)
        {
            if (SportsDac.DeleteSport(sport))
            {
                return Ok();
            }
            else
            {
                return Unauthorized();
            }
        }

        [HttpPut]
        public IActionResult Put(Deportes sport)
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
