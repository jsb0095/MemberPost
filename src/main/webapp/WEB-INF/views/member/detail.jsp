<%--
  Created by IntelliJ IDEA.
  User: anfzh
  Date: 2022-05-27
  Time: 오전 10:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
    <script src="/resources/js/jquery.js"></script>
    <title>Title</title>
</head>
<body>
<jsp:include page="../layout/header.jsp" flush="false"></jsp:include>
<table class="container table">
    <tr>
<c:if test="${sessionScope.loginProfile!=null}">
        <th>프로필사진</th>
</c:if>
        <th>회원번호</th>
        <th>아이디</th>
        <th>이름</th>
        <th>이메일</th>
        <th>전화번호</th>
        <th>수정</th>
    </tr>

    <tr>
        <div class="card" style="width: 5rem;">
            <c:if test="${sessionScope.loginProfile!=null}">
            <td><img src="${pageContext.request.contextPath}/upload/${sessionScope.loginProfile}" width="50" height="50"></td>
            </c:if>
            </div>
        <td>${findById.id}</td>
        <td>${findById.memberId}</td>
        <td>${findById.memberName}</td>
        <td>${findById.memberEmail}</td>
        <td>${findById.memberMobile}</td>
        <td><button class="btn btn-dark" onclick="update(${findById.id})">수정</button></td>





    </tr>
</table>
</body>
</body>
<script>
    function update(id){
        location.href="/member/update?id="+id;
    }
</script>
</html>
