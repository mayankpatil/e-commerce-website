<%@ page language="java" contentType="text/html; charset=ISO-8859-1"

    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ page isELIgnored="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>PRODUCTS LIST</title>
<link rel="stylesheet" type="text/css"
	href="resources/css/bootstrap.min.css" />
<link rel="stylesheet" type="text/css"
	href="resources/css/bootstrap-theme.min.css" />

<script src="http://ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular.min.js"></script>
 <script>
		var myApp = angular.module('myApp',[]);
		myApp.controller('getData', function($scope,$http,$location)
		 { 
			
			$scope.productdata= ${productList};
			//alert($scope.productdata);
		 
		 });
	
</script>
  
</head>

  <body ng-app="myApp" ng-controller="getData">  
<!-- <div class="jumbotron"> -->
<div class="container" style="background-color: lavenderblush;">
	<h2>
		<center>Add Product</center>
		
	</h2>
	<center>
		

			
			
			
			<div id="custom-search-input">
                            <div class="input-group col-sm-4">
                                <input type="text"ng-model="searchKeyword" placeholder="Search" />
                                <span class="input-group-btn">
                                    <button class="btn btn-danger" type="button">
                                        <span class=" glyphicon glyphicon-search"></span>
                                    </button>
                                </span>
                            </div>
                        </div>






<!-- </div> -->
 <br>
<div class="container">
<style>
th {
    background-color: #cc0000;
    color: white;
}</style>
	<h3>Product List</h3>
	<c:if test="${!empty productList}">
		<div class="table-responsive">

			<table class="table table-bordered">
				<tr>
					<th width="80">Product ID</th>
					<th width="120">Product Name</th>
					<th width="120">Product Description</th>
					<th width="120">Image</th>
					<th width="60">Edit</th>
					<th width="60">Delete</th>
				</tr>
			
					<tr  ng-repeat="groups in productdata | filter:searchKeyword ">
						<td>{{groups.id}}</td>
						<td>{{groups.name}}</td>
						<td>{{groups.desc}}</td>
						<td><img style="width: 20px;height:20px" src="{{groups.image}}"/></td>
						<td><a href="<c:url value='product/edit/{{groups.id}}' />">Edit</a></td>
						<td><a href="<c:url value='product/remove/{{groups.id}}' />">Delete</a></td>
					</tr>
			
			</table>
		</div>
	</c:if>
</div>
 

</body>
</html>