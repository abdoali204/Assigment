<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="VacationList.aspx.cs" Inherits="Assigment.VacationList" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div style="margin-top:35px; margin-left: 40px;">
        <asp:GridView ID="gvVacationList" runat="server" AutoGenerateColumns="False" CellPadding="30" CellSpacing="20" DataSourceID="VacationOSD" ForeColor="#333333" GridLines="None" AllowPaging="True" DataKeyNames="Id">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="Id" HeaderText="#" SortExpression="Id" />
                <asp:BoundField DataField="SubmissionDate" HeaderText="SubmissionDate" SortExpression="SubmissionDate" />
                <asp:BoundField DataField="EmployeeName" HeaderText="EmployeeName" SortExpression="EmployeeName" />
                <asp:BoundField DataField="VacationDateFrom" HeaderText="From" SortExpression="VacationDateFrom" />
                <asp:BoundField DataField="VacationDateTo" HeaderText="To" SortExpression="VacationDateTo" />
                <asp:BoundField DataField="DepartmentName" HeaderText="DepartmentName" SortExpression="DepartmentName" />
                <asp:CommandField SelectText="Details" ShowSelectButton="True" />
            </Columns>
            <EditRowStyle BackColor="#7C6F57" />
            <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#E3EAEB" />
            <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#F8FAFA" />
            <SortedAscendingHeaderStyle BackColor="#246B61" />
            <SortedDescendingCellStyle BackColor="#D4DFE1" />
            <SortedDescendingHeaderStyle BackColor="#15524A" />
        </asp:GridView>
        <asp:ObjectDataSource ID="VacationsOSD" runat="server"></asp:ObjectDataSource>
        <asp:ObjectDataSource ID="VacationOSD" runat="server" SelectMethod="GetVacations" TypeName="Assigment.DAL.VacationRepository"></asp:ObjectDataSource>
    </div>
    <div style="margin-top:35px; margin-left:35px;">
        <asp:DetailsView ID="DetailsView1" runat="server" Height="50px" Width="125px" AutoGenerateRows="False" BackColor="White" BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataSourceID="vacODS">
            <EditRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="#663399" />
            <Fields>
                <asp:BoundField DataField="Id" HeaderText="Id" SortExpression="Id" />
                <asp:BoundField DataField="SubmissionDate" HeaderText="SubmissionDate" SortExpression="SubmissionDate" />
                <asp:BoundField DataField="EmployeeName" HeaderText="EmployeeName" SortExpression="EmployeeName" />
                <asp:BoundField DataField="Title" HeaderText="Title" SortExpression="Title" />
                <asp:BoundField DataField="VacationDateFrom" HeaderText="VacationDateFrom" SortExpression="VacationDateFrom" />
                <asp:BoundField DataField="VacationDateTo" HeaderText="VacationDateTo" SortExpression="VacationDateTo" />
                <asp:BoundField DataField="Returing" HeaderText="Returing" SortExpression="Returing" />
                <asp:BoundField DataField="TotalNumberOfDaysRequested" HeaderText="TotalNumberOfDaysRequested" SortExpression="TotalNumberOfDaysRequested" />
                <asp:BoundField DataField="Notes" HeaderText="Notes" SortExpression="Notes" />
                <asp:BoundField DataField="DepartmentName" HeaderText="DepartmentName" SortExpression="DepartmentName" />
            </Fields>
            <FooterStyle BackColor="#FFFFCC" ForeColor="#330099" />
            <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="#FFFFCC" />
            <PagerStyle BackColor="#FFFFCC" ForeColor="#330099" HorizontalAlign="Center" />
            <RowStyle BackColor="White" ForeColor="#330099" />
        </asp:DetailsView>
     </div>
    <asp:ObjectDataSource ID="vacODS" runat="server" SelectMethod="GetVacation" TypeName="Assigment.DAL.VacationRepository">
        <SelectParameters>
            <asp:ControlParameter ControlID="gvVacationList" DefaultValue="0" Name="id" PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
    </asp:ObjectDataSource>
</asp:Content>
