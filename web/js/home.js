/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

let search = document.querySelector('.search-box');
document.querySelector('#search-icon').onclick = () => {
    search.classList.toggle('active');
};

let cart = document.querySelector('.cartTab');
document.querySelector('#cart').onclick = () => {
    cart.classList.toggle('active');
};

let close = document.querySelector('.close');
document.querySelector('#close').onclick = () => {
    cart.classList.toggle('active');
};

document.addEventListener("DOMContentLoaded", function() {
    // Lấy ra các span tăng và giảm số lượng sản phẩm
    var decreaseButtons = document.querySelectorAll('.decrease-btn');
    var increaseButtons = document.querySelectorAll('.increase-btn');

    // Lặp qua từng span giảm và thêm sự kiện click
    decreaseButtons.forEach(function(span) {
        span.addEventListener('click', function() {
            var quantityElement = span.nextElementSibling; // Lấy phần tử span chứa số lượng
            var currentQuantity = parseInt(quantityElement.textContent); // Lấy số lượng hiện tại
            if (currentQuantity > 0) {
                quantityElement.textContent = currentQuantity - 1; // Giảm số lượng đi 1
            }
        });
    });

    // Lặp qua từng span tăng và thêm sự kiện click
    increaseButtons.forEach(function(span) {
        span.addEventListener('click', function() {
            var quantityElement = span.previousElementSibling; // Lấy phần tử span chứa số lượng
            var currentQuantity = parseInt(quantityElement.textContent); // Lấy số lượng hiện tại
            quantityElement.textContent = currentQuantity + 1; // Tăng số lượng đi 1
        });
    });
});

document.addEventListener("DOMContentLoaded", function() {
    // Lấy ra các div giảm và tăng số lượng sản phẩm
    var decreaseButtons = document.querySelectorAll('#decrease');
    var increaseButtons = document.querySelectorAll('#increase');

    // Lặp qua từng div giảm và thêm sự kiện click
    decreaseButtons.forEach(function(div) {
        div.addEventListener('click', function() {
            var quantityElement = div.nextElementSibling; // Lấy phần tử input chứa số lượng
            var currentQuantity = parseInt(quantityElement.value); // Lấy số lượng hiện tại
            if (currentQuantity > 0) {
                quantityElement.value = currentQuantity - 1; // Giảm số lượng đi 1
            }
        });
    });

    // Lặp qua từng div tăng và thêm sự kiện click
    increaseButtons.forEach(function(div) {
        div.addEventListener('click', function() {
            var quantityElement = div.previousElementSibling; // Lấy phần tử input chứa số lượng
            var currentQuantity = parseInt(quantityElement.value); // Lấy số lượng hiện tại
            quantityElement.value = currentQuantity + 1; // Tăng số lượng đi 1
        });
    });
});


