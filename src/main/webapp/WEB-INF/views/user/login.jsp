<%@page import="com.may.entity.Account"%>
<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>


<!DOCTYPE html>
<html>
<head>
<base href="${pageContext.servletContext.contextPath}/">
<meta charset="utf-8" />
<title>ACCOUNT</title>
<link rel="stylesheet" href="style.css">
<link
	href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

<link rel="stylesheet" href="<c:url value = '/css/style.css'/>" />
</head>
<body>

	

	<div class="container">
		<div class="navbar">
			<div class="logo">
				<a href=""><img src="images/m.png" width="125px"></a>
			</div>
			<nav>
				<ul id="MenuItems">
					<li><a href="index.html">Home</a></li>
					<li><a href="products.html">Products</a></li>
					<li><a href="">About</a></li>
					<li><a href="">Contact</a></li>
					<li><a href="account.html">Account</a></li>
				</ul>
			</nav>
			<a href="cart.html"><img src="images/cart.png" width="30px"
				height="30px"></a> <img src="images/menu.png" class="menu-icon"
				onclick="menutoggle()">
		</div>
	</div>
	<!-- ------------Account-page------------------- -->
	<div class="account-page">
		<div class="container">
			<div class="row">
				<div class="col-2">
					<img src="images/anh2.jpg" width="100%">
				</div>

				<div class="col-2">
					<div class="form-container">
						<h1 style="font-size: 20px: color: red; margin: 0">${ notify }</h1>
						<div class="form-btn">
							<span onclick="login()">Login</span> <span onclick="register()">Register</span>
							<hr id="Indicator">
						</div>
						<form action='/login/auth' method='post'>
							<input type="text" placeholder="Username"  name="userName"> 
							<input type="password" placeholder="Password"  name="password">
							<button type="submit" class="btn">Login</button>
							<a href="">Forgot password</a>
						</form>

						<form id="RegForm">
							<input type="text" placeholder="Username"> <input
								type="email" placeholder="Email"> <input type="password"
								placeholder="Password">
							<button class="btn">Register</button>
						</form>

					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- ------------footer----------- -->

	<div class="footer">
		<div class="container">
			<div class="row">
				<div class="footer-col-1">
					<h3>Download Our App</h3>
					<p>Download App for Android and ios mobile phone</p>
					<div class="app-logo">
						<img src="images/play-store.png"> <img
							src="images/app-store.png">
					</div>
				</div>
				<div class="footer-col-2">
					<img src="images/logo-white.png">
					<p>Our Purpose Is To Sustainably Make the Pleasure and Benefits
						of Sports Accessible to the Many</p>
				</div>
				<div class="footer-col-3">
					<h3>Useful Links</h3>
					<ul>
						<li>Coupons</li>
						<li>Blog Post</li>
						<li>Return Policy</li>
						<li>Join Affiliate</li>
					</ul>
				</div>
				<div class="footer-col-4">
					<h3>Follow us</h3>
					<ul>
						<li>Facebook</li>
						<li>Twitter</li>
						<li>Instagram</li>
						<li>Youtube</li>
					</ul>
				</div>
			</div>
			<hr>
			<p class="Copyright">Bui Thao Van_ps13467</p>
		</div>
		<!-- ------------------- js for toggle menu-------------- -->
		<script>
			var MenuItems = document.getElementById("MenuItems");

			MenuItems.style.maxHeight = "0px";

			function menutoggle() {
				if (MenuItems.style.maxHeight == "0px") {
					MenuItems.style.maxHeight = "200px";
				} else {
					MenuItems.style.maxHeight = "0px";
				}
			}
		</script>
		<!-- ------------------- js for Account form-------------- -->

		<script>
		
		window.addEventListener('load',function(){
			var LoginForm = document.getElementById("LoginForm");
			var RegForm = document.getElementById("RegForm");
			var Indicator = document.getElementById("Indicator");

			window.login =  function register() {
				RegForm.style.transform = "translateX(0px)";
				LoginForm.style.transform = "translateX(0px)";
				Indicator.style.transform = "translateX(100px)";

			}
			window.login = function login() {
				RegForm.style.transform = "translateX(300px)";
				LoginForm.style.transform = "translateX(300px)";
				Indicator.style.transform = "translateX(0px)";
			}
			
			let loginForm = document.querySelector("#LoginForm");
			loginForm.addEventListener('submit', async (event)=>{
				event.preventDefault() 
				let formdata = {}
				Array.from(event.target.children).forEach(element =>{
					if(element.nodeName === "INPUT") formdata[element.name] = element.value
					})
			var result =   await postData('http://localhost:8080/login/auth',formdata)
				  .then(data => {
					  if(data.status)location.href  = '/login';
				  });
			})
		
		
		
		async function postData(url = '', data = {}) {
			  // Default options are marked with *
			  const response = await fetch(url, {
			    method: 'POST', // *GET, POST, PUT, DELETE, etc.
			    mode: 'cors', // no-cors, *cors, same-origin
			    cache: 'no-cache', // *default, no-cache, reload, force-cache, only-if-cached
			    credentials: 'same-origin', // include, *same-origin, omit
			    headers: {
			      'Content-Type': 'application/json'
			      // 'Content-Type': 'application/x-www-form-urlencoded',
			    },
			    redirect: 'follow', // manual, *follow, error
			    referrerPolicy: 'no-referrer', // no-referrer, *no-referrer-when-downgrade, origin, origin-when-cross-origin, same-origin, strict-origin, strict-origin-when-cross-origin, unsafe-url
			    body: JSON.stringify(data) // body data type must match "Content-Type" header
			  });
			  return response.json(); // parses JSON response into native JavaScript objects
			}		
		})
			
		
			
		</script>
</body>
</html>
