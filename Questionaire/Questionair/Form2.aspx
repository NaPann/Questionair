<%@ Page Title="" Language="C#" MasterPageFile="~/QN.Master" AutoEventWireup="true" CodeBehind="Form2.aspx.cs" Inherits="Questionair.Form2" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
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
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
    <div display: block; style="padding: 5px 9px 5px 5px;">
        <div style="width: 100%; height: 380px; border: 2px solid #008299;">
            <br />
            <table border="0" style="width:100%">
                <tr>
                    <td style="width: 25%; text-align: right;"></td>
                    <td style="width: 25%; text-align: left;">
                    </td>
                    <td style="width: 15%; text-align: right;"></td>
                    <td style="width: 35%; text-align: left;">
                    </td>
                </tr>
                <tr>
                    <td colspan="4" style="padding-left:20px">
                        เคยได้รับการตรวจสุขภาพ ถ้าไม่เคยให้ข้ามไปตอบข้อถัดไป :
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td colspan="3">
                        <table style="width:100%">
                            <tr>
                                <td style="width:20%">
                                    <asp:RadioButtonList id="BloodTest" runat="server" RepeatDirection="Horizontal" RepeatColumns="1">
                                        <asp:ListItem Text="เลือด" Value="1"></asp:ListItem>
                                    </asp:RadioButtonList>
                                    <asp:RadioButtonList id="BloodPressure" runat="server" RepeatDirection="Horizontal" RepeatColumns="1">
                                        <asp:ListItem Text="ความดันโลหิต" Value="1"></asp:ListItem>
                                    </asp:RadioButtonList>
                                    <telerik:RadTextBox ID="OtherExam" runat="server" Skin="Metro" EmptyMessage="-- อื่นๆ โปรดระบุ --">
                                    </telerik:RadTextBox>
                                </td>
                                <td style="width:15%">
                                    <asp:RadioButtonList id="BloodTestAns" runat="server" RepeatDirection="Horizontal" RepeatColumns="2">
                                        <asp:ListItem Text="ปกติ" Value="1"></asp:ListItem>
                                        <asp:ListItem Text="ไม่ปกติ" Value="0"></asp:ListItem>
                                    </asp:RadioButtonList>
                                    <asp:RadioButtonList id="BloodPressureAns" runat="server" RepeatDirection="Horizontal" RepeatColumns="2">
                                        <asp:ListItem Text="ปกติ" Value="1"></asp:ListItem>
                                        <asp:ListItem Text="ไม่ปกติ" Value="0"></asp:ListItem>
                                    </asp:RadioButtonList>
                                    <asp:RadioButtonList id="OtherExamAns" runat="server" RepeatDirection="Horizontal" RepeatColumns="2">
                                        <asp:ListItem Text="ปกติ" Value="1"></asp:ListItem>
                                        <asp:ListItem Text="ไม่ปกติ" Value="0"></asp:ListItem>
                                    </asp:RadioButtonList>
                                </td>
                                <td id="haha" style="width:20%">
                                    <telerik:RadTextBox ID="BloodTestReason" runat="server" Skin="Metro" EmptyMessage="-- ไม่ปกติ โปรดระบุ --">
                                    </telerik:RadTextBox>
                                    <telerik:RadTextBox ID="BloodPressureReason" runat="server" Skin="Metro" EmptyMessage="-- ไม่ปกติ โปรดระบุ --">
                                    </telerik:RadTextBox>
                                    <telerik:RadTextBox ID="OtherExamReason" runat="server" Skin="Metro" EmptyMessage="-- ไม่ปกติ โปรดระบุ --">
                                    </telerik:RadTextBox>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td colspan="4" style="padding-left:20px">
                        ท่านมีโรคประจำตัวหรือไม่ เช่น เบาหวาน ความดันโลหิตสูง ฯลฯ ) :
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td>
                        <asp:RadioButtonList id="rbIsCongenitalDisease" runat="server" RepeatDirection="Horizontal" RepeatColumns="2">
                            <asp:ListItem Text="ไม่มี" Value="0"></asp:ListItem>
                            <asp:ListItem Text="มี" Value="1"></asp:ListItem>
                        </asp:RadioButtonList>
                    </td>
                    <td>
                        <telerik:RadTextBox ID="RadTextBox2" runat="server" Skin="Metro" EmptyMessage="-- ถ้ามี โปรดระบุ --">
                        </telerik:RadTextBox>
                    </td>
                </tr>
                <tr>
                    <td style="width: 25%;  text-align: right;">สุขภาพของท่านในปัจจุบันเป็นอย่างไร :</td>
                    <td style="width: 25%;  text-align: left;" colspan="3">
                        <asp:RadioButtonList id="rbHealth" runat="server" RepeatDirection="Horizontal" RepeatColumns="1">
                            <asp:ListItem Text="แข็งแรงสามารถทำอะไรได้ทุกอย่างที่ต้องการ" Value="1"></asp:ListItem>
                            <asp:ListItem Text="ไม่แข็งแรง เจ็บป่วย มีโรคประจำตัว" Value="2"></asp:ListItem>
                            <asp:ListItem Text="ไม่แน่ใจว่าตนเองสุขภาพดีหรือไม่" Value="3"></asp:ListItem>
                        </asp:RadioButtonList>
                    </td>
                </tr>
                <%--<tr>
                    <td colspan="2" style="float:right">
                        <telerik:RadButton ID="btnPrev" runat="server" OnClick="btnPrev_Click"
                            Text="<< กลับ">
                        </telerik:RadButton>
                    </td>
                    <td colspan="2" style="float:none">
                        <telerik:RadButton ID="btnNext" runat="server" OnClick="btnNext_Click"
                            Text="ต่อไป >>" ValidationGroup="Detail">
                        </telerik:RadButton>
                    </td>
                </tr>--%>
                </table>
            <div style="text-align:center; width:100%; height:100%; padding-top:60px;">
                <telerik:RadButton ID="btnPrev" runat="server" OnClick="btnPrev_Click"
                            Text="<< กลับ">
                        </telerik:RadButton>
                <telerik:RadButton ID="btnNext" runat="server" OnClick="btnNext_Click"
                            Text="ต่อไป >>" ValidationGroup="Detail">
                        </telerik:RadButton>
            </div>

            </div>
        </div>
</asp:Content>


