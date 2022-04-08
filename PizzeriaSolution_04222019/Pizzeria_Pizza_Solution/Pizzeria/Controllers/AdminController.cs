using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Configuration;
using Newtonsoft.Json;
using Pizzeria.DataAccess;
using Pizzeria.Model;
using static Pizzeria.Model.Enums;

namespace Pizzeria.Controllers
{
    [Authorize]
    public class AdminController : Controller
    {
        private readonly IConfiguration configuration;

        public AdminController(IConfiguration config)
        {
            configuration = config;
        }

        public IActionResult Index()
        {
            return View();
        }

        #region PIZZAS

        public IActionResult Pizzas()
        {
            return View();
        }

        [HttpPost]
        public JsonResult GetPizzaList(FilterModel model)
        {
            var repo = new DatabaseHelper(configuration);
            var response = repo.GetDataList("USP_GetPizzaList", model);

            if (response != null)
            {
                switch (response.ResponseType)
                {
                    case ResponseType.Success:
                        return Json(response);
                    case ResponseType.Error:
                        // TODO: Write exception log
                        return Json(null);
                }
            }

            return Json(null);
        }

        [HttpPost]
        public IActionResult ManagePizza(PizzaModel model, IFormFile file)
        {
            if (ModelState.IsValid)
            {
                var repo = new DatabaseHelper(configuration);

                // UPLOAD FILE
                if (file == null || file.Length == 0)
                    return Content("File not selected");

                var fileName = DateTime.Now.ToString("ddMMyyyhhmmssff") + Path.GetExtension(file.FileName);
                var virualPath = Path.Combine("images", "pizzas", fileName);
                var absolutePath = Path.Combine(Directory.GetCurrentDirectory(), "wwwroot", "images", "pizzas", fileName);

                using (var stream = new FileStream(absolutePath, FileMode.Create))
                {
                    file.CopyTo(stream);
                    model.FilePath = virualPath;
                }

                // SAVE PIZZA
                var paramList = new Dictionary<string, string>
                {
                    { "@Mode", model.PizzaId == 0 ? "C" : "U" },
                    { "@PizzaId", model.PizzaId + "" },
                    { "@Title", model.Title + "" },
                    { "@Description", model.Description},
                    { "@CategoryId", model.CategoryId + ""},
                    { "@FilePath", model.FilePath}
                };

                var response = repo.ExecuteScalar("USP_ManagePizza", paramList);

                if (response != null)
                {
                    switch (response.ResponseType)
                    {
                        case ResponseType.Success:
                            var pizzaId = Convert.ToInt32(response.ResultSet);

                            return RedirectToAction("Pizzas");
                        case ResponseType.Error:
                            // TODO: Write exception log
                            break;
                    }
                }
            }

            return RedirectToAction("Pizzas");
        }

        #endregion


        #region SIZES

        public IActionResult Sizes()
        {
            return View();
        }

        [HttpPost]
        public JsonResult GetSizeList(FilterModel model)
        {
            var repo = new DatabaseHelper(configuration);
            var response = repo.GetDataList("USP_GetSizeList", model);

            if (response != null)
            {
                switch (response.ResponseType)
                {
                    case ResponseType.Success:
                        return Json(response);
                    case ResponseType.Error:
                        // TODO: Write exception log
                        return Json(null);
                }
            }

            return Json(null);
        }

        [HttpPost]
        public IActionResult ManageSize(SizeModel model)
        {
            //var allErrors = ModelState.Values.SelectMany(v => v.Errors.Select(b => b.ErrorMessage));

            if (ModelState.IsValid)
            {
                var repo = new DatabaseHelper(configuration);

                var paramList = new Dictionary<string, string>
                {
                    { "@Mode", model.SizeId == 0 ? "C" : "U" },
                    { "@SizeId", model.SizeId + "" },
                    { "@SizeName", model.SizeName },
                    { "@Abbreviation", model.Abbreviation }
                };

                var response = repo.ExecuteNonQuery("USP_ManageSize", paramList);

                if (response != null)
                {
                    switch (response.ResponseType)
                    {
                        case ResponseType.Success:
                            return RedirectToAction("Sizes");
                        case ResponseType.Error:
                            // TODO: Write exception log
                            break;
                    }
                }
            }

            return RedirectToAction("Sizes");
        }

        #endregion

        public IActionResult Orders()
        {
            return View();
        }

        public IActionResult Users()
        {
            return View();
        }

        #region HELPERS

        public JsonResult GetDropdownList(int mode)
        {
            var repo = new DatabaseHelper(configuration);
            var response = repo.GetDropdownList(mode);

            if (response != null)
            {
                switch (response.ResponseType)
                {
                    case ResponseType.Success:
                        return Json(response);
                    case ResponseType.Error:
                        // TODO: Write exception log
                        return Json(null);
                }
            }

            return Json(null);
        }

        #endregion
    }
}