<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<center>
		<h2>Customers having Balance less than 1000</h2>
		<h5>
			<br>
		</h5>
		<br>
		<table>
			<tr>
				<th>Name</th>
				<th>Mobile Number</th>
				<th>Balance</th>
			
			</tr>
			<c:forEach items="${customer}" var="transactions">
				<tr>
					<td>${transactions.name}</td>
					<td>${transactions.mobileNo}</td>
					<td>${transactions.wallet.balance}</td>
		
				</tr>
			</c:forEach>
		</table>

	</center>

</body>
</html>