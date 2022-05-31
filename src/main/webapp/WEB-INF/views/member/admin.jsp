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
    <style>
    body {
    height: 100vh;
    background-image: url('/resources/jpg/my7.jpg');
    background-repeat : no-repeat;
    background-size : cover;
    }
    </style>
</head>
<body>
<jsp:include page="../layout/header.jsp" flush="false"></jsp:include>
<div class="position-absolute top-1 start-0">
    <div class="btn-group-vertical gap-2">
<input type="button" class="btn btn-outline-dark col-12" value="운영자전용기능" readonly>
<input type="button" class="btn btn-dark col-12"  value="회원목록" onclick="findAll()">
    </div>
</div>
</body>
<script>

    function findAll(){
        location.href="/member/findAll";

    }
</script>
</html>
