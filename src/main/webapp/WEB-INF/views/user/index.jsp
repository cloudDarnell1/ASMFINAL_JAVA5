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
<link rel="stylesheet" href="<c:url value = '/css/range.css'/>" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">
<link
	href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script src='https://100dayscss.com/codepen/js/jquery.min.js'></script>

<script src="./script.js"></script>

</head>
<body>



	<jsp:include page="_header.jsp" />

	<%
		Account user = (Account) session.getAttribute("login");
	%>
	<script type="text/javascript">
		let isLogIn =
	<%=user != null ? true : false%>
		
	</script>
	
	

	<div class="small-container">
		<h2 class="title">Featured Products</h2>
		<div class="frame">
			<div class="range">
				<input type="range" min="0" max="400">
			</div>
		</div>
		<div class="row products">
			<jsp:include page="product.jsp"/>
		</div>
	</div>

	<!-- ------------ offer -------------- -->
	<div class="offer">
		<div class="small-container">
			<div class="row">
				<div class="col-2">
					<img src="images/pr12.jpg" class="offer-img">
				</div>
				<div class="col-2">
					<p>nhà thiết kế Gareth Pugh</p>
					<h1>Khẩu trang cao cấp SN9</h1>
					<small> The Mi Smart Band 4 features a 39.9% larger (than
						Mi Band 4) AMOLED color full-touch display with adjustable
						brightness, so everything is clear as can be</small> <a href=""
						class="btn">Buy Now &#8594;</a>
				</div>
			</div>
		</div>
	</div>

	<!-- ------------ testimonial -------------- -->
	<div class="testimonial">
		<div class="small-container">
			<div class="row">
				<div class="col-3">
					<i class="fa fa-qoute-lef"></i>
					<p>Vogmask là loại khẩu trang hoạt tính thời trang cùng với
						chất lượng tuyệt vời cho mọi thời đại, thể hiện phong cách của
						người sử dụng về thời trang và việc bảo vệ sức khỏe của chính mình
						trước đại dịch Covid 19 hiện nay.</p>
					<div class="rating">
						<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
							class="fa fa-star"></i> <i class="fa fa-star"></i> <i
							class="fa fa-star-o"></i>
					</div>
					<img src="images/u1.jpg">
					<h3>Vogmask</h3>
				</div>
				<div class="col-3">
					<i class="fa fa-qoute-lef"></i>
					<p>Khẩu trang 3M là 1 thương hiệu rất quen thuộc ở Việt Nam
						cũng như trên toàn thế giới. Khẩu trang 3M có mặt tại rất nhiều
						các quốc gia đặc biệt tại những đất nước phát triển công nghiệp
						nặng và công nghiệp hóa chất như Mỹ, Trung Quốc….</p>
					<div class="rating">
						<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
							class="fa fa-star"></i> <i class="fa fa-star"></i> <i
							class="fa fa-star-o"></i>
					</div>
					<img src="images/u2.png">
					<h3>Khẩu trang 3M</h3>
				</div>

				<div class="col-3">
					<i class="fa fa-qoute-lef"></i>
					<p>Tên đầy đủ của loại khẩu trang này là Khẩu trang đa năng
						XC99. Mình đã mua chiếc khẩu trang này với giá là khoảng 140.000đ,
						thêm phí giao hàng nữa là 170.000đ, một cái giá không thể nào
						"chát" hơn cho một chiếc khẩu trang đúng không?.</p>
					<div class="rating">
						<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
							class="fa fa-star"></i> <i class="fa fa-star"></i> <i
							class="fa fa-star-o"></i>
					</div>
					<img src="images/u3.jpg">
					<h3>XC99</h3>
				</div>
			</div>
		</div>
	</div>


	<jsp:include page="_footer.jsp" />

	<script src="${pageContext.request.contextPath}/js/filter.js"></script>


</body>
</html>



