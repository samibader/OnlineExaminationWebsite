using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace VKBH.code
{
    public class Answer
    {
        Guid id;
        string body;
        bool isCorrect = false;
        int order;

        public Guid Id
        {
            get { return id; }
            set { id = value; }
        }

        public string Body
        {
            get { return body; }
            set { body = value; }
        }

        public bool IsCorrect
        {
            get { return isCorrect; }
            set { isCorrect = value; }
        }

        public int Order
        {
            get { return order; }
            set { order = value; }
        }

        public Answer(Guid id, string body, bool isCorrect)
        {
            this.id = id;
            this.body = body;
            this.isCorrect = isCorrect;
        }

    }
}