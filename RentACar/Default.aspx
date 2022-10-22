<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="RentACar._Default" %>

<%@ Register Src="~/ShowCarList.ascx" TagPrefix="uc1" TagName="ShowCarList" %>


<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="jumbotron"><h2 class="lead">En çok seçilenler</h2></div>
        
           <uc1:ShowCarList runat="server" id="TopShowCarList" />

        <div class="jumbotron">
        <h2 class="lead">Fırsat Araçlar</h2></div>
           <uc1:ShowCarList runat="server" id="FirsatShowCarList" />

 


</asp:Content>
