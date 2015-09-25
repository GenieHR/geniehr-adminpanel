using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(adminpanel.Startup))]
namespace adminpanel
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
