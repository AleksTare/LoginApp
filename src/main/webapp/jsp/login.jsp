<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>Login</title>
</head>
<body>
<div id="amazon-root"></div>
<script type="text/javascript">
    window.onAmazonLoginReady = function() {
        amazon.Login.setClientId('amzn1.application-oa2-client.aedb066b31c4468388d07a2ca6801a0f');
    };
    (function(d) {
        var a = d.createElement('script'); a.type = 'text/javascript';
        a.async = true; a.id = 'amazon-login-sdk';
        a.src = 'https://assets.loginwithamazon.com/sdk/na/login1.js';
        d.getElementById('amazon-root').appendChild(a);
    })(document);
</script>

<form:form id="loginForm" modelAttribute="login" action="loginProcess" method="post">
    <table align="center">
        <tr>
            <td>
                <form:label path="username">Username: </form:label>
            </td>
            <td>
                <form:input path="username" name="username" id="username" />
            </td>
        </tr>
        <tr>
            <td>
                <form:label path="password">Password:</form:label>
            </td>
            <td>
                <form:password path="password" name="password" id="password" />
            </td>
        </tr>
        <tr>
            <td align="right">
                <a href id="LoginWithAmazon">
                    <img border="0" alt="Login with Amazon"
                         src="https://images-na.ssl-images-amazon.com/images/G/01/lwa/btnLWA_gold_156x32.png"
                         width="156" height="32" />
                </a>
            </td>
            <td align="left">
                <form:button id="login" name="login">Login</form:button>
            </td>
        </tr>
        <tr></tr>
        <tr>
            <td></td>
            <td><a href="/LoginApp">Home</a>
            </td>
        </tr>
    </table>
</form:form>
<table align="center">
    <tr>
        <td style="font-style: italic; color: red;">${message}</td>
    </tr>
</table>


<script type="text/javascript">
    document.getElementById('LoginWithAmazon').onclick = function() {
        options = { scope : 'profile' };
        amazon.Login.authorize(options,
            'http://localhost:8080/LoginApp/login/amazon');
        return false;
    };
</script>


</body>
</html>