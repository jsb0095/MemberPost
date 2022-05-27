<%--
  Created by IntelliJ IDEA.
  User: anfzh
  Date: 2022-05-26
  Time: 오후 3:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>


    <title>Document</title>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
</head>
<body>
<div class="container">
    <button  onclick="save()">회원가입</button><br>
    <button  onclick="login()">로그인</button><br>
    <button  onclick="findAll()">글목록</button><br>

</div>
</body>
<script>
    function save(){
        location.href="/member/save"
    }
    function login(){
        location.href="/member/login"
    }
    function findAll(){
        location.href="/member/findAll"
    }
</script>
</html>