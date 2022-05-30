<%--
  Created by IntelliJ IDEA.
  User: anfzh
  Date: 2022-05-26
  Time: 오후 8:12
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

<div class="container">
운영자 전용<br>
ID:<a id="adminId">${sessionScope.getId}</a><br>
${sessionScope.getMemberId}님 환영합니다<br>
<input type="button" value="회원목록" onclick="findAll()">
</div>
</body>
<script>

    function findAll(){
        location.href="/member/findAll";

    }
</script>
</html>
