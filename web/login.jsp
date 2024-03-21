<%-- 
    Document   : login
    Created on : Mar 20, 2024, 3:14:05 AM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Login & Registration Form</title>
        <link rel="stylesheet" href="./css/login.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    </head>

    <body>
        
        <% 
            String error = (String) request.getAttribute("ERROR");
            if (error == null) error = "";
        %>
        
        <div class="corner-button">
            <li class="icon-item">
                <a href="./home.jsp" class="icon-link"><i class="fas fa-home"></i></a>
            </li>
        </div>
        <div class="container">
            <input type="checkbox" id="flip">
            <div class="cover">
                <!--Ảnh lật-->
                <div class="front">
                    <img src="./image/login/login.png" alt="">
                </div>
            </div>
            <form action="MainController" method="POST">
                <div class="form-content">
                    <div class="login-form">
                        <div class="title">
                            LOGIN
                        </div>
                        <div style="color: #5A9A8E; font-weight: 600; text-align: center; margin-top: 20px"><h3><%=error%><h3></div> <!--style error here-->
                        <div class="input-boxes">
                            <div class="input-box">
                                <i class="fas fa-envelope"></i>
                                <input type="text" placeholder="Enter your username" name="username"> <!--required here-->
                            </div>
                            <div class="input-box">
                                <i class="fas fa-lock"></i>
                                <input type="password" placeholder="Enter your password" name="password"> <!--required here-->
                            </div>
                            <div class="text">
                                <a href="#">Forgot password?</a>
                            </div>
                           
                            <div class="button input-box">
                                <input type="submit" name="action" value="Login">
                            </div>
                            <div class="text sign-up-text">
                                Don't have an account? <label for="flip">SIGN UP NOW</label>
                            </div>
                        </div>
                    </div>
                    <div class="signup-form">
                        <div class="title">
                            SIGN UP
                        </div>
                        <div class="input-boxes">
                            <div class="input-box">
                                <i class="fas fa-user"></i>
                                <input type="text" placeholder="Enter your username" name="registerUsername"> <!--required here-->
                            </div>
                            <div class="input-box">
                                <i class="fas fa-envelope"></i>
                                <input type="text" placeholder="Enter your email" name="registerEmail"> <!--required here-->
                            </div>
                            <div class="input-box">
                                <i class="fas fa-lock"></i>
                                <input type="password" placeholder="Enter your password" name="registerPassword"> <!--required here-->
                            </div>
                            <div class="input-box radio-gender">
                                <div class="input-gender">
                                    <i class="fas fa-transgender" style="font-size: 24px;"></i>
                                </div>
                                <input type='radio' id='male' checked='checked' name='gender' value="MALE">
                                <label for='male' style="text-decoration: none;">Male</label>
                                <input type='radio' id='female' name='gender' value="FEMALE">
                                <label for='female' style="text-decoration: none;">Female</label>
                            </div>
                            <div class="button input-box">
                                <input type="submit" name="action" value="Register">
                            </div>
                            <div class="text sign-up-text">
                                Already have an account? <label for="flip">LOGIN NOW</label>
                            </div>
                        </div>
                    </div>
                </div>
            </form>
        </div>

    </body>

</html>
