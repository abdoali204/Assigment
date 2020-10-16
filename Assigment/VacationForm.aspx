<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="VacationForm.aspx.cs" Inherits="Assigment.VacationForm" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
      <div class="row justify-content-center">
        <div class="form-group" style="margin-top:30px;">

            <asp:Label ID="lblSubmissionDate" runat="server" Text="Submission Date:"  CssClass="control-label col-sm-2" Height="30px"></asp:Label>
            <asp:Label ID="SubmissionDateTxt" runat="server" CssClass="text-primary font-weght-bold col-sm-10" Height="30px"></asp:Label>

        </div>
        <div class="form-group">
            <asp:Label ID="lblEmployeeName" runat="server" Text="Employee Name:"  CssClass="col-sm-2 control-label"></asp:Label>
            <asp:TextBox ID="EmployeeName" runat="server" CssClass="form-control"></asp:TextBox>
        
            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="EmployeeName" ErrorMessage="Required" CssClass="text-danger" Font-Bold="True"></asp:RequiredFieldValidator>
        </div>
            
      <div class="form-group">
            <asp:Label ID="lblTitle" runat="server" Text="Title:"  CssClass="col-sm-2 control-label"></asp:Label>
            <asp:TextBox ID="TitleTxt" runat="server" CssClass="form-control"></asp:TextBox>
        
            <asp:RequiredFieldValidator ID="requiredValidtorTitle" runat="server" 
                ControlToValidate="EmployeeName" 
                ErrorMessage="Required" 
                CssClass="text-danger" Font-Bold="True">

            </asp:RequiredFieldValidator>

     </div> 
      <div class="form-group">
            <asp:Label ID="De" runat="server" Text="Department:"  CssClass="col-sm-2 control-label"></asp:Label>
           <asp:DropDownList ID="Department" runat="server" DataSourceID="DepartmentODS" DataTextField="Name" DataValueField="Id" CssClass="form-control" ></asp:DropDownList>
            <asp:ObjectDataSource ID="DepartmentODS" runat="server" SelectMethod="GetDepartments" TypeName="Assigment.DAL.DepartmentRepository"></asp:ObjectDataSource>
       
            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="Department" ErrorMessage="Required" CssClass="text-danger" Font-Bold="True"></asp:RequiredFieldValidator>
      </div> 
        <div class="form-group">
            <asp:Label ID="lblDateFrom" runat="server" Text="Vacation Date From:"></asp:Label>
            <asp:TextBox ID="DateFrom"  runat="server" placeholder="mm/dd/yyyy" CssClass="form-control" OnTextChanged="DateFrom_TextChanged">
            </asp:TextBox>

            <asp:CompareValidator 
                ID="CompareEndTodayValidator"
                Operator="GreaterThan" type="String"
                ControltoValidate="DateFrom" ErrorMessage="The 'Date' must be after today" 
                runat="server" Font-Bold="True" CssClass="text-danger" />
          <asp:CompareValidator 
                ID="CompareValidator2"
                Operator="DataTypeCheck" type="Date"
                ControltoValidate="DateFrom" ErrorMessage="Enter valid date" 
                runat="server" Font-Bold="True" CssClass="text-danger" ViewStateMode="Inherit" />
         
            
            
              <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="DateFrom" ErrorMessage="Required" CssClass="text-danger" Font-Bold="True"></asp:RequiredFieldValidator>
    
       </div>
      <div class="form-group">
            <asp:Label ID="lblDateTo" runat="server" Text="Vacation Date To:"></asp:Label>
            <asp:TextBox ID="DateTo" runat="server" placeholder="mm/dd/yyyy" CssClass="form-control"  AutoPostBack="true" OnTextChanged="DateTo_SelectionChanged"></asp:TextBox>
        
            <asp:CompareValidator 
                ID="CompareAfterFromDateValidator"
                Operator="GreaterThan"
                type="Date"
                ControltoValidate="DateTo"
                ErrorMessage="The 'Date To' must be after From Date"
                runat="server" CssClass="text-danger" Font-Bold="True" ControlToCompare="DateFrom" />

          <asp:CompareValidator 
                ID="CompareValidator1"
                Operator="DataTypeCheck" type="Date"
                ControltoValidate="DateTo" ErrorMessage="Enter valid date" 
                runat="server" Font-Bold="True" CssClass="text-danger" ViewStateMode="Inherit" />
         
            
            

     <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="DateTo" ErrorMessage="Required" CssClass="text-danger" Font-Bold="True"></asp:RequiredFieldValidator>
     </div>
      <div class="form-group">
            <label>Returning</label>
            <asp:Label ID="lblReturning" runat="server" Text=""></asp:Label>
       </div>
      <div class="form-group">
           <span>Total Number of Days Requested:
            <asp:Label ID="lblTotalDaysNumber" runat="server" Text=""></asp:Label>
            </span>
      </div>
        <div class="form-group">
            <asp:Label ID="lblNotes" runat="server" Text="Notes:"  CssClass="col-sm-"></asp:Label>
            <asp:TextBox ID="Notes" runat="server" CssClass="form-control"></asp:TextBox>               
            <asp:ValidationSummary ID="ValidationSummary1" runat="server" CssClass="text-danger" Font-Bold="True" />                 
         </div>
            <asp:Button ID="Button1" runat="server" BorderStyle="None" OnClick="Button1_Click" Text="Save" UseSubmitBehavior="true" CssClass="btn btn-success" />
    
   </div>
</asp:Content>
