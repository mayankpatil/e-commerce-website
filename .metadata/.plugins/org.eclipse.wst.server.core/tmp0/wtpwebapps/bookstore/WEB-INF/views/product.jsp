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

 <script type="text/javascript" src="resources/js/angular.min.js"></script>


</head>
<body ng-app="myApp" ng-controller="getData">


<!-- <div class="jumbotron"> -->
<div class="container" style="background-color: orange;">
	<h2>
		<center>Add a product</center>
	</h2>
	<center>
		<c:url var="addAction" value="/product/add"></c:url>

			
			<form:form class="form-horizontal" 
		modelAttribute="product" action="product/add" method="post" enctype="multipart/form-data">
		


			<table>
				<tr>
					<div class="form-group">
						<td><form:label class="control-label col-sm-2" path="id">
								<spring:message text="ID" />
							</form:label></td>
						<div class="col-sm-10">
							<c:choose>
								<c:when test="${!empty product.id}">
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
					<td><form:label class="control-label col-sm-12" path="id">
							<spring:message text="Select SubCategory" />
						</form:label></td>
					<td><form:select path="sub_category.name" items="${sub_categoryList}"
						itemValue="name" itemLabel="name" /></td>
				</tr>
				
			<tr>
					<td><form:label class="control-label col-sm-12" path="id">
							<spring:message text="Select Supplier" />
						</form:label></td>
					<td><form:select path="supplier.name" items="${supplierList}"
						itemValue="name" itemLabel="name" /></td>
				</tr>
				
			
				<tr>
					<td><form:label class="control-label col-sm-2" path="desc">
							<spring:message text="Description" />
						</form:label></td>
					<td><form:input class="form-control" path="desc"
							required="true" /></td>
				</tr>
				<tr>
					<td><form:label class="control-label col-sm-2" path="qty">
							<spring:message text="Quantity" />
						</form:label></td>
					<td><form:input class="form-control" path="qty"
							required="true" /></td>
				</tr>
				<tr>
					<td><form:label class="control-label col-sm-2" path="image">
							<spring:message text="Image" />
						</form:label></td>
					<td><form:input  class="btn btn-default" type="file" path="image"/></td>
				</tr>
				<tr>
					<td><form:label class="control-label col-sm-2" path="price">
							<spring:message text="price" />
						</form:label></td>
					<td><form:input class="form-control" path="price"
							required="true" /></td>
				</tr>
				<tr>
					<td colspan="2"><c:if test="${!empty product.name}">
							<input class="btn btn-primary" type="submit"
								value="<spring:message text="Edit product"/>" />
						</c:if> <c:if test="${empty product.name}">
							<input class="btn btn-success" type="submit"
								value="<spring:message text="Add product"/>" />
						</c:if></td>
				</tr>
			</table>
			</form:form>
</div>


</center>
</div>
</body>
</html>
