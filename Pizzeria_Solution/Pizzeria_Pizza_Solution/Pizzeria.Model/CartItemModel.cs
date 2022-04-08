using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Pizzeria.Model
{
    public class CartItemModel
    {
        public PizzaModel PizzaItem { get; set; }
        public int Quantity { get; set; }
        public decimal Total { get; set; }
    }
}
