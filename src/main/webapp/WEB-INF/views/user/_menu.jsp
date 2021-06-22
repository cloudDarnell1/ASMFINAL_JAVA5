<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<script src="https://code.jquery.com/jquery-3.6.0.slim.min.js" integrity="sha256-u7e5khyithlIdTpu22PHhENmPcRdFiHRjhAuHcs05RI=" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/ui/1.12.0/jquery-ui.min.js" integrity="sha256-eGE6blurk5sHj+rmkfsGYeKyZx3M4bG+ZlFyA7Kns7E=" crossorigin="anonymous"></script>

<div class="header">
	<div class="container">
		<div class="navbar">
			<div class="logo">
				<a href="index.html"><img src="images/m.png" width="125px"></a>
			</div>
			<nav>
				<ul id="MenuItems">
					<li><a href="/index.php">Home</a></li>
					<li><a href="/products">Products</a></li>
					<li><a href="">About</a></li>
					<li><a href="">Contact</a></li>
					<li><a href="account.html">Account</a></li>
					<li><a href="/logout">log out</a></li>
					<li><a href="/login">log in</a></li>
				</ul>
			</nav>
			<div style='position: relative;'>
				<span id="purchased" style="position: absolute;"></span> <img
					style="cursor: pointer;" src="images/cart.png" width="30px"  onclick='cart.open(this)'
					height="30px">
			</div>
			<img src="images/menu.png" class="menu-icon" onclick="menutoggle()">
		</div>

		<div class='incart-container'>
			<span class='closecart-btn'>x</span>
		</div>
	</div>

</div>