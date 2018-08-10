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
<body>
<form action = "printTransaction" method="post" name="customerFrm">
<table>
<div> 
			<h3>Login here</h3>
</div>
<tr>
<td>Enter MobileNo</td>
<td><input type="text" name="mobileNo"/>
<td><input type="submit" value="printTransactions"/>
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