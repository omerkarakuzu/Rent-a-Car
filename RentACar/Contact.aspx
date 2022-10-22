<%@ Page Title="Contact" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="RentACar.Contact" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
<%--    <h2><%: Title %>.</h2>
    <h3>Your contact page.</h3>
    <address>
        One Microsoft Way<br />
        Redmond, WA 98052-6399<br />
        <abbr title="Phone">P:</abbr>
        425.555.0100
    </address>

    <address>
        <strong>Support:</strong>   <a href="mailto:Support@example.com">Support@example.com</a><br />
        <strong>Marketing:</strong> <a href="mailto:Marketing@example.com">Marketing@example.com</a>

    </address>--%>
    <link
  href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css"
  rel="stylesheet"
  id="bootstrap-css"
/>
<script src="//netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<!------ Include the above in your HEAD tag ---------->

<div class="container">
  <div class="row">
    <div class="panel panel-default">
      <div class="panel-heading"></div>
      <div class="panel-body">
        <div class="col-md-4 col-xs-12 col-sm-6 col-lg-4">
          <img
            alt="User Pic"
            src="https://media-exp1.licdn.com/dms/image/D5603AQGRTrfA5C014A/profile-displayphoto-shrink_200_200/0/1644854275595?e=1671667200&v=beta&t=TyBWPhw_NitdVKk69BQNU4EqKM41L1maNYuX1MuiriY"
            id="profile-image1"
            class="img-circle img-responsive"
            style="margin-left: 15%"
          />
        </div>
        <div class="col-md-8 col-xs-12 col-sm-6 col-lg-8">
          <div class="container">
            <h2>Ömer Karakuzu</h2>
          </div>
          <hr />
          <ul class="container details">
            <li>
              <p>
                <span
                  class="glyphicon glyphicon-envelope one"
                  style="width: 50px"
                ></span
                ><a href="mailto:omerkarakuzu4@gmail.com"
                  >omerkarakuzu4@gmail.com</a
                >
              </p>
            </li>
            <li>
              <p>
                <span
                  class="glyphicon glyphicon-chevron-right"
                  style="width: 50px"
                ></span
                ><a href="https://www.linkedin.com/in/omerkarakuzu/"
                  >Linkedin</a
                >
              </p>
            </li>
          </ul>
          <hr />
        </div>
      </div>
    </div>
  </div>
</div>

</asp:Content>
