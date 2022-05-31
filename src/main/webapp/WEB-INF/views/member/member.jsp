<%--
  Created by IntelliJ IDEA.
  User: anfzh
  Date: 2022-05-26
  Time: 오후 6:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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


<div class="card" style="width: 10rem;">
<c:if test="${sessionScope.loginProfile!=null}">
    <img src="${pageContext.request.contextPath}/upload/${sessionScope.loginProfile}">
</c:if>
        <b><h5 class="card-title">${sessionScope.getMemberId}님</h5></b>
        <b><p class="card-text">사이트에 오신걸 환영합니다</p></b>
    </div>
</body>
<script>

    function boardSave(){
        location.href="/board/save";
    }

</script>
</html>
