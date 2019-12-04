﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using PruebaNitnetsIgnacio.Dac;
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
        public IActionResult Createuser(Usuarios userToRegister)
        {
            bool isUserRegisted;
            bool isEmailRegisted;
            bool isDniRegisted;
            bool isCorrectJson;
            Usuarios userRegisteered = new Usuarios();
            isCorrectJson = verifyJson(userToRegister);

            isUserRegisted = registerUserLogin(userToRegister.Login);

            if (!isCorrectJson)
            {
                return BadRequest();
            }
            else
            {
                if (isUserRegisted)
                {
                    return Unauthorized();
                }
                else
                {
                    isDniRegisted = registerUserDni(userToRegister.Dni);
                    if (isDniRegisted)
                    {
                        return Unauthorized();
                    }
                    else
                    {
                        isEmailRegisted = registerUserEmail(userToRegister.Email);

                        if (isEmailRegisted)
                        {
                            return Unauthorized();
                        }
                        else
                        {
                            userRegisteered = UserDac.CreateUser(userToRegister);

                            if (userRegisteered == null)
                            {
                                return Conflict();
                            }
                            else
                            {
                                return Ok();
                            }
                            
                        }
                    }

                }
            }

        }

        private bool verifyJson(Usuarios userToRegister)
        {
            return !string.IsNullOrEmpty(userToRegister.Dni) 
                && !string.IsNullOrEmpty(userToRegister.Email) 
                && !string.IsNullOrEmpty(userToRegister.Login)
                && !string.IsNullOrEmpty(userToRegister.Password) 
                && !string.IsNullOrEmpty(userToRegister.Name);
        }

        private bool registerUserLogin(string login)
        {
            bool isUserRegistred = UserDac.existUserLogin(login);

            return isUserRegistred;
        }

        private bool registerUserEmail(string email)
        {
            bool isUserRegistred = UserDac.existUserEmail(email);

            return isUserRegistred;
        }
        private bool registerUserDni(string dni)
        {
            bool isUserRegistred = UserDac.existUserDni(dni);

            return isUserRegistred;
        }

    }
}
