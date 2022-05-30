<%--
  Created by IntelliJ IDEA.
  User: anfzh
  Date: 2022-05-29
  Time: 오후 6:36
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
</head>
<body>
<jsp:include page="../layout/header.jsp" flush="false"></jsp:include>


<div class="container">
    <table class="table">
        <tr>
            <th>글번호</th>
            <th>작성자</th>
            <th>제목</th>
            <th>작성시간</th>
            <th>조회수</th>

            <c:if test="${UserDb.boardProfileName ne null}">
            <th>프로필</th>
            </c:if>

            <c:if test="${sessionScope.getMemberId eq UserDb.boardWriter}">
            <th>수정</th>
            <th>삭제</th>
            </c:if>
        </tr>

            <tr>
                <td>${UserDb.id}</td>
                <td>${UserDb.boardWriter}</td>
                <td>${UserDb.boardTitle}</td>
                <td><fmt:formatDate pattern="yyyy-MM-dd hh:mm:ss"
                                    value="${UserDb.boardCreatedDate}"></fmt:formatDate></td>
                <td>${UserDb.boardHits}</td>
                <c:if test="${UserDb.boardProfileName ne null}">
                <img src="${pageContext.request.contextPath}/upload/${UserDb.boardProfileName}" alt="" height="100"
                     width="100">
                </c:if>

                <c:if test="${sessionScope.getMemberId eq UserDb.boardWriter}">
                <td><input type="button" value="수정" onclick="update()"></td>
                <td><input type="button" value="삭제" onclick="drop()"></td>
                </c:if>

            </tr>
    </table>
    </div>
</body>
<script>
    function update(){
            location.href="/board/updateForm?id=${UserDb.id}";
    }
    function drop(){
        location.href="/board/delete?id=${UserDb.id}";
    }
</script>
</html>
