<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"
      xmlns:f="http://java.sun.com/jsf/core"
      xmlns:h="http://java.sun.com/jsf/html"
      xmlns:c="http://java.sun.com/jsp/jstl/core">
<head>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
          integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
            integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
            crossorigin="anonymous"></script>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>Login</title>
</head>
<body>
<div id="amazon-root"></div>
<script type="text/javascript">
    window.onAmazonLoginReady = function () {
        amazon.Login.setClientId('amzn1.application-oa2-client.aedb066b31c4468388d07a2ca6801a0f');
    };
    (function (d) {
        var a = d.createElement('script');
        a.type = 'text/javascript';
        a.async = true;
        a.id = 'amazon-login-sdk';
        a.src = 'https://assets.loginwithamazon.com/sdk/na/login1.js';
        d.getElementById('amazon-root').appendChild(a);
    })(document);
</script>

<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <a class="navbar-brand" href="/LoginApp">Login App</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
            aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="navbar-collapse collapse w-100 order-3 dual-collapse2">
        <ul class="navbar-nav ml-auto">
            <li class="nav-item active">
                <a class="nav-link" href="/LoginApp/login">Login <span class="sr-only">(current)</span></a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="/LoginApp/register">Register</a>
            </li>
        </ul>
    </div>
</nav>
<div class="d-flex justify-content-center" style="margin-top: 30px">

    <form:form id="loginForm" modelAttribute="login" action="loginProcess" method="post">

        <div class="form-group">
            <c:if test='${message.length()>0}'>
            <div class="row" style="text-align: center">
                <div class="alert alert-danger col-12" role="alert">${message}</div>
            </div>
            </c:if>
            <div class="row">
                <form:label path="username" cssClass="col-6">Username: </form:label>
                <form:input path="username" cssClass="col-6" name="username" id="username"/>
            </div>
        </div>
        <div class="form-group">
            <div class="row">
                <form:label path="password" cssClass="col-6">Password:</form:label>
                <form:password path="password" cssClass="col-6" name="password" id="password"/>
            </div>
        </div>

        <div class="form-group" style="text-align: center">
            <form:button id="login" name="login" class="btn btn-primary">Login</form:button>
        </div>
        <div class="form-group" style="text-align: center">
            <label>or</label>
        </div>
        <div class="form-group" style="text-align: center">
            <a href id="LoginWithAmazon">
                <img border="0" alt="Login with Amazon"
                     src="https://images-na.ssl-images-amazon.com/images/G/01/lwa/btnLWA_gold_156x32.png"
                     width="156" height="32"/>
            </a>
        </div>
    </form:form>
</div>


<script type="text/javascript">
    document.getElementById('LoginWithAmazon').onclick = function () {
        options = {scope: 'profile'};
        amazon.Login.authorize(options,
            'http://localhost:8080/LoginApp/login/amazon');
        return false;
    };
</script>


</body>
</html>