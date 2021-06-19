<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
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

</head>
<body>

	<jsp:include page="_menu.jsp" />
	<div class="small-container single-product">
		<div class="row">
			<div class="col-2">
				<img src="images/gl1.jfif" width="100%" id="productImg">

				<div class="small-img-row">
					<div class="small-img-rol">
						<img src="images/gl2.jfif" width="100%" class="small-img">
					</div>
					<div class="small-img-rol">
						<img src="images/gl3.jfif" width="100%" class="small-img">
					</div>
					<div class="small-img-rol">
						<img src="images/gl4.jpg" width="100%" class="small-img">
					</div>
					<div class="small-img-rol">
						<img src="images/gl5.jfif" width="100%" class="small-img">
					</div>
				</div>

			</div>
			
			<div class="col-2" data-id='${item.id}' data-price='${item.price}' data-name='${item.name}' data-img='${item.image}' data-catname='${item.category.name}'>
				<p>${item.category.name}</p>
				<h1>${item.name}</h1>
				<h4>$${item.price}</h4>
				<select id='size'>
					<option>Select Size</option>
					<option>XXL</option>
					<option>XL</option>
					<option>Large</option>
					<option>Medium</option>
					<option>Small</option>
					</section>
					<input type="number" value="1" id='amount' onchange='cart.amountValidation(event)'>
					<button class="btn" onclick='cart.add(this)'>Add To Card</button>
					<h3>
						Product Detail <i class="fa fa-indent"></i>
					</h3>
					<br>
					<p>Surrounded affronting favourable no mr. Lain knew like half
						she yet joy. Be than dull as seen very shot. Attachment ye so am
						travelling estimating projecting is. Off fat address attacks his
						besides. Suitable settling mr attended no doubtful feelings. Any
						over for say bore such sold five but hung</p>
			</div>
		</div>
	</div>

	
	<jsp:include page="_footer.jsp" />
	
</body>
</html>