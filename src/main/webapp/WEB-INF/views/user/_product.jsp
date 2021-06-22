<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<c:forEach var="item" items="${items }">
<div class="small-container">
        <h2 class="title">Featured Products</h2>
        <div class="row">
        <div class="col-4">
                <a href="products_detal.html"><img src="/images/product/${item.image }"></a>
                <a href="products_detal.html"><h4>${item.name }</h4></a>
                <div class="rating">
                    <i class="fa fa-star"></i>
                    <i class="fa fa-star"></i>
                    <i class="fa fa-star"></i>
                    <i class="fa fa-star"></i>
                    <i class="fa fa-star-o"></i>
                </div>
                <p> ${item.price}</p>
            </div>
        </div>
        </div>
    </c:forEach>
     
