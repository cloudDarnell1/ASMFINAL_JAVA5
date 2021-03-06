<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:forEach var="item" items="${items}">
    <div class="col-4">
        <a href="${pageContext.request.contextPath}/products_detal?masp=${item.id}"><img
                src="${ pageContext.request.contextPath }/images/product/${ item.image }"></a>
        <a href="products_detail"><h4>${item.name}</h4></a>
        <div class="rating">
            <i class="fa fa-star">${item.id}</i> <i class="fa fa-star"></i> <i
                class="fa fa-star"></i>${item.createDate} <i class="fa fa-star"></i>
            <i class="fa fa-star-o"></i>
        </div>
        <p>${item.price}</p>
    </div>
</c:forEach>