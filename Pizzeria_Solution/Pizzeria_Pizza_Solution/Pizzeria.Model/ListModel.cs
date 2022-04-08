using System.Data;

namespace Pizzeria.Model
{
    public class ListModel
    {
        public DataTable ReturnedData { get; set; }
        public long TotalRecords { get; set; }
    }
}
