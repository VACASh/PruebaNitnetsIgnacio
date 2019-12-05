using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Configuration;
using PruebaNitnetsIgnacio.Dac;
using PruebaNitnetsIgnacio.Models;

namespace PruebaNitnetsIgnacio.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class RegisterController : ControllerBase
    {
        
        public RegisterController()
        {
        }

        // POST: api/Register
        [HttpPost]
        [AllowAnonymous]
        public IActionResult Createuser(Usuarios userToRegister)
        {
            bool isUserRegisted;
            bool isEmailRegisted;
            bool isDniRegisted;
            bool isCorrectJson;
            Usuarios userRegisteered;
            isCorrectJson = VerifyJson(userToRegister);

            isUserRegisted = RegisterUserLogin(userToRegister.Login);

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
                    isDniRegisted = RegisterUserDni(userToRegister.Dni);
                    if (isDniRegisted)
                    {
                        return Unauthorized();
                    }
                    else
                    {
                        isEmailRegisted = RegisterUserEmail(userToRegister.Email);

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

        private bool VerifyJson(Usuarios userToRegister)
        {
            return !string.IsNullOrEmpty(userToRegister.Dni) 
                && !string.IsNullOrEmpty(userToRegister.Email) 
                && !string.IsNullOrEmpty(userToRegister.Login)
                && !string.IsNullOrEmpty(userToRegister.Password) 
                && !string.IsNullOrEmpty(userToRegister.Name);
        }

        private bool RegisterUserLogin(string login)
        {
            bool isUserRegistred = UserDac.ExistUserLogin(login);

            return isUserRegistred;
        }

        private bool RegisterUserEmail(string email)
        {
            bool isUserRegistred = UserDac.ExistUserEmail(email);

            return isUserRegistred;
        }
        private bool RegisterUserDni(string dni)
        {
            bool isUserRegistred = UserDac.ExistUserDni(dni);

            return isUserRegistred;
        }

    }
}
