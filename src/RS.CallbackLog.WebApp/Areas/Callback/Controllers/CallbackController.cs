using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;

namespace RS.CallbackLog.WebApp.Controllers
{
    public class CallbackController : ControllerBase
    {
        private readonly ILogger<CallbackController> _log;

        public CallbackController(ILogger<CallbackController> log)
        {
            _log = log;
        }


        //public ActionContext Call()
        //{

        //    return new Context("ok");
        //}




    }
}