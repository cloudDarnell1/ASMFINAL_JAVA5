<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>


<!DOCTYPE html>
<html>
<head>
<base href="${pageContext.servletContext.contextPath}/">
<meta charset="utf-8" />
<title>Send email</title>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link rel="stylesheet"
	href="<c:url value = '/vendor/bootstrap/forget.css'/>" />
</head>
<body>


	<form action="/user/checkForegetPass" method="post">
		<div class="container forget-password">
			<div class="row">
				<div class="col-md-12 col-md-offset-4">
					<div class="panel panel-default">
						<div class="panel-body">
							<div class="text-center">
								<img src="https://i.ibb.co/rshckyB/car-key.png" alt="car-key"
									border="0">
								<h2 class="text-center">Forgot Password?</h2>
								<p>You can reset your password here.</p>
<table style="margin: auto;">
		<tr>
			<td><label>Email</label></td>
			<td><input name="emailId"></input></td>
			<td><span style="color: red" id='msg'></span></td>
		</tr>
		<tr>
			<td><input type="reset" value="Clear" /></td>
			<td><input type="submit" value="Reset Password"></input></td>
		</tr>
	</table>
								
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

	</form>
	<script>
		var msg = document.querySelector('#msg');
		var error = eval('${error}');
		var errorMsg = '${errorMsg}';
		var successMsg = '${successMsg}';
		if (error !== undefined && error)
			msg.innerText = errorMsg;
		else if (error !== undefined && error === false)
			msg.innerText = successMsg;
	</script>
</body>
</html>
