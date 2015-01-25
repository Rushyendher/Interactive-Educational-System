using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace AmazonHackathon
{
    public class ChatRoom
    {
        static List<string> _room = new List<string>();
        static ChatRoom()
        {
            _room.Add("Introduce Yourself");
        }

        public static void add(string room)
        {
            _room.Add(room);
        }

        public static bool Exists(string room)
        {
            return _room.Contains(room);
        }

        public static IEnumerable<string> GetAll()
        {
            return _room;
        }
    }
}