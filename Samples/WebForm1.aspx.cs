using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Net.Http.Headers;
using System.Text;
using System.Threading.Tasks;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LawDesk.Samples
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        public class LikesAndDislike
        {
            public int ID { get; set; }
            public int? ArticleID { get; set; }
            public int? UserID { get; set; }
            public string Status { get; set; }
        }
        public class ArticleUser
        {
            public int ID { get; set; }
            public string Username { get; set; }
            public string Password { get; set; }
            public string Email { get; set; }
            public string PhoneNo { get; set; }
            public string Avatar { get; set; }
            public string RegDate { get; set; }
            public string AuthCode { get; set; }
            public string Verified { get; set; }
        }
        public string PostLikeOrDislike(int userID, int articleID, LikesAndDislike action)
        {
            //Uri u = new Uri("http://crief.edcebonyi.com/api/LikesAndDislikes");
            Uri u = new Uri("https://localhost:44310/api/LikesAndDislikes?userid=" + userID + "&articleid=" + articleID);

            var payload = JsonConvert.SerializeObject(action);

            System.Net.Http.HttpContent c = new StringContent(payload, Encoding.UTF8, "application/json");
            var t = Task.Run(() => PostURI(u, c));
            t.Wait();
            return t.Result;
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            //LikesAndDislike likeAndDislike = new LikesAndDislike { ArticleID = 1, UserID = 4, Status = "Dislike" };
            //string response = PostLikeOrDislike(1, 4, likeAndDislike);
            ArticleUser user = new ArticleUser { Email = "c.nonsonwachukwu@gmail.com",Username= "Sagytarius_9850", Password = "123456", AuthCode = "2514" };
            bool response = GetUser(user);
        }
        static async Task<string> PostURI(Uri u, HttpContent c)
        {
            var response = string.Empty;
            using (var client = new HttpClient())
            {
                HttpResponseMessage result = await client.PostAsync(u, c);
                if (result.IsSuccessStatusCode)
                {
                    response = result.StatusCode.ToString();
                }
            }
            return response;
        }
        public string CreateUser(ArticleUser user)
        {
            Uri u = new Uri("http://crief.edcebonyi.com/api/users");
            var payload = JsonConvert.SerializeObject(user);

            HttpContent c = new StringContent(payload, Encoding.UTF8, "application/json");
            var t = Task.Run(() => PostURI(u, c));
            t.Wait();
            return t.Result;
        }
        public string VerifyUser(ArticleUser user)
        {
            Uri u = new Uri("https://localhost:44310/api/AccountVerification");
            var payload = JsonConvert.SerializeObject(user);
            System.Net.Http.HttpContent c = new StringContent(payload, Encoding.UTF8, "application/json");
            var t = Task.Run(() => PostURI(u, c));
            t.Wait();
            return t.Result;
        }
        public bool GetUser(ArticleUser user)
        {
            try
            {
                HttpClient client = new HttpClient();
                var _WebApiUrl = string.Format("https://localhost:44310/api/AccountVerification?email="+user.Email+"&username" + user.Username + "&password=" + user.Password);
                client.DefaultRequestHeaders.IfModifiedSince = DateTime.Now;//.AddMinutes(-60); 
                client.DefaultRequestHeaders.Accept.Add(new MediaTypeWithQualityHeaderValue("application/json"));
                client.DefaultRequestHeaders.Add("Cache-Control", "no-cache");
                HttpResponseMessage messge = client.GetAsync(_WebApiUrl).Result;
                var Return_EventList = messge.Content.ReadAsStringAsync().Result;
                var result = JsonConvert.DeserializeObject<List<ArticleUser>>(Return_EventList);

                client.Dispose();
                ArticleUser u = result.Where(r => r.Username == user.Username).FirstOrDefault();
                if (u != null)
                    return true;
                else return false;
            }
            catch (Exception ex)
            {
                string err = ex.Message;
                return false;
            }
        }

    }
}