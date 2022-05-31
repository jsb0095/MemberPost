<%--
  Created by IntelliJ IDEA.
  User: anfzh
  Date: 2022-05-26
  Time: 오후 5:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
    <script src="/resources/js/jquery.js"></script>
    <title>Title</title>

</head>
<body>

<form method="post" action="/member/loginForm">
    <div class="position-absolute top-50 start-50 translate-middle">
        <input type="text" value="회원가입" readonly class="m-2 text-center form-control" >

        <input type="text" name="memberId" id="memberId"  placeholder="아이디" class="m-2 form-control" style="background-color:#e9ecef"  >

        <input type="password" name="memberPassword" placeholder="비밀번호" class="m-2 form-control" style="background-color:#e9ecef" >

        <input type="submit" class="btn btn-dark d-grid mx-auto" value="로그인">
    </div>
</form>

</body>

</html>
