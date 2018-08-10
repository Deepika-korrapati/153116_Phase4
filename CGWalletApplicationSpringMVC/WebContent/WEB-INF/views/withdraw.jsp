<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<style>
.error{
color:red;
font-weight:bold;
}
</style>
</head>
<body>
<center>
		<div>
			<h3>Withdraw</h3>
		</div>
		<table>
			<form:form action="withdrawAmount" method="post"
				modelAttribute="customer">
					<tr>
					<td>Enter Mobile Number</td>
					<td><form:input path="mobileNo" size="30" /></td>
					<td><form:errors path="mobileNo" cssClass="error" /></td>
				</tr>
				<tr>
					<td>Enter amount</td>
					<td><form:input path="wallet.balance" size="30" /></td>
					<td><form:errors path="wallet.balance" cssClass="error" /></td>
				</tr>
				<tr>
					<td><input type="submit" value="Withdraw"></td>
				</tr>
			</form:form>
			</table>
			<div>
<font color = red>
<c:if test ="${not empty errorMessage}">
${errorMessage}
</c:if>
</font>
</div>
	</center>
</body>
</html>