<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>



<div class="container">
	<div class="table-responsive">
		<div class="table-wrapper">
			<div class="table-title">
				<div class="row">
					<div class="col-xs-6">
						<h2>
							CATEGORY <b>Details</b>
						</h2>
					</div>
					<div class="col-xs-6">
						<div class="search-box">
							<div class="input-group">
								<input type="text" id="search" class="form-control"
									placeholder="Search by Name"> <span
									class="input-group-addon"><i class="material-icons">&#xE8B6;</i></span>
							</div>
						</div>
					</div>
				</div>
			</div>
			<table class="table table-striped">
				<thead>
					<tr>
						<th>ID</th>
						<th>NAME</th>

					</tr>
				</thead>
				<tbody>
					<c:forEach var="item" items="${items}">
						<tr>
							<td>${item.id}</td>
							<td>${item.name}</td>
							<td><a href="#" class="edit" title="Edit"
								data-toggle="tooltip"><i class="material-icons">&#xE254;</i></a>
								<a href="#" class="delete" title="Delete" data-toggle="tooltip"><i
									class="material-icons">&#xE872;</i></a></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
</div>
</div>
</div>
