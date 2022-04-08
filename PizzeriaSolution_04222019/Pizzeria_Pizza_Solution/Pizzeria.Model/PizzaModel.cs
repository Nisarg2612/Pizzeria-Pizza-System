using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace Pizzeria.Model
{
    public class PizzaModel : BaseModel
    {
        public int PizzaId { get; set; }

        [Required]
        [StringLength(100)]
        public string Title { get; set; }

        [Required]
        [StringLength(500)]
        public string Description { get; set; }

        [Required]
        [Display(Name = "Category")]
        public int CategoryId { get; set; }

        public string CategoryName { get; set; }

        [Display(Name = "Image")]
        public string FilePath { get; set; }
        
        public int Quantity { get; set; }

        public decimal Price { get; set; }

        public List<PizzaSize> PizzaSizesList { get; set; }
    }
}
