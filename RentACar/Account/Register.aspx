<%@ Page Title="Register" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="RentACar.Account.Register" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <h2>Kayıt Ol</h2>
    <p class="text-danger">
        <asp:Literal runat="server" ID="ErrorMessage" />
    </p>

    <div class="form-horizontal">
        <h4>Yeni hesap oluştur
           
        </h4>
        
        <hr />
        <asp:ValidationSummary runat="server" CssClass="text-danger" />

                <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="FullName" CssClass="col-md-2 control-label">İsim soyisim</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="FullName" CssClass="form-control" TextMode="SingleLine" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="FullName"
                    CssClass="text-danger" ErrorMessage="İsim soyisim alanı boş bırakılamaz." />
            </div>
        </div>
                        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="BirthDate" CssClass="col-md-2 control-label">Doğum Tarihi</asp:Label>
            <div class="col-md-3">
                <asp:TextBox runat="server" ID="BirthDate" CssClass="form-control" TextMode="Date" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="BirthDate"
                    CssClass="text-danger" ErrorMessage="Doğum Tarihi alanı boş bırakılamaz." />
                <asp:RangeValidator ID="RangeValidator1"  ControlToValidate="BirthDate" MaximumValue="2004-10-01" MinimumValue="1950-10-01" runat="server" ErrorMessage="RangeValidator"></asp:RangeValidator>
            </div>
        </div>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="Email" CssClass="col-md-2 control-label">Email</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="Email" CssClass="form-control" TextMode="Email" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="Email"
                    CssClass="text-danger" ErrorMessage="Email alanı boş bırakılamaz" />
            </div>
        </div>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="Password" CssClass="col-md-2 control-label">Parola</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="Password" TextMode="Password" CssClass="form-control" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="Password"
                    CssClass="text-danger" ErrorMessage="Parola alanı boş bırakılamaz" />
            </div>
        </div>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="ConfirmPassword" CssClass="col-md-2 control-label">Parolayı doğrula</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="ConfirmPassword" TextMode="Password" CssClass="form-control" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="ConfirmPassword"
                    CssClass="text-danger" Display="Dynamic" ErrorMessage="Parolayı doğrula alanı boş bırakılamaz" />
                <asp:CompareValidator runat="server" ControlToCompare="Password" ControlToValidate="ConfirmPassword"
                    CssClass="text-danger" Display="Dynamic" ErrorMessage="Parolalar eşleşmiyor." />
            </div>
        </div>
        <div class="form-group">
            <div class="col-md-offset-2 col-md-10">
                <asp:Button runat="server" OnClick="CreateUser_Click" Text="Kayıt Ol" CssClass="btn btn-default" />
            </div>
        </div>
    </div>
</asp:Content>
