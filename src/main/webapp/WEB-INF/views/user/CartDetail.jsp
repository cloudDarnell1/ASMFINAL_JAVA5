<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@page import="com.may.entity.Account"%>



<!DOCTYPE HTML>
<html lang="en" xmlns:th="http://www.thymeleaf.org">
<head>
<meta charset="UTF-8" />
<title>BẠN VẪN ĐẸP KHI ĐEO KHẨU TRANG</title>
    <link rel="stylesheet" href="<c:url value = '/css/style.css'/>" />
    
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap"
        rel="stylesheet">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

</head>
<body>

<jsp:include page="_header.jsp" />

<div class="small-container cart-page">
        <table>
            <tr>
                <th>Product</th>
                <th>Quantity</th>
                <th>Subtotal</th>
            </tr>          
        </table>
        <div class="total-price">
            <table>
                <tr>
                    <td>tổng sản phẩm mua</td>
                    <td id="cartTotalAmount"></td>
                </tr>
                <tr>
                    <td>Tax</td>
                    <td id='tax'>25.00$</td>
                </tr>
                <tr>
                    <td>thanh tien truoc thue</td>
                    <td id="cartTotalMoneyBeforeTax"></td>
                </tr>
                <tr>
                    <td>tổng tiền</td>
                    <td id="cartTotalMoney"></td>
                </tr>
                <tr>
                     <button class='btn' onclick="cart.payment()">thanh toan</button>
                </tr>           
            </table>

        </div>
    </div>


<jsp:include page="_footer.jsp" />
 <script>
window.addEventListener('load', () => {
    let userCart = cart.getCart()
    if (userCart.size > 0) {
        let header = `<tr>
                    <th>Product</th>
                    <th>Quantity</th>
                    <th>Subtotal</th>
                     </tr>`;
        let vi_tri_xuat_data = document.querySelector("body > div.small-container.cart-page > table > tbody");
        let ten_template_giao_dien = 'setCartDetailTemplate'
        cart.loadView(userCart, vi_tri_xuat_data, header, ten_template_giao_dien).then(data => {
            let { carts } = data;
          cart.cartDetailResult(carts);
        }).catch(errorMsg => console.error(errorMsg))
    }
})
</script> 
</body>
</html>



