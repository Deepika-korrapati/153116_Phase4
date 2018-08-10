<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<style>
.error {
	color: red;
	font-weight: bold;
}
</style>
</head>
<!-- <body> -->
<%-- 	<center> --%>
<!-- 		<div> -->
<!-- 			<h3>Login here</h3> -->
<!-- 		</div> -->
<!-- 		<table> -->
<%-- 			<form:form action="loginCustomer" method="post" --%>
<%-- 				modelAttribute="customer"> --%>
<!-- 				<tr> -->
<!-- 					<td>Mobile Number</td> -->
<%-- 					<td><form:input path="mobileNo" size="30" /></td> --%>
<%-- 					<td><form:errors path="mobileNo" cssClass="error" /></td> --%>
<!-- 				</tr> -->
<!-- 				<tr> -->
<!-- 					<td><input type="submit" value="Login"></td> -->
<!-- 				</tr> -->
<%-- 			</form:form> --%>
<%-- 	</center> --%>
<!-- </body> -->
<body>
<form action = "loginCustomer" method="post" name="customerFrm">
<table>
<div> 
			<h3>Login here</h3>
</div>
<tr>
<td>Enter MobileNo</td>
<td><input type="text" name="mobileNo"/>
<td><input type="submit" value="login"/>
</tr>
<div>
<font color = red>
<c:if test ="${not empty errorMessage}">
${errorMessage}
</c:if>
</font>
</div>
</table>
</body>
</html>