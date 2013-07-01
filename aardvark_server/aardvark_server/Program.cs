using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace aardvark_server
{
    class Program
    {
        static ServerManager serverManager;
        static void Main(string[] args)
        {
            serverManager = new ServerManager();
        }
    }
}
