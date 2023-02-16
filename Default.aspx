<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="FertilityDiagnosis.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Fertility Diagnosis</title>

    <link rel="stylesheet" href="fertility.css"/>

</head>
<body>
    <form id="form1" runat="server">
        <div class="text">
            <h1>Predict male fertility</h1>
        </div>

    <div class="queryText">Season in which the analysis was performed:
        <div class="queryOptions">
            <asp:RadioButtonList ID="rblSeason" runat="server" BorderColor="White">
                <asp:ListItem Value="-0.33">Spring</asp:ListItem>
                <asp:ListItem Value="0.33">Summer</asp:ListItem>
                <asp:ListItem Value="1">Fall</asp:ListItem>
                <asp:ListItem Value="-1">Winter</asp:ListItem> 
            </asp:RadioButtonList>
            <hr />
        </div>
    </div>

    <div class="queryText">Age (18-36):
        <div class="queryInput">
            <asp:TextBox ID="txtAge" runat="server" Width="50px"></asp:TextBox>
            <asp:RangeValidator ID="rangeAge" ControlToValidate="txtAge" runat="server" ErrorMessage="Invalid input. Please enter the age between 18 and 36." ForeColor="Red" MinimumValue="18" MaximumValue="36" Type="Integer"></asp:RangeValidator>                        
            <hr />
        </div>
    </div>

    <div class="queryText">Childish diseases (i.e. chicken pox, measles, mumps, polio):
        <div class="queryOptions">
            <asp:RadioButtonList ID="rblChildDiseases" runat="server" BorderColor="White">
                <asp:ListItem Value="0">Yes</asp:ListItem>
                <asp:ListItem Value="1">No</asp:ListItem>
            </asp:RadioButtonList>
            <hr />
        </div>
    </div>

    <div class="queryText">Accident or serious trauma:
        <div class="queryOptions">            
            <asp:RadioButtonList ID="rblAccidentOrTrauma" runat="server" BorderColor="White">
                <asp:ListItem Value="0">Yes</asp:ListItem>
                <asp:ListItem Value="1">No</asp:ListItem>
            </asp:RadioButtonList>
            <hr />
        </div>
    </div>

    <div class="queryText">Surgical intervention:
        <div class="queryOptions">            
            <asp:RadioButtonList ID="rblSurgIntervention" runat="server" BorderColor="White">
                <asp:ListItem Value="0">Yes</asp:ListItem>
                <asp:ListItem Value="1">No</asp:ListItem>
            </asp:RadioButtonList>
            <hr />  
        </div>
    </div>

    <div class="queryText">High fevers in the last year:
        <div class="queryOptions">            
            <asp:RadioButtonList ID="rblHighFevers" runat="server">
                <asp:ListItem Value="-1">Less than three months ago</asp:ListItem>
                <asp:ListItem Value="0">More than three months ago</asp:ListItem>
                <asp:ListItem Value="1">No</asp:ListItem>
            </asp:RadioButtonList>
            <hr />
        </div>
    </div>

    <div class="queryText">Frequency of alchocol consumption:
        <div class="queryOptions">           
            <asp:RadioButtonList ID="rblAchocolConsumption" runat="server" BorderColor="White">
                <asp:ListItem Value="0.2">Several times a day</asp:ListItem>
                <asp:ListItem Value="0.4">Every day</asp:ListItem>
                <asp:ListItem Value="0.6">Several times a week</asp:ListItem>
                <asp:ListItem Value="0.8">Once a week</asp:ListItem>
                <asp:ListItem Value="1">Hardy ever or never</asp:ListItem>
            </asp:RadioButtonList>
            <hr />
        </div>
    </div>

    <div class="queryText">Smoking habit:
        <div class="queryOptions">            
            <asp:RadioButtonList ID="rblSmoking" runat="server" BorderColor="White">
                    <asp:ListItem Value="-1">Never</asp:ListItem>
                    <asp:ListItem Value="0">Ocassional</asp:ListItem>
                    <asp:ListItem Value="1">Daily</asp:ListItem>
            </asp:RadioButtonList>
            <hr />
        </div>
    </div>

    <div class="queryText">Number of hours spent sitting per day:
        <div class="queryInput">
            <asp:TextBox ID="txtHoursSitting" runat="server" Width="50px"></asp:TextBox>
            <asp:RangeValidator ID="rangeHours" ControlToValidate="txtHoursSitting" runat="server" ErrorMessage="Invalid input. Maximum hours spent sitting is 16." ForeColor="Red" MinimumValue="0" MaximumValue="16" Type="Integer"></asp:RangeValidator>                        
            <hr />
        </div>
    </div>

    <div class="predictButton">
         <asp:LinkButton ID="lbPredict" runat="server" OnClick="lbPredict_Click" Font-Size="Large" Text="Predict" Font-Underline="False" ForeColor="#faf5e4"></asp:LinkButton>           
    </div>
    <br />
    <div class="result">
        <asp:Label ID="lblResults" runat="server" Font-Size="X-Large"></asp:Label>
    </div>
    <div>
        <asp:Label ID="lblDiagnosis" runat="server" Font-Size="X-Large" Height="100px"></asp:Label>
    </div>
    
    </form>
</body>
</html>

