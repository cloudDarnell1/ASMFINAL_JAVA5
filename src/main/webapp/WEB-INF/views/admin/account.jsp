<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- Custom fonts for this template-->
<link
	href='<c:url value= "/template/admin/vendor/fontawesome-free/css/all.min.css"/>'
	rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">

<!-- Custom styles for this template-->
<link href='<c:url value= "/template/admin/css/sb-admin-2.min.css"/>'
	rel="stylesheet">
<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.1.1/css/all.css"
	integrity="sha384-O8whS3fhG2OnA5Kas0Y9l3cfpmYjapjI0E4theH4iuMD+pLhbf6JI0jIMfYcK3yZ"
	crossorigin="anonymous">
<jsp:include page="header.jsp" />
<!-- Page Heading -->
<div class="d-sm-flex align-items-center justify-content-between mb-4">
	<h1 class="h3 mb-0 text-gray-800">Account</h1>
</div>
<div class="row">
	<!-- Area Chart -->
	<div class="col-xl-8 col-lg-7">
		<div class="card">
			<div class="card-header text-center">Accounts</div>
			<div class="card-body p-0">
				<table class="table table-hover">
					<thead>
						<tr>
							<th scope="col">User Name</th>
							<th scope="col">Password</th>
							<th scope="col">Email</th>
							<th scope="col">Full Name</th>
							<th scope="col">Admin</th>
							<th scope="col">Activated</th>
							<th></th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="item" items="${items }">
							<tr>
								<td>${item.username }</td>
								<td>${item.password }</td>
								<td>${item.email }</td>
								<td>${item.fullname }</td>
								<td>${item.admin?"Online":"Offline" }</td>
								<td>${item.activated?"Online":"Offline" }</td>
								<td><a href="/admin/account/edit/${item.username }"
									class="btn btn-outline-success"><i class="fas fa-edit    "></i></a></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
			<div class="card-footer text-muted">Footer</div>
		</div>
	</div>
	<!-- Pie Chart -->
	<div class="col-xl-4 col-lg-5">
		<div class="card">
			<div class="card-header">Nhập liệu</div>
			<div class="card-body">
				<form:form action="/admin/account" method="post"
					modelAttribute="item">
					<div class="form-group">
						<label for="username">Username</label>
						<form:input type="text" class="form-control" path="username"
							id="username" aria-describedby="usernameHid"
							placeholder="Username" />
						<small id="usernameHid " class="form-text text-muted">Tên
							người dùng</small>
					</div>

					<div class="form-group">
						<label for="password">Password</label>
						<form:input type="text" class="form-control" path="password"
							id="password" aria-describedby="passwordHid"
							placeholder="Password" />
						<small id="passwordHid" class="form-text text-muted">Mật
							khẩu</small>
					</div>

					<div class="form-group">
						<label for="email">Email</label>
						<form:input type="text" class="form-control" path="email"
							id="email" aria-describedby="emailHid" placeholder="Email" />
						<small id="emailHid" class="form-text text-muted">Địa chỉ
							Email</small>
					</div>

					<div class="form-group">
						<label for="fullname">Full Name</label>
						<form:input type="text" class="form-control" path="fullname"
							id="fullname" aria-describedby="fullnameHid"
							placeholder="Full Name" />
						<small id="fullnameHid" class="form-text text-muted">Họ và
							tên</small>
					</div>
					<div class="form-group form-check-inline">
						<label for="available" style="font-size: 13pt">Activated : </label>
						<div class="form-check form-check-inline">
							<label class="form-check-label"> <form:radiobuttons
									items="${activated}" class="form-check-input ml-3" path="activated" />
							</label>
						</div>
					</div>
					<div class="form-group form-check-inline">
						<label for="available" style="font-size: 13pt">Admin : </label>
						<div class="form-check form-check-inline">
							<label class="form-check-label"> <form:radiobuttons
									items="${admin}" class="form-check-input ml-3" path="admin" />
							</label>
						</div>
					</div>
			</div>
			<div class="card-footer text-muted text-center">
				<button class="btn btn-primary" formaction="/admin/account/create">Create</button>
				<button class="btn btn-success" formaction="/admin/account/update">Update</button>
				<button class="btn btn-danger"
					formaction="/admin/account/delete/${item.username }">Delete</button>
				<button class="btn btn-info" formaction="/admin/account/">Reset</button>
				</form:form>
			</div>
		</div>
	</div>
</div>

<jsp:include page="footer.jsp" />
