using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace VKBH.code
{
    public class Question
    {
        Guid id;
        string body;
        List<Answer> answers;

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

        public List<Answer> Answers
        {
            get { return answers; }
            set { answers = value; }
        }

        public Question(Guid id, string body, List<Answer> answers)
        {
            this.id = id;
            this.body = body;
            this.answers = answers;
        }

        public void AddAnswer(Answer answer)
        {
            answers.Add(answer);
        }
    }
}