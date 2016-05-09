using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(GroupWebProject.Startup))]
namespace GroupWebProject
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
