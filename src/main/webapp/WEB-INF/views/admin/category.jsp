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
	<h1 class="h3 mb-0 text-gray-800">Category</h1>
</div>
<div class="row">
	<!-- Area Chart -->
	<div class="col-xl-8 col-lg-7">
		<div class="card">
			<div class="card-header text-center">Category</div>
			<div class="card-body p-0">
				<table class="table table-hover">
					<thead>
						<tr>
							<th scope="col">ID</th>
							<th scope="col">Name</th>
							<th></th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="item" items="${items }">
							<tr>
								<td>${item.id }</td>
								<td>${item.name }</td>
								<td><a href="/admin/category/edit/${item.id }"
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
					modelAttribute="category">
					<div class="form-group">
						<label for="id">ID</label>
						<form:input type="text" class="form-control" path="id" id="id"
							aria-describedby="CategoryHid" placeholder="Category ID" />
						<small id="CategoryHid" class="form-text text-muted">CategoryId
							?</small>
					</div>
					<div class="form-group">
						<label for="name">Name</label>
						<form:input type="text" class="form-control" path="name" id="name"
							aria-describedby="nameHid" placeholder="Name" />
						<small id="nameHid" class="form-text text-muted">Name ?</small>
					</div>
			</div>
			<div class="card-footer text-muted text-center">
				<button class="btn btn-primary" formaction="/admin/category/create">Create</button>
				<button class="btn btn-success" formaction="/admin/category/update">Update</button>
				<button class="btn btn-danger"
					formaction="/admin/category/delete/${category.id }">Delete</button>
				<button class="btn btn-info" formaction="/admin/category/">Reset</button>
				</form:form>
			</div>
		</div>
	</div>
</div>

<jsp:include page="footer.jsp" />