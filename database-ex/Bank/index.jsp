<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="bank.*" %>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장세림</title>
<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
</head>
<body>

<%
Connection connection = Conn.getInstance();
	
	ResultSet result=connection.createStatement().executeQuery("select * from client");

	
	List<Client> userList=new ArrayList<Client>();
	
	while(result.next()) {
		String juminno = result.getString("residentNo");
		Client user = new Client();
		user.setName(result.getString("name"));
		user.setPhoneNumber(result.getString("phoneNumber"));
		user.setAccountNo(result.getString("accountNo"));
		user.setResidentNo(result.getString("residentNo"));
		
		userList.add(user);
	}
	
	pageContext.setAttribute("userList", userList);
%>

<div class="container">
	<table class="table">
		<thead>
			<tr>
				<th>주민번호</th>
				<th>이름</th>
				<th>휴대폰번호</th>
				<th>계좌번호</th>
				<th width="100px">삭제</th>
				<th width="100px">수정</th>
			</tr>	
		</thead>
		<tbody>
			<c:forEach var="item" items="${userList}"> 
				<tr>
					<td><c:out value="${item.residentNo}"></c:out></td>
					<td><c:out value="${item.name}"></c:out></td>
					<td><c:out value="${item.phoneNumber}"></c:out></td>
					<td><c:out value="${item.accountNo}"></c:out></td>
					<td>
						<a href="remove_client.jsp?residentNo=<c:out value="${item.residentNo}"></c:out>" type="button" class="btn btn-danger">삭제</a>
					</td>
					<td>
						<a href="modify_client.jsp?residentNo=<c:out value="${item.residentNo}"></c:out>" class="btn btn-primary">수정</a>
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<a type="button" class="btn btn-primary" href="add_client.jsp">사용자추가</a>
	
</div>

</body>
</html>
