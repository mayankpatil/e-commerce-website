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
<title>CATEGORIES</title>
<link rel="stylesheet" type="text/css"
	href="resources/css/bootstrap.min.css" />
<link rel="stylesheet" type="text/css"
	href="resources/css/bootstrap-theme.min.css" />
<script src="<u:url value="resources/js/controller.js" />" ></script>
<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.5/angular.min.js"></script>

<!--  <script type="text/javascript" src="resources/js/angular.min.js"></script>
 <script type="text/javascript" src="resources/js/angular.min.js"></script>
 --><script src="<u:url value="resources/js/controller.js" />" ></script>
<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.5/angular.min.js"></script> 
 
</head>
<body>
 <!-- <body ng-app="myApp" ng-controller="getData"> --> 
<!-- <div class="jumbotron"> -->
<div class="container" style="background-color: lavenderblush;">
	<h2>
		<center>Add Sub Category</center>
		
	</h2>
	<center>
	
		<c:url var="addAction" value="/sub_category/add"></c:url>

		<form:form class="form-horizontal" role="form" action="${addAction}"
			commandName="sub_category">
			
						
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

			<table>
			<tr>
				<div class="form-group">
				<td><form:label class="control-label col-sm-12" path="id">
				<spring:message text="Sub Category Id" />
				</form:label></td>

				<div class="col-sm-12">
					<c:choose>
						<c:when test="${!empty sub_category.id}">
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
					<td><form:label class="control-label col-sm-12" path="name">
							<spring:message text="Sub Category Name" />
						</form:label></td>
						<td><form:input class="form-control" path="name" /></td>
				</tr>
				
			<tr>
					<td><form:label class="control-label col-sm-12" path="id">
							<spring:message text="Select Category" />
						</form:label></td>
					<td><form:select path="category.name" items="${categoryList}"
						itemValue="name" itemLabel="name" /></td>
				</tr>
				
			
				
				
				<tr>
					<td><form:label class="control-label col-sm-12" path="desc">
							<spring:message text="Description" />
						</form:label></td>
					<td><form:input class="form-control" path="desc"
							required="true" /></td>
				</tr>
				
				
					
				
				<tr >
					<td colspan="2"><c:if test="${!empty sub_category.cat_id}">
							<input class="btn btn-primary" type="submit" value="<spring:message text="Edit Category"/>" />
						</c:if> <c:if test="${empty sub_category.cat_id}">
							<input class="btn btn-danger" type="submit"
								value="<spring:message text="Add Sub Category"/>" />
						</c:if></td>
				</tr>
			</table>
</div>
</form:form>
</center>
</div>

</body>
</html>
