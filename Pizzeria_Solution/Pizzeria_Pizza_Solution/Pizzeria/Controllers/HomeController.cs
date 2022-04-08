using System;
using System.Collections.Generic;
using System.Data;
using System.Diagnostics;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Configuration;
using Pizzeria.DataAccess;
using Pizzeria.Model;
using Pizzeria.Models;
using static Pizzeria.Model.Enums;

namespace Pizzeria.Controllers
{
    public class HomeController : Controller
    {
        private readonly IConfiguration configuration;

        public HomeController(IConfiguration config)
        {
            configuration = config;
        }

        public IActionResult Index()
        {
            return View();
        }

        #region PIZAAS

        public IActionResult Pizzas()
        {
            return View();
        }

        [HttpPost]
        public JsonResult GetPizzaList(FilterModel model)
        {
            model.PageSize = int.MaxValue;

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

        #endregion

        #region CART

        [Authorize]
        public IActionResult Cart()
        {
            var cart = SessionHelper.GetObjectFromJson<List<CartItemModel>>(HttpContext.Session, "UserCart");
            return View(cart);
        }

        [Authorize]
        public IActionResult AddToCart(int pizzaId)
        {
            if (!User.Identity.IsAuthenticated)
            {
                return LocalRedirect("/Identity/Account/Login");
                // RedirectToAction("Login", "Account");
            }

            var wrapper = new ResultWrapperModel();

            try
            {
                var model = new FilterModel
                {
                    SearchExpression = "P.PizzaId=" + pizzaId,
                    PageSize = 1
                };

                var repo = new DatabaseHelper(configuration);
                var response = repo.GetDataList("USP_GetPizzaList", model);

                if (response != null)
                {
                    switch (response.ResponseType)
                    {
                        case ResponseType.Success:
                            var pizzaItem = new PizzaModel();
                            if (response.ResultSet is DataTable dt && dt.Rows.Count > 0)
                            {
                                pizzaItem = new PizzaModel
                                {
                                    PizzaId = int.Parse(dt.Rows[0]["PizzaId"] + ""),
                                    Title = dt.Rows[0]["Title"] + "",
                                    Description = dt.Rows[0]["Description"] + "",
                                    CategoryId = int.Parse(dt.Rows[0]["CategoryId"] + ""),
                                    CategoryName = dt.Rows[0]["CategoryName"] + "",
                                    FilePath = dt.Rows[0]["FilePath"] + "",
                                    Price = decimal.Parse(dt.Rows[0]["Price"] + "")
                                };
                            }

                            var cartItem = new CartItemModel
                            {
                                PizzaItem = pizzaItem,
                                Quantity = 1
                            };

                            var cart = SessionHelper.GetObjectFromJson<List<CartItemModel>>(HttpContext.Session, "UserCart");
                            if (cart == null)
                            {
                                var list = new List<CartItemModel>() { cartItem };
                                SessionHelper.SetObjectAsJson(HttpContext.Session, "UserCart", list);
                                wrapper.ResultSet = "Item added to cart.";
                            }
                            else
                            {
                                var item = cart.Find(c => c.PizzaItem.PizzaId == pizzaId);

                                if (item != null)
                                {
                                    item.Quantity++;
                                    SessionHelper.SetObjectAsJson(HttpContext.Session, "UserCart", cart);
                                }
                                else
                                {
                                    cart.Add(cartItem);
                                    SessionHelper.SetObjectAsJson(HttpContext.Session, "UserCart", cart);
                                    wrapper.ResultSet = "Item added to cart.";
                                }
                            }
                            break;
                        case ResponseType.Error:
                            // TODO: 
                            break;
                    }
                }
            }
            catch (Exception ex)
            {
                wrapper.CaughtException = ex;
                wrapper.ResponseType = ResponseType.Error;
            }

            return Json(wrapper);
        }

        public IActionResult RemoveCartItem(int pizzaId)
        {
            var cart = SessionHelper.GetObjectFromJson<List<CartItemModel>>(HttpContext.Session, "UserCart");

            if (cart != null)
            {
                var item = cart.Find(c => c.PizzaItem.PizzaId == pizzaId);
                cart.Remove(item);
                SessionHelper.SetObjectAsJson(HttpContext.Session, "UserCart", cart);
            }

            return RedirectToAction("Cart");
        }

        #endregion

        public IActionResult Stores()
        {
            return View();
        }

        public IActionResult Contact()
        {
            ViewData["Message"] = "Your contact page.";

            return View();
        }

        public IActionResult Privacy()
        {
            return View();
        }

        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }
    }
}
