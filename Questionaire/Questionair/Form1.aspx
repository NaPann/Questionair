<%@ Page Title="" Language="C#" MasterPageFile="~/QN.Master" AutoEventWireup="true" CodeBehind="Form1.aspx.cs" Inherits="Questionair.Form1" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
    <style>
        .HeadText
        {
            font-weight: bold;
            padding-left: 15%;
        }

        td
        {
            vertical-align: top;
            padding-bottom: 5px;
        }

        #haha input
        {
            margin-bottom: 4px;
            margin-top: 4px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="Content" runat="server">
    <div display: block; style="padding: 5px 9px 5px 5px;">
        <div style="width: 100%; height: 380px; border: 2px solid #008299;">
            <table border="0" style="width:100%">
                <tr>
                    <td colspan="4">
                        <p class="HeadText">ส่วนที่  1  ข้อมูลทั่วไป</p>
                    </td>
                </tr>
                <tr>
                    <td style="width: 25%; text-align: right;">เพศ :</td>
                    <td style="width: 25%; text-align: left;">
                        <asp:RadioButtonList id="rbGender" runat="server" RepeatDirection="Horizontal">
                            <asp:ListItem Text="ชาย" Value="1"></asp:ListItem>
                            <asp:ListItem Text="หญิง" Value="0"></asp:ListItem>
                        </asp:RadioButtonList>
                    </td>
                    <td style="width: 15%; text-align: right;">อายุ :</td>
                    <td style="width: 35%; text-align: left;">
                        <telerik:RadNumericTextBox showspinbuttons="true" incrementsettings-interceptarrowkeys="true" incrementsettings-interceptmousewheel="true" runat="server" id="txtAge" NumberFormat-DecimalDigits="0">
                        </telerik:RadNumericTextBox>
                    </td>
                </tr>
                <tr>
                    <td style="width: 25%; text-align: right;">น้ำหนัก :</td>
                    <td style="width: 25%; text-align: left;">
                        <telerik:RadNumericTextBox showspinbuttons="true" incrementsettings-interceptarrowkeys="true" incrementsettings-interceptmousewheel="true" runat="server" id="txtWeight" NumberFormat-DecimalDigits="2">
                        </telerik:RadNumericTextBox> กิโลกรัม  
                    </td>
                    <td style="width: 15%;  text-align: right;">ส่วนสูง :</td>
                    <td style="width: 35%;  text-align: left;">
                        <telerik:RadNumericTextBox showspinbuttons="true" incrementsettings-interceptarrowkeys="true" incrementsettings-interceptmousewheel="true" runat="server" id="txtHeight" NumberFormat-DecimalDigits="2">
                        </telerik:RadNumericTextBox>    เซนติเมตร
                    </td>
                </tr>
                <tr>
                    <td style="width: 25%; text-align: right;">สถานภาพสมรส :</td>
                    <td style="width: 25%; text-align: left;">
                        <asp:RadioButtonList id="rbStatus" runat="server" RepeatDirection="Horizontal" RepeatColumns="2">
                            <asp:ListItem Text="โสด" Value="โสด"></asp:ListItem>
                            <asp:ListItem Text="คู่" Value="คู่"></asp:ListItem>
                            <asp:ListItem Text="ม่าย" Value="ม่าย"></asp:ListItem>
                            <asp:ListItem Text="หย่า" Value="หย่า"></asp:ListItem>
                            <asp:ListItem Text="แยกกันอยู่" Value="แยกกันอยู่"></asp:ListItem>
                        </asp:RadioButtonList>
                    </td>
                    <td style="width: 15%;  text-align: right;">สำเร็จการศึกษาสูงสุดระดับ :</td>
                    <td style="width: 35%;  text-align: left;">
                        <asp:RadioButtonList id="rbEducation" runat="server" RepeatDirection="Horizontal" RepeatColumns="2">
                            <asp:ListItem Text="ประถมศึกษา" Value="ประถมศึกษา"></asp:ListItem>
                            <asp:ListItem Text="มัธยมศึกษา" Value="มัธยมศึกษา"></asp:ListItem>
                            <asp:ListItem Text="ประกาศณียบัตร" Value="ประกาศณียบัตร"></asp:ListItem>
                            <asp:ListItem Text="ปริญญาตรี" Value="ปริญญาตรี"></asp:ListItem>
                            <asp:ListItem Text="ปริญญาโท" Value="ปริญญาโท"></asp:ListItem>
                        </asp:RadioButtonList>
                        <telerik:RadTextBox ID="OtherEducation" runat="server" Skin="Metro" EmptyMessage="-- อื่นๆ โปรดระบุ --">
                        </telerik:RadTextBox>
                    </td>
                </tr>
                <tr>
                    <td style="width: 25%; text-align: right;">ปัจจุบันท่านปฏิบัติงานในตำแหน่ง :</td>
                    <td style="width: 25%; text-align: left;" colspan="3">
                        <asp:RadioButtonList id="rbPosition" runat="server" RepeatDirection="Horizontal" RepeatColumns="3">
                            <asp:ListItem Text="ผู้บริหาร" Value="ผู้บริหาร"></asp:ListItem>
                            <asp:ListItem Text="หัวหน้าตึก" Value="หัวหน้าตึก"></asp:ListItem>
                            <asp:ListItem Text="เจ้าหน้าที่ผู้ปฏิบัติงาน" Value="เจ้าหน้าที่ผู้ปฏิบัติงาน"></asp:ListItem>
                            <asp:ListItem Text="ลูกจ้างประจำ" Value="ลูกจ้างประจำ"></asp:ListItem>
                            <asp:ListItem Text="ลูกจ้างชั่วคราว" Value="ลูกจ้างชั่วคราว"></asp:ListItem>
                            <asp:ListItem Text="คนงาน" Value="คนงาน"></asp:ListItem>
                        </asp:RadioButtonList>
                        <telerik:RadTextBox ID="OtherPosition" runat="server" Skin="Metro" EmptyMessage="-- อื่นๆ โปรดระบุ --">
                        </telerik:RadTextBox>
                    </td>
                    
                </tr>
                <tr>
                    <td style="width: 25%;  text-align: right;">ในรอบปีที่ผ่านมาเคยได้รับการตรวจสุขภาพ :</td>
                    <td style="width: 25%;  text-align: left;" colspan="3">
                        <asp:RadioButtonList id="rbIsMedicalExam" runat="server" RepeatDirection="Horizontal" RepeatColumns="2">
                            <asp:ListItem Text="เคย" Value="1"></asp:ListItem>
                            <asp:ListItem Text="ไม่เคย" Value="0"></asp:ListItem>
                        </asp:RadioButtonList>
                    </td>
                </tr>
                <tr>
                    <td style="text-align:center; width:100%" colspan="4">
                        <%--<telerik:RadButton ID="btnNext" runat="server" OnClick="btnNext_Click"
                            Text="ต่อไป >>" ValidationGroup="Detail">
                        </telerik:RadButton>--%>
                    </td>
                </tr>
            </table>
            <div style="text-align:center; width:100%">
            <telerik:RadButton ID="btnNext" runat="server" OnClick="btnNext_Click"
                            Text="ต่อไป >>" ValidationGroup="Detail">
                        </telerik:RadButton></div>
        </div>
    </div>
</asp:Content>

