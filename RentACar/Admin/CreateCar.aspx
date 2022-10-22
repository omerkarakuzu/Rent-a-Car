<%@ Page Title="CreateCar" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CreateCar.aspx.cs" Inherits="RentACar.About" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Araç Ekle</h2>
    <div class="form-horizontal">
        <h4>Yeni bir araç ekle</h4>
        <hr />
        <asp:ValidationSummary runat="server" CssClass="text-danger" />

                <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="PlateNumber" CssClass="col-md-2 control-label">Plaka numarası</asp:Label>
            <div class="col-md-3">
                <asp:TextBox runat="server" ID="PlateNumber" CssClass="form-control" TextMode="SingleLine" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="PlateNumber"
                    CssClass="text-danger" ErrorMessage="Plaka numarası alanı boş bırakılamaz." />
            </div>
        </div>
                        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="Color" CssClass="col-md-2 control-label">Renk</asp:Label>
            <div class="col-md-3">
                <asp:TextBox runat="server" ID="Color" CssClass="form-control" TextMode="Color" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="Color"
                    CssClass="text-danger" ErrorMessage="Renk alanı boş bırakılamaz." />
    
            </div>
        </div>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="Price" CssClass="col-md-2 control-label">Günlük ücret</asp:Label>
            <div class="col-md-3">
                <asp:TextBox runat="server" ID="Price" CssClass="form-control" TextMode="Number" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="Price"
                    CssClass="text-danger" ErrorMessage="Günlük ücret alanı boş bırakılamaz." />
            </div>
        </div>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="CarPhoto" CssClass="col-md-2 control-label">Araç görüntüsü</asp:Label>
            <div class="col-md-3">
               
                <asp:FileUpload ID="CarPhoto"  runat="server" CssClass="form-control" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="CarPhoto"
                    CssClass="text-danger" ErrorMessage="Araç görüntüsü alanı boş bırakılamaz." />
            </div>
        </div>
        <div class="form-group">
            <div class="col-md-offset-2 col-md-10">
                <asp:Button runat="server"  ID="Create" Text="Ekle" CssClass="btn btn-default" OnClick="Create_Click" />
            </div>
        </div>
    </div>
</asp:Content>
