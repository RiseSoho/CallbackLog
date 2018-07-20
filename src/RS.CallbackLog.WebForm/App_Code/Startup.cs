using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(RS.CallbackLog.WebForm.Startup))]
namespace RS.CallbackLog.WebForm
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
