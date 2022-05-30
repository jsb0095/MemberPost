<%--
  Created by IntelliJ IDEA.
  User: anfzh
  Date: 2022-05-27
  Time: 오후 7:34
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
    <script src="/resources/js/jquery.js"></script>
</head>
<body>
<jsp:include page="../layout/header.jsp" flush="false"></jsp:include>
<table class="table">
<tr>
    <th>회원번호</th>
    <th>제목</th>
    <th>작성자</th>
    <th>내용</th>
    <th>조회수</th>
    <th>시간</th>

</tr>
<c:forEach var="post" items="${findList}">
    <tr>
    <td>${post.id}</td>
    <td>${post.boardTitle}</td>
    <td>${post.boardWriter}</td>
    <td>${post.boardContents}</td>
    <td>${post.boardHits}</td>
    <td><fmt:formatDate pattern="yyyy-MM-dd hh:mm:ss" value="${post.boardCreatedDate}"></fmt:formatDate></td>

    </tr>
</c:forEach>
    </table>
</body>

</html>
