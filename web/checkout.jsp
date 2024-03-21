<%-- 
    Document   : checkout
    Created on : Mar 20, 2024, 3:14:26 AM
    Author     : ADMIN
--%>

<%@page import="model.Users"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Checkout</title>
        <link rel="stylesheet" href="./css/checkout.css">
    </head>

    <body>
        <%
            Users loginUser = (Users) session.getAttribute("LOGIN_USER");
            if (loginUser == null || !loginUser.getRole().getId().equals("US")) {
                response.sendRedirect("login.jsp");
                return;
            }
        %>
        <div class="container">
            <div class="checkoutLayout">
                <div class="returnCart">
                    <button class="buttonBack"><a href="./login.jsp">Keep shopping</a></button>
                    <h1>List Products In Cart</h1>
                    <div class="list">
                        <div class="item">
                            <img src="./image/product/tv.png">
                            <div class="info">
                                <div class="name">NAME</div>
                                <div class="quantity">1</div>
                                <div class="returnPrice">$50</div>
                            </div>
                        </div>
                        <div class="item">
                            <img src="./image/product/tv.png">
                            <div class="info">
                                <div class="name">NAME</div>
                                <div class="quantity">1</div>
                                <div class="returnPrice">$50</div>
                            </div>
                        </div>
                        <div class="item">
                            <img src="./image/product/tv.png">
                            <div class="info">
                                <div class="name">NAME</div>
                                <div class="quantity">1</div>
                                <div class="returnPrice">$50</div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="right">
                    <h1>CHECKOUT</h1>
                    <div class="form">

                        <div class="group">
                            <label for="">Full Name</label>
                            <input type="text" name="" id="">
                        </div>
                        <div class="group">
                            <label for="">Phone number</label>
                            <input type="text" name="" id="">
                        </div>
                        <div class="group">
                            <label for="">Address</label>
                            <input type="text" name="" id="">
                        </div>

                        <div class="group1">
                            <label for="">Country</label>
                            <select name="" id="">
                                <option value="">Việt Nam</option>
                            </select>
                        </div>
                        <div class="group1">
                            <label for="">City</label>
                            <select name="" id="">
                                <option value="Hà Nội">Hà Nội</option>
                                <option value="TP. Hồ Chí Minh">TP. Hồ Chí Minh</option>
                                <option value="Hải Phòng">Hải Phòng</option>
                                <option value="Cần Thơ">Cần Thơ</option>
                                <option value="Đà Nẵng">Đà Nẵng</option>
                                <option value="Hà Giang">Hà Giang</option>
                                <option value="Cao Bằng">Cao Bằng</option>
                                <option value="Lai Châu">Lai Châu</option>
                                <option value="Lào Cai">Lào Cai</option>
                                <option value="Tuyên Quang">Tuyên Quang</option>
                                <option value="Lạng Sơn">Lạng Sơn</option>
                                <option value="Bắc Kạn">Bắc Kạn</option>
                                <option value="Thái Nguyên">Thái Nguyên</option>
                                <option value="Yên Bái">Yên Bái</option>
                                <option value="Sơn La">Sơn La</option>
                                <option value="Phú Thọ">Phú Thọ</option>
                                <option value="Vĩnh Phúc">Vĩnh Phúc</option>
                                <option value="Quảng Ninh">Quảng Ninh</option>
                                <option value="Bắc Giang">Bắc Giang</option>
                                <option value="Bắc Ninh">Bắc Ninh</option>
                                <option value="Hải Dương">Hải Dương</option>
                                <option value="Hưng Yên">Hưng Yên</option>
                                <option value="Thái Bình">Thái Bình</option>
                                <option value="Hà Nam">Hà Nam</option>
                                <option value="Nam Định">Nam Định</option>
                                <option value="Ninh Bình">Ninh Bình</option>
                                <option value="Thanh Hóa">Thanh Hóa</option>
                                <option value="Nghệ An">Nghệ An</option>
                                <option value="Hà Tĩnh">Hà Tĩnh</option>
                                <option value="Quảng Bình">Quảng Bình</option>
                                <option value="Quảng Trị">Quảng Trị</option>
                                <option value="Thừa Thiên-Huế">Thừa Thiên-Huế</option>
                                <option value="Đắk Lắk">Đắk Lắk</option>
                                <option value="Đắk Nông">Đắk Nông</option>
                                <option value="Gia Lai">Gia Lai</option>
                                <option value="Kon Tum">Kon Tum</option>
                                <option value="Lâm Đồng">Lâm Đồng</option>
                                <option value="Bình Phước">Bình Phước</option>
                                <option value="Bình Dương">Bình Dương</option>
                                <option value="Đồng Nai">Đồng Nai</option>
                                <option value="Tây Ninh">Tây Ninh</option>
                                <option value="Bà Rịa-Vũng Tàu">Bà Rịa-Vũng Tàu</option>
                                <option value="Long An">Long An</option>
                                <option value="Tiền Giang">Tiền Giang</option>
                                <option value="Bến Tre">Bến Tre</option>
                                <option value="Trà Vinh">Trà Vinh</option>
                                <option value="Vĩnh Long">Vĩnh Long</option>
                                <option value="Đồng Tháp">Đồng Tháp</option>
                                <option value="An Giang">An Giang</option>
                                <option value="Kiên Giang">Kiên Giang</option>
                                <option value="Cần Thơ">Cần Thơ</option>
                                <option value="Hậu Giang">Hậu Giang</option>
                                <option value="Sóc Trăng">Sóc Trăng</option>
                                <option value="Bạc Liêu">Bạc Liêu</option>
                                <option value="Cà Mau">Cà Mau</option>
                                <option value="Hòa Bình">Hòa Bình</option>
                                <option value="Tây Ninh">Tây Ninh</option>
                                <option value="Bình Thuận">Bình Thuận</option>
                                <option value="Bình Định">Bình Định</option>
                                <option value="Khánh Hòa">Khánh Hòa</option>
                                <option value="Phú Yên">Phú Yên</option>
                                <option value="Ninh Thuận">Ninh Thuận</option>
                                <option value="Bình Thuận">Bình Thuận</option>
                            </select>
                        </div>
                        <div class="group">
                            <label for="">Note</label>
                            <input type="text" name="" id="">
                        </div>
                    </div>
                    <div class="return">
                        <div class="row">
                            <div>Total Quantity</div>
                            <div class="totalQuantity">60</div>
                        </div>
                        <div class="row">
                            <div>Total Price</div>
                            <div class="totalPrice">$60</div>
                        </div>
                    </div>
                    <button class="buttonCheckout"><!--<a></a>-->CHECKOUT</button>
                </div>
            </div>
        </div>


        <script src="/Home/checkout.js"></script>
    </body>

</html>
