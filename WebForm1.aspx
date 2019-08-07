﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="WebMethodInPage.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="Scripts/jquery-2.1.1.js"></script>

    <!-- script that use ScriptManager
        the object PageMethods is generated by ScriptManager -->
    <script type="text/javascript">
        function callWebServiceMethodTest() {
            PageMethods.Test(complete);
        }

        function callWebServiceMethodTestParGet() {
            // no difference by get or post using ScriptManager
            PageMethods.TestParGet(10, complete);
        }

        function callWebServiceMethodTestParPost() {
            // no difference by get or post using ScriptManager
            PageMethods.TestParPost(10, complete);
        }

        function callWebServiceMethodTestClass() {
            PageMethods.TestClass(completeClass);
        }

        function complete(val) {
            alert(val);
        }

        function completeClass(val) {
            alert("Name: " + val.name + ", Age: " + val.age);
        }
    </script>

    <!-- script that use Jquery and not ScriptManager to call the service -->

    <script type="text/javascript">
        function callWebServiceMethodAjaxTest() {

            // Test
            $.ajax({
                type: "GET",   // IMPORTANT use POST like ScriptManager
                cache: false,
                url: "http://localhost:3712/WebForm1.aspx/Test",
                contentType: "application/json",   // IMPORTANT if you write only contentType: "json" it doesn't work!!!
                beforeSend: function () { },
                complete: function () { },
                error: function (xhr, status, errorThrown) {
                    alert(errorThrown);
                },
                success: function (result) {
                    alert(result.d);
                }
            });
        }

        function callWebServiceMethodAjaxTestParGet() {
            // TestParGet
            $.ajax({
                type: "Get",
                cache: false,
                url: "http://localhost:3712/WebForm1.aspx/TestParGet?id=3",
                contentType: "application/json",   // IMPORTANT if you write only contentType: "json" it doesn't work!!!
                beforeSend: function () { },
                complete: function () { },
                error: function (xhr, status, errorThrown) {
                    alert(errorThrown);
                },
                success: function (result) {
                    // return d object 
                    alert(result.d);
                }
            });
        }

        function callWebServiceMethodAjaxTestParPost() {
            // TestParPOST
            $.ajax({
                type: "POST",
                data: JSON.stringify({      // IMPORTANT use JSON.stringify not only: data: {id:3} as default REST service
                    id: 3
                }),
                cache: false,
                url: "http://localhost:3712/WebForm1.aspx/TestParPost",
                contentType: "application/json",   // IMPORTANT if you write only contentType: "json" it doesn't work!!!
                beforeSend: function () { },
                complete: function () { },
                error: function (xhr, status, errorThrown) {
                    alert(errorThrown);
                },
                success: function (result) {
                    // return d object 
                    alert(result.d);
                }
            });
        }

        function callWebServiceMethodAjaxTestClass() {
            // TestClass
            $.ajax({
                type: "GET",
                cache: false,
                url: "http://localhost:3712/WebForm1.aspx/TestClass",
                contentType: "application/json",   // IMPORTANT if you write only contentType: "json" it doesn't work!!!
                beforeSend: function () { },
                complete: function () { },
                error: function (xhr, status, errorThrown) {
                    alert(errorThrown);
                },
                success: function (result) {
                    // return d object 
                    alert("Name: " + result.d.name + ", Age: " + result.d.age);
                }
            });
        }
    </script>

</head>
<body>
    <form id="form1" runat="server">
        <div>
            <%--IMPORTANT: EnablePageMethods="true"--%>
            <asp:ScriptManager ID="ScriptManager1" runat="server" EnablePageMethods="true" />
            <div>
                <h2>With Script Manager</h2>
                <input type="button" value="Test" onclick="callWebServiceMethodTest()" />
                <input type="button" value="TestParGET" onclick="callWebServiceMethodTestParGet()" />
                <input type="button" value="TestParPOST" onclick="callWebServiceMethodTestParPost()" />
                <input type="button" value="TestClass" onclick="callWebServiceMethodTestClass()" />
            </div>
            <div>
                <h2>Without Script Manager</h2>
                <input type="button" value="Test" onclick="callWebServiceMethodAjaxTest()" />
                <input type="button" value="TestParGET" onclick="callWebServiceMethodAjaxTestParGet()" />
                <input type="button" value="TestParPOST" onclick="callWebServiceMethodAjaxTestParPost()" />
                <input type="button" value="TestClass" onclick="callWebServiceMethodAjaxTestClass()" />
            </div>
        </div>
    </form>
</body>
</html>
