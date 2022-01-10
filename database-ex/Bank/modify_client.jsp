<%@page import="bank.Conn"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
</head>
<body>

<%
	request.setCharacterEncoding("UTF-8");
	String residentNo=request.getParameter("residentNo");
	String sql=String.format("select name, phoneNumber, accountNo, residentNo from client where residentNo='%s'", residentNo);
	
	Connection conn=Conn.getInstance();
	ResultSet rs=conn.createStatement().executeQuery(sql);
	rs.next();
	
	String name=rs.getString("name");
	String phoneNumber=rs.getString("phoneNumber");
	String accountNo=rs.getString("accountNo");

	pageContext.setAttribute("residentNo", residentNo);
	pageContext.setAttribute("name", name);
	pageContext.setAttribute("phoneNumber", phoneNumber);
	pageContext.setAttribute("accountNo", accountNo);
%>

<div class="container">
	<form class="form" method="post" action="modify_client_process.jsp">
		<input value='<c:out value="${residentNo}"></c:out>' readonly type="text" name="residentNo" placeholder="주민번호를 입력해주세요" class="form-control mt-2">
		<input value='<c:out value="${name}"></c:out>' type="text" name="name" placeholder="이름을 입력해주세요" class="form-control mt-2">
		<input value='<c:out value="${phoneNumber}"></c:out>' type="text" name="phoneNumber" placeholder="휴대폰번호를 입력해주세요" class="form-control mt-2">
		<input value='<c:out value="${accountNo}"></c:out>' readonly type="text" name="accountNo" placeholder="계좌번호를 입력해주세요" class="form-control mt-2">
		<input type="submit" value="사용자 수정" class="form-control btn-primary mt-3">
	</form>
</div>



</body>
</html>