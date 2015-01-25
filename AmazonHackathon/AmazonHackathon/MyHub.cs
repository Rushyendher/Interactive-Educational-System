using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Microsoft.AspNet.SignalR;
using System.Threading.Tasks;

namespace AmazonHackathon
{
    public class MyHub : Hub
    {
        public void Join(string room)
        {
            Groups.Add(Context.ConnectionId, room);
        }

        public void CreateChatRoom(string room)
        {
            if (!ChatRoom.Exists(room))
            {
                ChatRoom.add(room);
                Clients.All.addChatRoom(room);
            }
        }

        public void send(string room,string message)
        {
            Clients.Group(room).addMessage(room, message);
        }

        public override Task OnConnected()
        {
            foreach (var name in ChatRoom.GetAll())
            {
                Clients.Caller.addChatRoom(name);
            }
            return base.OnConnected();
        }
    }
}