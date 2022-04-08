using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Pizzeria.Model
{
    public class PizzaSize : BaseModel
    {
        public int PizzaSizeId { get; set; }
        public int PizzaId { get; set; }
        public int Size { get; set; }
        public decimal Price { get; set; }
    }
}
