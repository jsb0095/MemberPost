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
    <script src="/resources/js/jquery.js"></script>
    <title>Title</title>
</head>
<body>
<form method="post" action="/member/login">
<div class="container">
<input type="text" name="memberId" id="memberId" placeholder="아이디">
<h6></h6>
<input type="password" name="memberPassword" placeholder="비밀번호"><br>
<h6></h6>
    <input type="submit" value="로그인">

</div>
</form>
</body>
<script>
    
</script>
</html>
