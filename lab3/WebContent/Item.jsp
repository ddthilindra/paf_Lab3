<%@page import="java.sql.Connection"%>
<%@page import="com.Item"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%
if (request.getParameter("itemCode") != null) {
	Item itemObj = new Item();
	String stsMsg = itemObj.insertItem(request.getParameter("itemCode"), request.getParameter("itemName"),request.getParameter("itemPrice"), request.getParameter("itemDesc"));
	session.setAttribute("statusMsg", stsMsg);
}
%>

	<h1>Items Management</h1>
	<form method="post" action="Item.jsp">
		Item code: <input name="itemCode" type="text"><br> Item
		name: <input name="itemName" type="text"><br> Item price:
		<input name="itemPrice" type="text"><br> Item
		description: <input name="itemDesc" type="text"><br> <input
			name="btnSubmit" type="submit" value="Save">
	</form>

	<%
	out.print(session.getAttribute("statusMsg"));
	%>

	<%
	Item itemObj = new Item();
	out.print(itemObj.readItems());
	%>


</body>
</html>