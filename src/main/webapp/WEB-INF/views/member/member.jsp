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
</head>
<body>
<jsp:include page="../layout/header.jsp" flush="false"></jsp:include>
<div class="container">
회원전용<br>
ID:${sessionScope.getId}<br>
${sessionScope.getMemberId}님 환영합니다<br>

    <c:if test="${sessionScope.loginProfile!=null}">
    <img src="${pageContext.request.contextPath}/upload/${sessionScope.loginProfile}" alt="" height="100" width="100"><br>
    </c:if>
    <button onclick="findById(${sessionScope.getId})">마이페이지</button>
    <button onclick="boardSave()">글쓰기</button>
</div>
</body>
<script>
    function findById(id){
        location.href="/member/detail?id="+id;
    }
    function boardSave(){
        location.href="/board/save";

    }
</script>
</html>
