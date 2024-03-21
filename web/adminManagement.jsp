<%-- 
    Document   : adminManagement
    Created on : Mar 20, 2024, 3:15:11 AM
    Author     : ADMIN
--%>

<%@page import="model.Users"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>VettoGuen's dashboard</title>
        <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
        <link rel="stylesheet" href="./css/adminManagement.css">
    </head>

    <body>
        <%
            Users loginUser = (Users) session.getAttribute("LOGIN_USER");
            if (loginUser == null || !loginUser.getRole().getId().equals("AD")) {
                response.sendRedirect("login.jsp");
                return;
            }
        %>
        <div class="sidebar">
            <div class="logo">
                <ul class="menu">
                    <li>
                        <a href="./admin.jsp">
                            <i class='bx bxs-dashboard' style="font-size: 22px;"></i>
                            <span>Dashboard</span>
                        </a>
                    </li>
                    <li>
                        <a href="#">
                            <i class='bx bx-cart' style="font-size: 22px;"></i>
                            <span>Order</span>
                        </a>
                    </li>
                    <li>
                        <a href="#">
                            <i class='bx bx-envelope' style="font-size: 22px;"></i>
                            <span>Email</span>
                        </a>
                    </li>
                    <li class="active">
                        <a href="#">
                            <i class='bx bx-user-circle' style="font-size: 22px;"></i>
                            <span>Staff</span>
                        </a>
                    </li>
                    <li>
                        <a href="#">
                            <i class='bx bx-cog' style="font-size: 22px;"></i>
                            <span>Setting</span>
                        </a>
                    </li>
                    <li>
                        <a href="#">
                            <i class='bx bx-message-rounded-dots' style="font-size: 22px;"></i>
                            <span>Messenger</span>
                        </a>
                    </li>
                    <li>
                        <a href="#">
                            <i class='bx bxs-spreadsheet' style="font-size: 22px;"></i>
                            <span class="links_name">Timesheet</span>
                        </a>
                    </li>

                    <li>
                        <a href="./login.jsp">
                            <i class='bx bx-log-out' style="font-size: 22px;"></i>
                            <span>Logout</span>
                        </a>
                    </li>
                </ul>
            </div>
        </div>
        <div class="main-content">
            <div class="header-wrapper">
                <div class="header-title">
                    <span>Primary</span>
                    <h2>User Management</h2>
                </div>
                <div class="user-info">
                    <div class="search-box">

                        <input type="text " placeholder="Search ">
                    </div>
                    <img src="./image/avt/avt-1.png ">
                </div>
            </div>
            <div class="card-container ">
                <h2 class="main-title ">Today's data</h2>
                <div class="card-wrapper ">
                    <div class="payment-card light-brown ">
                        <div class="card-header ">
                            <div class="amount ">
                                <span class="title1 ">
                                    Sales revenue
                                </span>
                                <span class="amount-value1 ">$10.000</span>
                            </div>
                            <i class='bx bx-dollar icon1 circle-box'></i>
                        </div>
                        <span class="card-detail1 ">**** **** **** 2003</span>
                    </div>

                    <div class="payment-card light-green ">
                        <div class="card-header ">
                            <div class="amount ">
                                <span class="title ">
                                    Online traffic 
                                </span>
                                <span class="amount-value ">500</span>
                            </div>
                            <i class='bx bx-group circle-box icon3'></i>
                        </div>
                        <span class="card-detail ">**** **** **** 2003</span>
                    </div>
                    <div class="payment-card light-pink ">
                        <div class="card-header ">
                            <div class="amount ">
                                <span class="title1 " sty>
                                    Number of completed orders
                                </span>
                                <span class="amount-value1 ">50</span>
                            </div>
                            <i class='bx bx-check circle-box icon4'></i>
                        </div>
                        <span class="card-detail1 ">**** **** **** 2003</span>
                    </div>
                    <div class="payment-card light-yellow ">
                        <div class="card-header ">
                            <div class="amount ">
                                <span class="title ">
                                    Operating expenses 
                                </span>
                                <span class="amount-value ">$2.000</span>
                            </div>
                            <i class='bx bx-list-ul circle-box icon2'></i>
                        </div>
                        <span class="card-detail ">**** **** **** 2003</span>
                    </div>
                </div>
            </div>
            <div class="tabular-wrapper ">
                <h2 class="main-title ">User Information</h2>
                <div class="table-container ">
                    <table>
                        <thead>
                            <tr>
                                <th class="Id">ID</th>
                                <th><img>Image</th>
                                <th>Full Name</th>
                                <th>Email</th>
                                <th>Role ID</th>
                                <th>Password</th>
                                <th>Edit</th>
                                <th>Delete</th>
                            </tr>

                        <tbody>
                            <tr>
                                <td class="Id">1</td>
                                <td><img src="./image/avt/avt-6.png" style="width: 50px;"></td>
                                <td>Ngô Việt Tiến</td>
                                <td>viettien1602@gmail.com</td>
                                <td>US</td>
                                <td>*********</td>
                                <td><button><i class='bx bxs-edit'></i></button></td>
                                <td><button><i class='bx bx-trash' ></i></button></td>
                            </tr>
                            <tr>
                                <td class="Id">2</td>
                                <td><img src="./image/avt/avt-4.png" style="width: 50px;"></td>
                                <td>Trần Nguyễn Như Nguyên</td>
                                <td>tnnn0320@gmail.com</td>
                                <td>AD</td>
                                <td>*********</td>
                                <td><button><i class='bx bxs-edit'></i></button></td>
                                <td><button><i class='bx bx-trash' ></i></button></td>
                            </tr>
                            <tr>
                                <td class="Id">3</td>
                                <td><img src="./image/avt/avt-2.png" style="width: 50px;"></td>
                                <td>Đúi Ngô</td>
                                <td>duibietbay1907@gmail.com</td>
                                <td>AD</td>
                                <td>*********</td>
                                <td><button><i class='bx bxs-edit'></i></button></td>
                                <td><button><i class='bx bx-trash' ></i></button></td>
                            </tr>
                            <tr>
                                <td class="Id">4</td>
                                <td><img src="./image/avt/avt-9.png" style="width: 50px;"></td>
                                <td>Nấm Đầu Đỏ</td>
                                <td>nambietnamdau10@gmail.com</td>
                                <td>AD</td>
                                <td>*********</td>
                                <td><button><i class='bx bxs-edit'></i></button></td>
                                <td><button><i class='bx bx-trash' ></i></button></td>
                            </tr>
                            <tr>
                                <td class="Id">5</td>
                                <td><img src="./image/avt/avt-3.png" style="width: 50px;"></td>
                                <td>Thuốc Đẹp Trai</td>
                                <td>thuocdaudauu@gmail.com</td>
                                <td>US</td>
                                <td>*********</td>
                                <td><button><i class='bx bxs-edit'></i></button></td>
                                <td><button><i class='bx bx-trash' ></i></button></td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>

    </body>

</html>
