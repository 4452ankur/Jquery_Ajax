<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Ajax1.aspx.cs" Inherits="AjaxExmp.AjaxExample.Ajax1" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Ajax ScriptManager Example</title>


    <link href="~/Content/bootstrap.css" rel="stylesheet" />
    <link href="../Content/customButton.css" rel="stylesheet" />
    <script src="~/Scripts/bootstrap.js"></script>
    <script src="../Scripts/jquery-3.1.1.js"></script>

        <script type="text/javascript">
        function callWebServiceMethodTest() {
            PageMethods.Test(complete);
        }

            function callWebServiceMethodTestParPost() {
                // no difference by get or post using ScriptManager
                PageMethods.TestParPost(10, complete);
            }

        function complete(val) {
            alert(val);
        }

        function completeClass(val) {
            alert("Name: " + val.name + ", Age: " + val.age);
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
          <div class="container bg-success well-sm">
            <asp:ScriptManager ID="ScriptManager1" runat="server" EnablePageMethods="true"></asp:ScriptManager>
                        <div>
                <h2>With Script Manager</h2>
          
                <input type="button" value="Test" onclick="callWebServiceMethodTest()" />
                <input type="button" value="TestParPOST" onclick="callWebServiceMethodTestParPost()" />

            </div>
             <%-- *** Update Progress Bar ****--%>
           <asp:UpdateProgress ID="UpdateProgress1" runat="server" DisplayAfter="20">
               <ProgressTemplate>
                                <div id="cboxOverlay" style="display: block; opacity: 0.9; cursor: pointer;">
                    </div>
                    <div class="waitPopup">
                        <p style="text-align: center;">
                            <img alt="" src="/Images/SailLogo.jpg" style="float: right; margin-bottom: 15px;" />
                        </p>
                        <div class="clearx">
                        </div>
                        <p style="text-align: center;">
                            <img src="/Images/loading.gif" alt="Wait..." />
                        </p>
                        <p style="text-align: center;">
                            We are processing your request.
                        </p>
                        <p style="text-align: center;">
                            This may take some time.
                        </p>
                    </div>
               </ProgressTemplate>
            </asp:UpdateProgress>

         <div class="container">
            <asp:UpdatePanel runat="server" id="Panel" UpdateMode="Conditional">
            <ContentTemplate>
                <asp:Button runat="server" id="UpdateButton" onclick="ProgressButton_Click" text="ProgressBarChk" />
            </ContentTemplate>
            </asp:UpdatePanel>
              </div>
        </div>
        <%--- Update  Panel with trigger and Content Template ---%>
        <div class="container bg-warning ">
        <asp:UpdatePanel runat="server" id="UpdatePanel" updatemode="Conditional">
        <Triggers>
            <asp:AsyncPostBackTrigger controlid="UpdateButton2" eventname="Click" />
        </Triggers>
            <ContentTemplate>
                <asp:Label runat="server" id="DateTimeLabel1" />
                <asp:Button runat="server" id="UpdateButton1" onclick="UpdateButton_Click" text="Update Only First On" />               
            </ContentTemplate>
        </asp:UpdatePanel>
        <asp:UpdatePanel runat="server" id="UpdatePanel1" updatemode="Conditional">           
            <ContentTemplate>
                <asp:Label runat="server" id="DateTimeLabel2" />
                <asp:Button runat="server" id="UpdateButton2" onclick="UpdateButton_Click" text="Update All inside UpdatePanel" />
            </ContentTemplate>
        </asp:UpdatePanel>
        </div>
    </form>
</body>
</html>
