using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
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
    public class UsersController : ControllerBase
    {
        private readonly IConfiguration configuration;

        public UsersController(IConfiguration configuration)
        {
            this.configuration = configuration;
        }

        [HttpGet("{numberPage}")]

        public IActionResult GetAllUsers(int numberPage)
        {
            if (UserDac.GetAllUsers(numberPage).TotalItemCount > numberPage)
                return Ok(UserDac.GetAllUsers(numberPage));
            else
                return BadRequest();
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
                return BadRequest();
            }
        }

      
    }
}
