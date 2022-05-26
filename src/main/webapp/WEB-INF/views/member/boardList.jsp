<%--
  Created by IntelliJ IDEA.
  User: anfzh
  Date: 2022-05-26
  Time: 오후 6:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
    <title>Title</title>
</head>
<body>
<div class="container">
회원전용<br>
ID:${sessionScope.loginMemberId}<br>
${sessionScope.loginName}님 환영합니다<br>
<a href="">게시글작성</a><br>
<a href="">게시글조회</a><br>
<a href="">상세조회</a><br>
</div>
</body>
</html>
