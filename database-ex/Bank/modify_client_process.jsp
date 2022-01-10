<%@page import="bank.Conn"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>장세림</title>
</head>
<body>

<% 
	request.setCharacterEncoding("UTF-8");
	String residentNo = request.getParameter("residentNo");
	String name = request.getParameter("name");
	String phoneNumber = request.getParameter("phoneNumber");

	
	String sql=String.format("update client set name='%s', phoneNumber='%s' where residentNo='%s' ", name, phoneNumber, residentNo);
	Connection conn=Conn.getInstance(); 
	conn.createStatement().execute(sql);
	
	response.sendRedirect("/Bank/");
%>

</body>
</html>
