<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page isELIgnored="false"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>CATEGORIES</title>
<link rel="stylesheet" type="text/css"
	href="resources/css/bootstrap.min.css" />
<link rel="stylesheet" type="text/css"
	href="resources/css/bootstrap-theme.min.css" />

<script src="http://ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular.min.js"></script>

<script>
         var myApp = angular.module('myApp',[]);
         myApp.controller('getData',function($scope,$http,$location) 
        		 {
        	 
        	       $scope.searchKeyword=location.search.substring(15);
        	       $scope.categorydata=${categoryList};
        	       
        		 });


</script>
 
</head>
<body ng-app="myApp" ng-controller="getData">


<!-- <div class="jumbotron"> -->
<div class="container" style="background-color: orange;">
	<h2>
		<center>Add a Category</center>
	</h2>
	<center>
		<c:url var="addAction" value="/category/add"></c:url>

		<form:form class="form-horizontal" role="form" action="${addAction}"
			commandName="category">

			<table>
				<tr>
					<div class="form-group">
						<td><form:label class="control-label col-sm-2" path="id">
								<spring:message text="ID" />
							</form:label></td>
						<div class="col-sm-10">
							<c:choose>
								<c:when test="${!empty category.id}">
									<td><form:input class="form-control" path="id"
											disabled="true" readonly="true" /></td>
								</c:when>

								<c:otherwise>
									<td><form:input class="form-control" path="id"
											pattern=".{4,7}" required="true"
											title="id should contains 4 to 7 characters" /></td>
								</c:otherwise>
							</c:choose>
						</div>
					</div>
				</tr>
				<tr>
					<div class="form-group">
						<form:input path="id" hidden="true" />
						<td><form:label class="control-label col-sm-2" path="name">
								<spring:message text="Name" />
							</form:label></td>
						<td><form:input class="form-control" path="name"
								required="true" /></td>
					</div>
					</tr>
				
				<tr>
					<td><form:label class="control-label col-sm-2" path="desc">
							<spring:message text="Description" />
						</form:label></td>
					<td><form:input class="form-control" path="desc"
							required="true" /></td>
							
				</tr>
				
				<tr>
					<td colspan="2"><c:if test="${!empty category.name}">
							<input class="btn btn-primary" type="submit"
								value="<spring:message text="Edit Category"/>" />
						</c:if> <c:if test="${empty category.name}">
							<input class="btn btn-success" type="submit"
								value="<spring:message text="Add Category"/>" />
						</c:if></td>
				</tr>
				<br>
			</table>
</div>
</form:form>
</center>
</div>
<!-- </div> -->
<br>
<div class="container">
	<h3>Category List</h3>
	<div class="table-responsive">
 			 <table class="table table-bordered">
 		
	<c:if test="${!empty categoryList}">
		<div class="table-responsive">
 			 <table class="table table-condensed">
 			 <thead>					
 			 <tr>
					<th width="80">Category ID</th>
					<th width="120">Category Name</th>
					<th width="120">Category Description</th>
					<th width="60">Edit</th>
					<th width="60">Delete</th>
				</tr>
				</thead>
				 <tbody>
					<tr ng-repeat="group in categorydata | filter:searchKeyword	">
						<td>{{group.id}}</td>
						<td>{{group.name}}</td>
						<td>{{group.desc}}</td>
						<td><a href="<c:url value='category/edit/{{group.id}}' />">Edit</a></td>
						<td><a
							href="<c:url value='category/remove/{{group.id}}' />">Delete</a></td>
					</tr>
				
				 </tbody>
			</table>
		</div>
	</c:if>
</div>
</body>
</html>
