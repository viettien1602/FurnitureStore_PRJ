<%-- 
    Document   : admin
    Created on : Mar 20, 2024, 3:14:50 AM
    Author     : ADMIN
--%>

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
                    <a href="#">
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
                <h2>Dashboard</h2>
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
            <h2 class="main-title ">Product</h2>
            <div class="table-container ">
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

                        <tbody>
                            <tr>
                                <td class="Id">000001</td>
                                <td>Sofa</td>
                                <td><img src="./image/product/sofa.png" style="width: 70px;"></td>
                                <td>An essential item for your wonderful life.</td>
                                <td>$2000</td>
                                <td>20</td>
                                <td>2024-03-01</td>
                                <td>0</td>
                                <td><button><i class='bx bxs-edit'></i></button></td>
                                <td><button><i class='bx bx-trash' ></i></button></td>
                            </tr>
                            <tr>
                                <td class="Id">000002</td>
                                <td>Microwave oven</td>
                                <td><img src="./image/product/microwaveoven.png" style="width: 70px;"></td>
                                <td>An essential item for your wonderful life.</td>
                                <td>$500</td>
                                <td>24</td>
                                <td>2024-03-01</td>
                                <td>0</td>
                                <td><button><i class='bx bxs-edit'></i></button></td>
                                <td><button><i class='bx bx-trash' ></i></button></td>
                            </tr>
                            <tr>

                                <td class="Id">000003</td>
                                <td>Bed</td>
                                <td><img src="./image/product/bed.png" style="width: 70px;"></td>
                                <td>An essential item for your wonderful life.</td>
                                <td>$2000</td>
                                <td>31</td>
                                <td>2024-03-01</td>
                                <td>0</td>
                                <td><button><i class='bx bxs-edit'></i></button></td>
                                <td><button><i class='bx bx-trash' ></i></button></td>
                            </tr>
                            <tr>

                                <td class="Id">000004</td>
                                <td>Classic television</td>
                                <td><img src="./image/product/tv.png" style="width: 70px;"></td>
                                <td>An essential item for your wonderful life.</td>
                                <td>$1000</td>
                                <td>16</td>
                                <td>2024-03-01</td>
                                <td>0</td>
                                <td><button><i class='bx bxs-edit'></i></button></td>
                                <td><button><i class='bx bx-trash' ></i></button></td>
                            </tr>
                            <tr>

                                <td class="Id">000005</td>
                                <td>Dishwasher</td>
                                <td><img src="./image/product/dishwasher.png" style="width: 70px;"></td>
                                <td>An essential item for your wonderful life.</td>
                                <td>$1000</td>
                                <td>04</td>
                                <td>2024-03-01</td>
                                <td>0</td>
                                <td><button><i class='bx bxs-edit'></i></button></td>
                                <td><button><i class='bx bx-trash' ></i></button></td>
                            </tr>
                            <tr>

                                <td class="Id">000006</td>
                                <td>Refrigerator</td>
                                <td><img src="./image/product/fridge.png" style="width: 70px;"></td>
                                <td>An essential item for your wonderful life.</td>
                                <td>$3000</td>
                                <td>20</td>
                                <td>2024-03-01</td>
                                <td>0</td>
                                <td><button><i class='bx bxs-edit'></i></button></td>
                                <td><button><i class='bx bx-trash' ></i></button></td>
                            </tr>
                            <tr>

                                <td class="Id">000007</td>
                                <td>Toilet</td>
                                <td><img src="./image/product/toilet.png" style="width: 70px;"></td>
                                <td>An essential item for your wonderful life.</td>
                                <td>$500</td>
                                <td>18</td>
                                <td>2024-03-01</td>
                                <td>0</td>
                                <td><button><i class='bx bxs-edit'></i></button></td>
                                <td><button><i class='bx bx-trash' ></i></button></td>
                            </tr>
                            <tr>

                                <td class="Id">000008</td>
                                <td>Washing machine</td>
                                <td><img src="./image/product/washingmachine.png" style="width: 70px;"></td>
                                <td>An essential item for your wonderful life.</td>
                                <td>$1500</td>
                                <td>13</td>
                                <td>2024-03-01</td>
                                <td>0</td>
                                <td><button><i class='bx bxs-edit'></i></button></td>
                                <td><button><i class='bx bx-trash' ></i></button></td>
                            </tr>


                        </tbody>
                </table>
            </div>
            <div class="form-add ">
                <div class="form-add-body ">
                    <div class="add " id="add ">
                        <button type="button " onclick="hideShow() ">Add product</button>
                    </div>
                    <form id="show" class="show">
                        <i class='bx bxs-x-circle' id="close" style="color: #45413E;"></i>
                        <div class="form-content ">
                            <h4 style="color: #45413E;">ADD PRODUCT</h4>

                            <div class="form-input ">
                                <label for="mobileId ">Product ID:</label>
                                <input type="text " id="mobileId " name="mobileId " required>
                            </div>

                            <div class="form-input ">
                                <label for="mobileName ">Product Name:</label>
                                <input type="text " id="mobileName " name="mobileName " required>
                            </div>

                            <div class="form-input ">
                                <label for="description ">Description:</label>
                                <textarea id="description " name="description " rows="4 " required></textarea>
                            </div>

                            <div class="form-input ">
                                <label for="price ">Price:</label>
                                <input type="number " id="price " name="price " required>
                            </div>

                            <div class="form-input ">
                                <label for="yearOfProduction ">Quantity:</label>
                                <input type="number " id="yearOfProduction " name="yearOfProduction " required>
                            </div>

                            <div class="form-input ">
                                <label for="quantity ">Year of Production:</label>
                                <input type="number " id="quantity " name="quantity " required>
                            </div>



                            <div class="form-input ">
                                <label for="file ">Image:</label>
                                <div class="file-upload">
                                    <div class="file-select">
                                        <div class="file-select-button" id="fileName">Choose File</div>
                                        <div class="file-select-name" id="noFile">No file chosen...</div>
                                        <input type="file" name="chooseFile" id="chooseFile" style="color:red;">
                                    </div>
                                </div>
                            </div>


                            <div class="check-sale" style="margin-bottom: 0;">
                                <label for=" notForSale ">Not Sale:</label>
                                <div class="checkbox-wrapper-31" style="padding-top: 8px; ">
                                    <input type="checkbox">
                                    <svg viewBox="0 0 35.6 35.6">
                                      <circle class="background" cx="17.8" cy="17.8" r="17.8"></circle>
                                      <circle class="stroke" cx="17.8" cy="17.8" r="14.37"></circle>
                                      <polyline class="check" points="11.78 18.12 15.55 22.23 25.17 12.87"></polyline>
                                    </svg>
                                </div>
                            </div>



                            <div class="add_finish ">
                                <button type="button ">Add</button>
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
