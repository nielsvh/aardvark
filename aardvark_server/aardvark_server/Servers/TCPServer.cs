using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Net.Sockets;
using System.Threading;
using System.Net;

namespace aardvark_server
{
	class TCPServer
	{
        private TcpListener tcpListener;
        private Thread listenThread;

        public TCPServer()
        {
          this.tcpListener = new TcpListener(IPAddress.Any, 3000);
          this.listenThread = new Thread(new ThreadStart(ListenForClients));
          this.listenThread.Start();
        }

        private void ListenForClients()
        {
            this.tcpListener.Start();

            while (true)
            {
                TcpClient client = this.tcpListener.AcceptTcpClient();
                Thread clientThread = new Thread(new ParameterizedThreadStart(HandleClientComm));
                clientThread.Start(client);
            }
        }

        private void HandleClientComm(object client)
        {
            
        }
	}
}
