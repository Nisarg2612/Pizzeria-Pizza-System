using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Pizzeria.Model
{
    public class FilterModel
    {
        public FilterModel() {
            StartIndex = 1;
            PageSize = 10;
        }

        public string SearchExpression { get; set; }
        public string SortExpression { get; set; }
        public string SortDirection { get; set; }
        public long StartIndex { get; set; }
        public long PageSize { get; set; }
    }
}
