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
    public class UsersController : ControllerBase
    {
        private readonly IConfiguration configuration;

        public UsersController(IConfiguration configuration)
        {
            this.configuration = configuration;
        }

 
        [HttpGet]
        public Usuarios Get(Usuarios usuario)
        {
            return UserDac.ReadUser(usuario);
        }

        [HttpDelete]
        public IActionResult Delete(Usuarios usuario)
        {
            if (UserDac.DeleteUser(usuario))
            {
                return Ok();
            }
            else
            {
                return Unauthorized();
            }
        }
        [HttpPut]
        public IActionResult Put(Usuarios usuario)
        {
            if( UserDac.UpdateUser(usuario))
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
