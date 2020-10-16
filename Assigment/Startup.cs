using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(Assigment.Startup))]
namespace Assigment
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
