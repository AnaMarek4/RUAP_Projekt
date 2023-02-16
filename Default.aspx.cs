using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using RestSharp;
using Newtonsoft.Json.Linq;


namespace FertilityDiagnosis
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e) 
        {
            
        }

        protected void lbPredict_Click(object sender, EventArgs e)
        {
            var client = new RestClient("https://ussouthcentral.services.azureml.net/workspaces/e533d87a70e1453389b3e63bbd6c5ddf/services/54671a3994f042f7a10a1bf6da783dc8/execute?api-version=2.0&details=true");
            var request = new RestRequest(Method.POST);
            request.AddHeader("Cache-control", "no-cache");
            request.AddHeader("Content-type", "application/json");
            request.AddHeader("Authorization", "Bearer PFbVLTlOkuTjwUTj0S52+4j1sovdmYrmehAndFYsz1VKGCc/reQdKZ9k2A4gcddzWyRGuTND5nSZ+AMCnuOfoA==");

            double age = (Convert.ToDouble(txtAge.Text) - 18 ) / 18;

            double hours = Convert.ToDouble(txtHoursSitting.Text) / 16;

            request.AddParameter("application/json", "{\r\n  \"Inputs\": {\r\n    \"input1\": {\r\n      \"ColumnNames\": [\r\n        \"season\",\r\n        \"age\",\r\n        \"childish diseases\",\r\n        \"accident or trauma\",\r\n        \"surgical intervention\",\r\n        \"high fevers\",\r\n        \"freq. of alcohol consumption\",\r\n        \"smoking habit\",\r\n        \"numb. of hours spent sitting per day\",\r\n        \"diagnosis\"\r\n      ],\r\n      \"Values\": [\r\n        [\r\n          \""+ rblSeason.SelectedValue +"\",\r\n          \""+ age.ToString("0.00", System.Globalization.CultureInfo.InvariantCulture) +"\",\r\n          \""+ rblChildDiseases.SelectedValue +"\",\r\n          \""+ rblAccidentOrTrauma.SelectedValue +"\",\r\n          \""+ rblSurgIntervention.SelectedValue +"\",\r\n          \""+ rblHighFevers.SelectedValue +"\",\r\n          \""+ rblAchocolConsumption.SelectedValue +"\",\r\n          \""+ rblSmoking.SelectedValue +"\",\r\n          \""+ hours.ToString("0.00", System
                .Globalization.CultureInfo.InvariantCulture) +"\",\r\n          \"0\"\r\n        ]\r\n      ]\r\n    }\r\n  },\r\n  \"GlobalParameters\": {}\r\n}", ParameterType.RequestBody);
            IRestResponse response = client.Execute(request);

            var results = JObject.Parse(response.Content);

            string prediction = results["Results"]["output1"]["value"]["Values"][0][11].ToString();
            double percentage = double.Parse(prediction, System.Globalization.CultureInfo.InvariantCulture);
            lblResults.Text = "Prediction: " + percentage.ToString("#0.##%");

            string diagnosis = results["Results"]["output1"]["value"]["Values"][0][10].ToString();
            string output = diagnosis;
            string normal = "N";
            string altered = "O";

            if (output == normal) {
                lblDiagnosis.Text = "Diagnosis: Normal semen sample.";
            }

            if (output == altered)
            {
                lblDiagnosis.Text = "Diagnosis: Altered semen sample.";
            }
        }
    }
} 
       
           
    

   