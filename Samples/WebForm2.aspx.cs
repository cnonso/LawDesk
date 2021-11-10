using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LawDesk.Samples
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string keywords = "This sentence is an example sentence with a third and final";
            string[] _keywords = keywords.Split(' ');

            //Get distinct keywords
            Array keywordArray = _keywords.Distinct().ToArray();

            
           string stringArrayToSearch = "This is the first sentence in a string. " +
                   "More sentences will follow. For example, " +
                   "this is the third sentence. This is the " +
                   "fourth. And this is the fifth and final " +
                   "sentence.";
            if (SearchContainsSufficientKeywords(stringArrayToSearch, keywordArray, 5))
                Label1.Text = stringArrayToSearch;
        }
        public bool SearchContainsSufficientKeywords(string stringArrayToSearch, Array keywordArray, int keywordLength)
        {
            bool containsSufficientKeywords = false;
           

            int occurences = 0;

            foreach (string keyword in keywordArray)
            {
                bool keywordIsContained = stringArrayToSearch.Contains(keyword);
                if (keywordIsContained)
                    ++occurences;
                if (occurences >= keywordLength)
                {
                    containsSufficientKeywords = true;
                    return containsSufficientKeywords;
                }
            }
            return containsSufficientKeywords;
        }
    }
}