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
	<h1 class="h3 mb-0 text-gray-800">Product</h1>
</div>
<div class="row">
	<!-- Area Chart -->
	<div class="col-xl-8 col-lg-7">
		<div class="card">
			<div class="card-header text-center">Product</div>
			<div class="card-body p-0">
				<table class="table table-hover">
					<thead>
						<tr>
							<th scope="col" style="width: 200px;">Images</th>
							<th scope="col">Name</th>
							<th scope="col">Price</th>
							<th scope="col">Create Date</th>
							<th scope="col">Available</th>
							<th scope="col"></th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="item" items="${items }">
							<tr>
								<td><img
									src='<c:url value = "/images/product/${item.image }"/>'
									class="img-thumbnail" width="200px"></td>
								<td>${item.name }</td>
								<td>${item.price }</td>
								<td>${item.createDate }</td>
								<td>${item.available?"Online":"Offline"}</td>
								<td><a href="/admin/product/edit/${item.id }"
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
				<form:form action="/admin/category" method="post"
					modelAttribute="item" enctype="multipart/form-data">
					<div class="form-group">
						<img alt="" src="/images/product/${item.image }" width="100%"> <br>
						<label for="exampleFormControlFile1">Images</label>
						<form:input type="file" class="form-control-file"
							id="exampleFormControlFile1" path="image" />
					</div>
					<div class="form-group">
						<label for="name">Name</label>
						<form:input type="text" class="form-control" path="name" id="name"
							aria-describedby="nameHid" placeholder="Name" />
						<small id="nameHid" class="form-text text-muted">Name ?</small>
					</div>
					<div class="form-group">
						<label for="price">Price</label>
						<form:input type="text" class="form-control" path="price"
							id="price" aria-describedby="priceHid" placeholder="Price" />
						<small id="priceHid" class="form-text text-muted">Giá</small>
					</div>
					<div class="form-group form-check-inline">
						<label for="available" style="font-size: 13pt">Available : </label>
						<div class="form-check form-check-inline">
							<label class="form-check-label"> <form:radiobuttons
									items="${available}" class="form-check-input ml-3" path="available" />
							</label>
						</div>
					</div>
					<div class="form-group">
						<label for="categoryId">Category ID</label>
						<form:select id="inputState" class="form-control" path="category">
							<form:option value="NONE">---Select---</form:option>
							<c:forEach var="item" items="${cateItem }">
								<form:option value="${item.id }">${item.name }</form:option>
							</c:forEach>
						</form:select>
					</div>
			</div>
			<div class="card-footer text-muted text-center">
				<button class="btn btn-primary" formaction="/admin/product/create">Create</button>
				<button class="btn btn-success" formaction="/admin/product/update">Update</button>
				<button class="btn btn-danger" formaction="/admin/product/delete/${item.id }">Delete</button>
				<button class="btn btn-info" formaction="/admin/product/">Reset</button>
			</div>
			</form:form>
		</div>
	</div>
</div>

<jsp:include page="footer.jsp" />