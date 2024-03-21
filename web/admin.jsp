<%-- 
    Document   : admin
    Created on : Mar 20, 2024, 3:14:50 AM
    Author     : ADMIN
--%>

<%@page import="java.util.Base64"%>
<%@page import="model.Product"%>
<%@page import="java.util.List"%>
<%@page import="model.Users"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>VettoGuen's dashboard</title>
        <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
        <link rel="stylesheet" href="./css/admin.css">
    </head>

    <body>
        <%
            Users loginUser = (Users) session.getAttribute("LOGIN_USER");
            if (loginUser == null || !loginUser.getRole().getId().equals("AD")) {
                response.sendRedirect("login.jsp");
                return;
            }
            String message = (String) request.getAttribute("MESSAGE");
            if (message == null) {
                message = "";
            }
        %>
        <div class="sidebar">
            <div class="logo">
                <ul class="menu">
                    <li class="active">
                        <a href="#">
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
                    <li>
                        <a href="./adminManagement.jsp">
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
                        <a href="MainController?action=Logout">
                            <i class='bx bx-log-out' style="font-size: 22px;"></i>
                            <span>
                                Logout
                            </span>
                        </a>
                    </li>
                </ul>
            </div>
        </div>
        <div class="main-content">
            <div class="header-wrapper">
                <div class="header-title">
                    <span>Primary</span>
                    <h2>Dashboard</h2>
                </div>
                <div class="user-info">
                    <div class="search-box">
                        <form action="MainController">
                            <input type="text " placeholder="Search " name="search">
                            <input type="submit" name="action" value="Search">
                        </form>
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
                <h2 class="main-title ">Product</h2>
                <div class="table-container ">
                    <%
                        List<Product> listProduct = (List) request.getAttribute("LIST_PRODUCT");
                        if (listProduct != null) {
                            if (listProduct.size() > 0) {
                    %>
                    <table>
                        <thead>
                            <tr>
                                <th class="Id">ID</th>
                                <th>Name</th>
                                <th><img>Image</th>
                                <th>Description</th>
                                <th>Price</th>
                                <th>Quantity</th>
                                <th>Year</th>
                                <th>Not Sale</th>
                                <th>Edit</th>
                                <th>Delete</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                int count = 1;
                                for (Product product : listProduct) {
                            %>
                            <tr>
                                <td class="Id"><%=product.getId()%></td>
                                <td><%=product.getName()%></td>
                                <td><img src="data:image/png;base64,<%=Base64.getEncoder().encodeToString(product.getImage())%>" style="width: 70px;"></td>
                                <td><%=product.getDescription()%></td>
                                <td><%=product.getPrice()%></td>
                                <td><%=product.getQuantity()%></td>
                                <td><%=product.getYear()%></td>
                                <td><%=product.isNotSale()%></td>
                                <td><button><i class='bx bxs-edit'></i></button></td>
                                <td>
                                    <a href="MainController?action=Delete&id=<%=product.getId()%>">
                                        <button><i class='bx bx-trash' ></i></button>
                                    </a>
                                </td>
                            </tr>
                            <%
                                }
                            %>
                        </tbody>
                    </table>
                    <%
                            }
                        }
                    %>
                    
                </div>
                <div class="form-add ">
                    <div class="form-add-body ">
                        <div class="add " id="add ">
                            <button type="button " onclick="hideShow()">Add product</button>
                        </div>
                        <form id="show" class="show" action="MainController" method="POST" enctype="multipart/form-data">
                            <i class='bx bxs-x-circle' id="close" style="color: #45413E;"></i>
                            <div class="form-content ">
                                <h4 style="color: #45413E;">ADD PRODUCT</h4>

                                <div class="form-input ">
                                    <label for="mobileName ">Product Name:</label>
                                    <input type="text " id="mobileName " name="name" required>
                                </div>

                                <div class="form-input ">
                                    <label for="description ">Description:</label>
                                    <textarea id="description " name="description" rows="4 " required></textarea>
                                </div>

                                <div class="form-input ">
                                    <label for="price ">Price:</label>
                                    <input type="number" step="0.01" id="price " name="price" required>
                                </div>

                                <div class="form-input ">
                                    <label for="yearOfProduction ">Year of Production:</label>
                                    <input type="date" id="yearOfProduction " name="year" required>
                                </div>

                                <div class="form-input ">
                                    <label for="quantity ">Quantity:</label>
                                    <input type="number " id="quantity " name="quantity" required>
                                </div>



                                <div class="form-input ">
                                    <label for="file ">Image:</label>
                                    <div class="file-upload">
                                        <div class="file-select">
                                            <div class="file-select-button" id="fileName">Choose File</div>
                                            <div class="file-select-name" id="noFile">No file chosen...</div>
                                            <input type="file" name="image" id="chooseFile" style="color:red;">
                                        </div>
                                    </div>
                                </div>


                                <div class="check-sale" style="margin-bottom: 0;">
                                    <label for=" notForSale ">Not Sale:</label>
                                    <div class="checkbox-wrapper-31" style="padding-top: 8px; ">
                                        <input type="checkbox" name="notSale" value="true">
                                        <svg viewBox="0 0 35.6 35.6">
                                        <circle class="background" cx="17.8" cy="17.8" r="17.8"></circle>
                                        <circle class="stroke" cx="17.8" cy="17.8" r="14.37"></circle>
                                        <polyline class="check" points="11.78 18.12 15.55 22.23 25.17 12.87"></polyline>
                                        </svg>
                                    </div>
                                </div>
                                <div><%=message%></div>
                                <div class="add_finish ">
                                    <button type="submit" name="action" value="Insert">Add</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>

        <script src="./js/admin.js"></script>

    </body>

</html>
