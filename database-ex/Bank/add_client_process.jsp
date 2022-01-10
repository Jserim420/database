<%@page import="java.sql.ResultSet"%>
<%@page import="bank.Conn"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
</head>
<body>

<%
	request.setCharacterEncoding("UTF-8"); // 인코딩 utf-8로 변경
	String residentNo=request.getParameter("residentNo");
	String name=request.getParameter("name");
	String phoneNumber=request.getParameter("phoneNumber");
	String accountNo=request.getParameter("accountNo");
	
	String checkSql=String.format("select count(*) as count from client where residentNo='%s'", residentNo); // residentNo의 값을 가지고 있는 것의 개수를 세라.
	
	Connection conn=Conn.getInstance();
	
	ResultSet rs=conn.createStatement().executeQuery(checkSql);
	rs.next(); // 쿼리에 대한 결과값은 항상 표의 형태로 나오기 때문에 결과 값은 항상 0번째 줄을 먼저 센다. 그렇기 때문에 1번째 줄을 확인하기 위해서.
	int count=rs.getInt("count");
	
	if(count==0){	//카운트가 0일때 (동일한 값이 없을때) 해당 쿼리문을 실행
		String sql=String.format("insert client(name, phoneNumber, accountNo, residentNo) values('%s', '%s', '%s', '%s')", name, phoneNumber, accountNo, residentNo);  //printf랑 같은것, ""안에 sql문 삽입
		conn.createStatement().execute(sql); // sql쿼리문 실행
	
		response.sendRedirect("/Bank/"); // 파라미터로 값을 받아서 쿼리문으로 실행 시킨 후 화면 변경
	}
%>

	<div class="container">
		<div class="text-center">이미 가입된 주민등록번호 입니다.</div>
		<a class="btn btn-primary" href="add_client.jsp">확인</a>
	</div>

</body>
</html>