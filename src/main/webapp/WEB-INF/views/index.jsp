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
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
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
<div class="d-md-flex justify-content-md-end ">
    <div class="btn-group-vertical gap-1">
<button type="button" onclick="save()" class="btn btn-dark">회원가입</button>
<button type="button" onclick="login()" class="btn btn-dark">로그인</button>
<button type="button" onclick="findAll()" class="btn btn-dark">글목록</button>
    </div>
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
        location.href="/board/paging"
    }

</script>

</html>