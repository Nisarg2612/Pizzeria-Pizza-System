using System;

namespace Pizzeria.Model
{
    public class Enums
    {
        public enum ResponseType
        {
            Error = 0,
            Success = 1
        }
    }

    public class ResultWrapperModel
    {
        public object ResultSet { get; set; }
        public long TotalCount { get; set; }
        public Enums.ResponseType ResponseType { get; set; }
        public Exception CaughtException { get; set; }
    }
}
