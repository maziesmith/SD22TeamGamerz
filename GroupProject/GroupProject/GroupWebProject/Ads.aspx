<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Ads.aspx.cs" Inherits="GroupWebProject.Ads" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <asp:Panel ID="pnlGridAds" runat="server">
     <asp:GridView ID="GridView1" runat="server" DataSourceID="SqlDataSource1" AutoGenerateColumns="False" DataKeyNames="AdsID">
        <Columns>
            <asp:BoundField DataField="AdsID" HeaderText="AdsID" ReadOnly="True" InsertVisible="False" SortExpression="AdsID"></asp:BoundField>
            <asp:BoundField DataField="AdsTitle" HeaderText="AdsTitle" SortExpression="AdsTitle"></asp:BoundField>
            <asp:BoundField DataField="AdsDesc" HeaderText="AdsDesc" SortExpression="AdsDesc"></asp:BoundField>
            <asp:BoundField DataField="GameID" HeaderText="GameID" SortExpression="GameID"></asp:BoundField>
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:DefaultConnection %>' SelectCommand="SELECT * FROM [tbAds]"></asp:SqlDataSource>
     
    <asp:LinkButton ID="lbAdd" runat="server" CssClass="btn btn-default" OnClick="lbAdd_Click" >Add Advertisment</asp:LinkButton>
        
    </asp:Panel>
 

    <asp:Panel ID="pnlInsertAdd" Visible="false" runat="server">
    <br />
    <br />
        <div class ="form-horizontal">
        <div class ="form-group">
            <asp:Label runat="server" ID="lbTitle" CssClass="col-md-2 control-label">Title</asp:Label>
            <div class="col-md-10">
             <asp:TextBox ID="txtTitle" CssClass="form-control"  runat="server"></asp:TextBox>
                   <asp:RequiredFieldValidator runat="server" ControlToValidate="txtTitle"
                    CssClass="text-danger" ErrorMessage="The Title field is required." />
              </div>
        </div>

        <div class ="form-group">
             <asp:Label runat="server" ID="lbDesc" CssClass="col-md-2 control-label">Description</asp:Label>
            <div class="col-md-10">
                <asp:TextBox ID="txtDescription" CssClass="form-control" runat="server"></asp:TextBox>
             </div>
        </div>

        <div class ="form-group">
             <asp:Label runat="server" ID="lbGameName" CssClass="col-md-2 control-label">Game Name</asp:Label>
            <div class="col-md-10">
               <asp:DropDownList ID="ddlGames" runat="server" CssClass="form-control" Width="250px" DataSourceID="SqlDataSource3" DataTextField="GameName" DataValueField="GameID"></asp:DropDownList>
             <asp:SqlDataSource runat="server" ID="SqlDataSource3" ConnectionString='<%$ ConnectionStrings:DefaultConnection %>' SelectCommand="SELECT [GameName], [GameID] FROM [tbGames]"></asp:SqlDataSource>
            </div>
       </div>

        <div class ="form-group">
             <div class="col-md-offset-2 col-md-10">
            <asp:Button ID="btnAdd" runat="server" CssClass="btn btn-default" Text="Add Advertisement" OnClick="btnAdd_Click" />
             </div>
         </div>    
    </div>  
    </asp:Panel>

   
   
</asp:Content>
