using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using PruebaNitnetsIgnacio.Models;

namespace PruebaNitnetsIgnacio.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class RegisterController : ControllerBase
    {


        // POST: api/Register
        [HttpPost]
        [AllowAnonymous]
        public void Post(Usuarios userLogin)
        {
            bool userExist = registerUser(userLogin);

        }
        private bool registerUser()
        {

        }

    }
}
