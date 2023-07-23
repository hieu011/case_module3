<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: LAPTOP
  Date: 7/17/2023
  Time: 3:34 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
    <link rel="stylesheet" href="css/bootstrap.min.css">

    <link rel="stylesheet" href="css/bootstrap-icons.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/11.7.12/sweetalert2.css" integrity="sha512-K0TEY7Pji02TnO4NY04f+IU66vsp8z3ecHoID7y0FSVRJHdlaLp/TkhS5WDL3OygMkVns4bz0/ah4j8M3GgguA=="
          crossorigin="anonymous" referrerpolicy="no-referrer" />

    <style>
        @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@400;500&display=swap');

        *{
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Poppins', sans-serif;
        }

        #register-text {
            color: rgb(255, 255, 255);  /* Màu chữ ban đầu */
        }

        #register-text:hover {
            color: yellow;  /* Màu chữ khi rê chuột vào */
        }

        #message {
            color: red;
        }

        body{
            background: url("/assets/BG1.jpg");
            background-size: cover;
            background-repeat: no-repeat;
            background-attachment: fixed;
            overflow: hidden;
        }
        .wrapper{
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 110vh;
            /* background: rgba(39, 39, 39, 0.4); */
        }
        .nav{
            position: fixed;
            top: 0;
            display: flex;
            justify-content: space-around;
            width: 100%;
            height: 100px;
            line-height: 100px;
            background: linear-gradient(rgba(39,39,39, 0.6), transparent);
            z-index: 100;
        }
        .nav-logo p{
            color: white;
            font-size: 25px;
            font-weight: 600;
        }
        .nav-menu ul{
            display: flex;
        }
        .nav-menu ul li{
            list-style-type: none;
        }
        .nav-menu ul li .link{
            text-decoration: none;
            font-weight: 500;
            color: #fff;
            padding-bottom: 15px;
            margin: 0 25px;
        }
        .link:hover, .active{
            border-bottom: 2px solid #fff;
        }
        .nav-button .btn{
            width: 130px;
            height: 40px;
            font-weight: 500;
            background: rgba(255, 255, 255, 0.4);
            border: none;
            border-radius: 30px;
            cursor: pointer;
            transition: .3s ease;
        }
        .btn:hover{
            background: rgba(255, 255, 255, 0.3);
        }
        #registerBtn{
            margin-left: 15px;
        }
        .btn.white-btn{
            background: rgba(255, 255, 255, 0.7);
        }
        .btn.btn.white-btn:hover{
            background: rgba(255, 255, 255, 0.5);
        }
        .nav-menu-btn{
            display: none;
        }
        .form-box{
            position: relative;
            display: flex;
            align-items: center;
            justify-content: center;
            width: 512px;
            height: 920px;
            overflow: hidden;
            z-index: 2;
            top: -100px;
        }
        .login-container{
            position: absolute;
            left: 4px;
            width: 500px;
            display: flex;
            flex-direction: column;
            transition: .5s ease-in-out;
        }
        .register-container{
            position: absolute;
            right: -520px;
            width: 500px;
            display: flex;
            flex-direction: column;
            transition: .5s ease-in-out;
        }
        .top span{
            color: #fff;
            font-size: normal;
            padding: 10px 0;
            display: flex;
            justify-content: center;
        }
        .top span a{
            font-weight: 500;
            color: #fff;
            margin-left: 5px;
        }
        header{
            color: #fff;
            font-size: 30px;
            text-align: center;
            padding: 10px 0 30px 0;
        }
        .two-forms{
            display: flex;
            gap: 10px;
        }
        .input-field{
            font-size: 15px;
            background: rgba(255, 255, 255, 0.2);
            color: #fff;
            height: 50px;
            width: 100%;
            padding: 0 10px 0 45px;
            border: none;
            border-radius: 30px;
            outline: none;
            transition: .2s ease;
        }
        .input-field:hover, .input-field:focus{
            background: rgba(255, 255, 255, 0.25);
        }
        ::-webkit-input-placeholder{
            color: #fff;
        }
        .input-box i{
            position: relative;
            top: -35px;
            left: 17px;
            color: #fff;
        }
        .submit{
            font-size: 15px;
            font-weight: 500;
            color: black;
            height: 45px;
            width: 100%;
            border: none;
            border-radius: 30px;
            outline: none;
            background: rgba(255, 255, 255, 0.7);
            cursor: pointer;
            transition: .3s ease-in-out;
        }
        .submit:hover{
            background: rgba(255, 255, 255, 0.5);
            box-shadow: 1px 5px 7px 1px rgba(0, 0, 0, 0.2);
        }
        .two-col{
            display: flex;
            justify-content: space-between;
            color: #fff;
            font-size: small;
            margin-top: 10px;
        }
        .two-col .one{
            display: flex;
            gap: 5px;
        }
        .two label a{
            text-decoration: none;
            color: #fff;
        }
        .two label a:hover{
            text-decoration: underline;
        }
        @media only screen and (max-width: 786px){
            .nav-button{
                display: none;
            }
            .nav-menu.responsive{
                top: 100px;
            }
            .nav-menu{
                position: absolute;
                top: -800px;
                display: flex;
                justify-content: center;
                background: rgba(255, 255, 255, 0.2);
                width: 100%;
                height: 90vh;
                backdrop-filter: blur(20px);
                transition: .3s;
            }
            .nav-menu ul{
                flex-direction: column;
                text-align: center;
            }
            .nav-menu-btn{
                display: block;
            }
            .nav-menu-btn i{
                font-size: 25px;
                color: #fff;
                padding: 10px;
                background: rgba(255, 255, 255, 0.2);
                border-radius: 50%;
                cursor: pointer;
                transition: .3s;
            }
            .nav-menu-btn i:hover{
                background: rgba(255, 255, 255, 0.15);
            }
        }
        @media only screen and (max-width: 540px) {
            .wrapper{
                min-height: 100vh;
            }
            .form-box{
                width: 100%;
                height: 500px;
            }
            .register-container, .login-container{
                width: 100%;
                padding: 0 20px;
            }
            .register-container .two-forms{
                flex-direction: column;
                gap: 0;
            }
        }
        #list{
            margin-top: 20px;
        }

    </style>
    <title>Login</title>
</head>
<body>

<div class="wrapper">
    <nav class="nav">
        <div class="nav-button">
            <A href="/login"><button class="btn" id="loginBtn" onclick="login()">Đăng Nhập</button></A>
            <a href="/register"><button class="btn white-btn" id="registerBtn" onclick="register()">Đăng Ký</button></a>
        </div>
        <div class="nav-menu-btn">
            <i class="bx bx-menu" onclick="myMenuFunction()"></i>
        </div>
    </nav>

    <!----------------------------- Form box ----------------------------------->
    <form action="/register" method="post">
        <div class="form-box">

            <!------------------- login form -------------------------->
            <div class="login-container" id="login">
                <div class="top">
                    <span>Đã có tài khoản? <a href="/login" onclick="register()" id="register-text">Đăng nhập ngay!</a></span>
                    <header>Đăng Ký</header>
                </div>
                <div class="input-box">
                    <input type="text" class="input-field" placeholder="Username" name="username" value="${nameinput}">
                    <% session.setAttribute("nameinput", null);%>
                    <i class="bx bx-user"></i>
                    <c:if test="${existUser != null}">
                        <span style="color: darkred">${existUser}</span>
                        <% session.setAttribute("existUser", null);%>
                    </c:if>
                </div>
                <div class="input-box">
                    <input type="password" class="input-field" placeholder="Password" name="password">
                    <i class="bx bx-lock-alt"></i>
                </div>
                <div class="input-box">
                    <input type="password" class="input-field" placeholder="Re_Password" name="re_password">
                    <i class="bx bx-lock-alt"></i>
                    <c:if test="${wrongRepass != null}">
                        <span style="color: darkred">${wrongRepass}</span>
                        <% session.setAttribute("wrongRepass", null);%>
                    </c:if>
                </div>
                <div class="input-box">
                    <input type="submit" class="submit" value="Đăng Ký">
                </div>

                <c:if test="${wrongUsername || wrongPassword != null}">
                    <div class="input-box">
                        <ul class="list-group" id="list">
                            <c:if test="${wrongUsername != null}">
                                <li class="list-group-item list-group-item-danger">${wrongUsername}</li>
                            </c:if>
                            <c:if test="${wrongPassword != null}">
                                <li class="list-group-item list-group-item-danger">${wrongPassword}</li>
                            </c:if>
                        </ul>
                    </div>
                    <% session.setAttribute("wrongUsername", null);%>
                    <% session.setAttribute("wrongPassword", null);%>
                </c:if>

                <div class="two-col">
                    <div class="one">
<%--                        <input type="checkbox" id="login-check">--%>
<%--                        <label for="login-check"> Nhớ thông tin</label>--%>
                    </div>
                    <div class="two">
                        <label><a href="#" onclick="alert('Tính năng này chưa được phát triển :< ')">Điều khoản và quy định?</a></label>
                    </div>
                </div>
            </div>
        </div>
    </form>




    <%--    <!------------------- registration form -------------------------->--%>
    <%--        <div class="register-container" id="register">--%>
    <%--            <div class="top">--%>
    <%--                <span>Đã có tài khoản? <a href="#" onclick="login()" id="register-text">Đăng nhập ngay!</a></span>--%>
    <%--                <header>Đăng Ký</header>--%>
    <%--            </div>--%>
    <%--            <div>--%>
    <%--                <!-- <div class="two-forms"> -->--%>
    <%--                <div class="input-box">--%>
    <%--                    <input type="text" class="input-field" placeholder="Username">--%>
    <%--                    <i class="bx bx-user"></i>--%>
    <%--                </div>--%>
    <%--                <!-- <div class="input-box">--%>
    <%--                    <input type="text" class="input-field" placeholder="Lastname">--%>
    <%--                    <i class="bx bx-user"></i>--%>
    <%--                </div> -->--%>
    <%--            </div>--%>
    <%--            <!-- <div class="input-box">--%>
    <%--                <input type="text" class="input-field" placeholder="Email">--%>
    <%--                <i class="bx bx-envelope"></i>--%>
    <%--            </div> -->--%>
    <%--            <div class="input-box">--%>
    <%--                <input type="password" class="input-field" placeholder="Password">--%>
    <%--                <i class="bx bx-lock-alt"></i>--%>
    <%--            </div>--%>
    <%--            <div class="input-box">--%>
    <%--                <input type="submit" class="submit" value="Đăng ký">--%>
    <%--            </div>--%>
    <%--            <div class="two-col">--%>
    <%--                <div class="one">--%>
    <%--                    <input type="checkbox" id="register-check">--%>
    <%--                    <label for="register-check"> Nhớ thông tin</label>--%>
    <%--                </div>--%>
    <%--                <div class="two">--%>
    <%--                    <label><a href="#" onclick="alert('Tính năng này chưa được phát triển :< ')">Điều khoản & Quy định</a></label>--%>
    <%--                </div>--%>
    <%--            </div>--%>
    <%--        </div>--%>
</div>
</div>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<c:if test="${user != null}">
    <script>
        window.onload = ()=>{
            <%--const user = '${user}';--%>
            <%--if (user && user !== 'null') {--%>
                Swal.fire({
                    icon: 'success',
                    title: 'Bạn đã đăng kí thành công!',
                    showConfirmButton: false,
                    timer: 3000
                });
            // }
        }
    </script>
    <% session.setAttribute("user", null);%>
</c:if>

<script>
    function myMenuFunction() {
        var i = document.getElementById("navMenu");

        if(i.className === "nav-menu") {
            i.className += " responsive";
        } else {
            i.className = "nav-menu";
        }
    }

</script>

<script>
    var a = document.getElementById("loginBtn");
    var b = document.getElementById("registerBtn");
    var x = document.getElementById("login");
    var y = document.getElementById("register");

    function login() {
        x.style.left = "4px";
        y.style.right = "-520px";
        a.className += " white-btn";
        b.className = "btn";
        x.style.opacity = 1;
        y.style.opacity = 0;
    }

    function register() {
        x.style.left = "-510px";
        y.style.right = "5px";
        a.className = "btn";
        b.className += " white-btn";
        x.style.opacity = 0;
        y.style.opacity = 1;
    }
</script>

</body>
</html>
