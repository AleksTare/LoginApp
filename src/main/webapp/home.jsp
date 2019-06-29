<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
    <title>LOGIN APP</title>

    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
            integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
            crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
            integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
            crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
            integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
            crossorigin="anonymous"></script>
    <style>

        h1 {
            color: white;
            padding-left: 10px;
        }

        /* generic css */

        .view {
            float: left;
            overflow: hidden;
            position: relative;
            text-align: center;
            box-shadow: 1px 1px 2px #e6e6e6;
            cursor: default;

        }

        .view .mask{
            width: 100%;
            height: 100%;
            position: absolute;
            overflow: hidden;
            top: 0;
            left: 0
        }
        .view .content {
            width: 100%;
            height: 50%;
            position: absolute;
            overflow: hidden;
            top: 0;
            left: 0
        }


        .view img {
            display: inline;
            position: relative
        }

        .view h2 {
            text-transform: uppercase;
            color: #fff;
            text-align: center;
            position: relative;
            font-size: 28px;
            padding: 10px;
            /*background: rgba(0, 0, 0, 0.8);*/
            margin: 20px 0 0 0
        }

        .view p {
            font-style: italic;
            font-size: 24px;
            position: relative;
            color: #fff;
            padding: 0px 20px 0px;
            text-align: center
        }

        .view a.info {
            display: inline;
            text-decoration: none;
            padding: 7px 14px;
            background: #000;
            color: #fff;
            text-transform: uppercase;
            box-shadow: 0 0 1px #000
        }

        .view a.info:hover {
            box-shadow: 0 0 5px #000
        }
        .view-first img {
            transition: all 0.2s linear;
            height: 100%;
        }

        .view-first .mask {
            opacity: 0;
            background-color: rgba(58, 1, 132, 0.44);
            transition: all 0.4s ease-in-out;
        }

        .view-first h2 {
            margin: 0;
            position: relative;
            top: 40%;
            transform: translateY(-100px);
            opacity: 0;
            font-size: 16pt;
            transition: all 0.2s ease-in-out;
        }

        .view-first p {
            margin: 0;
            position: relative;
            top: 43%;
            transform: translateY(100px);
            opacity: 0;
            font-size: 14pt;
            transition: all 0.2s linear;
        }

        .view-first a.info {
            opacity: 0;
            transition: all 0.2s ease-in-out;
        }


        /* */

        .view-first:hover img {
            transform: scale(1.1);
        }

        .view-first:hover .mask {
            opacity: 1;
        }

        .view-first:hover h2,
        .view-first:hover p,
        .view-first:hover a.info {
            opacity: 1;
            transform: translateY(0px);
        }

        .view-first:hover p {
            transition-delay: 0.1s;
        }

        .view-first:hover a.info {
            transition-delay: 0.2s;
        }
    </style>

</head>
<body>
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <a class="navbar-brand" href="/LoginApp">Login App</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
            aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="navbar-collapse collapse w-100 order-3 dual-collapse2">
        <ul class="navbar-nav ml-auto">
            <li class="nav-item">
                <a class="nav-link" href="/LoginApp/login">Login</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="/LoginApp/register">Register <span class="sr-only">(current)</span></a>
            </li>
        </ul>
    </div>
</nav>
<div class="container-fluid">
    <div class="row">
        <div class="view view-first col-md-6" style="padding: 0">
            <a href="register">
                <img src="https://www.glenstone.org/wp-content/uploads/prod/2018/07/AV_Landscape-Hero-Contour-2993-1276x800.jpg" alt=""/>
                <div class="mask">
                    <h2 style="text-align: center">Register</h2>
                    <p style="text-align: center">Don't have an account yet? Sign up here</p>
                </div>
            </a>
        </div>


        <div class="view view-first col-md-6" style="padding: 0">
            <a href="login">
                <img src="https://i.ytimg.com/vi/BfCwN4iy6T8/maxresdefault.jpg" alt=""/>
                <div class="mask">
                    <h2 style="text-align: center">Login</h2>
                    <p style="text-align: center">Login with your existing account or use your Amazon account</p>
                </div>
            </a>
        </div>
    </div>
</div>
</body>
</html>