using System;
using System.Collections;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Data.Entity;
using System.Security.Claims;
using System.Threading.Tasks;
using System.Web;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;
using Microsoft.AspNet.Identity.Owin;
using Microsoft.Owin.Security;
using RentACar.Models;

namespace RentACar.Models
{
    // You can add User data for the user by adding more properties to your User class, please visit https://go.microsoft.com/fwlink/?LinkID=317594 to learn more.
    public class ApplicationUser : IdentityUser
    {
        [MaxLength(250)]
        [Required]
        public string FullName { get; set; } // Kullanıcının adı, soyad,
        public DateTime BirthDate { get; set; } // Kullanıcının doğum tarihi, 18 yaşından küçükse sisteme kayıt olamayacak.

        public virtual ICollection<CarRental> CarRentals { get; set; }



        public ClaimsIdentity GenerateUserIdentity(ApplicationUserManager manager)
        {
            // Note the authenticationType must match the one defined in CookieAuthenticationOptions.AuthenticationType
            var userIdentity = manager.CreateIdentity(this, DefaultAuthenticationTypes.ApplicationCookie);
            // Add custom user claims here
            return userIdentity;
        }

        public Task<ClaimsIdentity> GenerateUserIdentityAsync(ApplicationUserManager manager)
        {
            return Task.FromResult(GenerateUserIdentity(manager));
        }
    }
    public class Car
    {
        public int Id { get; set; } // Araba'nın veritabanındaki Unique Id'si
        [MaxLength(25)]
        [Required]
        public string PlateNumber { get; set; } // Plaka numarası
        [MaxLength(25)]
        [Required]
        public string Color { get; set; } // Rengi
        public decimal DailyPrice { get; set; } // 1 Günlük Fiyatı

        //public byte[] Photo { get; set; } Byte olarak tutmak maliyetli.
        [MaxLength(250)]
        [Required]
        public string Photo { get; set; }

        public virtual ICollection<CarRental> CarRentals { get; set; }

        public int TotalRentCount { get; set; }

    }
    public class CarRental
    {
        public int Id { get; set; }
        public string ApplicationUserId { get; set; } // Kim kiraladı.
        public virtual ApplicationUser ApplicatonUser { get; set; }
        public int CarId { get; set; }
        public virtual Car Car { get; set; } // Hangi arabayı kiraladı.

        public DateTime StartDate { get; set; } // Kiralamaya ne zaman başladı.
        public DateTime EndDate { get; set; } // Kiralama ne zaman bitti.
        public decimal TotalPrice { get; set; } // İndirim yapılmış olabilir. Aracın 1 sene önceki fiyatıyla bugünkü fiyatı değişmiş olabilir.
    }

    public class ApplicationDbContext : IdentityDbContext<ApplicationUser>
    {
        public DbSet<Car> Cars { get; set; }
        public DbSet<CarRental> CarRentals { get; set; }

        public ApplicationDbContext()
            : base("DefaultConnection", throwIfV1Schema: false)
        {
        }

        public static ApplicationDbContext Create()
        {
            return new ApplicationDbContext();
        }
    }
}

#region Helpers
namespace RentACar
{
    public static class IdentityHelper
    {
        // Used for XSRF when linking external logins
        public const string XsrfKey = "XsrfId";

        public const string ProviderNameKey = "providerName";
        public static string GetProviderNameFromRequest(HttpRequest request)
        {
            return request.QueryString[ProviderNameKey];
        }

        public const string CodeKey = "code";
        public static string GetCodeFromRequest(HttpRequest request)
        {
            return request.QueryString[CodeKey];
        }

        public const string UserIdKey = "userId";
        public static string GetUserIdFromRequest(HttpRequest request)
        {
            return HttpUtility.UrlDecode(request.QueryString[UserIdKey]);
        }

        public static string GetResetPasswordRedirectUrl(string code, HttpRequest request)
        {
            var absoluteUri = "/Account/ResetPassword?" + CodeKey + "=" + HttpUtility.UrlEncode(code);
            return new Uri(request.Url, absoluteUri).AbsoluteUri.ToString();
        }

        public static string GetUserConfirmationRedirectUrl(string code, string userId, HttpRequest request)
        {
            var absoluteUri = "/Account/Confirm?" + CodeKey + "=" + HttpUtility.UrlEncode(code) + "&" + UserIdKey + "=" + HttpUtility.UrlEncode(userId);
            return new Uri(request.Url, absoluteUri).AbsoluteUri.ToString();
        }

        private static bool IsLocalUrl(string url)
        {
            return !string.IsNullOrEmpty(url) && ((url[0] == '/' && (url.Length == 1 || (url[1] != '/' && url[1] != '\\'))) || (url.Length > 1 && url[0] == '~' && url[1] == '/'));
        }

        public static void RedirectToReturnUrl(string returnUrl, HttpResponse response)
        {
            if (!String.IsNullOrEmpty(returnUrl) && IsLocalUrl(returnUrl))
            {
                response.Redirect(returnUrl);
            }
            else
            {
                response.Redirect("~/");
            }
        }
    }
}
#endregion
