<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ShowCarList.ascx.cs" Inherits="RentACar.ShowCarList" %>
    <style>
      * {
        -webkit-transition: 300ms;
        transition: 300ms;
      }

      h1,
      h2,
      h3,
      h4,
      h5,
      p {
        font-weight: 400;
      }

      a {
        text-decoration: none;
        color: inherit;
      }

      a:hover {
        color: #6abcea;
      }

      .movie-card {
        background: #ffffff;
        box-shadow: 0px 6px 18px rgba(0, 0, 0, 0.1);
        width: 100%;
        max-width: 315px;
        margin: 2em;
        border-radius: 10px;
        display: inline-block;
      }

      .movie-header {
        padding: 0;
        margin: 0;
        height: 367px;
        width: 100%;
        display: block;
        border-top-left-radius: 10px;
        border-top-right-radius: 10px;
      }

      .Cars {
        background-position-y: 50%;

        width: 100%;
        height: 20em;
        text-align: center;
        vertical-align: middle;
        color: #ffffff;
        background-repeat: no-repeat;
        opacity: 0.85;
        background-size: contain;
      }

      .header-icon-container {
        position: relative;
      }

      .header-icon {
        width: 100%;
        height: 100%;
        line-height: 367px;
        text-align: center;
        vertical-align: middle;
        margin: 0 auto;
        color: #ffffff;
        font-size: 54px;
        text-shadow: 0px 0px 20px #6abcea, 0px 5px 20px #6abcea;
        opacity: 0.85;
      }

      .header-icon:hover {
        background: rgba(0, 0, 0, 0.15);
        font-size: 104px;
        text-shadow: 0px 0px 20px #6abcea, 0px 5px 30px #6abcea;
        border-top-left-radius: 10px;
        border-top-right-radius: 10px;
        opacity: 1;
      }

      .movie-card:hover {
        -webkit-transform: scale(1.03);
        transform: scale(1.03);
        box-shadow: 0px 10px 25px rgba(0, 0, 0, 0.08);
      }

      .movie-content {
        padding: 18px 18px 24px 18px;
        margin: 0;
      }

      .movie-content-header,
      .movie-info {
        display: table;
        width: 100%;
      }

      .movie-title {
        font-size: 24px;
        margin: 0;
        display: table-cell;
      }

      .movie-info {
        margin-top: 1em;
      }

      .info-section {
        display: table-cell;
        text-transform: uppercase;
        text-align: center;
      }

      .info-section:first-of-type {
        text-align: left;
      }

      .info-section:last-of-type {
        text-align: right;
      }

      .info-section label {
        display: block;
        color: rgba(0, 0, 0, 0.5);
        margin-bottom: 0.5em;
        font-size: 9px;
      }

      .info-section span {
        font-weight: 700;
        font-size: 11px;
      }

      @media screen and (max-width: 500px) {
        .movie-card {
          width: 95%;
          max-width: 95%;
          margin: 1em;
          display: block;
        }
      }
    </style>
<div class="row">
      <asp:Repeater ID="rptCars" runat="server">  
            <ItemTemplate>
<%--                <div class="col-md-4 offset-md-1 panel panel-default ">
                    <div class="row">
                        <div class="col offset-md-1">
                            <h4><%# Eval("PlateNumber") %></h4>
                            <img class="img-thumbnail thumbnail-box-shadow"   width="250" height="250"  src='<%# Eval("Photo", "/carImages/{0}") %>' />
                        
                            
                            <p><%# Eval("DailyPrice", "{0:c}") %></p>
                            <asp:HyperLink Text="Kirala" runat="server"  CssClass="btn btn-primary btn-lg" NavigateUrl='<%# Eval("Id", "~/Kirala?id={0}") %>'></asp:HyperLink>
                            </div>
                        </div>
                    </div>--%>
<%--                <div class="col-md-3 panel panel-default">
                <div class="panel-heading"><h4><%# Eval("PlateNumber") %></h4></div>
                <div class="panel-body"> <img class="img-thumbnail thumbnail-box-shadow"  height="500" width="500"   src='<%# Eval("Photo", "/carImages/{0}") %>' /></div>
                <div class="panel-footer"><p><%# Eval("DailyPrice", "{0:c}") %></p>
                            <asp:HyperLink Text="Kirala" runat="server"  CssClass="btn btn-primary btn-lg" NavigateUrl='<%# Eval("Id", "~/Kirala?id={0}") %>'></asp:HyperLink></div>
    </div>--%>
<div class="movie-card">
      <div class="movie-header Cars" style="background-image: url('<%# Eval("Photo", "/carImages/{0}") %>')">
        <div class="header-icon-container">
        </div>
      </div>
      <!--movie-header-->
      <div class="movie-content">
        <div class="movie-content-header">
          <a href="#">
            <h3 class="movie-title"><asp:HyperLink Text="Kirala" runat="server"  CssClass="btn btn-primary btn-lg" NavigateUrl='<%# Eval("Id", "~/Kirala?id={0}") %>'></asp:HyperLink></h3>
          </a>
          <div class="imax-logo"><%# Eval("DailyPrice", "{0:c}") %>₺</div>
        </div>
        <div class="movie-info">
          <div class="info-section">
            <label>Plaka</label>
            <span><%# Eval("PlateNumber") %></span>
          </div>
          <!--date,time-->
          <!--screen-->
          <div class="info-section">
            <label>Yıl</label>
            <span>2015</span>
          </div>
          <!--row-->
          <div class="info-section">
            <label>Koltuk</label>
            <span>5</span>
          </div>
          <!--seat-->
        </div>
      </div>
      <!--movie-content-->
    </div>

            </ItemTemplate>
             </asp:Repeater>
    </div>



