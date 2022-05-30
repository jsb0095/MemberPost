<%--
  Created by IntelliJ IDEA.
  User: anfzh
  Date: 2022-05-26
  Time: 오후 10:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
    <script src="/resources/js/jquery.js"></script>

</head>
<body>
<jsp:include page="../layout/header.jsp" flush="false"></jsp:include>
<table class="table">
    <tr>
        <th>회원번호</th>
        <th>아이디</th>
        <th>이름</th>
        <th>이메일</th>
        <th>전화번호</th>
        <th>삭제</th>
<%--        <th>상세조회</th>--%>





    </tr>
    <c:forEach var="member" items="${findUser}">
    <tr>
        <td>${member.id}</td>
        <td>${member.memberId}</td>
        <td>${member.memberName}</td>
        <td>${member.memberEmail}</td>
        <td>${member.memberMobile}</td>
        <td><button onclick="drop(${member.id})">삭제</button></td>
<%--        <td><button onclick="findById(${member.id})">상세조회</button></td>--%>


    </tr>
    </c:forEach>
</body>
<script>
    function drop(id){
        location.href="/member/delete?id="+id;
    }
    // function findById(id){
    //     if(id==3){
    //         alert("운영자는 접근할수 없습니다!!")
    //     }else{location.href="/member/detail?id="+id;}
    //
    // }
</script>
</html>
