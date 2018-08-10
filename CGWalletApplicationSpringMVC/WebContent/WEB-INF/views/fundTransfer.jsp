<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<center>
		<div>
			<h3>Enroll here to register</h3>
		</div>
		<table>
	<form action = "fundTransferAction" method="post" name="customerFrm">
<table>
<div> 
			<h3>Login here</h3>
</div>
<tr>
<td>Enter Source MobileNo</td>
<td><input type="text" name="smobileNo"/>

</tr>
<tr>
<td>Enter Target MobileNo</td>
<td><input type="text" name="tmobileNo"/>

</tr>
<tr>
<td>Enter Amount</td>
<td><input type="text" name="amount"/>
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
		</table>
	</center>
	</form>
</body>
</html>