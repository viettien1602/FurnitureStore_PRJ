<%-- 
    Document   : home
    Created on : Mar 20, 2024, 3:13:47 AM
    Author     : ADMIN
--%>

<%@page import="model.ProductInCart"%>
<%@page import="model.Cart"%>
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
        <title>VettoGuen's Décor</title>
        <link rel="stylesheet" href="./css/home.css">
        <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>

    </head>

    <body>
        <%
            Users loginUser = (Users) session.getAttribute("LOGIN_USER");
            if (loginUser != null && loginUser.getRole().getId().equals("AD")) {
                response.sendRedirect("admin.jsp");
                return;
            }
        %>
        <div class="container">
            <header>
                <nav>
                    <div id="logo">
                        <img src="./image/session/houselogodonee.png" style="height: 50px; width: 60px;"> VettoGuen's <br> Décor
                    </div>
                    <ul class="navigation-menu">
                        <li><a href="#products">Products</a></li>
                        <li><a href="#services">Services</a></li>
                        <li><a href="#locate">Locations &amp; Hours</a></li>
                        <li><a href="#about">About Us</a></li>
                    </ul>
                    <div id="utility">
                        <i class='bx bx-search-alt' id="search-icon" style="font-size: 24px;"></i>
                        <div class="icon-cart">
                            <i class='bx bx-cart-alt' id="cart" style="font-size: 24px; padding-left: 10px;"></i>
                        </div>
                        <%
                            if (loginUser == null) {
                        %>
                        <div class="corner-button">
                            <li class="icon-item">
                                <a href="./login.jsp" class="icon-link"><i class='bx bx-log-in-circle'></i></a>
                            </li>
                        </div>
                        <%
                        } else {
                        %>
                        <div class="dropdown">
                            <img class="dropbtn" src="./image/avt/avt-11.png">
                            <div class="dropdown-content">
                                <a href="MainController?action=Logout">Log out</a>
                            </div>
                        </div>
                        <%
                            }
                        %>

                    </div>
                    <!--Search box-->
                    <div class="search-box">
                        <input type="search" name="" id="" placeholder="Search here ...">
                    </div>

                    <%
                        String cartMessage = (String) request.getAttribute("CART_MESSAGE");
                        if (cartMessage == null) {
                            cartMessage = "";
                        }
                    %>
                    <div class="cartTab">
                        <h3>Shopping Cart</h3>
                        <div class="list">
                            <div class="listCart">
                                <%
                                    Cart cart = (Cart) session.getAttribute("CART");
                                    if (cart != null) {
                                        if (!cart.getCart().isEmpty()) {
                                            int count = 1;
                                            for (int key : cart.getCart().keySet()) {
                                                ProductInCart productInCart = cart.getCart().get(key);
                                                Product product = productInCart.getProduct();
                                %>
                                <div class="itemCart">
                                    <div class="imageCart">
                                        <img src="data:image/png;base64,<%=Base64.getEncoder().encodeToString(product.getImage())%>">
                                    </div>
                                    <div class="name">
                                        <%=product.getName()%>
                                    </div>
                                    <div class="totalPrice">
                                        <%=product.getPrice() * productInCart.getQuantity()%>$
                                    </div>
                                    <div class="quantity ">
                                        <span class="decrease-btn">-</span>
                                        <span><%=productInCart.getQuantity()%></span>
                                        <span class="increase-btn">+</span>
                                    </div>
                                    <div>
                                        <button class="btn btn-danger" style="padding: 5px;">
                                            <a href="MainController?action=RemoveFromCart&id=<%=product.getId()%>"><i class='bx bxs-trash'></i></a>
                                        </button>
                                    </div>
                                </div>
                                <%
                                            }
                                        }
                                    }
                                %>
                            </div>
                        </div>
                        <div class="btnCart ">
                            <button class="close" id="close" style="border-radius: 0; border: none; ">CLOSE</button>
                            <button class="checkout" style="border-radius: 0; border: none; "><a href="./checkout.jsp">CHECK OUT</a></button>
                        </div>
                    </div>


                </nav>
            </header>
            <section class="hero" style=" padding-top: 0;">
                <h1>Furnishing Dreams, transforming Houses into Homes!</h1>
                <div class="btn-group">
                    <button class="btn-filled-dark" onclick="window.location.href = '#products'"><i class='bx bx-cart-alt' style="font-size: 18px;" ></i>All Products</button>
                    <button class="btn-outline-dark btn-hover-color" onclick="window.location.href = '#footer'"><i class='bx bx-phone-call' style="font-size: 17px;"></i> Contact us</button>
                </div>

            </section>
            <section id="about" class="about">
                <div class="about-img">
                    <img src="./image/session/about.png" alt="">
                </div>
                <div class="about-text">
                    <h2>Our History</h2>
                    <p>VettoGuen's Décor emerges from a vision fueled by passion and purpose. Our journey begins with a simple desire to redefine living spaces, crafting havens of warmth and convenience for our patrons. From inception to realization, every step
                        is guided by an unwavering commitment to excellence, from sourcing premium materials to meticulous craftsmanship. With each piece curated and every corner adorned, we strive to transcend the ordinary, infusing every space with a touch
                        of elegance and comfort.
                    </p>
                    <p>Join us on this transformative journey as we shape not just homes, but lifestyles, one beautifully designed space at a time. Welcome to VettoGuen's Décor, where every visit promises to inspire and elevate your living experience.</p>

                </div>

            </section>
            <section>
                <h2>Living Space</h2>

                <ul class="shops">
                    <li class="card-large card-light" id="sup-bed">
                        <div class="card-image"><img src="./image/session/bedroom.png" style="height: 100%; width: 100%;"></div>
                        <ul>
                            Bedroom
                            <li><a href="#">Bed</a></li>
                            <li><a href="#">Wardrobe</a></li>
                            <li><a href="#">Bedside lamp</a></li>
                            <li><a href="#">Bookshelf</a></li>
                            <li><a href="#">Other</a></li>

                            <button class="btn-outline-light" onclick="window.location.href = '#products'">All Products<i class='bx bx-right-arrow-alt'></i></button>

                        </ul>


                    </li>

                    <li class="card-large card-dark" id="sup-kit">
                        <div class="card-image"><img src="./image/session/kitchen.png" style="height: 100%; width: 100%;"></div>
                        <ul>Kitchen
                            <li><a href="#">Dining table</a></li>
                            <li><a href="#">Oven</a></li>
                            <li><a href="#">Refrigerator</a></li>
                            <li><a href="#">Stove</a></li>
                            <li><a href="#">Other</a></li>
                            <button class="btn-outline-dark" onclick="window.location.href = '#products'">All Products<i class='bx bx-right-arrow-alt'></i></button>
                        </ul>

                    </li>

                    <li class="card-large card-dark" id="sup-liv">
                        <div class="card-image"><img src="./image/session/livingroom.png" style="height: 100%; width: 100%;"> </div>
                        <ul>Living room
                            <li><a href="#">Sofa</a></li>
                            <li><a href="#">Tea table</a></li>
                            <li><a href="#">TV</a></li>
                            <li><a href="#">Rug</a></li>
                            <li><a href="#">Other</a></li>
                            <button class="btn-outline-dark" onclick="window.location.href = '#products'">All Products<i class='bx bx-right-arrow-alt'></i></button>
                        </ul>

                    </li>
                    <li class="card-large card-light" id="sup-bath">
                        <div class="card-image"><img src="./image/session/bathroomdone.png" style="height: 100%; width: 250px;"></div>
                        <ul>
                            Bathroom
                            <li><a href="#">Bathtub</a></li>
                            <li><a href="#">Shower</a></li>
                            <li><a href="#">Toilet</a></li>
                            <li><a href="#">Sink</a></li>
                            <li><a href="#">Other</a></li>
                            <button class="btn-outline-light" onclick="window.location.href = '#products'">All Products<i class='bx bx-right-arrow-alt'></i></button>
                        </ul>

                    </li>
                </ul>
            </section>

            <section id="services">
                <h2>Our Services</h2>
                <ul class="services">
                    <li class="card-large card-dark card-wide" id="serv-groom">
                        <div class="card-image"><img src="./image/session/InteriorDesignConsultationdone.png"></div>
                        <ul>
                            Interior Design Consultation<span class="subtitle">Gathering detailed information about customers' living spaces, needs, and design goals through consultations.</span>
                            <li>
                                <a href="#">Space-appropriate design</a><span>$80</span></li>
                            <li>
                                <a href="#">Customized design</a><span>$16</span></li>
                            <li>
                                <a href="#">Tailored design to meet customer requirements
                                </a><span>$160</span></li>
                            <button class="btn-filled-dark" onclick="window.location.href = '#footer'"><i class='bx bx-phone-call' style="font-size: 17px;"></i>Contact us</button>

                        </ul>


                    </li>
                    <li class="card-large card-dark card-wide" id="serv-board">
                        <div class="card-image"><img src="./image/session/CustomizationofProducts.png"></div>
                        <ul>
                            Customization of Products<span class="subtitle">
                                Supporting customers in customizing any product according to their requests.</span>
                            <li>
                                <a href="#">Customizing materials</a><span>$80</span></li>
                            <li>
                                <a href="#">Customizing styles</a><span>$80</span></li>
                            <li>
                                <a href="#">Designing according to requirements</a><span>$200</span></li>
                            <button class="btn-filled-dark" onclick="window.location.href = '#footer'"><i class='bx bx-phone-call' style="font-size: 17px;"></i>Contact us</button>
                        </ul>

                    </li>

                </ul>
                <ul class="services">
                    <li class="card-large card-dark card-wide" id="serv-board">
                        <div class="card-image"><img src="./image/session/InstallationandDelivery.png"></div>
                        <ul>
                            Installation and Delivery<span class="subtitle">Tail-wagging transformations are our specialty.</span>
                            <li><a href="#">Inner-city delivery</a><span>$20</span></li>
                            <li><a href="#">Professional installation</a><span>$0</span></li>
                            <li><a href="#">Scheduling delivery to other provinces</a><span>$80</span></li>
                            <button class="btn-filled-dark" onclick="window.location.href = '#footer'"><i class='bx bx-phone-call' style="font-size: 17px;"></i>Contact us</button>

                        </ul>


                    </li>
                    <li class="card-large card-dark card-wide" id="serv-groom">
                        <div class="card-image"><img src="./image/session/MaintenanceandRepair.png"></div>
                        <ul>
                            Maintenance and Repair<span class="subtitle">Where fun and care never take a day off.</span>
                            <li><a href="#">Regular maintenance service</a><span>$60</span></li>
                            <li><a href="#">Repair</a><span>$100</span></li>
                            <li><a href="#">6-month warranty</a><span>$0</span></li>
                            <button class="btn-filled-dark" onclick="window.location.href = '#footer'"><i class='bx bx-phone-call' style="font-size: 17px;"></i>Contact us</button>
                        </ul>

                    </li>

                </ul>
            </section>
            <!--PRODUCT-->
            <div id="popup" class="popup-container popup-style">
                <div class="popup-content">
                    <a href="#products" class="close">&times;</a>
                    <h3>Notification:</h3>
                    <p><%=cartMessage%></p>
                </div>
            </div>

            <section class="product" id="products">
                <h2>Our Products</h2>
                <div class="listProduct">
                    <%
                        List<Product> listProduct = (List) request.getAttribute("LIST_PRODUCT");
                        if (listProduct != null) {
                            if (listProduct.size() > 0) {
                                int count = 1;
                                for (Product product : listProduct) {
                    %>
                    <div class="item">
                        <img src="data:image/png;base64,<%=Base64.getEncoder().encodeToString(product.getImage())%>">
                        <h4 class="item-name"><%=product.getName()%></h4>
                        <div class="price">$<%=(int) product.getPrice()%></div>
                        <form action="MainController" method="POST">
                            <div class="value-button" id="decrease"><span>-</span></div>
                            <input type="number" id="number" name="quantity" value="0" />
                            <div class="value-button" id="increase"><span>+</span></div>
                            <input type="hidden" name="id" value="<%=product.getId()%>" />
                            <button class="addCart" type="submit" name="action" value="AddToCart" style="margin-left: 35px;">
                                Add To Cart
                            </button>
                        </form>
                    </div>
                    <%
                                }
                            }
                        }
                    %>

                </div>
            </section>
            <section class="customers" id="customers">
                <div class="heading">
                    <h2>OUR CUSTOMER'S</h2>
                </div>
                <div class="customers-container">
                    <div class="box">
                        <div class="stars">
                            <i class='bx bxs-star'></i>
                            <i class='bx bxs-star'></i>
                            <i class='bx bxs-star'></i>
                            <i class='bx bxs-star'></i>
                            <i class='bx bxs-star-half'></i>
                        </div>
                        <p>Absolutely love the sofa I got from your store! It's stylish, comfy, and exactly what I was looking for. Thanks for the great product!</p>
                        <h3>Michael Smith</h3>
                        <img src="./image/avt/avt-7.png">
                    </div>
                    <div class="box">
                        <div class="stars">
                            <i class='bx bxs-star'></i>
                            <i class='bx bxs-star'></i>
                            <i class='bx bxs-star'></i>
                            <i class='bx bxs-star'></i>
                            <i class='bx bxs-star'></i>
                        </div>
                        <p>Thrilled with the fridge I bought from your store! It's sleek, spacious, and keeps everything perfectly chilled. Thanks for the top-notch appliance!</p>
                        <h3>Olivia Williams</h3>
                        <img src="./image/avt/avt-3.png">
                    </div>
                    <div class="box">
                        <div class="stars">
                            <i class='bx bxs-star'></i>
                            <i class='bx bxs-star'></i>
                            <i class='bx bxs-star'></i>
                            <i class='bx bxs-star'></i>
                            <i class='bx bxs-star'></i>
                        </div>
                        <p>Couldn't be happier with the dishwasher I purchased! It's efficient, quiet, and leaves my dishes sparkling clean every time. Thanks for such a fantastic product!</p>
                        <h3>Emily Johnson</h3>
                        <img src="./image/avt/avt-4.png">
                    </div>
                </div>
            </section>
            <section id="locate">

                <div>
                    <h2>Location &amp; Hours</h2>
                    <p>Our knowledgeable and friendly staff is always ready to assist you in making the best choices for your living space. <br> Opening hours: <strong>8:00am - 10:30pm</strong> <br>We are pleased to welcome you!</p>
                    <div class="btn-group">
                        <button class="btn-filled-dark" onclick="window.location.href = '#footer'"><i class='bx bx-buildings' style="font-size: 17px;"></i>Find a Store</button>
                        <button class="btn-outline-dark btn-hover-color" onclick="window.location.href = '#footer'"><i class='bx bx-phone-call' style="font-size: 17px;"></i> Contact us</button>
                    </div>
                </div>
            </section>




            <footer id="footer">
                <svg class="footer-wave-svg " xmlns="http://www.w3.org/2000/svg " viewBox="0 0 1200 100 " preserveAspectRatio="none ">
                <path class="footer-wave-path " d="M851.8,100c125,0,288.3-45,348.2-64V0H0v44c3.7-1,7.3-1.9,11-2.9C80.7,22,151.7,10.8,223.5,6.3C276.7,2.9,330,4,383,9.8 c52.2,5.7,103.3,16.2,153.4,32.8C623.9,71.3,726.8,100,851.8,100z "></path>
                </svg>

                <ul class="f-left">
                    Our Company
                    <li><a href="#products">Products</a></li>
                    <li><a href="#services">Services</a></li>
                    <li><a href="#locate">Locations &amp; Hours</a></li>
                    <li><a href="#about">About us</a></li>

                </ul>

                <ul class="f-center">
                    <span style="padding-left: 42px;">Our Store</span>
                    <div class="footer-center">
                        <div>
                            <i class='bx bx-location-plus'></i>
                            <span>13/1 Street No. 20, Hiep Binh Chanh, Thu Duc</span>
                        </div>

                        <div>
                            <i class='bx bx-location-plus'></i>
                            <span>47G Hoa Lan, Ward 2, Phú Nhuận District</span>
                        </div>

                        <div>
                            <i class='bx bx-location-plus'></i>
                            <span>154 Thành Thái, Ward 12, District 10 </span>
                        </div>

                        <div>
                            <i class='bx bx-location-plus'></i>
                            <span>307 Hồng Bàng, Ward 11, District 5 </span>
                        </div>

                        <div>
                            <i class='bx bx-phone'></i><span> +84865181979 </span>
                        </div>

                        <div>
                            <i class='bx bx-envelope'></i>
                            <span><a href="mailto:tnnn0320@gmail.com">tnnn0320@gmail.com</a></span>
                        </div>
                    </div>
                </ul>

                <ul class="f-right">
                    <span style="padding-left: 7px;">Follow us</span>
                    <div class="social-links">
                        <a href="#" class="facebook"><i class='bx bxl-facebook'></i></a>
                        <a href="#" class="twitter"><i class='bx bxl-twitter'></i></i></a>
                        <a href="#" class="instagram"><i class='bx bxl-instagram'></i></a>
                        <a href="#" class="tiktok"><i class='bx bxl-tiktok'></i></i></a>
                    </div>
                </ul>
            </footer>
            <div class="copy">&copy;<span id="year"> </span><span> VettoGuen's Décor. All rights reserved.</span></div>
        </div>

        <script src="./js/home.js"></script>

    </body>

</html>
