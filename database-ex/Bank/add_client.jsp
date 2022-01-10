<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장세림</title>
<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
</head>
<body>

	<div class="container">
		<form class="form" method="post" action="add_client_process.jsp">
			<input type="text" name="residentNo" placeholder="주민번호를 입력해주세요" class="form-control mt-2">
			<input type="text" name="name" placeholder="이름을 입력해주세요" class="form-control mt-2">
			<input type="text" name="phoneNumber" placeholder="휴대폰번호을 입력해주세요" class="form-control mt-2">
			<input type="text" name="accountNo" placeholder="계좌번호를 입력해주세요" class="form-control mt-2">
			<input type="submit" value="사용자 생성" class="form-control btn-primary mt-3">
		</form>
	</div>

</body>
</html>
