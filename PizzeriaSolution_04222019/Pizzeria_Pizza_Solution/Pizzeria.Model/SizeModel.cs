using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Pizzeria.Model
{
    public class SizeModel : BaseModel
    {
        public int SizeId { get; set; }

        [Required]
        [Display(Name = "Size")]
        [StringLength(50)]
        public string SizeName { get; set; }

        [Required]
        [Display(Name = "Abbreviation")]
        [StringLength(10)]
        public string Abbreviation { get; set; }
    }
}
