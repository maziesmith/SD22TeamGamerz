using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(JACCproject.Startup))]
namespace JACCproject
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
