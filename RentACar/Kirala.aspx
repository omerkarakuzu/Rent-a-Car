<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Kirala.aspx.cs" Inherits="RentACar.Kirala" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
        <div class="row">
        <div class="col-md-12">
            <div  class="form-horizontal">
                <h3 style="text-align:center" >Kiralamak İstediğiniz Araç</h3>
                <hr />
                <asp:Image CssClass="col-md-offset-4" Width="350" ID="photo" runat="server" />

                <br />
                <br />
               <div class="row">
                   <div class="col-md-6">
                          <dl class="dl-horizontal">
                                     <dt>Başlangıç Tarihi</dt>
                              <dd> 
                                  <asp:TextBox ID="txtStartDate" CssClass="form-control" runat="server" TextMode="Date" OnTextChanged="txtStartDate_TextChanged"></asp:TextBox>
                    </dd>
                                         <dt>Bitiş Tarihi</dt>

                              <dd> 
                                  <asp:TextBox ID="txtEndDate" CssClass="form-control" runat="server" AutoPostBack="true" TextMode="Date" OnTextChanged="txtEndDate_TextChanged" ></asp:TextBox>
                                  <div class="row">
                                      <div class="col-md-8" style="margin-top:3%;">
                                       <div class="row">
                                           <div class="col-md-6">
                                               <h3><label>Toplam: </label></h3></div>
                                           <div class="col-md-6">
                                              <h3><asp:Label ID="lblTotalPrice" CssClass="label label-primary" runat="server" Text="0₺"></asp:Label></h3>

                                           </div>
                                       </div>
                                      </div>
                                      <div class="col-md-4"><asp:Button ID="Rent" runat="server" style=" width:min-content; margin-left:45%;
    margin-top: 15px;
   " CssClass="form-control btn-primary " Text="Kirala" OnClick="Rent_Click" /></div>
                                  </div>
                                  <asp:TextBox ID="kytol" Text="!login" Visible="false" runat="server"></asp:TextBox>             

                              </dd>
                    </dl>
                   </div>
                   <div class="col-md-6">
                                       <dl class="dl-horizontal">
               
                    <dt>Plaka</dt>
                    <dd>
                        <asp:Label ID="lblPlateNumber" CssClass="form-control-static"  runat="server" Text="34AA001"></asp:Label></dd>
                        <dt>Günlük Fiyatı</dt>
                        <dd>
                             <asp:Label ID="lblDailyPrice" CssClass="form-control-static"  runat="server" Text="Fiyat"></asp:Label>
                    </dd>

                </dl>
                   </div>
               </div>

                <hr />



              <%--  <asp:Button ID="Button1"  CssClass="form-control" runat="server" OnClick="Button1_Click" Text="Hesapla" />--%>
            </div>
        </div>
    </div>
</asp:Content>
