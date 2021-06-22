
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<div class="header">
	<div class="container">
		<div class="navbar">
			<div class="logo">
				<a href="index.html"><img src="/images/m.png" width="125px"></a>
			</div>
			
			
			
		<!-- header -->
			<nav>
				<ul id="MenuItems">
			
			<!-- search -->
				<li><a href="/index.php">Trang chủ</a></li>
					<li><a href="home/about">Giới thiệu</a></li>
					<li><a href="/home/contact">Liên hệ</a></li>
					<li><a href="/home/feedback">Góp ý</a></li>



					<li><a href="/payment/CartDetail">chi tiet thanh toan</a></li>
					<div class="dropdown">
						<button class="dropbtn">Account</button>
						<div class="dropdown-content">
							<a href="">User</a>
							<a href="/admin">Admin</a>
						</div>
					</div>

				</ul>
			</nav>
			<div style='position: relative;'>
				<span id="purchased" style="position: absolute;"></span> <img
					style="cursor: pointer;" src="/images/cart.png" width="30px"
					onclick='cart.open(this)' height="30px">
			</div>

			<!-- <a href="cart.html"><img src="images/cart.png" width="30px"
				height="30px"></a> <img src="images/menu.png" class="menu-icon"
				onclick="menutoggle()"> -->
		</div>
		<div class="row">
			<div class="col-2">
				<h1>
					Bạn vẫn đẹp <br> khi đeo khẩu trang!
				</h1>
				<p>
					chung sống an toàn với dịch và vững tin <br>Việt Nam quyết
					thắng dịch bệnh này.
				</p>
				<br>
				<!-- <a href="" class="btn">Explore Now &#8594;</a> -->
				
				
				<form action="/product/search" method="post">
				<div class="search-container">
        <input  name="keywords" value="${keywords}"placeholder="Search..."  class="search-input">
        <a href="#" class="search-btn">
                <i class="fas fa-search"></i>      
        </a>
    </div>
    </form>
		</div>
				<!-- search -->
	
			<div class="col-2">
				<img src="/images/hhh.jpg">
			</div>
		</div>
	</div>
</div>

<!-- <div class='incart-container'>
			<span class='closecart-btn'>x</span>
		</div> -->

</div>

