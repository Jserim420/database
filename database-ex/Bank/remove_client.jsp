<%@page import="bank.Conn"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
	request.setCharacterEncoding("UTF-8");
	String residentNo=request.getParameter("residentNo");
	
	out.println(residentNo);
	
	String sql=String.format("delete from client where residentNo='%s'", residentNo);
	out.println(sql);
	
	Connection conn=Conn.getInstance();
	conn.createStatement().execute(sql);
	
	response.sendRedirect("/Bank/");
%>

</body>
</html>